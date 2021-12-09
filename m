Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4615B46EB0D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236284AbhLIP0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235460AbhLIP0Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 10:26:24 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDC2C0617A2
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 07:22:50 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id a14so11488416uak.0
        for <linux-i2c@vger.kernel.org>; Thu, 09 Dec 2021 07:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=1J+XmU+DI+E9grUJzbC6kqmpdJljZUH9ERdWF3VqDW4=;
        b=wdLsu7dxo6JsUsOMFhDQbVF/7k6JWW4SfduROl3lRRispvueS+VzjduoBSJdTfWBEd
         6WSFxBtUmOKlOmMhQ3z/jkIE7pzpINk0xwSI/SPkCItxTti5tDk/k0IhLQHC+8Px4tjb
         opJUQAh2haWglvTbBYOWb8wBDboplqK/k1wz7pMdWd6wdnUQ/lntzIFt6iSZTILpnD8i
         54xvkltZMUQI8d/TgbxN0KHDTzZgDh9qR2+z7YHpzTmSmEOViRiW6faiJb/MrojlY22z
         iqhnQCWYXF/aRrptPwEpnmuIlyCMxU2JXz5pvmM6Y/9El6BpFI85smH7ropsRnktM+lU
         pV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=1J+XmU+DI+E9grUJzbC6kqmpdJljZUH9ERdWF3VqDW4=;
        b=N+rdwxJ8AU5Y7d+OldCkWCK7kIEKaLVbole508k8YJF5k2sLpkL57d9bLRW+0EpEWt
         Aol22uMxZ4b5c+rx8lPd/TcefMHd/h4q5Pww6G8em7FGSsoseZwu5mUu1xQY9q7ni9sI
         4hy/CsPXl0IdZ7dL10azL1tiEtSC1ceprFyXP9+QhCz6yljT+8X0v6Myf4CuwPT6pfAp
         X+picMkwzfUbN3BtdrWbw4qHK7QzISAUoJ1FplostCbgmdo1+F3L14q4KwthkJaojAAi
         RaMTy0pXSx4NgfW/hAxR0PyxyaUaDnZSBkRNPrt1goGp19jjlnlgbb1FBNNkpD+WRrnY
         GEnQ==
X-Gm-Message-State: AOAM533H1V4GUgGKqTZvWTFCuTCUAdv2TzgJAa6KqgpMrpcuTGI92NJc
        FI4dULkPaJffBSygYIUAwDwy+OJzozgg57NThLpEmeixndKWffuo
X-Google-Smtp-Source: ABdhPJzCfp+KpbSMOwI8zmZeJ5bMvIl0+2m+q7morIH15CbHe7sXKx+R0flGIAcP0B04JBjStSt4FQXkkLNvJzN85pA=
X-Received: by 2002:a67:3382:: with SMTP id z124mr7978137vsz.57.1639063370025;
 Thu, 09 Dec 2021 07:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-8-semen.protsenko@linaro.org> <YbIXVw+as1Sj6yDW@ninjato>
In-Reply-To: <YbIXVw+as1Sj6yDW@ninjato>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 9 Dec 2021 17:22:38 +0200
Message-ID: <CAPLW+4kOr8NBUpgDXCcALP0BbnQ=w0v_oW24Vsa3e90TBxrHyQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 7/8] arm: dts: exynos: Rename hsi2c nodes to i2c
 for Exynos5260
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

On Thu, 9 Dec 2021 at 16:49, Wolfram Sang <wsa@kernel.org> wrote:
>
> On Sat, Dec 04, 2021 at 11:58:19PM +0200, Sam Protsenko wrote:
> > In Device Tree specification it's recommended to use "i2c" name for I2C
> > nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
> > warnings like this when validating HS-I2C nodes:
> >
> >     hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
> >                                   '^i2c(@.*)?'
> >     From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> >
> > Rename hsi2c@* to i2c@* to fix those warnings.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>
> Applied to for-next, thanks!
>

Just a heads up: Krzysztof has already taken patches #7 and #8 to his
tree: [1]. Other than that, thanks a lot for handling this series!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-next
