Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68DB563C9F
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 00:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbiGAW6v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 18:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbiGAW6u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 18:58:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A2858FF5
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 15:58:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0131EB8321E
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 22:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC31C341C8
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 22:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656716325;
        bh=fEdRqxonC1gxWwhqrAvFHDDrWPQijaL7ObutDOmtPps=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZbKpmajdx+LWzAAmrxPd4nF9kA52T28RetmFkrs5v/AcTEq1PSkLqortoyDYldKSS
         2qUkhF/RIFmdRg0rRgeVFefLUGHhoK3m6lIHtNkt/j7Qq/YX1HEOMafuVrV9rVDqDZ
         OG7d0Iw4TBMwjMnNvUADX5iyMCK7v3bYTMeAUgKKBX65/rzbD0fZgVXqE59pZ16LZo
         +QuCnyQLb8rV7IMmlgZi/oseCrg2RURpxiM6gryz/UILuOOQIund+qtwy3ZIGyNo/Z
         4VeEYI4fEIvLjSVJYRktuqVPpJqBerNmTLyY3piKmtWauiSL+If2jhD15IJQCH8L6s
         YA1W3cxXRdQtg==
Received: by mail-vs1-f41.google.com with SMTP id w187so3635102vsb.1
        for <linux-i2c@vger.kernel.org>; Fri, 01 Jul 2022 15:58:45 -0700 (PDT)
X-Gm-Message-State: AJIora+BnktXEkOnjWwlSy+SRe+RPgWrLRfFxqQDlelrHiyPIDX9WROO
        vLxW3DbEAQm5qxCKmRrHpdR1Cr/pboJ70D5UEg==
X-Google-Smtp-Source: AGRyM1vu7fa9A1HkEucB9ILdKzlCJ9mjd0mg+YUkJdxMOvE7WtQECmtLJqr/tVLoSZtHxD6LOszOc94FHU2NPGX5Bvs=
X-Received: by 2002:a67:e18e:0:b0:354:4c38:11dd with SMTP id
 e14-20020a67e18e000000b003544c3811ddmr12360159vsl.6.1656716324488; Fri, 01
 Jul 2022 15:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220701225303.814888-1-linus.walleij@linaro.org>
In-Reply-To: <20220701225303.814888-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 1 Jul 2022 16:58:33 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+-fpuCc7HHsOo=m5XejWSGBy1zZVQgnhcOzL4+rd142w@mail.gmail.com>
Message-ID: <CAL_Jsq+-fpuCc7HHsOo=m5XejWSGBy1zZVQgnhcOzL4+rd142w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: Add power domain to binding
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

On Fri, Jul 1, 2022 at 4:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The power domain is used in the example and in the device trees
> for this IP block. Add it.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Wow, that was fast.

Acked-by: Rob Herring <robh@kernel.org>
