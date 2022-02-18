Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54FFC4BB480
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 09:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbiBRIog (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 03:44:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbiBRIof (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 03:44:35 -0500
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3057E29924D;
        Fri, 18 Feb 2022 00:44:19 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id f12so4427666vkl.2;
        Fri, 18 Feb 2022 00:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SimntoUMkVEr2cj/igvj4PS7W+Y51sYnkHLvFZaYW80=;
        b=H6EhQcfUGl/x/FwmMEC0GKzTlKvRrsxJdOISya+K5Mkm8xYNd0hntME3zyIJ+vkjQ/
         k+vJmT1TvwkEe+vqjgoHwhMvYr2h1k3l7hW2hLOHGs1Yv1An/baL6znslB2wdnlFG6J1
         2l7YoPkNPezwQJHVbwQNl/lyStlZYs6AoKMOYUnWre8Fk3m+T3dkaPZsEqziH196rizf
         1F/I5UZg+MMmr2WZtOPhCZ2kjAYaso3BMCprhvakXUjsxAITEsq+RI5MtXZQOLceXcRx
         ol6URm8dGp69rsuV9Eyj9iE+f6L1R0ICGcZgHuG3xISe87YsFP2GoaLGl9+hrE/W51DN
         BC1Q==
X-Gm-Message-State: AOAM531Fvoh2etlhhEEMMIZWPA5/yeBC58bWcFHMirDlBvycAebtSPNF
        sVF1ULJt1XPk98rRf35p1oRxgikwWXW8EA==
X-Google-Smtp-Source: ABdhPJzMjRhSvl0VZmieN75UYGGMI1CQ9FCxiL/qO/pUNgU5jpDf48XNxNqWb0Hdh+ZaLQzAuFsmGA==
X-Received: by 2002:a05:6122:549:b0:330:288:f36d with SMTP id y9-20020a056122054900b003300288f36dmr2942131vko.28.1645173858249;
        Fri, 18 Feb 2022 00:44:18 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id s25sm2314167vkm.21.2022.02.18.00.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 00:44:18 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id k128so4438580vkk.10;
        Fri, 18 Feb 2022 00:44:17 -0800 (PST)
X-Received: by 2002:a05:6122:ca1:b0:330:b95b:e048 with SMTP id
 ba33-20020a0561220ca100b00330b95be048mr2974054vkb.39.1645173857563; Fri, 18
 Feb 2022 00:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20220209232232.18461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220209232232.18461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Feb 2022 09:44:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgtbqA9M_ZuCJpB0EcH3Ysw-zqG2c1EHuih2DJO714qg@mail.gmail.com>
Message-ID: <CAMuHMdUgtbqA9M_ZuCJpB0EcH3Ysw-zqG2c1EHuih2DJO714qg@mail.gmail.com>
Subject: Re: [PATCH] i2c: riic: Simplify reset handling
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 10, 2022 at 12:22 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Read reset phandle as optional instead of exclusive so that all the DT's
> passing the reset phandle can be used to assert/deassert the reset line.
> With this change we don't have to differentiate the RZ/G2L SoC.
>
> With the above changes we no longer need the "renesas,riic-r9a07g044"
> compatible string, so drop it from riic_i2c_dt_ids[]. No changes are
> required to the r9a07g044.dtsi as we already have "renesas,riic-rz" as a
> fallback compatible string.
>
> While at it, check the return code of reset_control_deassert() as it might
> fail and also add a devres action to assert the reset line.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
