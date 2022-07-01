Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9AAD563C99
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 00:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbiGAWys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 18:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiGAWys (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 18:54:48 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB602E9C1
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 15:54:47 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3177f4ce3e2so36771897b3.5
        for <linux-i2c@vger.kernel.org>; Fri, 01 Jul 2022 15:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Kt/08iyf+kylRHoIf7NE1bKHV8wItkIjASWeXHEu1E=;
        b=C8Jbki7P+C8sFtdRv/71Qrc5TOUlTQ2v6EM2YthFlNKEMLJ2kz+q+Qwc7QC63510V+
         Zj6pGVrlaYpR7Ld3FAMf97i8joQCvO6ld0kdbIOPSeFxO/vxWany2bcS6YRh+TIx2TI5
         K6LOuQy2JXh5gkya6gk9R6X3JvOG69ZV4Xf+7r0I4aOLmjhnz4Tr+w6045/GQGHwYeXI
         YWUcEGIr9SebwlUa2iCuzevJ3Ddy4fiiylaanZ2V258g9psVpLlqTnsl9s+tKXn4MsPW
         t9R25qhb+Fhmn5yH9xyB8IEI4pC751A3KhC2TsnuOvGXZ8/j9F147wGcrEgA8razyNEH
         EHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Kt/08iyf+kylRHoIf7NE1bKHV8wItkIjASWeXHEu1E=;
        b=5W/oG9Hi4Fgr8pOy6oK6iTalFOG+B7MIpqzXhOVkrBsKSwAaab/xYmS762tLzVX6Vu
         d5dPXOP7UjKnDIRNsXHTRxjDqWmHV/UxeKjGn2vjewc1kebrwFeVN/DCD4D+nAM4V5MB
         HG8Xe48I/bTKsL6RbaMEDZE/6Ojy7zOzQ4rFPJlRuLucfyMTg3Hp6X1WiYTAKpMBhL8C
         Zc9M+LhyD+M3GKd9xORugPYwnkRA2wSfxh/+B83LYhbfud+Uxzz/Zrnk1P9fCFudfpeI
         vqefBDZ6mU2PHSc6XFclmVrkmbsE3E59eUz5qLoAMzRCAkjZL71mybDrxT+YIRlXkDpz
         obxg==
X-Gm-Message-State: AJIora/dW7erXAVFOL2XXWnFz7TJcZ2z9ZQwkLNMgpVFdS7BSqrysJUr
        4KLvxWmsBM2Dvw4CtOoM2e9/XIs+gH2T81QD79o/Jg==
X-Google-Smtp-Source: AGRyM1tc/YCQzLSvEbPHHoP9ffiiTik+L9CV/2a/Pz75Svi3hh3KRTunL0xlLwuFNAlN2aryqHY78zreWgUrFNJIyiA=
X-Received: by 2002:a0d:cc54:0:b0:317:752c:bcf3 with SMTP id
 o81-20020a0dcc54000000b00317752cbcf3mr19601452ywd.437.1656716086867; Fri, 01
 Jul 2022 15:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220526211046.367938-1-linus.walleij@linaro.org>
 <20220605142540.GA3448684-robh@kernel.org> <CAL_JsqKRK5Oxz+PfJXZ9NYBYWmMdYGfRo-q=SOKnkDbr_QO6xg@mail.gmail.com>
In-Reply-To: <CAL_JsqKRK5Oxz+PfJXZ9NYBYWmMdYGfRo-q=SOKnkDbr_QO6xg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 2 Jul 2022 00:54:35 +0200
Message-ID: <CACRpkdZ7dkYYtjyv_hSLbTCs27grgea4ng7mRrijJ1E5V2AyJQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: Rewrite Nomadik I2C bindings in YAML
To:     Rob Herring <robh@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 1, 2022 at 11:54 PM Rob Herring <robh@kernel.org> wrote:
> On Sun, Jun 5, 2022 at 8:26 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, 26 May 2022 23:10:46 +0200, Linus Walleij wrote:
> > > This rewrites the Nomadik I2C bindings in YAML, some extra
> > > tweaks were needed because of the way the original nomadik
> > > names the compatible with two compatibles and the DB8500
> > > with three, and the two main variants use a different clock
> > > name.
> > >
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > >  .../devicetree/bindings/i2c/i2c-nomadik.txt   |  23 ----
> > >  .../bindings/i2c/st,nomadik-i2c.yaml          | 113 ++++++++++++++++++
> > >  MAINTAINERS                                   |   2 +-
> > >  3 files changed, 114 insertions(+), 24 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-nomadik.txt
> > >  create mode 100644 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Due to partially broken 'unevaluatedProperties' implementation, this
> error is going to show up when fixed.
>
> Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb:
> i2c@80004000: Unevaluated properties are not allowed ('v-i2c-supply',
> 'power-domains' were unexpected)
>         From schema:
> /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml

Ooops. Sent some fixup patches.

Yours,
Linus Walleij
