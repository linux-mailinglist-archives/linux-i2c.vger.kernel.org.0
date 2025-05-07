Return-Path: <linux-i2c+bounces-10878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFDBAAE679
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 18:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9E8983414
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 16:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9044028D8F6;
	Wed,  7 May 2025 16:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kde1Y7nx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771FB28C2C2;
	Wed,  7 May 2025 16:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634763; cv=none; b=GQxIzk6+DwZ+9A7aGCt7gdiZbR0A3rberCuq8yfU63X9lJ5D7nlYVc20O2sYm9nvy3h2KemnCnDL5t8SnnMN407Djf3osrN1vjsI5+j5jNapaxKWXx7lP1TS9G0r+jldIgTjQj+fmaZ2MiTjUQVHNHtwRpCjTIP4bDgBSfou/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634763; c=relaxed/simple;
	bh=bjvKIxu4eG9uCBmREGHiuI3YzEktQh1+u8s53l9D5c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6ApguIN5erGByg/IeRtb2ANogKZiXrNGL+lu7H+BeLP4rp4RbeylcEsUrbDeBRn06AV2NeR3U15lSbLU6ghS4RVWWtFVl2pt993VTr6lXvAwhFeg6I+CX4oQ16hVmY3FVdcR0MfEsyv/lPYFPG+u2FPixgXcton2xRsfjPyWE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kde1Y7nx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746634761; x=1778170761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bjvKIxu4eG9uCBmREGHiuI3YzEktQh1+u8s53l9D5c0=;
  b=kde1Y7nxnJK+llHE2wJylU5eyF7s1whCukTnhHvIXyR8X+b5vtqQdely
   QtloJaj/kaYuW3Tujk2s/Ip3a5NUhVhXCvf7hICsMu5ZA0867w2jp2doL
   vdd2MkTSalbHiHdferPXkw70efj0mfNuACMkJxpX8G4zWX4d9Z99P7MKD
   nIXGdLiRuhDLGZo5H4ygqYxGIkl0HNiiO9UgZqTsFIqWOdZ+x2dqH1kOT
   aQR6ILW0GYopITUxE358n1YUQUQpi6U0496X6Qh6e4QBSH7vSO7TAhfEx
   sZPjVfC/lorD+luygBEyNHMabn3MiG01YiXqCcyS9yUSI5wfhqudptY+h
   A==;
X-CSE-ConnectionGUID: 6TTN1G5CQCutI7U6mwcJdQ==
X-CSE-MsgGUID: b76AnggTS26A/vkoOsm9qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59772965"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59772965"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:19:20 -0700
X-CSE-ConnectionGUID: b/FN9FoPQpuKIolEffre2w==
X-CSE-MsgGUID: fdCGD3zBSKSaMGmZkOdFcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141200324"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 09:19:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uChUE-00089N-22;
	Wed, 07 May 2025 16:19:10 +0000
Date: Thu, 8 May 2025 00:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: a0282524688@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v10 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <202505072336.mhh6H9Ma-lkp@intel.com>
References: <20250423094058.1656204-5-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423094058.1656204-5-tmyu0@nuvoton.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on brgl/gpio/for-next andi-shyti/i2c/i2c-host mkl-can-next/testing groeck-staging/hwmon-next abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/a0282524688-gmail-com/mfd-Add-core-driver-for-Nuvoton-NCT6694/20250423-174637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250423094058.1656204-5-tmyu0%40nuvoton.com
patch subject: [PATCH v10 4/7] can: Add Nuvoton NCT6694 CANFD support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505072336.mhh6H9Ma-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072336.mhh6H9Ma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072336.mhh6H9Ma-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/can/usb/nct6694_canfd.c:543:30: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     543 |         setting->nbtp = cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NSJW,
         |                                     ^
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   1 error generated.


vim +/FIELD_PREP +543 drivers/net/can/usb/nct6694_canfd.c

   512	
   513	static int nct6694_canfd_start(struct net_device *ndev)
   514	{
   515		struct nct6694_canfd_priv *priv = netdev_priv(ndev);
   516		const struct can_bittiming *d_bt = &priv->can.data_bittiming;
   517		const struct can_bittiming *n_bt = &priv->can.bittiming;
   518		struct nct6694_canfd_setting *setting __free(kfree) = NULL;
   519		const struct nct6694_cmd_header cmd_hd = {
   520			.mod = NCT6694_CANFD_MOD,
   521			.cmd = NCT6694_CANFD_SETTING,
   522			.sel = ndev->dev_port,
   523			.len = cpu_to_le16(sizeof(*setting))
   524		};
   525		int ret;
   526	
   527		setting = kzalloc(sizeof(*setting), GFP_KERNEL);
   528		if (!setting)
   529			return -ENOMEM;
   530	
   531		if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
   532			setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_MON);
   533	
   534		if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
   535			setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_NISO);
   536	
   537		if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
   538			setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_LBCK);
   539	
   540		/* Disable clock divider */
   541		setting->ctrl2 = 0;
   542	
 > 543		setting->nbtp = cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NSJW,
   544						       n_bt->sjw - 1) |
   545					    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NBRP,
   546						       n_bt->brp - 1) |
   547					    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NTSEG2,
   548						       n_bt->phase_seg2 - 1) |
   549					    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NTSEG1,
   550						       n_bt->prop_seg + n_bt->phase_seg1 - 1));
   551	
   552		setting->dbtp = cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DSJW,
   553						       d_bt->sjw - 1) |
   554					    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DBRP,
   555						       d_bt->brp - 1) |
   556					    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG2,
   557						       d_bt->phase_seg2 - 1) |
   558					    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG1,
   559						       d_bt->prop_seg + d_bt->phase_seg1 - 1));
   560	
   561		setting->active = NCT6694_CANFD_SETTING_ACTIVE_CTRL1 |
   562				  NCT6694_CANFD_SETTING_ACTIVE_CTRL2 |
   563				  NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP;
   564	
   565		ret = nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
   566		if (ret)
   567			return ret;
   568	
   569		priv->can.state = CAN_STATE_ERROR_ACTIVE;
   570	
   571		return 0;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

