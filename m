Return-Path: <linux-i2c+bounces-11151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4E6AC74BB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 02:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9370A1C00204
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 00:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0757BE65;
	Thu, 29 May 2025 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+Isr71s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948F9268685;
	Thu, 29 May 2025 00:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476810; cv=none; b=rRjKWXMMbYT2b5vnCc+u+ETNa9+y5KtSrEJdMft6kpJ8y7lcxIMGqUIvXvmM6KbVi9SZg5rBfWfIDZ3L4HWc/lS0wYniAI//qB9NR+TJCIg08gjSyCnoA//A9nVW8Gs2ngfQa0063TEHP5B5piWo2oTiZ0nYiITB7AdfTWBXRMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476810; c=relaxed/simple;
	bh=aZqOxp92Ys+aIo+jdyqdVvFWBEXiUqE+1611Mk1Hygg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKl63tRHqTCIUgXHQAzsci1TTjnea0aqqHgUZgI9KfsoH2PHwa20JQ2BzYsOaVKIg/GFDhQg7vSK0BjE5LrMAiekZWD27jXQQnJ/b6osSpqpnDzKy+H2C/GK32xtpDUcyMzNUwouE4ZwXcXQEoNuDi2+cN5/XG8WWw7wnRlse78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+Isr71s; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748476809; x=1780012809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aZqOxp92Ys+aIo+jdyqdVvFWBEXiUqE+1611Mk1Hygg=;
  b=n+Isr71sqOBEEw9qACn4/TykcsjO/9BnZuBogwJcaKaj6ThUuzPVVCGk
   BGDNmRb+I8j0OC0nF/MEGWX8XsEJ7K/lRm4AZe6f83VLzYAD7yRwpp5XM
   0iHqCy99ZUNISlIxEggnXj8BlVlIhoIxsGvSzS0kLyKaypEMpvgn2KDTC
   SB5F7yGt/7PPEudP+JxGnuSLfXWd08MqmzXS6chTAoB5sthbYlEOJVm1H
   hRyocGlik2sdTtxSoBgYnepvUk4rwy9nzopKOM1EXxmq1Vx9SVEV8CrSi
   Q+/NFyk2d3idbOr35byc5kC3igNyPmIGmQY5ctRHb7D73Dkkiyb+vlhWw
   w==;
X-CSE-ConnectionGUID: JFfsWyGkQ66P9zk3wGMdoA==
X-CSE-MsgGUID: xwqI3S1eRF63VdwR4vWcrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61577736"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="61577736"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 17:00:08 -0700
X-CSE-ConnectionGUID: 1z5J1C5zSuWrDEBzOv7fyQ==
X-CSE-MsgGUID: MOGkxtCZQeeIz1BS4roItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143372266"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 17:00:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKQgl-000WAi-0E;
	Thu, 29 May 2025 00:00:03 +0000
Date: Thu, 29 May 2025 07:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
Subject: Re: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Write
 Disable
Message-ID: <202505290728.VsNgBfDO-lkp@intel.com>
References: <20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com>

Hi Yo-Jung,

kernel test robot noticed the following build errors:

[auto build test ERROR on 176e917e010cb7dcc605f11d2bc33f304292482b]

url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin/i2c-i801-Do-not-instantiate-spd5118-under-SPD-Write-Disable/20250528-163253
base:   176e917e010cb7dcc605f11d2bc33f304292482b
patch link:    https://lore.kernel.org/r/20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918%40canonical.com
patch subject: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Write Disable
config: loongarch-randconfig-001-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290728.VsNgBfDO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290728.VsNgBfDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290728.VsNgBfDO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-i801.c: In function 'i801_notifier_call':
>> drivers/i2c/busses/i2c-i801.c:1304:9: error: implicit declaration of function '__i801_register_spd' [-Wimplicit-function-declaration]
    1304 |         __i801_register_spd(priv);
         |         ^~~~~~~~~~~~~~~~~~~


vim +/__i801_register_spd +1304 drivers/i2c/busses/i2c-i801.c

  1291	
  1292	static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
  1293				      void *data)
  1294	{
  1295		struct i801_priv *priv = container_of(nb, struct i801_priv, mux_notifier_block);
  1296		struct device *dev = data;
  1297	
  1298		if (action != BUS_NOTIFY_ADD_DEVICE ||
  1299		    dev->type != &i2c_adapter_type ||
  1300		    i2c_root_adapter(dev) != &priv->adapter)
  1301			return NOTIFY_DONE;
  1302	
  1303		/* Call i2c_register_spd for muxed child segments */
> 1304		__i801_register_spd(priv);
  1305	
  1306		return NOTIFY_OK;
  1307	}
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

