Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90F5F563C18
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 23:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiGAVyJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 17:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiGAVyI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 17:54:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1696F37D;
        Fri,  1 Jul 2022 14:54:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A03C623A5;
        Fri,  1 Jul 2022 21:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3830C341CA;
        Fri,  1 Jul 2022 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656712446;
        bh=zLSrvBOSLFfwPH+CZlrioDDqxBhPCGJ2SPJ+RZzc68M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MgvqiDHV7+Ms6yNohjOqoachbPDBtV5mW7sIE8RUq4xD4Ck7w/Ql6NIhKO5hiF9MO
         hTtF7kNpst0GSfyjVOGWqccbjJK9IE3fZZPtACk81oHMFwnoKmualtVTEUv1rubGql
         XxX+a863Uex/xrgt4zkh/5JJYtCU/n1ylFLt7v0AwgCYYOYZbqhe1QeuF7UMIysrbO
         f1NQDMzZpxnY8O+KOoWliDoy24OeZo3ZetRM7ZsT9QjwJWgl9/9PLAI2nH6JEYBJXo
         FUQ6lScG7zEBxmIFn94DakBZ6drG3b6hrovqkIwHAFOmI8AUBH6S3t67iAiqDRX55i
         X4qLVOtd4AGdQ==
Received: by mail-vs1-f50.google.com with SMTP id 189so3520813vsh.2;
        Fri, 01 Jul 2022 14:54:06 -0700 (PDT)
X-Gm-Message-State: AJIora9gQwUatI2DSgVMF+8FxK++cIEffysV7LPIj0QFqRKZU2EBNkI6
        N2tO0UmXXTuR/f0n2uTzKbOdo9RQRCIrd6bisQ==
X-Google-Smtp-Source: AGRyM1s0H7pARALLTirJ/KD0L+zTvOACU6mqxw9K9rYjeZ3l6HiWuonAyHglQk/j+3PQjKBHqo4gfcClDxV74nts52o=
X-Received: by 2002:a67:c187:0:b0:354:3ab2:ba65 with SMTP id
 h7-20020a67c187000000b003543ab2ba65mr12609378vsj.53.1656712445667; Fri, 01
 Jul 2022 14:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220526211046.367938-1-linus.walleij@linaro.org> <20220605142540.GA3448684-robh@kernel.org>
In-Reply-To: <20220605142540.GA3448684-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 1 Jul 2022 15:53:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKRK5Oxz+PfJXZ9NYBYWmMdYGfRo-q=SOKnkDbr_QO6xg@mail.gmail.com>
Message-ID: <CAL_JsqKRK5Oxz+PfJXZ9NYBYWmMdYGfRo-q=SOKnkDbr_QO6xg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: Rewrite Nomadik I2C bindings in YAML
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 5, 2022 at 8:26 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 26 May 2022 23:10:46 +0200, Linus Walleij wrote:
> > This rewrites the Nomadik I2C bindings in YAML, some extra
> > tweaks were needed because of the way the original nomadik
> > names the compatible with two compatibles and the DB8500
> > with three, and the two main variants use a different clock
> > name.
> >
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  .../devicetree/bindings/i2c/i2c-nomadik.txt   |  23 ----
> >  .../bindings/i2c/st,nomadik-i2c.yaml          | 113 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 114 insertions(+), 24 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-nomadik.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Due to partially broken 'unevaluatedProperties' implementation, this
error is going to show up when fixed.

Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb:
i2c@80004000: Unevaluated properties are not allowed ('v-i2c-supply',
'power-domains' were unexpected)
        From schema:
/home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
