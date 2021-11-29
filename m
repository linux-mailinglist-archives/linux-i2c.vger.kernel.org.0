Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C600460B61
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 01:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376260AbhK2AIx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Nov 2021 19:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236080AbhK2AGw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Nov 2021 19:06:52 -0500
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDB7C0613E1
        for <linux-i2c@vger.kernel.org>; Sun, 28 Nov 2021 16:02:12 -0800 (PST)
Received: by mail-ua1-x92f.google.com with SMTP id i6so30326900uae.6
        for <linux-i2c@vger.kernel.org>; Sun, 28 Nov 2021 16:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iX/liG3cogM7y6xTjLVTRJ7br8H2lhulk0j4IZZdOaQ=;
        b=uGe8zOrAcFrS6z7QKGo9xMOZg9CRr8M4izeUnePF88hPW3IOU4O47zaGY3ehLTJ7ad
         jjp/QfHp82CjKI63WwBE9dITiRQtKezFFSOrSjz5ClIRSE3QGYDg+XCo+0Ms4r+/kbSu
         glgbX/zxa/WBlsB16AuTRQs2FQqadz+FldsS42Q4F/qDUyBfI5bzByZwN+90bzGM+ITS
         cpdZU3TcFgVt6NApgJa2NVB6pVumAWqrHlkE/4ehl1V3jjQAGwTg+/O5YPrNoQZvB9Z4
         fPLH38w79wmmzGLT4vmMkeZLhvPNIc86Xdyp5fIhurOrDWbBRwgR7fHa0iRIDL1OJWaD
         lJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iX/liG3cogM7y6xTjLVTRJ7br8H2lhulk0j4IZZdOaQ=;
        b=nwX+wUKab4HE0S9zIp0Y1CCoNdDWvD9vXgWzm+KeLhVQOvfNLREuutP5KRUWx0PtOa
         6waNgpQFeEkxE+Ol4PIgg8fPJvFJxvpXhq8LEn3uLNIao+YJJNm/5OclZqa9MLpDgo2V
         P7yRHGrwo4OsPMUSIM3EO/i9UTR3m6hSc2QMUh4FfSdRAqQMJQnASGTVHSbl3Te/Hz3D
         Vr/G8ZQOTPLq2eMxWC9/L2brASDAjZjayJV/XRFvcRQZMVCAKrNVB/KHzWBf0iIqJmuU
         yr8RDGY32mSc48lqF52Oqw2IsxklyfoFvzNt6ssVXF1LAPRDN2vwKNZmfh/FRt4gOHNd
         jtcw==
X-Gm-Message-State: AOAM530qv4mbfP/bdpeWxm5Ums7wUxOi75RvO37yLnMORQQlOKHd+tp3
        H9Mz4/9EGBNHP0wiNZ8z+DKt+4ctESr4NpbKEZwiyQ==
X-Google-Smtp-Source: ABdhPJyCQS9jji7xzd9RwMMKE908k3zhD5Kc+fdoA3RuOXkWpCn93jL0JO8s9A/cdRM25JVC4dSxIq/pH3Ao+owxJYo=
X-Received: by 2002:a67:7247:: with SMTP id n68mr27587295vsc.6.1638144131510;
 Sun, 28 Nov 2021 16:02:11 -0800 (PST)
MIME-Version: 1.0
References: <20211127223253.19098-1-semen.protsenko@linaro.org> <20211127223253.19098-8-semen.protsenko@linaro.org>
In-Reply-To: <20211127223253.19098-8-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 29 Nov 2021 02:02:00 +0200
Message-ID: <CAPLW+4nf7Y6HQW-XmgB93Lyie=FwZMAG2rA+S5=KcKpEn_4mjA@mail.gmail.com>
Subject: Re: [PATCH 7/8] i2c: Make I2C_EXYNOS5=y impossible when EXYNOS_USI_V2=m
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 28 Nov 2021 at 00:33, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> When HSI2C is encapsulated in USIv2 block (e.g. in Exynos850), USIv2
> driver must be loaded first, as it's preparing USI hardware for
> particular protocol use. Make it impossible for i2c-exynos5 driver to be
> built-in when USIv2 driver is built as a module, to prevent incorrect
> booting order for those drivers.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

This patch is not needed, please ignore it.

>  drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index df89cb809330..e815a9dffb2c 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -613,6 +613,7 @@ config I2C_EXYNOS5
>         tristate "Exynos high-speed I2C driver"
>         depends on OF
>         depends on ARCH_EXYNOS || COMPILE_TEST
> +       depends on EXYNOS_USI_V2 || !EXYNOS_USI_V2
>         default y if ARCH_EXYNOS
>         help
>           High-speed I2C controller on Samsung Exynos5 and newer Samsung SoCs:
> --
> 2.30.2
>
