Return-Path: <linux-i2c+bounces-11212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C1ACCFFF
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 00:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB07D1889EB1
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 22:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA682253F2;
	Tue,  3 Jun 2025 22:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f1OBsMcQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0B2C3253;
	Tue,  3 Jun 2025 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748990922; cv=none; b=AXZR5wHJGcLVwaM9bdm7Q9S2V9VQloC2plAk7TUmOrHk4Mv08kCwEyJJHBNuNCbi73HzvPai/sCvsB8uRkQkGqDutonANxxIquDSTFuAWqfG6h2ytwK9Zv0JgV9JjkiN9l5FUI1axfrhjibpDIOaHhFmN5k/MF7Qm+c3TmHBaXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748990922; c=relaxed/simple;
	bh=clJQUNwdwlX60yAaKsNhWdwwXmyiCmre5oh/U1SAchE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJNMBI9f1qCQtcuZ7btZVFNQU2KP++h6tCyoAWTxJGuZQw33ZgvNbGKjQwkckqdYtVIGh9+Mhh6ebG2FqXhksDEcuxG8UD2BwmpRrHalPTGHMw11Zd4L93T/J/9eCyfdCtY/FBBjzRpqWeoaRvyGaurPXfJuV7lcY5VSR3z312M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=f1OBsMcQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=SrYBN3CmnWpYR3NhQM6Kd9jk26siZ5bSwDLCv5Pgh8A=; b=f1OBsMcQH/n0npzP2qozZCdFaw
	RhIQJ6AVWEM83ZqVdmb9MMyn0sryR+FggxsIZdJjT8oiUNmc/9KOUvsi+kGVzDMEQXE8vgA7Refvg
	f+t9kRIt/LRBCA5w0Ng6JSWchkq5tvwlZr0kKxNGTaAK/Oq0SZEBe24Ip2b8/ltpiQgZYoHEn1Ckl
	bgzOT03pBqlXOxBKqaQPQo0VZfbnAFUB89SJDGMSwHG9pbbwE8kZOyil20w+1ue/RhPO//jxv/Svj
	sc10MuR1SClw5U0V3Va1X1zxISx1+4QDuAbHvyuOcLgXDf1iTMieHsIM4roUp4DQaZYTSTXoVPFZp
	ludJ0CRA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMaQp-00000002VsN-41Hy;
	Tue, 03 Jun 2025 22:48:32 +0000
Message-ID: <f80360f4-0d17-4464-8ede-21bae10dcfd8@infradead.org>
Date: Tue, 3 Jun 2025 15:48:28 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i2c: amd-isp: Initialize unique adpater name
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
 <20250603214611.3039787-3-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250603214611.3039787-3-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/25 2:40 PM, Pratap Nirujogi wrote:
> Initialize unique name for amdisp i2c adapter, which is used
> in the platform driver to detect the matching adapter for
> i2c_client creation.
> 
> Add definition of amdisp i2c adapter name in a new header file
> (include/linux/soc/amd/isp4_misc.h) as it is referred in different
> driver modules.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
>  include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 include/linux/soc/amd/isp4_misc.h
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> index ad6f08338124..450793d5f839 100644
> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -8,6 +8,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/soc/amd/isp4_misc.h>
>  
>  #include "i2c-designware-core.h"
>  
> @@ -62,6 +63,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>  
>  	adap = &isp_i2c_dev->adapter;
>  	adap->owner = THIS_MODULE;
> +	scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
>  	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>  	adap->dev.of_node = pdev->dev.of_node;
>  	/* use dynamically allocated adapter id */
> diff --git a/include/linux/soc/amd/isp4_misc.h b/include/linux/soc/amd/isp4_misc.h
> new file mode 100644
> index 000000000000..6738796986a7
> --- /dev/null
> +++ b/include/linux/soc/amd/isp4_misc.h
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef __SOC_ISP4_MISC_H
> +#define __SOC_ISP4_MISC_H
> +
> +#define AMDISP_I2C_ADAP_NAME "AMDISP DesignWare I2C adapter"
> +
> +#endif

-- 
~Randy

