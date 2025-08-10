Return-Path: <linux-i2c+bounces-12194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5707B1F753
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 02:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1F73BEF7E
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61954A1A;
	Sun, 10 Aug 2025 00:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNyukv4B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165DF10785;
	Sun, 10 Aug 2025 00:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754785221; cv=none; b=CMqTxeFVNOw8TfUn/mggnfCxjFSd4bgJ/Oc452RJQ5hHnhibs4gZjMlK03UqTxsEU9oQJldCQcRo18PAs5ial3W/bamn5PQk2yaQRh5Y+nSePvkd6gJ8rXVCGWrUaqTR0eSihlFkndA1Bw66OyYNAsy/mRXxh3KyJyGQJk5FIu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754785221; c=relaxed/simple;
	bh=Yu3/TIsfaw8eta+0x7toQmHRIySyi8f8Rt+H3p/7MpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3psOksUudmk6Al9t56kDPzS8YTLvzSDbPCd1DeCoxw2KR75NhaJRLczj+VqqUyucvtiMfl/Xb7GVWFweQGcZadXakTyXqwG8PDOSO8wJct5AKpz7VxzqVT5OGPGY5hVDfAsiP0P8uCWsAxZ/kwEPRsItq6MzkDjoU69TGB+4zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNyukv4B; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754785219; x=1786321219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yu3/TIsfaw8eta+0x7toQmHRIySyi8f8Rt+H3p/7MpA=;
  b=RNyukv4Bet06qt713UicZCKNLrQffZudG2hcGBr8kY6g1Vdnp66vva6/
   hBTw0AZ0B1FtqR7oMBD8SFoBIRg+AV4Zq/JMcK4dQbjcdVwvhzBH5GGh3
   rdarW6ZYOyY8KC033YsPMWQFwaA/LnG89fouDRtP0uvWhOQ9IGxzEMiWA
   T6eDyFrQC/UB489P0y6CVQ5BXwdjswW8PK9CeLT4JMFgwy+lhjt5spgeT
   kADp8+/niE18WlBIJpSXosKtY/moDrFTvxiFVQBvzfG2HUdejZZ+wQUkp
   5zfLiqDiiponTl54ssScPlZMxZA4thtVFMKoPGr+lMe3CU7QCQ9zkfIS7
   g==;
X-CSE-ConnectionGUID: y5Zah+LuTeaqW81Fff4Dqw==
X-CSE-MsgGUID: w9fWuXq8QLySyTnB5I9RjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="68457231"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68457231"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 17:20:18 -0700
X-CSE-ConnectionGUID: /zRJEk8/SnC8qdNqk4z4TA==
X-CSE-MsgGUID: uYBqjVq/T3WvtPihRBdrDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165501820"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Aug 2025 17:20:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uktmy-00056K-2w;
	Sun, 10 Aug 2025 00:19:58 +0000
Date: Sun, 10 Aug 2025 08:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hansg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
Message-ID: <202508100706.TBcpUB9u-lkp@intel.com>
References: <20250809102326.6032-2-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809102326.6032-2-hansg@kernel.org>

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus brgl/gpio/for-next andi-shyti/i2c/i2c-host linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/usb-misc-Add-Intel-USBIO-bridge-driver/20250809-182506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250809102326.6032-2-hansg%40kernel.org
patch subject: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
config: loongarch-randconfig-r052-20250810 (https://download.01.org/0day-ci/archive/20250810/202508100706.TBcpUB9u-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508100706.TBcpUB9u-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/misc/usbio.c:661:19-21: WARNING !A || A && B is equivalent to !A || B

vim +661 drivers/usb/misc/usbio.c

   647	
   648	static int usbio_match_device_ids(struct acpi_device *adev, void *data)
   649	{
   650		struct usbio_match_ids_walk_data *wd = data;
   651		unsigned int id = 0;
   652		char *uid;
   653	
   654		if (!acpi_match_device_ids(adev, wd->hids)) {
   655			uid = acpi_device_uid(adev);
   656			if (uid)
   657				for (int i = 0; i < strlen(uid); i++)
   658					if (!kstrtouint(&uid[i], 10, &id))
   659						break;
   660	
 > 661			if (!uid || (uid && wd->id == (u8)id)) {
   662				wd->adev = adev;
   663				return 1;
   664			}
   665		}
   666	
   667		return 0;
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

