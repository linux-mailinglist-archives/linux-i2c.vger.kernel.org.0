Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD171FC567
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 06:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgFQEwW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jun 2020 00:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgFQEwV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Jun 2020 00:52:21 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B78C061573;
        Tue, 16 Jun 2020 21:52:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a9so1201668ljn.6;
        Tue, 16 Jun 2020 21:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+Osoj5ygLvNMxDa6TIcT1b6EKKm4cXZgXB/12o2ZCl0=;
        b=lW2Iyg1ShW2LI+AsuHbi/kCBkrS+XBtLwwWUuqAI6nlrAv8PoSRdNmOXyQqwBhmZWM
         4rKS0Uo7qEE9mnQVoB8iAom+H4xiqC25FdOQoYrphowG0/38/x7gBNDCDIOYf20KxT0E
         AaBEqDBk4Ik7L2aTyF0CIEcNGfonBSNkMV4etQ/bK4IZil0qhEAWZ8TPMXw/sg6PD6vq
         ac62iA6Ula3LnuWCunyZZv7sajXgGWDDp6uN6FnmePIWCNiYqMIzzuuALJ0AryDRkMVD
         B8jo9zdr13nLnaVN0I3y8PIah9hyuUe/T+8JpdnW1jVA/mzCb07ch3zfz/zZ/fA6LgYb
         3Ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Osoj5ygLvNMxDa6TIcT1b6EKKm4cXZgXB/12o2ZCl0=;
        b=FjaVit+kQ7UDB1x65WH7jGdYI1kluYA7eKd5MTIL/RXudLRN8CIrfz5axYxPKp09JW
         2wnwfp7pIltM+dywXXMJRoDPxNoMPJh0gIyVS1BxCPXZgaaQi1TMKDCDJNWv7dluHf6o
         5fL84nVRl/LRGKHnFtwePu5PSm7kEpFzlsGHIdich667gNwZR+IWBvSqUoPsJwL3oS5O
         JNMb8n2N/YoDAYEt5Ny2CXB9XdmDIVF4qyZfQWG1Cx9wymFUoofGkVpnoTS6jRfQMuke
         iBbTYqugoRnDGRc5uHz5BYrTFOn4iDF08hjqWjBbCs9QKh+cD/LVwMUX2mNkilYefydB
         E1NA==
X-Gm-Message-State: AOAM530Rs+yXb/RQ1XRYP0144QtEGPbq+/OT3Q2b2GbZYkqCOYP9nzOP
        H0FbAbCQ6SPZzWuR3jMGypf9RMwJ
X-Google-Smtp-Source: ABdhPJwf+Zpknbb8mRkR5GoEZZJ/z3KJOBdQT7rCwopnn394cbc1Qr8XMmuJmoQXw7uHYjLcBxrHpQ==
X-Received: by 2002:a05:651c:338:: with SMTP id b24mr2838896ljp.87.1592369539402;
        Tue, 16 Jun 2020 21:52:19 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id f2sm2021812lfc.11.2020.06.16.21.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 21:52:18 -0700 (PDT)
Subject: Re: [RFC PATCH v2 04/18] i2c: tegra: Fix the error path in
 tegra_i2c_runtime_resume
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-5-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f7997a48-eaec-839e-e0cd-cde718bd2e72@gmail.com>
Date:   Wed, 17 Jun 2020 07:52:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1592358094-23459-5-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.06.2020 04:41, Sowjanya Komatineni пишет:
> tegra_i2c_runtime_resume does not disable prior enabled clocks
> properly.
> 
> This patch fixes it.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 3be1018..1b459ca 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -668,7 +668,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>  		ret = clk_enable(i2c_dev->slow_clk);
>  		if (ret < 0) {
>  			dev_err(dev, "failed to enable slow clock: %d\n", ret);
> -			return ret;
> +			goto disable_fast_clk;
>  		}
>  	}
>  
> @@ -676,11 +676,16 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>  	if (ret < 0) {
>  		dev_err(i2c_dev->dev,
>  			"Enabling div clk failed, err %d\n", ret);
> -		clk_disable(i2c_dev->fast_clk);
> -		return ret;
> +		goto disable_slow_clk;
>  	}
>  
>  	return 0;
> +
> +disable_slow_clk:
> +	clk_disable(i2c_dev->slow_clk);
> +disable_fast_clk:
> +	clk_disable(i2c_dev->fast_clk);
> +	return ret;
>  }
>  
>  static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
> 

This looks good to me. Could you please add an additional patch to
remove all the other conditions of the clk enable/disable? The current
code was already inconsistent because in most cases there are
conditions, but not in all cases.
