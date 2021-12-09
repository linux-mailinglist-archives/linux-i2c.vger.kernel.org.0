Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB3046E99B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 15:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238344AbhLIOK6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 09:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238327AbhLIOK5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 09:10:57 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845F8C061353
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 06:07:24 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id j1so3872040vkr.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 Dec 2021 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=aOiyKQmystL558bO5VkHIM1ncICMWoc5eViBcWRY0xc=;
        b=GCUVV7TKAKr/xN0Rr3byEbzMFdnQ1aFeK13+eNVK8yteo6J4gqmeN54QMkQhx2Q0y9
         xVtpIQL95ZHcwa5mLIAAs6Gw5QXVXVF12bg4SXgcakyg+6nNCqupHXNSPyju1nS9myvq
         yqihwmrHfVzbmjZVogciMkgx5DBtuhuMInQbled+yazrL2loG4zbzV8SrfF+/FJNQbXr
         SN9HsXL/OWCNrg9iVO3dKxRAYp5utW+ef8IJ/BjOllbHcwUF3FaS4x3+zRkfW3PWKV84
         J4flmCFyLN/Ft+Mie0DUYtPdKLUIZketPdTyEUPyaONQDYozj3ZgMmiUVAuQqAMvEwkg
         AWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=aOiyKQmystL558bO5VkHIM1ncICMWoc5eViBcWRY0xc=;
        b=6k8Ae2CnFchgscEuW845w6G320x5UIJREhfJ5YJMRPHVqO0jmkx2xSvcd8eGjcbjbk
         eyO/2/oIIfMFd1fIqwdkyloPBCEl2DMAhh88Gu9rm9uJHsKzEBU/BFIhXsgvhfEzSSb5
         4gayaAX6BRs3I5oFnOvHzjFGEIIb1YA6ZTI5QkBdu9La41d9Ppqaw+OaraZOXvYtlueB
         nbuSXj9AjjQjgWqg+SaZ9/uBTFYvaXWbDKG2/AX9R1UxLzdIXRfRm7CzIxwltfuvTHw6
         /FyWTOSVpVbqxOb8oyb0uAuhmluHZ4tXDEuBlcqpBu2xkLEiHSlYCJyHzTDU8AWBi+98
         eQxA==
X-Gm-Message-State: AOAM530AWt0CyWPVebOsCr0CES6PcCp3/rKRRp3pW4mr8VvYlKtbmeGz
        E4fJuTksVMQAbfgi9g/DLn5qygmXRNN66eq+O0+KCA==
X-Google-Smtp-Source: ABdhPJxvOzCM8W4klk/CbODi03E1NwZPlh5xdjiU0IEleM9nT680cmqdlvNersGdQio2+Q6KzzAk/RAzLiAdKZoccwE=
X-Received: by 2002:a05:6122:1306:: with SMTP id e6mr9429827vkp.13.1639058843381;
 Thu, 09 Dec 2021 06:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-6-semen.protsenko@linaro.org> <YbHIWBa4VFEK1wKR@ninjato>
In-Reply-To: <YbHIWBa4VFEK1wKR@ninjato>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 9 Dec 2021 16:07:11 +0200
Message-ID: <CAPLW+4kPxmjqt3m3er4yHCsUPr9GrxTtkZB0hZZVvNB5k43QJw@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 5/8] i2c: exynos5: Add bus clock support
To:     Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 9 Dec 2021 at 11:11, Wolfram Sang <wsa@kernel.org> wrote:
>
> On Sat, Dec 04, 2021 at 11:58:17PM +0200, Sam Protsenko wrote:
> > In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a
> > part of USIv2 block, there are two clocks provided to HSI2C controller:
> >   - PCLK: bus clock (APB), provides access to register interface
> >   - IPCLK: operating IP-core clock; SCL is derived from this one
> >
> > Both clocks have to be asserted for HSI2C to be functional in that case.
> >
> > Add code to obtain and enable/disable PCLK in addition to already
> > handled operating clock. Make it optional though, as older Exynos SoC
> > variants only have one HSI2C clock.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Reviewed-by: Chanho Park <chanho61.park@samsung.com>
>
> This one doesn't apply here? What tree is this based on?
>

Based on linux-next. Might got outdated, or maybe I had some debug
patches in my branch at the time. Anyway, I've sent v3 only for this
patch [1]. Can you please try to apply that one?

Thanks!

[1] https://lkml.org/lkml/2021/12/9/584
