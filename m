Return-Path: <linux-i2c+bounces-3741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDC68D72D1
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 01:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F12341C20A92
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 23:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C425F47A48;
	Sat,  1 Jun 2024 23:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnoVYImF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9BD2CCB7
	for <linux-i2c@vger.kernel.org>; Sat,  1 Jun 2024 23:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717285546; cv=none; b=ODHUpojTL8c+kqh+xTxRUl0pRD5I/Ldbf8mJJqm6zurV3dqWb1Q2E3R6eVKkC2ytnCG85kLWCZVPnIutP2dKOkEox4puWG0JKw3URBkPF71TepUjJsjIFmWYuHEGOWvjYPUboNsiDDq35X86/AZlRgMiQKP/f+naDA5F6lDkL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717285546; c=relaxed/simple;
	bh=LeE/DKM7nORnodW5HlSYlXnlRdu0lEUmbIUh0ZGAa/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3/6YkU9ZyjmUbrp7QNJkf7uWMJKkUGFr20JFFJEfX1SQ5gCUZz/HmuH40QZafUtwyOULsY9rUs0yJknLgUfwJ/y5RZ0BQExNHL/6ZTYBJL8HbaQCM/idaEWXKhi8ru4JXjyrAOXMwwOQsrurj3a1CHSDj9+Kv/5Hy49lMMdk0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnoVYImF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717285545; x=1748821545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LeE/DKM7nORnodW5HlSYlXnlRdu0lEUmbIUh0ZGAa/4=;
  b=NnoVYImF1fcEGvIln77Ji2ErlKIX8eSc3M5i84IuVVWxNCLiDhoksVtR
   uXcDOaVxrDVutzFZ5czEonetT95sPbas5AvrpDgs8+VDQbS/2YNMcvY6O
   5cqfB9ZZfKUctnXFXN5UFavJxjQfAR0IwUwEMUnC5jyrG+GmQM3+E/W29
   9lMIZ2fQHiWnFRfuj7zVrgWnpnWEqKE8RggwN8uG66DaBoCNReF1lFDqv
   00QOC8LDKvw/AfdkjQ56/JgYZOPUwTVJHJwFpznVrkH8aFT+VEWXmHH9O
   P0oySlRlAFNpNCa9zAdZZZlXpQxvbT15nREqHDZX0NMbHcXoIuKOD9f5y
   Q==;
X-CSE-ConnectionGUID: jsgDNuFXRnOyXfWFGtu5cw==
X-CSE-MsgGUID: UrKVGA+yT/SjhdndcnVJog==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="24437080"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="24437080"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 16:45:45 -0700
X-CSE-ConnectionGUID: U1fTR9JtQyCFDollWQF+8g==
X-CSE-MsgGUID: ScpkeA/OQF2ZCgyOGdFmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="36524187"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2024 16:45:42 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDYPq-000JV2-0x;
	Sat, 01 Jun 2024 23:45:38 +0000
Date: Sun, 2 Jun 2024 07:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
	linux-i2c@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andi.shyti@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: Re: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
Message-ID: <202406020713.qwylbUoh-lkp@intel.com>
References: <20240601192846.68146-2-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601192846.68146-2-gerhard@engleder-embedded.com>

Hi Gerhard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gerhard-Engleder/i2c-keba-Add-KEBA-I2C-controller-support/20240602-040548
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240601192846.68146-2-gerhard%40engleder-embedded.com
patch subject: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240602/202406020713.qwylbUoh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406020713.qwylbUoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406020713.qwylbUoh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-keba.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/i2c/busses/i2c-keba.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/i2c/busses/i2c-keba.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/i2c/busses/i2c-keba.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-keba.c:568:34: warning: unused variable 'ki2c_devtype' [-Wunused-variable]
     568 | static struct platform_device_id ki2c_devtype[] = {
         |                                  ^~~~~~~~~~~~
   8 warnings generated.


vim +/ki2c_devtype +568 drivers/i2c/busses/i2c-keba.c

   567	
 > 568	static struct platform_device_id ki2c_devtype[] = {
   569		{ .name = KI2C },
   570		{ }
   571	};
   572	MODULE_DEVICE_TABLE(platform, ki2c_devtype);
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

