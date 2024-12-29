Return-Path: <linux-i2c+bounces-8803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A69FDCFE
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 01:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7514C3A15DE
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 00:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6222046BF;
	Sun, 29 Dec 2024 00:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar1B1PKH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660A3A50;
	Sun, 29 Dec 2024 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735433190; cv=none; b=O3kwgMcCnAGJyJtuqWpk9Z9ldELpy8JMpBileC8u87Hkjq5ag/Y4bZaDaODslajXRLQgiPhKb2xQslBwkEWemrVDvAXRptWwnaNC6yJ36lmX624sM8s7wi/h8lyYiZZvV5vM8P4HbMj6Sbl8TIQJ4URZ3YZA5le+q1TbSYWIh7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735433190; c=relaxed/simple;
	bh=1Pkd5GhnM8h/kIiowSI2bNGLEP9Rd43jvZ+w7PxXB5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I88Zc2UTuGZFtQoNq5h8BPAZGnRuLvA4vWu9g4lGsr9PDrYVSeO6igTENwgo18xXh8GvuaZ1joj54P58bYrGgRe6mAU6hkSXrD/+iHaEG2AFrY90C4Av2/wY/HpzCJhNrhznSaMNgNTbO79n86Vq+Wv8BwOiGCfw2nAA3IRDgUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar1B1PKH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735433188; x=1766969188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Pkd5GhnM8h/kIiowSI2bNGLEP9Rd43jvZ+w7PxXB5Q=;
  b=ar1B1PKHRJcrOVnhh4DHiixJ877H+HqNMBRAXwEWoxI5o3k5U7wLC7zU
   eIvvS60UYnyUaSCnrX6guw4JP1LonDLCy01wTXhpzo/w8v1/ftTY/5OoI
   hE1ktmGLA0lMN1l//eropF3LQT+PntEmGiy2bvp25++ICe2891xY0JmNo
   4DnX8J2ijLal4oyCB2UUpsPyTL7Kpo3TldThD5KgCEsC+P0ytNZN/h1yD
   53tF4gF2aJU0xJyTjoanXx3QUpcxwTTacl9tI35sI8c73r49f6PdGeRUJ
   UDR/pqDFyOMQpMC8KjacmbG620c4jTMHaV/t4+DluuRXSpufuYlvrADNS
   g==;
X-CSE-ConnectionGUID: yLiz1/oGShWXhHbeitj4DQ==
X-CSE-MsgGUID: 1GtsNCd6S+ylNS0gEy5zYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35931499"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35931499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 16:46:28 -0800
X-CSE-ConnectionGUID: ke8uEKZEQwWvbk0DC7ZLZw==
X-CSE-MsgGUID: M+gEg5IkQe2RBzXdNTp5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123739152"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Dec 2024 16:46:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRhRn-0004PA-2j;
	Sun, 29 Dec 2024 00:46:23 +0000
Date: Sun, 29 Dec 2024 08:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>, andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com, masahiroy@kernel.org,
	u.kleine-koenig@baylibre.com, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <202412290825.cKFjKHQf-lkp@intel.com>
References: <20241228184328.5ced280b@dsl-u17-10>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228184328.5ced280b@dsl-u17-10>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.13-rc4 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/module-Allow-DEFAULT_SYMBOL_NAMESPACE-be-set-after-export-h-included/20241229-024441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241228184328.5ced280b%40dsl-u17-10
patch subject: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after export.h included
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241229/202412290825.cKFjKHQf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290825.cKFjKHQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290825.cKFjKHQf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-lpss.c:22: warning: "DEFAULT_SYMBOL_NAMESPACE" redefined
      22 | #define DEFAULT_SYMBOL_NAMESPACE "PWM_LPSS"
         | 
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:13,
                    from drivers/pwm/pwm-lpss.c:14:
   include/linux/export.h:63: note: this is the location of the previous definition
      63 | #define DEFAULT_SYMBOL_NAMESPACE ""
         | 


vim +/DEFAULT_SYMBOL_NAMESPACE +22 drivers/pwm/pwm-lpss.c

093e00bb3f82f3 Alan Cox        2014-04-18  21  
ceb8bf2ceaa77f Masahiro Yamada 2024-12-03 @22  #define DEFAULT_SYMBOL_NAMESPACE "PWM_LPSS"
a3682d2fe3c36c Andy Shevchenko 2022-09-27  23  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

