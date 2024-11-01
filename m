Return-Path: <linux-i2c+bounces-7725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8329B93FE
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 16:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0CAD1F21B26
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 15:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F86D1B5821;
	Fri,  1 Nov 2024 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNmUjjRJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4D81AAE00;
	Fri,  1 Nov 2024 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473718; cv=none; b=DhrQB8o9ywSFtp3m2dkads4rCF8AiOTpfqEZgy3evJA3m1XB24chLul9c7Sc0JmCxbdAIX935WmtYlF8LOxfVunPkamHi7CKpoHPvapTA+fOUAx80kciBWrEL1mZrNcel8cMDQ1Gd5nXYXaQOk1uOL0JWA1uFqKDELKILxGJusk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473718; c=relaxed/simple;
	bh=c6vixD2UtKgBTEGYBA4IBx+FWPVk0mN6X3UaVNC4oO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUj70a+TAM9pjgXkfb+NN0zLXZHS624aLqcpl2/Kcltj6mQOjntc2dNS4+SfP0YbPXLQdeeRgT/UDT94NWh6LdGKs5WW482C57vRfVAen/TnGfg7nnYwHbE5JPCZJ1hT5NL+gMr7450EGRxtXEV63cpUgpC0Fa0jMksnefif+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNmUjjRJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e625b00bcso1764289b3a.3;
        Fri, 01 Nov 2024 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730473713; x=1731078513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CmMdpGUnFePHYrsBQ6Q2Mizbty9ECFme4tqH9oKWuw=;
        b=TNmUjjRJgJsiRsYqu/tKpyWHfqFVzzvy3mqQenGf5d10dOg/PV7V3ByrC2GoLQv1U5
         HVzUpstsEZsZcuYAY7f2EsOgK8hxAznq+FwqOCcoYMKjBen8OuAzBd9p6wPt6SMBM4U5
         h1KZGNQjYb40wyDRdFPu9I1ZF87BDUUleeswyUwcHHiLJhBB8paaVeUwCI3H4e+p9UIC
         lPjzEPkn9+4cGZtiU5hIyhVIlPX4TCA2DHtuvqpjQSUQ9AFzGNjBV/BHOMJ1N3nzbyIF
         5HsYa4aSAjhUkfQ85dypck1m8Kc4ImyRyd86UCS/vMj8iksw8QC2iMURXcgPYLnWU32W
         hJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730473713; x=1731078513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CmMdpGUnFePHYrsBQ6Q2Mizbty9ECFme4tqH9oKWuw=;
        b=ligqce1orIeo19+O6YlbolKpS4p0ZcpkiujGOfMNtRk0BL1obE0hIRldcGsxY1HJ3g
         JuPvUllOYSnypK4u0g9ffxPkU1wb4vYHcEusjYW9F7zDMS1sbBOmL4XYZJInHkBiMhNl
         mEI3TRdOdXfx2z8GDg8sEJztBACLXNZj4Gvm5O/tBhK8kFSGTXHF3tUsBROGmE59isoa
         Oqc//tkkAZKlQURH1w5MadXtBrCoIo9NhxhRz0datoWJyA8MFsmTtX8upJVrCLHLejMz
         /E9VqnMjlDiwRWPkWRRuMiTOy8z/O4bYfQa43RBj84P94+ReOC7LJci8LuldRHna6Mf6
         RgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+2EtD8x+IR+5lG/LyMwqxxR9BmV7K+A2iA7tO//Uiia1Zuh99kLktNe1n3dxVm0T/1LlyJnLvlk2lj5g=@vger.kernel.org, AJvYcCUYfVixazUNgzDmFmGbtzlv5h31McaRvSSOHSOUZIKd5QgvWHa2rUpesmx4LPyQh9ovQKZnjD/+SRfm@vger.kernel.org, AJvYcCUsBnpi9V6+nOjw3Ji2JO1iYsVf71v83F4L7d40Sj+0gtaJn2x1AKKZdbPcd+Iz/G73VWWffbPNLama@vger.kernel.org, AJvYcCVY8tyYMbEe+xvGekh49wO+FksRpoD2eJZdFAjjcMVKsPRJn2JW2SstPZYYwQSsFtr6McnGr/ar9O4z@vger.kernel.org, AJvYcCXhGNGv56+CUcqL8Xo+qmlKELTYPAIpYXFGdMPo08giWphB/IO7cSzPS3Uj9r8EQhB54UErbGSwNkH/J6Ga@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLvcoVdSEW/t88ZNTu/jVqiifWBG6cHIKt9X3wvud0DPeWLr6
	Nvdhsul7o+fLo+8x3NNU7vf3W0Ou/5cZfA3ihSdlxfTpo3dn4DJw
