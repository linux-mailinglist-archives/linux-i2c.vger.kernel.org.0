Return-Path: <linux-i2c+bounces-900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE523819D5B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 11:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F02601C2118F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 10:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B14F20B2C;
	Wed, 20 Dec 2023 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R7cNe7Pl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA8420DD3;
	Wed, 20 Dec 2023 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFA00E0017;
	Wed, 20 Dec 2023 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703069376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDREN8pL6rlwj/zx8p4+gf0J/H2ZGLILA62AWk5JrKI=;
	b=R7cNe7PljnMWbHiOXpSckQyJhiJsd9Xey7FxPrajIPq0BvmESrVg2a+Ikz8vdb5UdFPxqb
	orIOWQUaIATjaZNTR44qk96mq+KAdE8dZZStq77Dp6/i9fPJ92glBlXnHUuXn0ZpYNuTuK
	UHjta+d0mpLjVdM2NUBWpXzZGvShj33o2o+tSCib6EHcHW43yp4/6od2YYRh6n28HEHTjs
	9eJITUPh5n/pMV6SqSoN/gA/9r7VS+b2thgaa3YvphqJrFF0JY4i4G8mnalssN9xFiBMBT
	rUmRCl2lbrECykoAsoUrGYVoers5mbNKHkBT4PxOCvpWLIiRXQ6Oije3v8vQkw==
Message-ID: <4c31acd8-4edb-44f5-9a90-cb2f2dc530b6@bootlin.com>
Date: Wed, 20 Dec 2023 11:49:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: omap-i2c: runtime pm issue during suspend to ram
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
To: linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Kumar Udit <u-kumar1@ti.com>
References: <f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.com>
In-Reply-To: <f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 12/19/23 18:15, Thomas Richard wrote:
> Hello,

I add some people in this thread.

> 
> I have a gpio expander (pca953x driver) connected to an i2c controller
> managed by the omap-i2c driver.
> And I have some issues with pm_runtime_force_suspend/resume during
> suspend to ram.
> For some reasons, related to hardware design, I need to access to this
> gpio expander during suspend_noirq and resume_noirq. So I had to move
> the suspend/resume of the pca953x to suspend_noirq/resume_noirq.
> 
> The i2c controller is autosuspended when I start the suspend sequence.
> In suspend_noirq, I access to one gpio of the expander, so rpm_resume is
> called to resume the i2c controller.
> And rpm_resume returns an error because disable_depth > 0 [1]. In
> suspend_noirq, runtime pm is disabled (disable_depth is incremented when
> runtime pm is disabled [2]). So the expander is not reachable, and the
> access fails.
> 
> [1]
> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L773
> [2]
> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L1474
> 
> The suspend_noirq of the gpio expander don't do i2c access, so no
> problem for pca953x suspend.
> The pm_runtime_force_suspend (suspend_noirq [3]) of the i2c controller
> does nothing as the device is already suspended [4].
> 
> [3]
> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/i2c/busses/i2c-omap.c#L1579
> [4]
> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L1878
> 
> Then during the pm_runtime_force_resume (resume_noirq [3]) the i2c
> controller is not resumed because needs_for_resume is equal to 0 [5].
> The needs_for_resume flag is set in pm_runtime_force_suspend [6] but we
> don't reach this point, because the device is already suspended [4].
> 
> [5]
> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L1929
> [6]
> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L1900
> 
> Then the resume_noirq of the pca953x driver is called, consequently
> rpm_resume is called to resume the i2c controller. But it is never
> resumed because disable_depth > 0 [7] (runtime pm is still disabled in
> resume_noirq). So the resume_noirq fails.
> 
> [7]
> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L773
> 
> I found a workaround which is to resume the controller and disable
> runtime pm during suspend, then runtime pm is enabled during resume.
> But there is probably a better solution to fix this issue.
> 
> Best Regards,
> 
> Thomas Richard
> 
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 42165ef57946..fe79b27b46fd 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1575,9 +1575,24 @@ static int __maybe_unused
> omap_i2c_runtime_resume(struct device *dev)
>         return 0;
>  }
> 
> +static int omap_i2c_suspend(struct device *dev)
> +{
> +       pm_runtime_get_sync(dev);
> +       pm_runtime_disable(dev);
> +       return 0;
> +}
> +
> +static int omap_i2c_resume(struct device *dev)
> +{
> +       pm_runtime_enable(dev);
> +       pm_runtime_put_autosuspend(dev);
> +       return 0;
> +}
> +
>  static const struct dev_pm_ops omap_i2c_pm_ops = {
>         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                       pm_runtime_force_resume)
> +       SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
>         SET_RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
>                            omap_i2c_runtime_resume, NULL)
>  };
> 
> 
> 
-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


