Return-Path: <linux-i2c+bounces-2903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EFB8A1D7E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 20:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D78289018
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 18:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749431E312F;
	Thu, 11 Apr 2024 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmV+om7A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959FF1E3121;
	Thu, 11 Apr 2024 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712855342; cv=none; b=YUpQCheA/hlFKWQWf/G4LKUVRfDUjCBN0HPA49RmEdGNYTOeUyWV2V20nahg0eWlT753Wt4GVMBY15eZTcmn5gEyG9Z4ArC6yaLVMFju1aTsNEUPxQCFNCAp9Iy9ttltEQs21MJCz04r3a4TiRE506sIaiJRn2+ABoFMFkv5JDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712855342; c=relaxed/simple;
	bh=/YHP+vy+GUBWNACNY3WPAHUPtqxAyh04TU6owuCU+1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5pOjb3vEhSfiXA/kb0RPy0JLp7c5IOHarYhPD8KwSHVril5ecXUAkSQIZ/qeH5r5nfK9J6ahELBex5wtcdTC1BhApBE3KV3p7xZMiX8zd5Pc4KNvVamxSCWnvLhLrrzhT+QL9mVIEL/LY4ezRrybcaAyY5wReHfK8Ery+eQHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmV+om7A; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so104911fa.0;
        Thu, 11 Apr 2024 10:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712855339; x=1713460139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pyphqGVCbq+kAaIZuipItp9+DUC7bP/EUNJp2qT2X6M=;
        b=SmV+om7AbwMoUvktXZlYQcxy7ls7HkLM9c6LhhibRdb3EhxSkAVX/Y5H/uxqcHXgvY
         FeDkdCvQcdPWn1hip60Rn+hRFwTx7DxfdbPfCsGOXKanE9x5B73/IGjUth6dOl08EluM
         kZWjlPbwqoBtz0TvHIms6+DwKhcq6v2Cr308AK+0IwwuZf/ONzz+Otsnpx8DM3Awpvij
         xwQjKjlIYf9hDX9t5IzGyphp+ORKl6BhkoCoFMCuJn+DF1uj6HwmyEwsmoo6RiWV5X1x
         D6aKbj4TgofwsrQ8utU1zqUlNqx4PMACwF4KCMjZkaSl3ZGFDRvr9zO/B1UqfrWj2Vey
         djWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712855339; x=1713460139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyphqGVCbq+kAaIZuipItp9+DUC7bP/EUNJp2qT2X6M=;
        b=LzA5ajqz7hDoovyAE8nyLac74o8npgfP1TSCKt+rsofzoNrGEoKsv0OHqbhVvCcFjL
         pbuCpK1GT9k72NxKPyEvlvpxTuJlrp2bvJ0W274bc76RyZbO6GFwSmK/xPmjI+oTEUBf
         d5/jcyq0dP22G55Ko5m+SN0xwobaQctwihky1+XiPv/uLzA96XNrz/0eheL3367j+gxk
         UAXLlhwDJ557ALXRCS2Ua7uTIk4oCpjKcH0gjq5RsCyp/8cpAukfY0MOqHi+MUM0h9Q6
         IaNUmEjhy30+P+Ko301mt2CoQcrnNjGm77D7g6xCVxCSXRGwzQomvppStqvNMJlpOoAE
         a55g==
X-Forwarded-Encrypted: i=1; AJvYcCU4dxZ1okUeIPcgl8L7R2+na3cXCZt3cc0muO+pIRTdfLLsz+Kje8bz3FOKNiLo+zO/ZJWCPHqw0VYaWW71rvDnLfCVEhMQ2CGgcOnkV4ZrBFUEleY8Ulu3jPgBSz+q7Q3k7Fp2vZceH9HciDgA7Xpg6bO21dEibqr2Q1pRuJq6jhhkxQ==
X-Gm-Message-State: AOJu0YwNjfvJu1t5C1azrIW5/Dvp+ot2Jv5MLKBMnDtH8kxDuQKkZZT5
	LNqBJi7p1xQC9tDd4tM9xsUj4dhTb53N1lkDHqadnlgIpYz0ZJUW
X-Google-Smtp-Source: AGHT+IGVX1ZUl9zs97xoOOhiCDudM7xFGxbuyDZia/hyPst/uQxTzBSNl/eDIaGOzEIan/dNf1sSsw==
X-Received: by 2002:a05:651c:4c6:b0:2d8:1267:3202 with SMTP id e6-20020a05651c04c600b002d812673202mr195567lji.10.1712855338499;
        Thu, 11 Apr 2024 10:08:58 -0700 (PDT)
Received: from [192.168.3.32] (d-zg2-064.globalnet.hr. [213.149.37.64])
        by smtp.gmail.com with ESMTPSA id cg14-20020a5d5cce000000b00346d91ddbe3sm1090289wrb.9.2024.04.11.10.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 10:08:58 -0700 (PDT)
Message-ID: <416340b6-33a9-4b9e-bdc5-c5a9cffb3055@gmail.com>
Date: Thu, 11 Apr 2024 19:08:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] i2c: Set i2c pinctrl recovery info from it's
 device pinctrl
To: Hanna Hawa <hhhawa@amazon.com>, andriy.shevchenko@linux.intel.com,
 wsa@kernel.org, linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com,
 jonnyc@amazon.com, hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
References: <20221228164813.67964-1-hhhawa@amazon.com>
 <20221228164813.67964-3-hhhawa@amazon.com>
Content-Language: en-US
From: Robert Marko <robimarko@gmail.com>
In-Reply-To: <20221228164813.67964-3-hhhawa@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28. 12. 2022. 17:48, Hanna Hawa wrote:
> Currently the i2c subsystem rely on the controller device tree to
> initialize the pinctrl recovery information, part of the drivers does
> not set this field (rinfo->pinctrl), for example i2c DesignWare driver.
>
> The pins information is saved part of the device structure before probe
> and it's done on pinctrl_bind_pins().
>
> Make the i2c init recovery to get the device pins if it's not
> initialized by the driver from the device pins.
>
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/i2c-core-base.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 7539b0740351..fb5644457452 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -34,6 +34,7 @@
>   #include <linux/of.h>
>   #include <linux/of_irq.h>
>   #include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/devinfo.h>
>   #include <linux/pm_domain.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_wakeirq.h>
> @@ -282,7 +283,9 @@ static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
>   {
>   	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
>   	struct device *dev = &adap->dev;
> -	struct pinctrl *p = bri->pinctrl;
> +	struct pinctrl *p = bri->pinctrl ?: dev_pinctrl(dev->parent);
> +
> +	bri->pinctrl = p;

Hi Hanna,
I know this has already been merged, but setting bri->pinctrl breaks PXA 
recovery.

Regards,
Robert

>   
>   	/*
>   	 * we can't change states without pinctrl, so remove the states if

