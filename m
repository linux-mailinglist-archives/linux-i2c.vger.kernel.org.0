Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF01A46E937
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 14:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238043AbhLINif (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 08:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238029AbhLINie (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 08:38:34 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE383C0617A2
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 05:35:00 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id w23so10765727uao.5
        for <linux-i2c@vger.kernel.org>; Thu, 09 Dec 2021 05:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rVYnS72yP3Vfzg3mEeaHx/Hrk/5oTnnL8AOPR30dVy0=;
        b=YNbIIe25vYO60B6ne+3R6oyfuOlsSlaiSJ0awd9eU4155uIpSononUMENtDdIgoDmf
         BHGw6HYe99GQZYx9FfYPR8miMIoI0Dtz2f1PZPZFMkPAVp0S9+XG+uNykXR9qJNgSAuq
         OwN1NDferXQYxSFnieDZV9txPPv08yqtPTq7nPWE9OWy9s96iwlSTw22Je/e+l3z/KKA
         FktQa5MebX9P8KMB0z0adm2hvv4i9Ubi9l8auMtQ7Olh7f2Xyt4OOC5EzAVNu7Pc55oA
         0yR9r2Tfui1h/D2pFxSsLygQdkVj0xZ+Kq+ruVSC1VN5L6FQRFTcsppM489BWXqikkhS
         VM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVYnS72yP3Vfzg3mEeaHx/Hrk/5oTnnL8AOPR30dVy0=;
        b=7DT1eDVwgHlM8urHRXAyndK5Bc+E6cDswBW+qmUcSOlXFRiUXd2seIc/RR9d7gdayd
         +eNMt4IDBQh76OBq+CW3rVaFDnJ6OShn65MQvELsSAMwyk/dD8tI1QGhmQormQcWi4yY
         /Peu7bogMjUEVp6KMK8ASSsYh2iXRl1K6snmXZxqR3EAO2fSbIPCnWq3DFo4RaojKrUK
         zuP8maPfmuyU+d+jPF9BOzjJgetiVjOnpguL5gryqIpv1LL1BcA0J8j2bSGZmRV4BEvb
         AQMYpWNgTXCu2NYPSd1rvYS59PTPa0KjHQUVQ3Yf1tmKUtpJSjAfyyQb2VuFpf0meY0I
         XRTg==
X-Gm-Message-State: AOAM530zwKDyHPFDNHtVXgW6/0+p4DIXIwbVfF8JNZXYmmSj9VWmGhk8
        iSxtWJ80W55PsVfjEwo7P3UcKpDv7My4jkWvFnCeUg==
X-Google-Smtp-Source: ABdhPJxt91N8G6WCwX4/8szQ/jRPc67Jnft4mCDcv3HJQElj92b5iS0Vgpy3Lmy7HyhnoVglAwtQnGhOm6TIe36Ga5s=
X-Received: by 2002:a67:be0f:: with SMTP id x15mr7817987vsq.86.1639056899865;
 Thu, 09 Dec 2021 05:34:59 -0800 (PST)
MIME-Version: 1.0
References: <20211204215820.17378-1-semen.protsenko@linaro.org> <20211204215820.17378-7-semen.protsenko@linaro.org>
In-Reply-To: <20211204215820.17378-7-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 9 Dec 2021 15:34:47 +0200
Message-ID: <CAPLW+4kCH7Z3ZJrYcHtjMeq1_mhPg1FusBQb5KyV2nvBc60n5Q@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 6/8] i2c: exynos5: Mention Exynos850 and
 ExynosAutoV9 in Kconfig
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 4 Dec 2021 at 23:58, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> I2C controller chosen by I2C_EXYNOS5 config option is also suitable for
> Exynos850 and ExynosAutoV9 SoCs. State that specifically in I2C_EXYNOS5
> symbol help section.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>
> ---

Wolfram, can you please also take this one in your tree?

> Changes in v2:
>   - Added R-b tag by Krzysztof Kozlowski
>   - Added R-b tag by Chanho Park
>
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index df89cb809330..42da31c1ab70 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -617,7 +617,7 @@ config I2C_EXYNOS5
>         help
>           High-speed I2C controller on Samsung Exynos5 and newer Samsung SoCs:
>           Exynos5250, Exynos5260, Exynos5410, Exynos542x, Exynos5800,
> -         Exynos5433 and Exynos7.
> +         Exynos5433, Exynos7, Exynos850 and ExynosAutoV9.
>           Choose Y here only if you build for such Samsung SoC.
>
>  config I2C_GPIO
> --
> 2.30.2
>
