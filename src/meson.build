conf = configuration_data()
conf.set('prefix', get_option('prefix'))
conf.set('libdir', get_option ('libdir'))
conf.set('PROJECT_NAME', 'bulu')
conf.set('PROJECT_VERSION', '0.0.1')
conf.set('API_VERSION', API_VERSION)

sources = files([
  'Handler.vala',
  'HandlerArgs.vala',
  'Server.vala',
  'ServerConfiguration.vala',
  'Action/HandlerAction.vala',
  'Builder/HandlerArgsBuilder.vala',
  'Enum/Method.vala'
])    

libbulu = library('bulu-' + API_VERSION,
  sources,
  vala_header: 'bulu.h',
  vala_vapi: 'bulu-' + API_VERSION + '.vapi',
  vala_gir: 'Bulu-' + API_VERSION + '.gir',
  dependencies : dependencies,
  vala_args: [
    '--abi-stability'
    ],
  install: true,
  install_dir: [
    true,
    get_option('includedir') / 'bulu-' + API_VERSION / 'bulu',
    vapidir,
    g_ir_compiler.found()
  ]
)

if g_ir_compiler.found()
  custom_target('libbulu-typelib',
    command: [
      g_ir_compiler,
      '--shared-library', 'libbulu-@0@.so'.format (API_VERSION),
      '--output', '@OUTPUT@',
      meson.current_build_dir() / 'Bulu-' + API_VERSION + '.gir'
    ],
    output: 'Bulu-' + API_VERSION + '.typelib',
    depends: libbulu,
    install: true,
    install_dir: join_paths(get_option('libdir'), 'girepository-1.0'))
endif

pkgconfig.generate(libbulu,
  subdirs: 'bulu-' + API_VERSION,
  version: API_VERSION,
  name: 'bulu',
  filebase: 'bulu-' + API_VERSION,
  requires: PKGCONFIG_DEPS,
  description: 'A simple Vala libsoup server wrapper')

if get_option('enable_valadoc')
  valadoc = find_program('valadoc')

  valadoc_command = [
      valadoc,
      '-o', meson.current_build_dir() / 'Bulu-' + API_VERSION,
      '--doclet',
      'devhelp',
      '@INPUT@',
      '--force'
  ]

  foreach dependency : dependencies
    valadoc_command += '--pkg=' + dependency.name()
  endforeach

  bulu_docs = custom_target('bulu_apidocs',
    input: sources,
    install: true,
    # FIXME: Installing to tmp, so the target will be built
    #        the problem is we cannot access a subfolder of the
    #        buildtarget via the output parameter.
    #        Find a nicer solution
    install_dir: get_option('datadir') / 'devhelp' / 'books',
    command: valadoc_command,
    output: 'Bulu-' + API_VERSION)

  install_subdir(meson.current_build_dir() / 'Bulu-' + API_VERSION / 'Bulu-' + API_VERSION,
    install_dir: get_option('datadir') / 'devhelp' / 'books')
endif
