Return-Path: <linux-i2c+bounces-12252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0FEB21667
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 22:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 875A316B6E7
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 20:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAD02DAFA1;
	Mon, 11 Aug 2025 20:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSO6Kccn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42E227AC3D;
	Mon, 11 Aug 2025 20:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944001; cv=none; b=gD9iKz9n5qL8qad+OzFU4+6Of/Poyt20kcxKb9H2JxqjzjkWKNoEbrGdrgAQGNkSoRgBVGTBck3+M+8fcp4hvPU1HWYr8Ur/uDfnRifPEveQU0UOSVx98B6nJJOo6ifUk1wMGt0rtc78DFtpDppETwbSKSUBasghntRqiqYe8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944001; c=relaxed/simple;
	bh=fWqfsa10BRT77DGve7cJQjkBsC6AQOTHMUr98zqAhwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cg+yN4n45DBCacrvONtRMEUYRDDGQUUA6c/s9FS8MZFM6aad5YWhyNPLHDHJe6IqyzGV5b6DERp+wzZY3zTnkVli6MU0k0HPmhJgzOAy1PiT/Lstz8FTdE8gvwV2y3os55NXVnmpIYNZbbCKU4ZRFWHuIsgm5t7GYb67kdRCIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSO6Kccn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754944000; x=1786480000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fWqfsa10BRT77DGve7cJQjkBsC6AQOTHMUr98zqAhwY=;
  b=NSO6Kccnp9lhCS4lN5qFdOxJquE6xqGSjqsJ0Es1X4vhNImSxQxmRClT
   5Zsx1ztSyiIawLUVM2RB18flWbwgStNerMb9AmgTlofMy6A1wFbMdurIh
   GQqNlYF4m66hRjtRpyajEqo+c8+73bOhLGnKKtjr59u0u3gYjrha5E6/0
   wNd1JudHpvXwWPj/84Uk/zQ1FGtkQSd9OeHPsadZaSSdWcEmwiPRa/YUw
   74wUYOQz9yfTLU7CjFrvdMphe2+DhTBMiDk4Z5R2dsPzKLdjh5s38KXt9
   lvRZM9jRLNfG3UxVL6En0WjEUXtyqHZAlIRMCvAVeKNL9mmjRQR1OvyKs
   Q==;
X-CSE-ConnectionGUID: aruFB+rJSmGmOiSnU7O61A==
X-CSE-MsgGUID: xjvmTqu3R4qqgBZPYHn7qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60833035"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60833035"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:26:39 -0700
X-CSE-ConnectionGUID: P2sUgeGjSViYIrl0MnncvQ==
X-CSE-MsgGUID: zhjH1eHDRpG+WAqlVuOE3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="189682515"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:26:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulZ6F-000000056eI-3lk1;
	Mon, 11 Aug 2025 23:26:31 +0300
Date: Mon, 11 Aug 2025 23:26:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
Message-ID: <aJpR96Kkj12BwW-M@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
> The I2C communication is completely broken on the Armada 3700 platform
> since commit 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery").
> 
> For example, on the Methode uDPU board, probing of the two onboard
> temperature sensors fails ...
> 
>   [    7.271713] i2c i2c-0: using pinctrl states for GPIO recovery
>   [    7.277503] i2c i2c-0:  PXA I2C adapter
>   [    7.282199] i2c i2c-1: using pinctrl states for GPIO recovery
>   [    7.288241] i2c i2c-1:  PXA I2C adapter
>   [    7.292947] sfp sfp-eth1: Host maximum power 3.0W
>   [    7.299614] sfp sfp-eth0: Host maximum power 3.0W
>   [    7.308178] lm75 1-0048: supply vs not found, using dummy regulator
>   [   32.489631] lm75 1-0048: probe with driver lm75 failed with error -121
>   [   32.496833] lm75 1-0049: supply vs not found, using dummy regulator
>   [   82.890614] lm75 1-0049: probe with driver lm75 failed with error -121
> 
> ... and accessing the plugged-in SFP modules also does not work:
> 
>   [  511.298537] sfp sfp-eth1: please wait, module slow to respond
>   [  536.488530] sfp sfp-eth0: please wait, module slow to respond
>   ...
>   [ 1065.688536] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>   [ 1090.888532] sfp sfp-eth0: failed to read EEPROM: -EREMOTEIO
> 
> After a discussion [1], there was an attempt to fix the problem by
> reverting the offending change by commit 7b211c767121 ("Revert "i2c:
> pxa: move to generic GPIO recovery""), but that only helped to fix
> the issue in the 6.1.y stable tree. The reason behind the partial succes
> is that there was another change in commit 20cb3fce4d60 ("i2c: Set i2c
> pinctrl recovery info from it's device pinctrl") in the 6.3-rc1 cycle
> which broke things further.
> 
> The cause of the problem is the same in case of both offending commits
> mentioned above. Namely, the I2C core code changes the pinctrl state to
> GPIO while running the recovery initialization code. Although the PXA
> specific initialization also does this, but the key difference is that
> it happens before the conrtoller is getting enabled in i2c_pxa_reset(),
> whereas in the case of the generic initialization it happens after that.
> 
> To resolve the problem, provide an empty init_recovery() callback
> function thus preventing the I2C core to call the generic recovery
> initialization code.
> 
> As the result this change restores the original behaviour, which in
> turn makes the I2C communication to work again as it can be seen from
> the following log:
> 
>   [    7.305277] i2c i2c-0:  PXA I2C adapter
>   [    7.310198] i2c i2c-1:  PXA I2C adapter
>   [    7.315012] sfp sfp-eth1: Host maximum power 3.0W
>   [    7.324061] lm75 1-0048: supply vs not found, using dummy regulator
>   [    7.331738] sfp sfp-eth0: Host maximum power 3.0W
>   [    7.337000] hwmon hwmon0: temp1_input not attached to any thermal zone
>   [    7.343593] lm75 1-0048: hwmon0: sensor 'tmp75c'
>   [    7.348526] lm75 1-0049: supply vs not found, using dummy regulator
>   [    7.356858] hwmon hwmon1: temp1_input not attached to any thermal zone
>   [    7.363463] lm75 1-0049: hwmon1: sensor 'tmp75c'
>   ...
>   [    7.730315] sfp sfp-eth1: module Mikrotik         S-RJ01           rev 1.0  sn 61B103C55C58     dc 201022
>   [    7.840318] sfp sfp-eth0: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
>   [    7.850083] mvneta d0030000.ethernet eth0: unsupported SFP module: no common interface modes
>   [    7.990335] hwmon hwmon2: temp1_input not attached to any thermal zone

TBH this sounds to me like trying to hack the solution and as you pointed out
the problem is in pinctrl state changes. I think it may affect not only I2C case.

And I didn't get how recovery code affects the initialisation (enumeration). Do we
set pin control state back and forth during probe? May be this is a root cause?

...

> [1] https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sartura.hr
> 

Can you make this a Link tag?
Link: $URL #1

> Cc: stable@vger.kernel.org # 6.3+
> Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device pinctrl")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

...

>  static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
>  {
>  	struct i2c_bus_recovery_info *bri = &i2c->recovery;

>  		return 0;
>  	}
>  
> +	bri->init_recovery = i2c_pxa_init_recovery_cb;

This is unfortunate. I would keep the naming schema consistent, i.e. rename
existing function and use its original name for the new callback.

>  	bri->prepare_recovery = i2c_pxa_prepare_recovery;
>  	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
>  	bri->recover_bus = i2c_generic_scl_recovery;

-- 
With Best Regards,
Andy Shevchenko



