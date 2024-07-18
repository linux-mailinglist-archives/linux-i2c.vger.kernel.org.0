Return-Path: <linux-i2c+bounces-5017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D99346FD
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 05:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8191C22AFF
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 03:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBE33A1DB;
	Thu, 18 Jul 2024 03:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZKT34Vy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549239FD4;
	Thu, 18 Jul 2024 03:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721275036; cv=none; b=SDlRaAlBd3eCyuWTo1ROsCnwtI73otm62WctICPrlkn5/tUFeOLIigrqEkTwKbUygr+W12Vo7g5zzzOnM/K6Qw0qv/PFiB6DG/ZhX6RuFH8To1699YwF2uJNZ+7c+cTcCPZMGIlOfdsn4SxYAJ4dVjiipWf1YMVVz0rbYPFQYzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721275036; c=relaxed/simple;
	bh=twHvAcda8Z/GGj5MjDm3WeTacn53HYfEBn563aMraqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcUvePln5REDlnhVIAz7dXRMjALm+V6Y612AE2fmiDGl6k8aCMLYXF7FDXBZRodhxefduZYyurfgeOgZloiIA8PidH1/iCGBh6rQ9sMOswBCIZP6Qk+0eF4cIGDakrd1AYAsPBSKM6nqCIJK7Rrw2YFUdnrBQ6Vl1Ks5Mqx3SN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZKT34Vy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721275035; x=1752811035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twHvAcda8Z/GGj5MjDm3WeTacn53HYfEBn563aMraqQ=;
  b=PZKT34VyMKrMG3tvBR1h+lJOs1iEhjz/cMlHl0nPe+ZxHux5+dbiEV05
   hSIA1iiY+l4A6PjJFumeAdNQj6Bbx80X+wW/rtbIMISGNqWJwKwT9xOze
   QTKpHvWq7/q9hmZWwPWyqN6lKHNH0bjyD301WDpPYb7wUtUqCiVmthtQG
   g6mXnAl3EtiCfhyy8DVXQkRLi2VmHbHo5RuOZdm2bp7KpCnQNZYglGuoH
   YbilC8OQw0gGqrK1ZM72TFuDSlQ2WZ52F2wpMm67WAS7nIDN2o0irqGoE
   d3Cnk6i+YOF/RJsJg4ovsqE/iYvwZTKj67IMEFnGmZeFcebkhnIeVDZ5R
   Q==;
X-CSE-ConnectionGUID: LY6YsaxjSlCjkQF0BVq0Yw==
X-CSE-MsgGUID: CGVBtpItTHyBBXnaHhm5XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18626954"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="18626954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 20:57:14 -0700
X-CSE-ConnectionGUID: BgezPt6PQciq+6bm85OcoA==
X-CSE-MsgGUID: ivDuiGalRpa2v6si1bKteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="88100677"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jul 2024 20:57:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUIGS-000gvi-18;
	Thu, 18 Jul 2024 03:57:08 +0000
Date: Thu, 18 Jul 2024 11:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH 2/3] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <202407181147.SJ9mOE8q-lkp@intel.com>
References: <20240718011504.4106163-3-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718011504.4106163-3-mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes akpm-mm/mm-everything andi-shyti/i2c/i2c-host linus/master v6.10 next-20240717]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/mm-vmalloc-export-__vmalloc_node_range/20240718-091816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240718011504.4106163-3-mstrodl%40csh.rit.edu
patch subject: [PATCH 2/3] x86: Add basic support for the Congatec CGEB BIOS interface
reproduce: (https://download.01.org/0day-ci/archive/20240718/202407181147.SJ9mOE8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181147.SJ9mOE8q-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/mfd/congatec-cgeb.c: 25 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 423: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

