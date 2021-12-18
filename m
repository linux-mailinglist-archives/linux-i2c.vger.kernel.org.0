Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90911479CCF
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 22:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbhLRVRR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Dec 2021 16:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbhLRVRR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Dec 2021 16:17:17 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F79DC061574;
        Sat, 18 Dec 2021 13:17:17 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id u17so4872793plg.9;
        Sat, 18 Dec 2021 13:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GTXZALPrULQFFohO+yn4hKDW5HSqM1ZL3ZeujC4578Q=;
        b=claeeP6hpDrPXUF1P+DW1064XICLuC4tDMVCgrdkHAkWSRd2+zz+lqiVodfQYAAYxS
         qEhhz2tEvSS0kDpNuPz/jGz6Sx+yl2FZfUuJJOWTNTEtKHmKswZq98ol/HFQBgWJgnFo
         FItfyvk2yooWM5DvukP0a6c0TFqksVW/ryXcD3WibWQFIBkmN8Hcs54Svevzg//UZKmR
         5ezGUKhufyVDXtTc0J8nB91Xutuol90iHN9zTrYTcVDIRt3U/XDR8+K9a4d4WBetgbtq
         +vUFjFOVhGBMmnGtuEBH/useCRe3vB9hcVVCrIkgil+7FR8yp2Xqjrq/Frs9mQG5Tcx/
         t2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GTXZALPrULQFFohO+yn4hKDW5HSqM1ZL3ZeujC4578Q=;
        b=h5PznRnmXFvQpYnWI2Zmc021QzXAN3v0RcxZzemH0gHckS2tSUM0BKQdkGjL2S/B6P
         4chYxpuWoJzbVqsSMsiAurxzZg3BVejbDlZIKTq8m9I38Vg0y/8sQuVWv1vi8T0WaIct
         OlVqe3VTsXdExFwAqBD0qR4qw9nvGsiZE+7CVjYYINnOgnFAed0ipHOv/+1pp0G0b661
         vcF12Lyi5UMT2nkSepUHFOhJEcT0+mz3DzrnogKhR/A2LIqog8kcKxsVwU3pRb9dP+on
         s3gDMsWi935+3twFGWrua1mdspi5yGkYCY1yL8kgcRzGK/TbBK2qz+Z8sT5tL8bEK4vd
         OgMg==
X-Gm-Message-State: AOAM533CcIed4GiqCwCjS22Ml94MzFdXLkTXphWnYP/bR58dM9jbKP+I
        1Iqzq2eKlqDGTU9p75VqPls=
X-Google-Smtp-Source: ABdhPJzyBK3WWbHHo+VX9p2yHZLVkeAfYE/tCUCIbpHeawtBk1NfNjDO6g1jSdvVyXSM2qb0j1I8Bw==
X-Received: by 2002:a17:902:8b8a:b0:148:bd36:94ed with SMTP id ay10-20020a1709028b8a00b00148bd3694edmr9766601plb.44.1639862236626;
        Sat, 18 Dec 2021 13:17:16 -0800 (PST)
Received: from [10.1.10.177] (c-71-198-249-153.hsd1.ca.comcast.net. [71.198.249.153])
        by smtp.gmail.com with ESMTPSA id oj9sm9458935pjb.0.2021.12.18.13.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 13:17:15 -0800 (PST)
Message-ID: <a02d76dc-52cc-3ecc-5ef7-825c3167431a@gmail.com>
Date:   Sat, 18 Dec 2021 13:17:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] i2c: bcm2835: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211218165258.16716-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/18/2021 8:52 AM, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Just one nit below:
> ---
>   drivers/i2c/busses/i2c-bcm2835.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> index 37443edbf754..d63dec5f3cb1 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -402,7 +402,7 @@ static const struct i2c_adapter_quirks bcm2835_i2c_quirks = {
>   static int bcm2835_i2c_probe(struct platform_device *pdev)
>   {
>   	struct bcm2835_i2c_dev *i2c_dev;
> -	struct resource *mem, *irq;
> +	struct resource *mem;
>   	int ret;
>   	struct i2c_adapter *adap;
>   	struct clk *mclk;
> @@ -452,12 +452,9 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!irq) {
> -		dev_err(&pdev->dev, "No IRQ resource\n");
> -		return -ENODEV;
> -	}
> -	i2c_dev->irq = irq->start;
> +	i2c_dev->irq = platform_get_irq(pdev, 0);
> +	if (i2c_dev->irq <= 0)
> +		return i2c_dev->irq ? i2c_dev->irq : -ENXIO;

Why not just check for a negative return code and propagate it as is?
-- 
Florian
