Return-Path: <linux-i2c+bounces-891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DAB81927B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 22:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D2061C23CCF
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 21:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27C53B78B;
	Tue, 19 Dec 2023 21:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJ/M3s2D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394E53B786
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 21:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d12ade25dso37110935e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 13:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703022286; x=1703627086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtmFFtn5frOYNVe98K3JjBM8V3BsafUOuZOR6rzyEi0=;
        b=WJ/M3s2Dzg+iR7k+yYocRnCbTIRtOcEMIvT1gMpSHoNOOganyuEWNRK/tOG5Bjib5c
         eD+W0oBcdZVMptcIQ5opFCcstq73mVx0BnbdD5kEPeIgnBEOUQylA4w1mzqW/jSxbHDc
         fuenNojVKVbsElgU/yINE1Gwa35k3+hrH7ZPDgWi4Kl/UVTNACKo3Y0UaswdzJYvzJhs
         k5WvDdIatLyaEJLWU6FsfiNfQ3a2uiRZmQANcGe6OCTfZhCpiuxLbCNr2PlLmjRsJ4n9
         5bvZQU0rdOhAZOg378xZJEXkkCRiddneF23G+s3cF7ZfLJUqygJlZCjtI/B6Xv6HiSDs
         mPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703022286; x=1703627086;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtmFFtn5frOYNVe98K3JjBM8V3BsafUOuZOR6rzyEi0=;
        b=C5ThXCnPL0c1ZLTIdO2AFtwlAq/T1FgsvKb1H7ZPenWyWPwh528p9DpGI8xMCDUz6l
         apL+50NFeSyZuHNpqc25f2s6Nt2Tc11KKzGLbHRDApSkfeKZ0pmX70ZhpkS77s/4rIPJ
         crd1+HmnlZtmNFNhMNOisudmMQaPaJcEW8fshSh09AJpAVk+Jht86SkuUplsUPgcfUgn
         dgNkkVyQ9ey7gzFzWF/b6EabYcdCf56BYhqeygDPW0py8aYKTbIGjHfES/29mVwY/B2u
         jvsrDUDqiBmGQNcKF7YJtZq4Cdn21bIv4ndzd2nFpdC+IltCCTtbMTsaFkLO765LmqOQ
         rqYg==
X-Gm-Message-State: AOJu0Yx7ddS2CezeUQZefeP7jyTtZcqGurxenJttW4sGdHSvLarU5mt1
	clecQONdCQF5nhBv8mHfiIBOf1Mq9p8=
X-Google-Smtp-Source: AGHT+IGAHWKEl5vpGLYZahBzqidPdpt9O7Dg9PjT7iI2ZCmNV++1wid21WiM4aciCaNp3ZzdN2Flgg==
X-Received: by 2002:a05:600c:444e:b0:40c:48c2:f69f with SMTP id v14-20020a05600c444e00b0040c48c2f69fmr8300038wmn.12.1703022286069;
        Tue, 19 Dec 2023 13:44:46 -0800 (PST)
Received: from ?IPV6:2a01:c23:b834:3300:1863:dc87:812:137a? (dynamic-2a01-0c23-b834-3300-1863-dc87-0812-137a.c23.pool.telefonica.de. [2a01:c23:b834:3300:1863:dc87:812:137a])
        by smtp.googlemail.com with ESMTPSA id r12-20020a05600c35cc00b0040d3276ba19sm789578wmq.25.2023.12.19.13.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 13:44:45 -0800 (PST)
Message-ID: <c9e9cd8b-0056-41be-b62c-223e494fb069@gmail.com>
Date: Tue, 19 Dec 2023 22:44:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: mux: reg: Remove class-based device auto-detection
 support
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <69f19443-f2ca-4158-9d25-160db55bfb57@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <69f19443-f2ca-4158-9d25-160db55bfb57@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2023 07:38, Heiner Kallweit wrote:
> Legacy class-based device auto-detection shouldn't be used in new code.
> Therefore remove support in i2c-mux-reg as long as we don't have a
> user of this feature yet.
> 
> Link: https://lore.kernel.org/linux-i2c/a22978a4-88e4-46f4-b71c-032b22321599@gmail.com/
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/muxes/i2c-mux-reg.c           | 4 +---
>  include/linux/platform_data/i2c-mux-reg.h | 2 --
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
> index 9efc1ed01..8489971ba 100644
> --- a/drivers/i2c/muxes/i2c-mux-reg.c
> +++ b/drivers/i2c/muxes/i2c-mux-reg.c
> @@ -159,7 +159,6 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
>  	struct regmux *mux;
>  	struct i2c_adapter *parent;
>  	struct resource *res;
> -	unsigned int class;
>  	int i, ret, nr;
>  
>  	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
> @@ -213,9 +212,8 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
>  
>  	for (i = 0; i < mux->data.n_values; i++) {
>  		nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
> -		class = mux->data.classes ? mux->data.classes[i] : 0;
>  
> -		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], class);
> +		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
>  		if (ret)
>  			goto err_del_mux_adapters;
>  	}
> diff --git a/include/linux/platform_data/i2c-mux-reg.h b/include/linux/platform_data/i2c-mux-reg.h
> index 2543c2a1c..e2e895768 100644
> --- a/include/linux/platform_data/i2c-mux-reg.h
> +++ b/include/linux/platform_data/i2c-mux-reg.h
> @@ -17,7 +17,6 @@
>   * @n_values: Number of multiplexer channels
>   * @little_endian: Indicating if the register is in little endian
>   * @write_only: Reading the register is not allowed by hardware
> - * @classes: Optional I2C auto-detection classes
>   * @idle: Value to write to mux when idle
>   * @idle_in_use: indicate if idle value is in use
>   * @reg: Virtual address of the register to switch channel
> @@ -30,7 +29,6 @@ struct i2c_mux_reg_platform_data {
>  	int n_values;
>  	bool little_endian;
>  	bool write_only;
> -	const unsigned int *classes;
>  	u32 idle;
>  	bool idle_in_use;
>  	void __iomem *reg;

Any feedback on this patch? We're at 6.7-rc6 and I if there's any
feedback I'd like to incorporate it before the 6.8 merge window.


