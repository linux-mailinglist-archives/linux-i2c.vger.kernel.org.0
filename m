Return-Path: <linux-i2c+bounces-1938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2094860B99
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 08:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A543285316
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 07:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00295171A6;
	Fri, 23 Feb 2024 07:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuLq6wOs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149DB171BC
	for <linux-i2c@vger.kernel.org>; Fri, 23 Feb 2024 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708674744; cv=none; b=Gm7jqy2BrtmJrQ/BMa6OIiuV+ttjWTBy/mRYgLZKErKGvNfThOpSyCP5eeG2SujS7ko2aY/dXLj7uaNTbvjESy54M36xiQ9mbLiycpSzb2xArXYK0KbHYZBgtvnlk77g5H83B+1SGNMORtWrZ0Cr372tFbm6l5cLwYl3JDzEPro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708674744; c=relaxed/simple;
	bh=O73BuFwKoK5bxhyp6g9/FnZ06WEdxJutm1mhHw49934=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bqc47XlHhqGa1huTuJ+QRHC5XTVXtZxSF3d3zIy2qIV6AlTfw6onsTlbbf0amc6X877NMrHnvql7bc0DrOKjOTpkY6+7KRtrSq2MV02zJw7G7RRKErjHRDE3dAbRgpRDJlWRZ1aylNlog+VIML9fyvlMNVw5cupkieSSfIz1TTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuLq6wOs; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512e4f4e463so811565e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 23:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708674741; x=1709279541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOOKZGMXeQ8AvIHoBCXOx+ntgSqz1Org+Q9UIiabiFc=;
        b=fuLq6wOsconva8YwrXIbFlqPjxmNdnWHDjiEFPpOct5SA92E75DKrZ2s+JMq9XQnvH
         7e+iXXhCSx+2k54TxPNJ6eURy7+nckUa1M4xD55P/5PtWgCtgaOkla+odOaH+lQmOkB/
         Z+FSzn7AXV3WEWvvh0UmW3DSud7VbpDZTBMibLxwMGYtFVJUmqx8qddPgHMFeAlLTFag
         p5sm5YzgV17j1DbGrLJr0pTwZ2yxIZxAJNDpJL1Ht2QfZdZKsy1MHBmiTEnQrxKLM90e
         r+KRtki3ajmhj50/Ygp9FD08X7TZExWVfuntTjqen12YiCIHe00rOKJQRkDVtAIQ/W8s
         kgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708674741; x=1709279541;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOOKZGMXeQ8AvIHoBCXOx+ntgSqz1Org+Q9UIiabiFc=;
        b=efE5TsIyxkHWcMRF8APGweVe58P2/KUaRH9DOGTL3TBwrUokrEhnUHatubdSfhYfYz
         7HmjSxTOFO4n+F+ldBbRxojVhWt0Nmni6egwg2G2AJw0Wh1q+FTfd5ZH7HGLV5jbHyU3
         KcIxgzpnCACebx+M01Eli90bTDuiuhW0oNayl5qae2Sqcoexa0P+VILTICfBaIGZ1A39
         k9ULiT9VlhYCPawMBS9vI5UkmHiJl1R5yn2Pq2VPb5NR1R9+cERJ1Aqr0tMwvCD7GxzA
         V95c/w2dvUTzUBumhluW5rL/94t//y5H5utkj8GmfQJbiVU2VXnqIjyxMsSn56JFoU9T
         NbTQ==
X-Gm-Message-State: AOJu0YxPrbDlA0yDwV3d8hfg2r0R1e579W/mXcwXBSfV+a+0viJzg+Sf
	mBwcInU/Cva/Hu5EvDZm5sElAIsWYkgEMGIZL8Tp9f3SyzOVlGTw
X-Google-Smtp-Source: AGHT+IFscJHxpRg0b7QUosU9fz5FN62mkCNzaswl4vo2fA7A9IMPkDVgM/YEFJ71rdlTzK/MbSqHjw==
X-Received: by 2002:ac2:5b44:0:b0:512:aa1f:669 with SMTP id i4-20020ac25b44000000b00512aa1f0669mr896594lfp.16.1708674740918;
        Thu, 22 Feb 2024 23:52:20 -0800 (PST)
Received: from ?IPV6:2a01:c23:c403:8000:4442:2b24:9c18:44ef? (dynamic-2a01-0c23-c403-8000-4442-2b24-9c18-44ef.c23.pool.telefonica.de. [2a01:c23:c403:8000:4442:2b24:9c18:44ef])
        by smtp.googlemail.com with ESMTPSA id cf28-20020a0564020b9c00b00564761ca19fsm4525736edb.29.2024.02.22.23.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 23:52:20 -0800 (PST)
Message-ID: <7e6f4711-5c74-4b82-a136-d3cf19f61593@gmail.com>
Date: Fri, 23 Feb 2024 08:52:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Avoid potential double call to
 gpiod_remove_lookup_table
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <39f39c4e-b997-4698-8406-4d514a530d0d@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <39f39c4e-b997-4698-8406-4d514a530d0d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 08:11, Heiner Kallweit wrote:
> If registering the platform device fails, the lookup table is
> removed in the error path. On module removal we would try to
> remove the lookup table again. Fix this by leaving it to
> i801_del_mux() to clean up.
> 
> Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 4b9d04f20..223cd2b84 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1457,10 +1457,8 @@ static void i801_add_mux(struct i801_priv *priv)
>  	priv->mux_pdev = platform_device_register_data(dev, "i2c-mux-gpio",
>  				PLATFORM_DEVID_NONE, &gpio_data,
>  				sizeof(struct i2c_mux_gpio_platform_data));
> -	if (IS_ERR(priv->mux_pdev)) {
> -		gpiod_remove_lookup_table(lookup);
> +	if (IS_ERR(priv->mux_pdev))
>  		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
> -	}
>  }
>  
>  static void i801_del_mux(struct i801_priv *priv)

Forgot to cc stable in both patches. I'll wait for other feedback and will
submit a v2 afterwards.