X-Google-Smtp-Source: AGHT+IGw93/HsyjgUnAfeY8EGDn4mNBprwaF1ZcDkdpL1uk/hwkmsJo4n62S1q//MIYva2B6TCrKwg==
X-Received: by 2002:a05:6a00:10cf:b0:71e:6a99:472f with SMTP id d2e1a72fcca58-720b9de116emr9532316b3a.24.1730473713160;
        Fri, 01 Nov 2024 08:08:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8cf3sm2748398b3a.20.2024.11.01.08.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:08:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 08:08:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] hwmon: (pmbus/core) add wp module param
Message-ID: <47164712-876e-4bb8-a4fa-4b3d91f2554b@roeck-us.net>
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
 <20241024-tps25990-v3-3-b6a6e9d4b506@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-tps25990-v3-3-b6a6e9d4b506@baylibre.com>

On Thu, Oct 24, 2024 at 08:10:37PM +0200, Jerome Brunet wrote:
> Add a module parameter to force the write protection mode of pmbus chips.
> 
> 2 protections modes are provided to start with:
> * 0: Remove the write protection if possible
> * 1: Enable full write protection if possible
> 
> Of course, if the parameter is not provided, the default write protection
> status of the pmbus chips is left untouched.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  4 ++
>  drivers/hwmon/pmbus/pmbus_core.c                | 74 ++++++++++++++++++-------
>  2 files changed, 59 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1518343bbe2237f1d577df5656339d6224b769be..aa79242fe0a9238f618182289f18563ed63cba1c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4733,6 +4733,10 @@
>  			Format: { parport<nr> | timid | 0 }
>  			See also Documentation/admin-guide/parport.rst.
>  
> +	pmbus.wp=	[HW] PMBus Chips write protection forced mode
> +			Format: { 0 | 1 }
> +			See drivers/hwmon/pmbus/pmbus_core.c
> +

I have always seen that file as applicable for core kernel parameters,
not for driver kernel parameters. I can not accept a global change like
this without guidance. Please explain why it is desirable to have this
parameter documented here and not in driver documentation.

>  	pmtmr=		[X86] Manual setup of pmtmr I/O Port.
>  			Override pmtimer IOPort with a hex value.
>  			e.g. pmtmr=0x508
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 7bdd8f2ffcabc51500437182f411e9826cd7a55d..ce697ca03de01c0e5a352f8f6b72671137721868 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -31,6 +31,20 @@
>  #define PMBUS_ATTR_ALLOC_SIZE	32
>  #define PMBUS_NAME_SIZE		24
>  
> +/*
> + * PMBus write protect forced mode:
> + * PMBus may come up with a variety of write protection configuration.
> + * 'pmbus_wp' may be used if a particular write protection is necessary.
> + * The ability to actually alter the protection may also depend on the chip
> + * so the actual runtime write protection configuration may differ from
> + * the requested one. pmbus_core currently support the following value:
> + * - 0: write protection removed
> + * - 1: write protection fully enabled, including OPERATION and VOUT_COMMAND
> + *      registers. Chips essentially become read-only with this.

Would it be desirable to also suppport the ability to set the output voltage
but not limits (PB_WP_VOUT) ?

Guenter

