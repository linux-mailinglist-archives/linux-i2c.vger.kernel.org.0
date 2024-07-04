Return-Path: <linux-i2c+bounces-4640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCCB927E83
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 23:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E5A1F229CF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 21:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B04513D246;
	Thu,  4 Jul 2024 21:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qs7hMrMU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043BA131736;
	Thu,  4 Jul 2024 21:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720128300; cv=none; b=iK4KrKcORXXrXg88kbSeqLm2csCq5QRP43TlBA7AWESaUpX5In9mxhTOE8ZIuUoG1q/MwFYHZi5yMDD6f4y5TcwHH3sp7nyrXRKvpdVG0HOdsx3WTTcSXczoiRPC+eHkPQN0FiH86g7Nvn3DJoSmnzPL7teUzy+84hIx1IhQaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720128300; c=relaxed/simple;
	bh=QvGt16gL/1P99pontiVpx6N0qgm92daX1SuLGPTYRSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9VkQZpVsVbWCgpUfMYPYRTV/EQP0CcjsClg18ANzc2QLzsUSoxucjYqkUQu8u46oDl2jUBynBX752XifPMz/NZj19f0e854L2CwwJB90gMczp16Mv3MsjikJ/DuOLtDZzsapd+okkRf7dc3Kt83XLHQyqgmbgZxivSLu5hvvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qs7hMrMU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7737C3277B;
	Thu,  4 Jul 2024 21:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720128299;
	bh=QvGt16gL/1P99pontiVpx6N0qgm92daX1SuLGPTYRSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs7hMrMU+aW0N4S1MYIiq2XPMFKThLwk5TST/UEmDfuOGxQUaUsr7mEynw8ryoChv
	 oeC0j5I3XwtgmAJd91pyy+DeWgOZ2osW/ModsPpmO+9nbwqwOnzCSUP4QWurPaF+n5
	 u2/zKYon8MJlVGxkI+oelyy+Lbiab6Pw/J0Knxy5G43lHnu33AuuTX5wHbYwnRKAr/
	 VNDWu7PzJUZfFMFMdf7e/vLKF7zj5zkb731eh1GPB054bNLY1fv6QzTRNhiwQzp6Cc
	 rt3wXNTfP7iIU2aONVdpY8aol+BpfaacQAYrfxg+TCntxD58idvDQlIzEbqoO5ehAK
	 BTPA3tdsTY/YQ==
Date: Thu, 4 Jul 2024 23:24:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
	Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 1/6] i2c: core: Setup i2c_adapter runtime-pm before
 calling device_add()
Message-ID: <iy5gde33alb7v3kflarph4wpn5lmelquozje7glfnfqjgxhdzr@o5e2kfgsslht>
References: <20240704125643.22946-1-hdegoede@redhat.com>
 <20240704125643.22946-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704125643.22946-2-hdegoede@redhat.com>

Hi Hans,

...

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1521,7 +1521,18 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>  	dev_set_name(&adap->dev, "i2c-%d", adap->nr);
>  	adap->dev.bus = &i2c_bus_type;
>  	adap->dev.type = &i2c_adapter_type;
> -	res = device_register(&adap->dev);
> +	device_initialize(&adap->dev);
> +
> +	/*
> +	 * This adapter can be used as a parent immediately after device_add(),
> +	 * setup runtime-pm (especially ignore-children) before hand.
> +	 */
> +	device_enable_async_suspend(&adap->dev);
> +	pm_runtime_no_callbacks(&adap->dev);
> +	pm_suspend_ignore_children(&adap->dev, true);
> +	pm_runtime_enable(&adap->dev);
> +
> +	res = device_add(&adap->dev);

I see a pattern here around in the kernel:

	device_initialize(...)
	...
	device_add(...)

which makes the device_register() helper not that useful. Perhaps
for the future we could add a device_register_fn() where we pass
the reference of a function that does whatever lies in between
the initialize and the add... food for thoughts.

As of now, looks good to me:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

>  	if (res) {
>  		pr_err("adapter '%s': can't register device (%d)\n", adap->name, res);
>  		goto out_list;
> @@ -1533,11 +1544,6 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>  	if (res)
>  		goto out_reg;
>  
> -	device_enable_async_suspend(&adap->dev);
> -	pm_runtime_no_callbacks(&adap->dev);
> -	pm_suspend_ignore_children(&adap->dev, true);
> -	pm_runtime_enable(&adap->dev);
> -
>  	res = i2c_init_recovery(adap);
>  	if (res == -EPROBE_DEFER)
>  		goto out_reg;
> -- 
> 2.45.1
> 

