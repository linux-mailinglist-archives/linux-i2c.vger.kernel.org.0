Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFB35A5C9A
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 09:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiH3HKN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 03:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbiH3HJz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 03:09:55 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E76E4E;
        Tue, 30 Aug 2022 00:09:47 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id r6so7880139qtx.6;
        Tue, 30 Aug 2022 00:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kvehLYa8RckdOHZiyCr1n+0fIpZ/1DX6g3S67QojAKk=;
        b=LUyB9UaH3iN+wPpx6xBh/pOFCnPLE9bSgaOb0/z33lotPOGDueMWq8qIfCq0NOO25e
         MOEmF4ZDLiu9sp+8tF35G8OsxiG4/JzETvaGvVuYnPZQQ5GnCIOPP5mzTRQD5GG9oLFM
         VmZTBY5KGsLDMmKDAET8cUZ67uxSamKnYZgCC9Uh0z0rIjbpfuGpGrsAv0quiv1NE7mp
         O0SSucQnKFC5tFeemof2hJTcmsg4RfjMXCDhQDfikCFtXqrIyVtwRbu9iRKiCKpKdT9r
         58OpRLBKzl0lcyS/TV36qzEBNld2iDmTDz6dXTQRpJjbDt6zKhaWEYjj2ZqMIl9kfhJ9
         tgtw==
X-Gm-Message-State: ACgBeo33rnRyxP9Itw2yhAQI+f5jvHqZZLLqJWtHtBrl2aGhKTVEeXzF
        /3+p5piJAMKfnc3J2ZtRT4eCrXLrTPmb8w==
X-Google-Smtp-Source: AA6agR7OzLQymi4nFNOzzqioDGvDod9M3yrbunBtTzTOPOhQJ5gO4g7ikkDyUbBHWYLpmMH6psZjfg==
X-Received: by 2002:ac8:6b18:0:b0:343:6b3:60ff with SMTP id w24-20020ac86b18000000b0034306b360ffmr13695593qts.176.1661843385968;
        Tue, 30 Aug 2022 00:09:45 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id v13-20020a05620a440d00b006bb29d932e1sm8037817qkp.105.2022.08.30.00.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:09:45 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-333a4a5d495so250799757b3.10;
        Tue, 30 Aug 2022 00:09:45 -0700 (PDT)
X-Received: by 2002:a0d:e895:0:b0:340:ab79:3285 with SMTP id
 r143-20020a0de895000000b00340ab793285mr12995245ywe.358.1661843385104; Tue, 30
 Aug 2022 00:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220829214730.5752-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220829214730.5752-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Aug 2022 09:09:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW92V6R2f97sEO9phBqDTDywXkjbjURv3Ntj_YczCQ05Q@mail.gmail.com>
Message-ID: <CAMuHMdW92V6R2f97sEO9phBqDTDywXkjbjURv3Ntj_YczCQ05Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Fix 'unevaluatedProperties'
 warnings
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Mon, Aug 29, 2022 at 11:47 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> With 'unevaluatedProperties' support implemented, there's a number of
> warnings when running dtbs_check:
>
> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: i2c@10058000: Unevaluated properties are not allowed ('resets' was unexpected)
>         From schema: Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>
> The main problem is that bindings schema marks resets as a required
> property for RZ/G2L (and alike) SoC's but resets property is not part
> of schema. So to fix this just add a resets property with maxItems
> set to 1.
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
