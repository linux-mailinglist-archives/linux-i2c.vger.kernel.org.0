Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC878563CA0
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 00:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbiGAW7V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 18:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbiGAW7U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 18:59:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FCA58FF5
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 15:59:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 17F1BB831B6
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 22:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F42C341C8
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 22:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656716356;
        bh=ujexMdQJeifFAfBRhBPKzOTtcnFOXQij8737R3MpRQo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oM/to4+BtIonCyowHdmiwvAJ+W5MXWPny4oieNqZY2HAKm+Ertg69fgUNutt6hnwR
         dZNUxnA1t8MBJZLmyQwJ71e6kZ+0G0QRh2/drZ3o6xX4gTY1+8B4mqKBKFBgEAS2NO
         m6tjdT4rRw4wVnFRFtaq96DVbjtzt73jVCDB2Dvs8r4xiBzhwrcfPJAjQqKatRWcQM
         uu47WXXOUYwrAMolWUmqI9hatOEXOLLQfbOgJ8YmzvMuDjxe6OwCHCASvqaX0V4Iq/
         oVienLkCWafQtcBoA4bp4T25lngF+S8AtEpC6WvdUCUVkzyZSV/zs7PxD/jjnazOu4
         5R2F5RLzwMEhQ==
Received: by mail-ua1-f54.google.com with SMTP id t21so1338865uaq.3
        for <linux-i2c@vger.kernel.org>; Fri, 01 Jul 2022 15:59:16 -0700 (PDT)
X-Gm-Message-State: AJIora8w3ZXMHKuOEDZ8f/ppajuq6TJmIqNEmk26kMTGluKOcRIS5lwk
        jbCzOt61DJl+DeWVh3D2m5mX3v429yFSeQm3+A==
X-Google-Smtp-Source: AGRyM1vB6crzdzX224a4sGrIMy3A81UkbxRvze5iYBIuY6NgPEFlHmofJQFZMGqHiPf0GmL4hE/lsGzCD4W0CsuMR+A=
X-Received: by 2002:ab0:2705:0:b0:379:7378:3c75 with SMTP id
 s5-20020ab02705000000b0037973783c75mr9249967uao.77.1656716355778; Fri, 01 Jul
 2022 15:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220701224136.808991-1-linus.walleij@linaro.org>
In-Reply-To: <20220701224136.808991-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 1 Jul 2022 16:59:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL6mZbESXybZp=gL2JtnGsW79Z5LYJESEK3E=cAfCFKQw@mail.gmail.com>
Message-ID: <CAL_JsqL6mZbESXybZp=gL2JtnGsW79Z5LYJESEK3E=cAfCFKQw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: Drop unused voltage supply from example
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
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

On Fri, Jul 1, 2022 at 4:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This drops the pointless v-i2c-supply from the Nomadik I2C
> example. This is a leftover from before the use of power
> domains when the power domain voltage was attached to a
> regulator.
>
> The unused property in the device trees will be removed
> in a separate patch.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
