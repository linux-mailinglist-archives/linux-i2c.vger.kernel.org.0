Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1AE443E84
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 09:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhKCIor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 04:44:47 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58072
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230463AbhKCIoq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Nov 2021 04:44:46 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EABC73F19B
        for <linux-i2c@vger.kernel.org>; Wed,  3 Nov 2021 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635928929;
        bh=kKZRZEPwd3etVyB2WM4q5L1wpzbHA8gGvbGv8rJ6kec=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=KGRXzVpG/9G4c6e8UBMa/GtREoZDKDzjl2/tOqcb9P8Wck6fz/LqqPhwRxBjuZKZo
         jJqY1IDtNPXnFH0vTZY3RgwI94b/6YToIHzOveVrqZsJhqSb4pktB4ulCH1Z7hVfIz
         MYUGmfjDCeybvpQPfTOHHgzEkOyP78Kr/YVVAY/f4k/y1tTyev1XnzLbT5eOmDI82B
         ZH3wJ+HZfrDcoY5qDaGBaahseRrkMkhDUTGNzgwcsmtmLlZQEuzXf51e4KJcKPpWk+
         Eg6sXINnCmzGsqP42VXmE3GdOgfADZsnBLz3lGZutfVqwt2YOG5Sq+HPvHfJbaefas
         w3VwVQ4AH5tyQ==
Received: by mail-lf1-f70.google.com with SMTP id i1-20020a056512340100b003fdd5b951e0so346501lfr.22
        for <linux-i2c@vger.kernel.org>; Wed, 03 Nov 2021 01:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kKZRZEPwd3etVyB2WM4q5L1wpzbHA8gGvbGv8rJ6kec=;
        b=PHr1et7pi8T6Q3mKDCtaDLnYGfX9+Vh6yAEFTasJLfYVRzw26npe+nS9ufeb9Xq9lo
         AF/7uFt2xNXtILbqtF7qV40G7YSlHWPwarcCZlBFC5Fvm7Sk0tzSvxoYsBgFKdCj3hs1
         we7hLhTExRF/Mw2PP2u2p8PPv4JigbJ1zWK8/U7iV+YDzfCI/74XU1oZe5o5b2zXVoqc
         5mLSIt+b2tLVew2EJjPXbmsugKYrN1Ae1o+61PSIP3ZjKPtWNI6SRjCNohJddVFamw9G
         hFqBmyYVukvvJeYTfms1KHV96YBbiufi6rGw9OCyC9pCJErYib9WlsDjlv6KptEfIxfv
         KD7Q==
X-Gm-Message-State: AOAM531O1uemVEfHy/pgWz5MChOcJ1R81xpYo8iYkeq6aWrowafOUw98
        Ed/UVQiHB/4NHlf1Pw/KxmSek3JJHuBt+H+mOrqmPZAmdDQmsHIX/IjC9AwR5e6N+rB1X3Dhtg5
        5hzApXuORTdaKHAolZwWtr09+GbmpoujqVjtmfA==
X-Received: by 2002:a05:6512:238b:: with SMTP id c11mr23340534lfv.55.1635928929417;
        Wed, 03 Nov 2021 01:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoLYZQxp82GIsICfzZKnVOQP/gVDZZ1JYoK6fKha/wI/ZKZJTg775ib/aBhiilx9HsGfUCJA==
X-Received: by 2002:a05:6512:238b:: with SMTP id c11mr23340519lfv.55.1635928929251;
        Wed, 03 Nov 2021 01:42:09 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id k16sm120594lfm.168.2021.11.03.01.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 01:42:08 -0700 (PDT)
Message-ID: <c626abd9-eebb-3111-123d-7b2bea95b310@canonical.com>
Date:   Wed, 3 Nov 2021 09:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 2/2] dt-bindings: i2c: exynos5: add exynos-usi-hsi2c
 compatible
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Chanho Park <chanho61.park@samsung.com>, linux-i2c@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211101113819.50651-1-jaewon02.kim@samsung.com>
 <CGME20211101114158epcas2p46b50f8d946d59ffaedd203370b81c6ed@epcas2p4.samsung.com>
 <20211101113819.50651-2-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211101113819.50651-2-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01/11/2021 12:38, Jaewon Kim wrote:
> This patch adds new "samsung,exynos-usi-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

The bindings go as first patch, please.

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> index 2dbc0b62daa6..ce2373c7a357 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> @@ -14,6 +14,8 @@ Required properties:
>  				on Exynos5260 SoCs.
>  	-> "samsung,exynos7-hsi2c", for i2c compatible with HSI2C available
>  				on Exynos7 SoCs.
> +	-> "samsung,exynos-usi-hsi2c", for i2c compatible with HSI2C available
> +				on Exynos SoCs with USI.

I would prefer to describe the Exynos model, not the feature. USI might
change between different SoCs, so then it will be "usiv2"?

>  
>    - reg: physical base address of the controller and length of memory mapped
>      region.
> @@ -31,6 +33,8 @@ Optional properties:
>         at 100khz.
>      -> If specified, the bus operates in high-speed mode only if the
>         clock-frequency is >= 1Mhz.
> +  - samsung,usi-sysreg : sysreg handle to control USI type.
> +    -> sysreg phandle for "samsung,exynos-usi-hsic" compatible.

s/sysreg/system registers controller/
s/handle/phandle/

Please document to what is this phandle. To which block.

Why it cannot be the existing generic samsung,sysreg?

>  
>  Example:
>  
> @@ -46,6 +50,8 @@ hsi2c@12ca0000 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
>  
> +	samsung,usi-sysreg = <&usi_sysreg 0x28>;

This does not look correct for this compatible. We should really convert
the bindings to YAML...

> +
>  	s2mps11_pmic@66 {
>  		compatible = "samsung,s2mps11-pmic";
>  		reg = <0x66>;
> 


Best regards,
Krzysztof
