Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9C984B08EC
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 09:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238017AbiBJIzJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 03:55:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238013AbiBJIzI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 03:55:08 -0500
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D616BD4A;
        Thu, 10 Feb 2022 00:55:09 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id w207so2142594vkd.2;
        Thu, 10 Feb 2022 00:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3WoIIEMj24t8PFRjDuDzok8HeC1xxHYqU5dE7ucu2Ks=;
        b=ANtY4mZeTE0nJoQ+Qcmz4cBd5ftxgavmaCB+A2pFhOGdoGeQW9l/jLl6uf3n/gskUQ
         YXYCQSVPHWBPnrNbWFH//z6SCo50wy/eLbSHH+vcoV7WLPN4ApbCl92mCDZGF32JafOk
         /4J/f6ZZI2Ea4ofpHqO9QCi5PBHQau7vPJhCgwyAkmGunbO8+GgL1woH1XzpAgCdi+E6
         qS0gVWoLf5IkGKXw5dcWGkzWwP8+xBocBVFWkPn1I9kSBhNXTqfalKO2aLxyM1gcAnNn
         W0wAISuChQB9TWloRlj/IVGZ5i1auiiQQhqNqBBIJfU34efA0KB3mLM3B5mpYMzoyc72
         bKog==
X-Gm-Message-State: AOAM530CmS+yPa10uDfuaqZxS85ErMdS1QtkCn6gd+cDl2rReavVor3v
        Xatdq/f9/kdc+adkizplU1F1ubmISu47gA==
X-Google-Smtp-Source: ABdhPJzJMqj51Kru2IrMKdWHNU2o+sXqHfY9Ui+79DN8JUppbZBPxlNZKjZ0Ak3hpEZHr4NakPTzIg==
X-Received: by 2002:a05:6122:507:: with SMTP id x7mr2178276vko.14.1644483308822;
        Thu, 10 Feb 2022 00:55:08 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 66sm902864vsh.33.2022.02.10.00.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 00:55:08 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id w207so2142554vkd.2;
        Thu, 10 Feb 2022 00:55:08 -0800 (PST)
X-Received: by 2002:a1f:2ac3:: with SMTP id q186mr1408230vkq.33.1644483307856;
 Thu, 10 Feb 2022 00:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
 <042a2183-3f04-088c-1861-656de870337d@gmail.com> <CAK8P3a3owi7YWmq-tckD-C7NK5HaX+swGNW-QBkWQuQgVsVWrA@mail.gmail.com>
 <d74ab454-9337-d168-9b21-842569431b4a@gmail.com> <CAK8P3a20mwJXN4Mb063zQG+HAevj_Odpj58EzPHkX-p6pbtnGA@mail.gmail.com>
 <7c47ce67-88ee-9cba-3356-a530b0d3e657@gmail.com> <CAK8P3a0gf6TeK2vZ+u3NZ2VrrvrGUohAPz5WiZ4Mbk5QQg9FFg@mail.gmail.com>
 <9a07be5a-914b-cec9-f6bc-8c1b0ecef766@gmail.com>
In-Reply-To: <9a07be5a-914b-cec9-f6bc-8c1b0ecef766@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Feb 2022 09:54:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-zBMqHV4aC58E925Aiyqag4TModL8dR1SA8Cwg1Drkw@mail.gmail.com>
Message-ID: <CAMuHMdV-zBMqHV4aC58E925Aiyqag4TModL8dR1SA8Cwg1Drkw@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>
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

Hi Sergei,

On Wed, Feb 9, 2022 at 5:08 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>    One more thing: the board code for those boards was added in 2011, we can assume
> it was working back then, right? :-_

This assumption may not be true: there is plenty of driver/board
support that was only upstreamed partially.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
