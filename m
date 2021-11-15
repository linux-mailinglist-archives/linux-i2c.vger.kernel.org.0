Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045C9451DA1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 01:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352282AbhKPAbr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 19:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345572AbhKOT2m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 14:28:42 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5139EC0AFD77
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 10:56:23 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id t13so37007018uad.9
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 10:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wjFytYa62TwsRDtT9P+lI6l+ZPmY9Qu38r4fj9pXQeI=;
        b=Et3mLJfVVa31pUjIiX3D9ldtHtwfS2Ty0ZDCKaDhjnrACzXviF+n5avqkd0wi52RbJ
         x8B6+Y/Mrdqx7qBEUU7AMThPC/tfboVqIHcexrDStDQG4F6OuXJm7QybGYb4/PIefpiP
         qdNa5kCUzqv+9tlXAWjZjq6k46+nKkyyj3ca3AJq+z73CvIReKUOSUP7yH7sAHD0khTj
         ponfVix4Wzw1TnM2ady5uBFwE4d33Bo1+bZknSVPKjD4HedtWQClz32AwYdNZFtHh5Z7
         BHVTOvFvAyl4pxfoavUjBnxwV1aP9Hb7IvY06fkY2g0G/yNZCGfX2Bpe1C2YWYlrYcEV
         uNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wjFytYa62TwsRDtT9P+lI6l+ZPmY9Qu38r4fj9pXQeI=;
        b=YaOP9CuQ/nT4Ph1ud9ofraZSQ08jOqCjDbMCObZqZom97llUR+jodqgehjJ5CPeTqU
         CeV/kTCANmOicq2CF0hAkatIEEUDrNymzLkinodIrWGpkEPtk5llz6pUoJviBbSgUVpt
         qkqfsCszWpRwrrfY1E4KlbOSA2Iiogsz4fZInEk9SkbBjvBAw110owaK/XEFBp+icU7q
         yhQ0isDtg2U2RQNHsejhrP2h9NSDCzuhHO2lxVrTw8i9PwdXn93LHTfbN6qRtsGcgCva
         fgRa4MjfbU59+nhTcWlWPNOo2+BXJKhgdwjrStbdg7rKvLOcbpOwDntsY1opTnk03x29
         3ypQ==
X-Gm-Message-State: AOAM531omCFKDQcwi6mfByuxKh0SvxKrzktsgt5S5ubBE80/h/KQRQ7W
        HhC5hM155a4DentxdAOD8uu/BVMAiau4nmt9ybc2cw==
X-Google-Smtp-Source: ABdhPJylv9Dsbu7ZOrf0qTkvNNEqYiy+MbBLGYCd80FkaWunLT9ncwO+I1KUfsKqM53IfBUg2/slkF2dFCSNflVEqho=
X-Received: by 2002:a67:d893:: with SMTP id f19mr45783283vsj.39.1637002581757;
 Mon, 15 Nov 2021 10:56:21 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211112010603epcas2p26c076e65e0cb286cb53f06053165ef60@epcas2p2.samsung.com>
 <20211112010137.149174-1-jaewon02.kim@samsung.com> <20211112010137.149174-2-jaewon02.kim@samsung.com>
In-Reply-To: <20211112010137.149174-2-jaewon02.kim@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 15 Nov 2021 20:56:10 +0200
Message-ID: <CAPLW+4=QoTLzZsHHxM_E+WhzhYKsfEisFe_berH=i9G=TSb0ng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: exynos5: add exynosautov9-hsi2c compatible
To:     Jaewon Kim <jaewon02.kim@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 12 Nov 2021 at 03:06, Jaewon Kim <jaewon02.kim@samsung.com> wrote:
>
> This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
>
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> index 2dbc0b62daa6..39f4067d9d1f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> @@ -14,6 +14,8 @@ Required properties:
>                                 on Exynos5260 SoCs.
>         -> "samsung,exynos7-hsi2c", for i2c compatible with HSI2C available
>                                 on Exynos7 SoCs.
> +       -> "samsung,exynosautov9-hsi2c", for i2c compatible with HSI2C available
> +                               on ExynosAutov9 SoCs.
>
>    - reg: physical base address of the controller and length of memory mapped
>      region.
> @@ -31,6 +33,11 @@ Optional properties:
>         at 100khz.
>      -> If specified, the bus operates in high-speed mode only if the
>         clock-frequency is >= 1Mhz.
> +  - samsung,sysreg : system registers controller phandle to control USI.
> +    -> If I2C integrated to USI(Universal Serial Interface), this property
> +       is required. When using Exynos USI block, it needs to select which type
> +       of Serial IPs(UART, SPI, I2C) to use with system register. So, it
> +       requires samsung,sysreg phandle and offset value of system register.
>
>  Example:
>
> --
> 2.33.1
>
