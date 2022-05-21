Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D0F52FC8F
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 15:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238449AbiEUNKU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 09:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbiEUNKU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 09:10:20 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649D66339E;
        Sat, 21 May 2022 06:10:15 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id k13so1245378uad.0;
        Sat, 21 May 2022 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gY5YVxSZXZa4246xLEbiahVb0abGv5fP2xn0Bj47TQk=;
        b=MMm10EHw5NfVdmbzl5QnYyuVlnEypnTwmxnUjZrASRiX2RdolTkvhEPaQEtTnLzUcB
         ZPAuRWUOk+JmMv9bCijbs03VPBKqVtjZ7zq6h8L2C+h3o8rJT3OajJkR2cAaX5auDWCW
         +avBzKF5XDR+EziuGPLwVH/foFpjhWUxdS91ikc3apcg+i12qRKv9rzwBOjRNcNhBezU
         aYXJaFYNxGJXFmu0+EqfbFRLe+EaHYb4jbQ0NMowo3xV4VLAgCK54EguUwQZggvFLcMq
         7QuXzDy12eydEhmCkozNV9kXSyckNYYMHmeIUyUOkCP5dJOC4OTWamw8CWnWFI4OsfMj
         OziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=gY5YVxSZXZa4246xLEbiahVb0abGv5fP2xn0Bj47TQk=;
        b=f2Uu0XpgqxufFdZpYN1BHvvqBO3sNsKtKrBBjSXrfs5/aHUsXG2d2841XXH7BFGWkt
         LVdV4uUIIqWuOLR+gFiuh5hD5fuyPZB7SwEc9H8YrxHDEqkuV7G+X6tViD+d8tbX6tFL
         xP3fDiLSyeo+wG3XRFOeXCBX6p9gv05LN0OySAQWB3OWuDmC0wrtPR2WNyfN0O0F9ZhS
         07t9IbimIze7I1eZ7RK83W8lh7ijwUGVrBzGYltohfS8rlWhFQPR1S/8L6rAYd0OiJZ1
         KmDx+GMvaJTelmzhOvtJettSuLnBfcVD4rOlz1nzc51EJbmHp6TgQwm8kMr2wBCbqWte
         RmLg==
X-Gm-Message-State: AOAM531cJZ4Yorq9u8sUod2kvcUZCt8pHKLWdbTgOCZQUY46wVPEtuPO
        JjLHakTq6TorNuIwgpJIfW63l/eJMilotPTGfw==
X-Google-Smtp-Source: ABdhPJxMM64PIFeMevBuR5+/jP8tWbXAUSF3xQaHJhxiF1PXLUgVCD+aHXQWr5I9X4Fu4iz9yZN9yRf/dfAQ0K4A0Y4=
X-Received: by 2002:ab0:2e90:0:b0:368:acd4:f2cd with SMTP id
 f16-20020ab02e90000000b00368acd4f2cdmr5227856uaa.116.1653138614398; Sat, 21
 May 2022 06:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-10-warp5tw@gmail.com>
 <YoiAF3fcFJiH4nGP@shikoro>
In-Reply-To: <YoiAF3fcFJiH4nGP@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 21:10:02 +0800
Message-ID: <CACD3sJb6OParLBQxe+JwcGRpnLfihFRLMOQWEwC_DJHrpzcr_w@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] i2c: npcm: Support NPCM845
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram:

Thank you for your reminder.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:01=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Tue, May 17, 2022 at 06:11:41PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add NPCM8XX I2C support.
> > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > The internal HW FIFO is larger in NPCM8XX.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Would be great to get an ack from one of the listed Nuvoton maintainers.
>

Best Regards,
Tyrone
