Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB4B4ADB8E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343673AbiBHOuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbiBHOuQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:50:16 -0500
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A82C061578;
        Tue,  8 Feb 2022 06:50:15 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id w21so25123301uan.7;
        Tue, 08 Feb 2022 06:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=IjJaAw/wafWxfeGosbqe867twyJsK3qqDpDgzhK+Gow=;
        b=75RKAOy/yzSLjE5DXhQeml/gKQod1NZfpAQhKM2NylQf8aYa53YF4qVJpfZ17dIlir
         fCrDjjPUw/XqqayZsoEP+vQ3l7lZZJALvcccUfDitXtrY/ooGBdZPkx2BNfMfGHqtcEP
         E3JS4HbtBbPn+tyEHD9rENEbfdxgdTOzyZjkfsSQoe/2z87qLkk/l2E6ui6dZiw28ZbE
         CKc3f5vtegbiJ+r6urZuWXdN9FHlLualMA+EhNS2OFAy58600cheztllK6uQJBymFrSu
         kUmZt7ULq8DW9Is+41hyo9/2k76MjuSYWeSwgpCYjtI+PhP1Hb+R7nOzkI5jkqaDo6Zq
         S/yA==
X-Gm-Message-State: AOAM533/JiQIZEeyF9AUnFPKQDYQFHesveGCvYw+A66KV47grUqIt0Wb
        8OJI3aQFM8PljKPl9G//EXCROYdoyBA36A==
X-Google-Smtp-Source: ABdhPJxRRvLag3x6cxYAh4qn8nypIqhPjKlLNxi/aoEmbr6pCfvPAn/t1rJt6XAYbMX780OKtnRJRg==
X-Received: by 2002:a9f:2f16:: with SMTP id x22mr1564345uaj.125.1644331814186;
        Tue, 08 Feb 2022 06:50:14 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id g67sm2672945vkb.55.2022.02.08.06.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 06:50:13 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id b2so1841675vkl.1;
        Tue, 08 Feb 2022 06:50:13 -0800 (PST)
X-Received: by 2002:a1f:2555:: with SMTP id l82mr1836194vkl.7.1644331813494;
 Tue, 08 Feb 2022 06:50:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643898531.git.geert+renesas@glider.be> <127a63594229deca2f63c7393b9bdf17b572163a.1643898531.git.geert+renesas@glider.be>
 <CAMuHMdVVN2Jc0sYpsc=V6gfQRGXk44Uh4r=2JWhM28gF4ePASg@mail.gmail.com>
 <YgJjkOqg6YL7499D@ninjato> <CAMuHMdWNUC+XqMLjY22L6XZ5NTyWTGA6HLruZUNFWBDEpcsmGg@mail.gmail.com>
 <YgKBk5o2aFegPNI1@ninjato>
In-Reply-To: <YgKBk5o2aFegPNI1@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Feb 2022 15:50:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCB1=UT7bidSJ0qqhf1qbrUmkwdyiiXX8E9zRo9uVkUw@mail.gmail.com>
Message-ID: <CAMuHMdUCB1=UT7bidSJ0qqhf1qbrUmkwdyiiXX8E9zRo9uVkUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: rcar: Add R-Car Gen4 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

Hi Wolfram,

On Tue, Feb 8, 2022 at 3:43 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Don't we want to introduce a family-specific compatible value for
> > R-Car Gen4? At least the SCSS seems to be a new R-Car Gen4 feature
> > common to R-Car S4 and R-Car V3U (yes, the latter is advertised as
> > the first member of the R-Car Gen4 family, so I intend to move it
> > over to renesas,rcar-gen4-* where it makes sense).
>
> Yeah, sure we want the family compatible. But for now it can point to
> I2C_RCAR_GEN3, so the patch can stay as is. That is what I was wondering
> about why a v2 was needed. If we add SCSS, we can update the family
> compatible data for Gen4 to I2C_RCAR_GEN4. Unless I miss something.

Ah, there's the source of the confusion! ;-)

There's a need for a v2 because the patch description says R-Car S4
supports FM+, which is false.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
