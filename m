Return-Path: <linux-i2c+bounces-170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6AE7EC125
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 12:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEA80280D53
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 11:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66895156D4;
	Wed, 15 Nov 2023 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJKy6Uz+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31848E57E
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 11:14:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EA0E6;
	Wed, 15 Nov 2023 03:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700046882; x=1731582882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WQgxSSG423XRPERiwlT6QFzhckBWPkr0uzAzYrsVN3U=;
  b=nJKy6Uz+S/F5isMV6aK/410uSEEUuzr7uDLitJ06djaSSu+EMvq+5/ZS
   IqWUwvM1XP/P+gQKtqj7Y+sMMAq049wAOCZO8WFDgyOG2VQTUCTExk1Td
   ZeIbDxnIBhIV0FK4hBVzxgIYk6V/HlpNi9etW5F7EvHcPrMSI040GjitF
   kX4PLKriAEZvrLvzTVMGn7u2hhjp6g4IuG9JwcOn0IHniZk6nmS1fB/sK
   kkVP2c5a5/h6X3e5Qzgi1IQYeLiu2no8wTE+sI9IXgNOfJGogxjJEc4s1
   uOVq8SB0FwQ1PK4kp5hg7IYGXzhnNOT7NXbfq7cUrQ2b1/GrpWm9RA7wC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390654631"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="390654631"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 03:14:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="741408395"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="741408395"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2023 03:14:37 -0800
Message-ID: <e299ee44-7de1-4542-828d-a0c86b217fb4@linux.intel.com>
Date: Wed, 15 Nov 2023 13:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/25] i2c: designware: Fix PM calls order in
 dw_i2c_plat_probe()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-3-andriy.shevchenko@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231110182304.3894319-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 20:11, Andy Shevchenko wrote:
> We should not mix managed calls with non-managed. This will break
> the calls order at the error path and ->remove() stages. Fix this
> by wrapping PM ops to become managed one.
> 
> Fixes: 36d48fb5766a ("i2c: designware-platdrv: enable RuntimePM before registering to the core")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I fail to see what was broken in above commit and how this patch fixes it?

> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 28 ++++++++++++---------
>   1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 855b698e99c0..8b0099e1bc26 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -177,14 +177,26 @@ static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> -static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
> +static void dw_i2c_plat_pm_cleanup(void *data)
>   {
> +	struct dw_i2c_dev *dev = data;
> +
>   	pm_runtime_disable(dev->dev);
>   
>   	if (dev->shared_with_punit)
>   		pm_runtime_put_noidle(dev->dev);
>   }
>   
> +static int dw_i2c_plat_pm_setup(struct dw_i2c_dev *dev)
> +{
> +	if (dev->shared_with_punit)
> +		pm_runtime_get_noresume(dev->dev);
> +
> +	pm_runtime_enable(dev->dev);
> +
> +	return devm_add_action_or_reset(dev->dev, dw_i2c_plat_pm_cleanup, dev);
> +}
> +
>   static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev->dev);
> @@ -381,19 +393,12 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   	pm_runtime_use_autosuspend(&pdev->dev);
>   	pm_runtime_set_active(&pdev->dev);
>   
> -	if (dev->shared_with_punit)
> -		pm_runtime_get_noresume(&pdev->dev);
> -
> -	pm_runtime_enable(&pdev->dev);
> -
> -	ret = i2c_dw_probe(dev);
> +	ret = dw_i2c_plat_pm_setup(dev);
>   	if (ret)
> -		goto exit_probe;
> +		goto exit_reset;
>   
> -	return ret;
> +	return i2c_dw_probe(dev);
>   
> -exit_probe:
> -	dw_i2c_plat_pm_cleanup(dev);
>   exit_reset:
>   	reset_control_assert(dev->rst);
>   	return ret;

Is it intended change the reset isn't asserted after this patch in case 
i2c_dw_probe() fails?

