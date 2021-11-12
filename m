Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E6444E8B9
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 15:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbhKLObE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 09:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbhKLObD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 09:31:03 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC85C061766;
        Fri, 12 Nov 2021 06:28:13 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id q124so18190004oig.3;
        Fri, 12 Nov 2021 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x5dfSUHa1njoopDFflSMfZqV2g9VFMYcNiM5aiRugeo=;
        b=VYSjzYM+QuDZ26S8+m6rUl0o+PC8pqY7nVUW31EomlzBGk1hF4UaAGOLXL03Sxgq4k
         GmQ0BI+jQKcdjgCViAosV+9bmYzbhmeDclSSvQ2QVeofKAWuVh5/oTiLuS74rdXZvspS
         wkqCLN+B75Udtsujv6++p96gd/GPIywNxMvpaUAlWdOylHuEkVP1PMqfB4iLXVOH2FBp
         fX3UJhoBm2XdD9T64ZIGEoMk+F7BgwlNE1dKE49DpD+mATY+rt8pizFFmvLNWSvgBc0x
         W0NkFWf/R64HxaTNiUxFefA28VRhDFTvXs3/0xn7IUGm1YYj6nG2e9pkvtSeCEZ5ZhwD
         f16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x5dfSUHa1njoopDFflSMfZqV2g9VFMYcNiM5aiRugeo=;
        b=nWZ8rws3CfghxDhrTQbToqTZhw6UUq7X4lXhV5ofZ49orJAabmaxuQeCE+LFD8qO4f
         DRrS2luilW8na3VfPWQWbfoVV6xckFCzNvs+DrI05JCy/HVpUoxBG2nipIYwGxPD8DZ/
         P0VauYxwl6G9OZL6UoKKV7Mxnsqflns30yDhNNUZRFJWp9SAU2YCnzahS5F7VANE0EKK
         RTBfjyN8bCAcXdiZtB4v/AMUXTrrmhPqs/JpjrQbBmLv2h7daUZGeTLkmRO8rODgjBKI
         09S4bIGPxwKIoov5WpOm2iKrVIU1cWZVt1j0q8/aUh/WL5J+fKoDLQNYyla85o7XvdfH
         Bl6Q==
X-Gm-Message-State: AOAM532G6VkmuKhDgECeJk4alnWRGqHejA2kgVV2wqWIFWzKIdst1/Q3
        m5aUliZwEXUxG/+rnsattss=
X-Google-Smtp-Source: ABdhPJzdXAiqkHjNaY9KvH435R1uUoa7Ewk7VHxGDNdTXjcKZxF8WNLoJN4qb9Pk7ctJYmVRXQPq1w==
X-Received: by 2002:a05:6808:2186:: with SMTP id be6mr27190633oib.115.1636727292441;
        Fri, 12 Nov 2021 06:28:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l19sm1083194ooq.17.2021.11.12.06.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:28:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V4 6/9] dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp
 compatible string
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, robh+dt@kernel.org,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        ulf.hansson@linaro.org, broonie@kernel.org, wim@linux-watchdog.org,
        linux@rempel-privat.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
References: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
 <20211112082930.3809351-7-peng.fan@oss.nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ecd1b962-0401-e077-f1c4-426fafde58f8@roeck-us.net>
Date:   Fri, 12 Nov 2021 06:28:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112082930.3809351-7-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/12/21 12:29 AM, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> The wdog on i.MX8ULP is derived from i.MX7ULP, it uses two compatible
> strings, so update the compatible string for i.MX8ULP.
> 
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
>   - v4 changes:
>     no
> 
>   - v3 changes:
>     no
> 
>   - v2 changes:
>     refine the commit message
> 
>   .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml      | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> index 51d6d482bbc2..fb603a20e396 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> @@ -14,8 +14,11 @@ allOf:
>   
>   properties:
>     compatible:
> -    enum:
> -      - fsl,imx7ulp-wdt
> +    oneOf:
> +      - const: fsl,imx7ulp-wdt
> +      - items:
> +          - const: fsl,imx8ulp-wdt
> +          - const: fsl,imx7ulp-wdt
>   
>     reg:
>       maxItems: 1
> 

