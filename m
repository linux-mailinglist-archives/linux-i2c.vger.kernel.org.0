Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAC44CD530
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Mar 2022 14:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237292AbiCDNdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Mar 2022 08:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiCDNdn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Mar 2022 08:33:43 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02581AEEF7;
        Fri,  4 Mar 2022 05:32:55 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id w128so4390007vkd.3;
        Fri, 04 Mar 2022 05:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T+kHmAz6l1ndX6TQI2u7iZIHW4bnnzxuzo8+CeI4d4I=;
        b=mQn0dY66Sf/voiE8UVxt/qYi1q4GXq26jWUXpsn+zV+zBbr4CuXLOb44C/wPuZuLwy
         nld+brL688EFhpmUmXFRwiMcODuMa2EhgyJN5W7LrL/E5Jz3j/h5gLaOwOyGRLMFepXG
         PBpfEcs3sW/mAsIagdMiAAeTPPDhiQZzQlS62MYE+TaW1peTGjY/ukQIK/NyynXNFTAS
         o/aZQ2Fj05+ZDfft1x1NsexBnlEU87vgwoxTAxrTzj3gZ6hZr1qcu0+VajEJHjgsNimB
         lQkaQ7KqYEy16I3+8kf4MAznIjqTbkH/pw17cBwxwoKpLhJleJlrZvqVNTEGCc3lO09n
         gP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T+kHmAz6l1ndX6TQI2u7iZIHW4bnnzxuzo8+CeI4d4I=;
        b=63WeLu3MvVyauTG8ZB/HmInV++97/pTbK393bIq82vYabGbTssLVuqbP99PE/BF232
         9OIWvl55d7AkrwgQEmShmluEWVqTG/aP7n2as2G0T5G8UOpEq5HGVWE46Wffx4jXzV9X
         +/9nNTVTeC4oYJCb4XwJoElUeVj3Tno+qHJ2D8FFLfdEWRGlwOHzxh/YG0yuhGq0OpnI
         V3giXO+pDdj65j92iYXpvgDFK9ZsPA0QWz/cmdDb7j7cvlvKAV+8ivx1UUmkl2blfCp0
         7R2Z7US8xYYEkjGsFSgLiYQB/1kicWXCvKDXCXwjxSymxgULRf/U7128pvOIX2fjNg6v
         GbWA==
X-Gm-Message-State: AOAM533zGcSGHo4LoO74X/o94ES7+stX075qSlACOUzA7U5NitQ9zmcU
        Gn0IeSJwFfnz1oUWK+mPmCIZ/xDqr2Iw4rN0xw==
X-Google-Smtp-Source: ABdhPJzrXfMN69JWz+3WZFtQeyrKlatWN68na8i/a78IpFoNMNcCPSAwbeerj3SgWmN0re+5ewOvBiF6g2pyEunlW58=
X-Received: by 2002:a1f:3f0c:0:b0:336:e97a:7a33 with SMTP id
 m12-20020a1f3f0c000000b00336e97a7a33mr2895599vka.11.1646400774849; Fri, 04
 Mar 2022 05:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-5-warp5tw@gmail.com>
 <d4f6fc91-ad07-7d4b-9c87-ec556ef26ff7@canonical.com>
In-Reply-To: <d4f6fc91-ad07-7d4b-9c87-ec556ef26ff7@canonical.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Fri, 4 Mar 2022 21:32:42 +0800
Message-ID: <CACD3sJbZfKYcZ=a8MgRohWt+Md_501Pr8c2UQP4tMK4D+=Ec-Q@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] i2c: npcm: Change the way of getting GCR regmap
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, yangyicong@hisilicon.com,
        semen.protsenko@linaro.org, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof:

Thank you for your review.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=883=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:38=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On 03/03/2022 09:31, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Change the way of getting NPCM system manager reigster (GCR)
> > and still maintain the old mechanism as a fallback if getting
> > nuvoton,sys-mgr fails while working with the legacy devicetree
> > file.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
>
> Best regards,
> Krzysztof

Best regards,
Tyrone
