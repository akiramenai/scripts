#!/usr/bin/python

import os
from git import Repo
import git

# INSTALL PATH
llvm_path = "~"
llvm_dir = os.path.join(llvm_path, "llvm")
clang_dir = os.path.join(llvm_dir, "tools/clang")
compiler_rt_dir = os.path.join(llvm_dir, "projects/compiler-rt")
testsuite_dir = os.path.join(llvm_dir, "projects/test-suite")
clang_extra_dir = os.path.join(llvm_dir, "tools/clang/tools/extra")
libcxx_dir = os.path.join(llvm_dir, "projects/libcxx")
libcxxabi_dir = os.path.join(llvm_dir, "projects/libcxxabi")
lld_dir = os.path.join(llvm_dir, "tools/lld")
lldb_dir = os.path.join(llvm_dir, "tools/lldb")

# TOOLS TO INSTALL
clang = 1
clang_extra = 1
compiler_rt = 1
libcxx = 1
libcxxabi = 1
lld = 0
lldb = 0
testsuite = 1

# REPO
repo_llvm = "http://llvm.org/git/llvm.git"
repo_clang = "http://llvm.org/git/clang.git"
repo_clang_extra = "http://llvm.org/git/clang-tools-extra.git"
repo_compiler_rt = "http://llvm.org/git/compiler-rt.git"
repo_libcxx = "http://llvm.org/git/libcxx.git"
repo_libcxxabi = "http://llvm.org/git/libcxxabi.git"
repo_lld = "http://llvm.org/git/lld.git"
repo_lldb = "http://llvm.org/git/lldb.git"
repo_testsuite = "http://llvm.org/git/test-suite.git"

# CLONING
if(not os.path.exists(llvm_dir)):
    print "Cloning llvm to " + llvm_dir
    Repo.clone_from(repo_llvm, llvm_dir)
if(not os.path.exists(clang_dir) and clang):
    print "Cloning clang to " + clang_dir
    Repo.clone_from(repo_clang, clang_dir)
if(not os.path.exists(clang_extra_dir) and clang_extra):
    print "Cloning clang extra tools to " + clang_extra_dir
    Repo.clone_from(repo_clang_extra, clang_extra_dir)
if(not os.path.exists(compiler_rt_dir) and compiler_rt):
    print "Cloning compiler-rt to " + compiler_rt_dir
    Repo.clone_from(repo_compiler_rt, compiler_rt_dir)
if(not os.path.exists(libcxx_dir) and libcxx):
    print "Cloning libc++ to " + libcxx_dir
    Repo.clone_from(repo_libcxx, libcxx_dir)
if(not os.path.exists(libcxxabi_dir) and libcxxabi):
    print "Cloning libc++ ABI to " + libcxxabi_dir
    Repo.clone_from(repo_libcxxabi, libcxxabi_dir)
if(not os.path.exists(lld_dir) and lld):
    print "Cloning lld to " + lld_dir
    Repo.clone_from(repo_lld, lld_dir)
if(not os.path.exists(lldb_dir) and lldb):
    print "Cloning lldb to " + lldb_dir
    Repo.clone_from(repo_lldb, lldb_dir)
if(not os.path.exists(testsuite_dir) and testsuite):
    print "Cloning llvm test suite to " + testsuite_dir
    Repo.clone_from(repo_testsuite, testsuite_dir)

# UPDATING

print "Updating LLVM"
git.cmd.Git(llvm_dir).pull()
if(clang):
    print "Updating clang"
    git.cmd.Git(clang_dir).pull()
if(clang_extra):
    print "Updating clang extra tools"
    git.cmd.Git(clang_extra_dir).pull()
if(compiler_rt):
    print "Updating compiler-rt"
    git.cmd.Git(compiler_rt_dir).pull()
if(libcxx):
    print "Updating libc++"
    git.cmd.Git(libcxx_dir).pull()
if(libcxxabi):
    print "Updating libc++ ABI"
    git.cmd.Git(libcxxabi_dir).pull()
if(lld):
    print "Updating lld"
    git.cmd.Git(lld_dir).pull()
if(lldb):
    print "Updating lldb"
    git.cmd.Git(lldb_dir).pull()
if(testsuite):
    print "Updating llvm test suite"
    git.cmd.Git(testsuite_dir).pull()
