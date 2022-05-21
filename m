Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D894D52FC7E
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 14:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbiEUM6Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 08:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiEUM6Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 08:58:24 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BF65E770;
        Sat, 21 May 2022 05:58:22 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id bc42so5179651vkb.12;
        Sat, 21 May 2022 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bykWdl7RkLd7Jog7GhgIWoVbo/GRYcAx6n48qBmXwJQ=;
        b=gTDImOFg2B6vBdQngixeW/HBPTktxpECBn/wsKGgzGqvIB/rHUt2m6Lx8G2UhwbFR6
         eFHv+2FUP23EXjhF0JGO7oeZH9VWAWwPx+yH7evdpZuMu8ew1iTVo53uGCD0Ywz03b08
         1Rb+j7cO8b99jzj5uYdBfnAw08STnAdQ0JQV5lp3sjiKzwyrkMgEkZmkeF+MjKjL0Pgd
         98uyQnUMYaQrHP02V5PitoHKi6JBPLag0nQyoEJUWuFjRZkklusWihMRj6th0Xx83rKM
         98UzlkRgsztjyb0ZklsrVWu4+aLKj3XECXsaTMG82pEfx9JO+WIe3Vdil8drO7OKMD4E
         WW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bykWdl7RkLd7Jog7GhgIWoVbo/GRYcAx6n48qBmXwJQ=;
        b=Jc4C5eNg+LgYMVczlpsg+jLja+XAXcodL+SjXRiOqVBXVrfK1r2YmZ49r5/mj+sj2P
         Jb6XlS+o01K8HTXEGDjDl8ricEh9DRwJ15vCDb04vNlfXMkh9DLFruuex2JZAZwKTLNZ
         cjjUmr9mnDoDb5mimOLxjLg0qH5OoFQmMWfsJJ9T8Bb7a+14ATFYl2nk8WC/RkmcdQAN
         wMzuv01KezMzkuYANKibMDagzJpBadrRo/7lqUbXH402ZTPhrt3uCrKNK9g6gUYPR4DB
         oYxwIErNjba+ynksiYBcPHjsPhcCgWdOY+WJTBc0rHRP/rwagMbL5v0CkFWDQIO+OObL
         iBTw==
X-Gm-Message-State: AOAM5316l48yzqpo5degmqGAGBQe4ahe8d+b7VAS2IfoqmdXFu+BiEil
        +7nHr5n9HI/O/Y8UdkTYm86ubqKuZFR8rEFnQw==
X-Google-Smtp-Source: ABdhPJw2hjnkCON9vjPf/cymYkRdWh75PM+u9FYDAz5c58fDuAVkVCoVnkqkOCnc/jPPILXIWW5ufceScMZiovqk4Os=
X-Received: by 2002:a1f:3254:0:b0:34e:b02d:bdd7 with SMTP id
 y81-20020a1f3254000000b0034eb02dbdd7mr5659802vky.11.1653137902033; Sat, 21
 May 2022 05:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-7-warp5tw@gmail.com>
 <Yoh+RUTtmiQsrCg3@shikoro>
In-Reply-To: <Yoh+RUTtmiQsrCg3@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 20:58:10 +0800
Message-ID: <CACD3sJb1GOFNeXU3csDWR7mSeUEDqqNkT+JvKVavRL1Epik-zw@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] i2c: npcm: Correct register access width
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
Cc:     jie.deng@intel.com
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

Thank you for your help.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:38PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > The SMBnCTL3 register is 8-bit wide and the 32-bit access was always
> > incorrect, but simply didn't cause a visible error on the 32-bit machin=
e.
> >
> > On the 64-bit machine, the kernel message reports that ESR value is
> > 0x96000021. Checking Arm Architecture Reference Manual Armv8 suggests t=
hat
> > it's the alignment fault.
> >
> > SMBnCTL3's address is 0xE.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
