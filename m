Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31214C6FB2
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 15:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbiB1OmM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 09:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbiB1OmM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 09:42:12 -0500
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F03612A8C;
        Mon, 28 Feb 2022 06:41:33 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id t25so6108550uaa.3;
        Mon, 28 Feb 2022 06:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=209/Hf4nH00Ju/2a2j/NloHG1AU0BZ+wP4Cp3BK+aEk=;
        b=Cpc6jU/yasZLIfZd/O+REjSGJOsvLHhiNhIXWFpyn+/WwykbswmvLJlqmo05eoS4Be
         lqCnUek3u1MO5z1StJuvo0ew475gOCHFVFPpBmb5GLGsMWjmHCVIxjWrAf60Bs8o5TiO
         IFeD+HA/4FMLo0gIp0oCVlhJ0vIzs1XAvVMD5k61vVkrK/jnj7YEoNTX5Cf0GCUrXi2W
         FmgGR+8mmr5nLiTeHVC0DqO/94HR50FBWr36KfXTUCvA2ICCay3HMxSkqdn/JNpsaTN5
         Jbm4HErEezKl1mzcN2EvcKlF4HF1hewUCugcOgi3jYZgaWDfVMsKQaYiWf5ZOgfafYmM
         PHGA==
X-Gm-Message-State: AOAM5325jYXIk7wfhPLPXEuND8Big6Sp+0F3lYayvnqZ9DfINB/th2v4
        5XEr00UcIyqX4WpHXbiMBrt9o6EaWj0hbQ==
X-Google-Smtp-Source: ABdhPJydw5lnGoZRIU0GcbS7Qbf6+7CFKn3KnJhNqyxoKzX8kMHZZT+ej+KH1tLpFTpxCDvl7RoIcw==
X-Received: by 2002:ab0:4911:0:b0:346:3893:b9be with SMTP id z17-20020ab04911000000b003463893b9bemr7362744uac.94.1646059292013;
        Mon, 28 Feb 2022 06:41:32 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id u190-20020a1fabc7000000b003334be45eeesm577421vke.34.2022.02.28.06.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 06:41:31 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id 10so6102569uar.9;
        Mon, 28 Feb 2022 06:41:31 -0800 (PST)
X-Received: by 2002:ab0:6253:0:b0:341:8be9:7a1 with SMTP id
 p19-20020ab06253000000b003418be907a1mr7934443uao.114.1646059291145; Mon, 28
 Feb 2022 06:41:31 -0800 (PST)
MIME-Version: 1.0
References: <20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Feb 2022 15:41:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2pNUhtrkEv92fd8J-8W0TM_UamJaNcfd+3D4+FXdX6w@mail.gmail.com>
Message-ID: <CAMuHMdW2pNUhtrkEv92fd8J-8W0TM_UamJaNcfd+3D4+FXdX6w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

Hi Prabhakar,

On Sun, Feb 27, 2022 at 10:47 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document RZ/V2L I2C bindings. RZ/V2L I2C is identical to one found on
> the RZ/G2L SoC. No driver changes are required as RZ/G2L compatible
> string "renesas,riic-rz" will be used as a fallback.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -20,6 +20,7 @@ properties:
>            - renesas,riic-r7s72100   # RZ/A1H
>            - renesas,riic-r7s9210    # RZ/A2M
>            - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> +          - renesas,riic-r9a07g054  # RZ/V2L
>        - const: renesas,riic-rz      # RZ/A or RZ/G2L

The last comment looks a bit strange now. Perhaps just drop it?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
