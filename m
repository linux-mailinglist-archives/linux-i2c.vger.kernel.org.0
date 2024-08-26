Return-Path: <linux-i2c+bounces-5796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA1695EF18
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 12:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4A9A1C21C13
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A99915443C;
	Mon, 26 Aug 2024 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwFgF5DX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B7A29A2
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724669702; cv=none; b=Vpoc2cmwD4Kvy+M02b2i3xK5J1WzsXhpJRqxOWYn3/L/JNHzfrFvfAypzDe+xVl9Wg15pO5mjNg59WokWw4cgZnTzDk++PHR09O7VQhycR9uCjly9mQNsgeTMbVIT0RKNtois7ePLc8pEkN4ZHUExUxcxZqpA+Mxc8l24BQiXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724669702; c=relaxed/simple;
	bh=W8nuNbBdEHlJVtYL4VjX6VZb/AtBfROqXOtG3u4vP/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u68xtr2ncEjHgFCpZp6S6VjmAl6GyLYf4y8Z8MRYlrq/VpEESRZoDZ3Ac6CmE8mQZvB5Rw05WJ0yWwdszrsTi8mQHJ1E2J4sU5BAntTva5bA7QglvhH2nRiVnOURDbEjc996dPsNU8X0wbvBC+eyZ/cUIbwxu48KolO/DFFH2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwFgF5DX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724669699; x=1756205699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8nuNbBdEHlJVtYL4VjX6VZb/AtBfROqXOtG3u4vP/M=;
  b=UwFgF5DXrMUlyP/d7utM7bRtCsFJWavYMDPDGX70PFJClk87+gER7Daf
   kIsA1RPFXiRNb3vkn/YlEF8x5f4q+iN14owow60RKngcx9VP7mTtPmJ6p
   vWsRyohlgfTaqdgNFKo75V5qJCdvl+E21S2m2iR/d8w5zeC9u4GqF6JX6
   zWzn5hSaGBwSx8FX3jV3v37fj4eelxe0DtJ2GaS7H70wOp+cbpKgt2q+b
   HrA9zcY1gDm42whSSWLyqwTImR/I1dBbVbvUAww/WfhJXt2OLi4mNc4sh
   L2Q8waAmNUt6NTGoRnZR+4MRis+wKcb2alB6+ohFD0iKgcpgDL9tuM1pS
   Q==;
X-CSE-ConnectionGUID: f8r5cK7nT1ekcUa8vuBOeQ==
X-CSE-MsgGUID: 4Br5+xuAQ1Wu3dHRnl0oUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33704999"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33704999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:54:59 -0700
X-CSE-ConnectionGUID: PKPrqmHEQay8bHoY/wI+mg==
X-CSE-MsgGUID: Bf8C/Mj7T2i+ak5igUEWOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93202995"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 03:54:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siXN8-000Gwy-2o;
	Mon, 26 Aug 2024 10:54:54 +0000
Date: Mon, 26 Aug 2024 18:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	Sanket.Goswami@amd.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 2/5] i2c: piix4: Add i2c_algorithm operations to support
 AMD ASF with SMBus
Message-ID: <202408261818.T8eXqGIz-lkp@intel.com>
References: <20240822142200.686842-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822142200.686842-3-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i2c-piix4-Allow-more-than-two-algo-selection-for-SMBus/20240826-113028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240822142200.686842-3-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 2/5] i2c: piix4: Add i2c_algorithm operations to support AMD ASF with SMBus
config: i386-randconfig-016-20240826 (https://download.01.org/0day-ci/archive/20240826/202408261818.T8eXqGIz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261818.T8eXqGIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261818.T8eXqGIz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-piix4.c:1069:10: error: 'const struct i2c_algorithm' has no member named 'reg_slave'
    1069 |         .reg_slave = sb800_asf_reg_slave,
         |          ^~~~~~~~~
>> drivers/i2c/busses/i2c-piix4.c:1069:22: error: initialization of 'int (*)(struct i2c_adapter *, struct i2c_msg *, int)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
    1069 |         .reg_slave = sb800_asf_reg_slave,
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-piix4.c:1069:22: note: (near initialization for 'sb800_asf_smbus_algorithm.<anonymous>.xfer_atomic')
>> drivers/i2c/busses/i2c-piix4.c:1070:10: error: 'const struct i2c_algorithm' has no member named 'unreg_slave'
    1070 |         .unreg_slave = sb800_asf_unreg_slave,
         |          ^~~~~~~~~~~
>> drivers/i2c/busses/i2c-piix4.c:1070:24: error: initialization of 'int (*)(struct i2c_adapter *, u16,  short unsigned int,  char,  u8,  int,  union i2c_smbus_data *)' {aka 'int (*)(struct i2c_adapter *, short unsigned int,  short unsigned int,  char,  unsigned char,  int,  union i2c_smbus_data *)'} from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
    1070 |         .unreg_slave = sb800_asf_unreg_slave,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-piix4.c:1070:24: note: (near initialization for 'sb800_asf_smbus_algorithm.smbus_xfer')
>> drivers/i2c/busses/i2c-piix4.c:1067:63: warning: missing braces around initializer [-Wmissing-braces]
    1067 | static const struct i2c_algorithm sb800_asf_smbus_algorithm = {
         |                                                               ^
    1068 |         .master_xfer = sb800_asf_xfer,
         |                                      }
    1069 |         .reg_slave = sb800_asf_reg_slave,
         |                      {                  }
   cc1: some warnings being treated as errors


vim +1069 drivers/i2c/busses/i2c-piix4.c

  1066	
> 1067	static const struct i2c_algorithm sb800_asf_smbus_algorithm = {
  1068		.master_xfer = sb800_asf_xfer,
> 1069		.reg_slave = sb800_asf_reg_slave,
> 1070		.unreg_slave = sb800_asf_unreg_slave,
  1071		.functionality = sb800_asf_func,
  1072	};
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

