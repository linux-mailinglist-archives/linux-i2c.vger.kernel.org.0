Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596AF460B65
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 01:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376285AbhK2AJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Nov 2021 19:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376340AbhK2AHP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Nov 2021 19:07:15 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C4DC0613F4
        for <linux-i2c@vger.kernel.org>; Sun, 28 Nov 2021 16:02:25 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id i6so30327727uae.6
        for <linux-i2c@vger.kernel.org>; Sun, 28 Nov 2021 16:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cihXymsmUHJPK/TpycI3whj34mwZgsGQNeETMeNkJkk=;
        b=A+6uTg6zy+dwEI5PlIIpWiF2rMrmbofCwCiqCH/7CP/80MhgTVENmzWcvh4Diqj+Ie
         /2ubJqhwm1368bdKEm9reQWqTZU5Vy06xQvQ93JT/xW3m4+aB5PKn2U5pCNfyaic4h3R
         8erLzb9MCcpeEq+A6TBsKEdrGmUoFE+5L2v9mlTYbT43XHw5Dfi0ZuTjJ12YGmbTCfTf
         NLKjiWH6UDOlwieUTnpPVrkFDtGiC2BybQXegG0QVXH6CUUEE37EzEXH4LsN2s0/4i5s
         ut3QilvvGkj8xv6cIGWHXvraMX0CitgLXjfnYgWOmODMsV/5vGoqgrpfeB3gJ/6jiXSV
         kZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cihXymsmUHJPK/TpycI3whj34mwZgsGQNeETMeNkJkk=;
        b=PRA/QzAb3ihRDoK4wqiv5a43Tcu06U/9aRxkNwr3prZpI1WJ0dzfeKuDJ+i4QgWVmg
         oXRxnk3f4ehOVuGbAGrg+58ZDTzPi/foLANEIgh2sp32oGzridReTVj2Rco+OUIK9kap
         vDvlLvBThvnIIUojW+u6vgIInTa8rpvN0Pafp46zTxnXAXqBzV1Zu1LGzTKtv58WHxCb
         sfamA94ovvW1D11yIYvwE564YD5LZ7vDebrgS7pzqSj8VVUk7pqGzu/9kGes5Lkh3dxb
         7oSUFJnhIpTU1D1jlU4rnc2dB3FLuMIOCsK1Bc4U7Z+JA3vyfD0qtFBQmp8jD6uCHHTa
         IlUA==
X-Gm-Message-State: AOAM532JKAq6LtL+PcbXGtLd5AV0cTPlq8M0/2j8cmbkbgYs5Tyvng6c
        MQLyZClZMlb3kz5mvTPdBDpj5SV2hsm9SXOdmlrB4mjhKHO/UomV
X-Google-Smtp-Source: ABdhPJzTha2H8BfgE7HV7+donkkXjIIjVJN8XihiGCGrL8G93mKkssc06T4yjvwHNsvW874Lx0jSDZPZN8X+FZeb+5A=
X-Received: by 2002:a05:6102:f10:: with SMTP id v16mr30028063vss.86.1638144144481;
 Sun, 28 Nov 2021 16:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20211127223253.19098-1-semen.protsenko@linaro.org> <20211127223253.19098-9-semen.protsenko@linaro.org>
In-Reply-To: <20211127223253.19098-9-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 29 Nov 2021 02:02:13 +0200
Message-ID: <CAPLW+4mrxLrjr3B+DrCQP_2B-+sqH3A_P=NP9he22c_MmnFLpg@mail.gmail.com>
Subject: Re: [PATCH 8/8] spi: Make SPI_S3C64XX=y impossible when EXYNOS_USI_V2=m
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
> When S3C64XX SPI is encapsulated in USIv2 block (e.g. in Exynos850),
> USIv2 driver must be loaded first, as it's preparing USI hardware for
> particular protocol use. Make it impossible for spi-s3c64xx driver to be
> built-in when USIv2 driver is built as a module, to prevent incorrect
> booting order for those drivers.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

This patch is not needed, please ignore it.

>  drivers/spi/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index b2a8821971e1..fbdf901248be 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -761,6 +761,7 @@ config SPI_S3C24XX_FIQ
>  config SPI_S3C64XX
>         tristate "Samsung S3C64XX/Exynos SoC series type SPI"
>         depends on (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST)
> +       depends on EXYNOS_USI_V2 || !EXYNOS_USI_V2
>         help
>           SPI driver for Samsung S3C64XX, S5Pv210 and Exynos SoCs.
>           Choose Y/M here only if you build for such Samsung SoC.
> --
> 2.30.2
>
