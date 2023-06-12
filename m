Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A17F72B906
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 09:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjFLHr2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 12 Jun 2023 03:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234312AbjFLHr2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 03:47:28 -0400
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020851B4
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 00:46:52 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b3db8f3d94so840695ad.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 00:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555915; x=1689147915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFmt9oFYPTAPg3wj1si1eD0dPhih612zMCcfYbCc65o=;
        b=IzKzNdijbF61n6ReYE42K++LphBJkD1nRfkQBSJ7GYLAxmak2C7TejbDE8QLQIhl3N
         /kZHd0Rt3sGmxDcMLhANE8E17emBk7zsBrkHKhtNrw+wWHVgnTdJBiKvseW/BHEhDKAg
         LdMRQqgtr/JIfM7aiwTn+J0UdshUp/Gv9THVhxCwsDR+A1ydjzaR3CmSDLvG5cDiu9u0
         Y5vzGtTKP+y3cmwCb41C/jptqUr6neIZ4dVTQa1xon9Z6TND0npkVo3yQXgIoeYNu2gj
         te6AbByDXOKAlJl1UFU2u6Wm/tW/o0YvtCFn89EZMuVx/jLQRBbD3o4bZdInB2r0xH+w
         KedA==
X-Gm-Message-State: AC+VfDyTa4rw3ToFLu2NOHAn7bbcqo9xc3sskVYOmTiAeN6WiIN0Rwe9
        Ahik9gpXHpw8ii1yaRiVUw/FUHFQfCMVoQ==
X-Google-Smtp-Source: ACHHUZ7zPh2tnc64KD0JMFyRxotGdXcaE28dBL8vBk/DRDnJ3djm7v2EhlTmbqFeELm2px0VmXE1lw==
X-Received: by 2002:a81:a110:0:b0:56c:fc62:a5a2 with SMTP id y16-20020a81a110000000b0056cfc62a5a2mr5787409ywg.7.1686553914420;
        Mon, 12 Jun 2023 00:11:54 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id x10-20020a81a00a000000b00565de196516sm1339709ywg.32.2023.06.12.00.11.53
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 00:11:53 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-56d2b950447so7549207b3.2
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 00:11:53 -0700 (PDT)
X-Received: by 2002:a0d:d687:0:b0:56c:f2f6:5c5f with SMTP id
 y129-20020a0dd687000000b0056cf2f65c5fmr6659705ywd.24.1686553913188; Mon, 12
 Jun 2023 00:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230611225702.891856-1-andi.shyti@kernel.org> <20230611225702.891856-2-andi.shyti@kernel.org>
In-Reply-To: <20230611225702.891856-2-andi.shyti@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jun 2023 09:11:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7-MDrpxNyoLWfDKsZRn2-GafSfgADKkF20mqtpLhwng@mail.gmail.com>
Message-ID: <CAMuHMdX7-MDrpxNyoLWfDKsZRn2-GafSfgADKkF20mqtpLhwng@mail.gmail.com>
Subject: Re: [PATCH 01/15] i2c: busses: emev2: Use devm_clk_get_enabled()
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

On Mon, Jun 12, 2023 at 12:57 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Magnus Damm <magnus.damm@gmail.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-emev2.c
> +++ b/drivers/i2c/busses/i2c-emev2.c
> @@ -373,14 +373,10 @@ static int em_i2c_probe(struct platform_device *pdev)
>
>         strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
>
> -       priv->sclk = devm_clk_get(&pdev->dev, "sclk");
> +       priv->sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
>         if (IS_ERR(priv->sclk))
>                 return PTR_ERR(priv->sclk);

After this, priv->sclk is unused, so you can replace em_i2c_device.sclk
by a local variable.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
