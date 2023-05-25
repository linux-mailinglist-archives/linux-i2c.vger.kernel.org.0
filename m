Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D7B71105B
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 18:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbjEYQFY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 25 May 2023 12:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbjEYQFX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 12:05:23 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D132195;
        Thu, 25 May 2023 09:05:22 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-75affe977abso132156085a.0;
        Thu, 25 May 2023 09:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685030721; x=1687622721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh08Ox/+tC22G+gywAd5EyuJ85NWPL4SWw8BJ7/dXm4=;
        b=aW2usrGK9kzTdMEifc3N4aoxwk8xj1rFg8rybZqgxhFbUduxgUqYXH56DM9kKuvKJ3
         8vC02d1BDpnNw/ATlcx14phTHbajTNtLfl6IOLIAvaHIkttgfj/9W57RFKlkpRvVbT6j
         cqabyN3P9NSPdzr8SoybjjdKXaJ6anW2T3kFjtbgYV+TPnDwKu1inGHL6tgruuJoMT7S
         LwyFvM5dOvs4pe4CCPePaiWt3isH2GfLeAfufCFsO/g2FK2fM5yeClPCcJRmZfQz7WvL
         0Z5F2BYFl/SR61t5oqUJVdlfXUARYsyMe+53hGaIwGImHGXpqSD0Shn/mltqjk+H/j4f
         SOJg==
X-Gm-Message-State: AC+VfDyP6YlfQ8aAFCkDaoXMbrRgfYe/gJcTbC1OgYbKw00n91NvqNzS
        df/IN1ggSToFJDgQN8jA2rP1HR1/c7QS5g==
X-Google-Smtp-Source: ACHHUZ5J+1ngYQ+NZdNHRQHardXL7DAr2uYchaPkxHKmRoa3x/o2GfqnFsWAiHaHmkP8AZgSftV+NQ==
X-Received: by 2002:a05:620a:9481:b0:75b:23a1:3622 with SMTP id sn1-20020a05620a948100b0075b23a13622mr10157820qkn.51.1685030721485;
        Thu, 25 May 2023 09:05:21 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id m24-20020a05620a13b800b0075ca93fd90dsm349777qki.45.2023.05.25.09.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 09:05:19 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-75affe977abso132147485a.0;
        Thu, 25 May 2023 09:05:18 -0700 (PDT)
X-Received: by 2002:a05:620a:801a:b0:75b:23a1:362c with SMTP id
 ee26-20020a05620a801a00b0075b23a1362cmr12025522qkb.61.1685030717893; Thu, 25
 May 2023 09:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230525135108.240651-1-biju.das.jz@bp.renesas.com> <20230525135108.240651-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230525135108.240651-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 May 2023 18:04:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJpUV+u3z_enmJDC5anQfF-+0KWJgNYxjuhjELif-pAg@mail.gmail.com>
Message-ID: <CAMuHMdXJpUV+u3z_enmJDC5anQfF-+0KWJgNYxjuhjELif-pAg@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: rzv2m: Drop extra space
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        William Zhang <william.zhang@broadcom.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Tyrone Ting <kfting@nuvoton.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
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

On Thu, May 25, 2023 at 3:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Drop extra space from the I2C_RZV2M config help description.
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
