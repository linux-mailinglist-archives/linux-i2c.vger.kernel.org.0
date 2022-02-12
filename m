Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17CB34B32D5
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Feb 2022 04:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbiBLDT7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 22:19:59 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiBLDT7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 22:19:59 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB682BB16;
        Fri, 11 Feb 2022 19:19:57 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id j5so9183322vsm.5;
        Fri, 11 Feb 2022 19:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VsyfeuJ6g/2GunJL7YeMT1Xjct0dmD0TxFd0nF8PH8U=;
        b=TwmGdMbxLLHVUn9Ba5bpyMP6jFwDyBiTYLHgXVRkaZujZ8eyCU+aHfYjLY7KNVukYT
         3MlOT/3rrOb9bN11+ueZ5hiUJr1GTkpFMozsfpwnpk4YOMQcReN4NOHyQnMMy8v/5lp/
         WKY5aFvS9XzKFm0kP+e7GuhPXAU2+Bw3unDK3nY79MNQcyqbK5Xj3e94BV0fqSb84ok5
         VMIWd5OolmStlZVA20lMLsCHvW1WKPZPrIF2pk16Rfxnp0vGFDzVl9odAe4yzwqPFB+X
         xsLLI4I2PYOsfAJIDRMXtXMLrFPynOXoC+K8u6uoCo+flcSP0cMUxbZrH1UJ9cjKwCaG
         neJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VsyfeuJ6g/2GunJL7YeMT1Xjct0dmD0TxFd0nF8PH8U=;
        b=W4U0TthyeY1zH2HgzyuZYIyUjI8ThqAiuBhVbX8Jy2v1BZjXxCBwuptEHQstEzDHlH
         ZBmjOfK6F/9cxYzRuf0FLjSQyouX798eS9NqRL4wAFPVKPwlZZ2iU7+VXnBZfHPSEgQQ
         PMy0nmiZDj3PXNe3Ed13IRzaVEMZbpHBfSS08k0qsnW4ia8T/Fx2s684ICzVVh/aBH4V
         N1s5E06OWQP6vQmaxWtH1mSgQ03cpTgIexq/Pu0hD2AqI3Oi3izt3svHJ3gCo/q7tWsB
         10KxHkh1z1nAedwRY5xUylPrA13lHw193Yzl2bQ2WsF+t+1A0xt8SmRQnxdLtGe+Cz+B
         k/gw==
X-Gm-Message-State: AOAM530h2UxA0fJmElLq8VH/Y3DnqVpvFybbX9gAaXTRA+Rx80hbeGAu
        tw/jrmEbzzcuPAB2d9xThBoHAYbsjHghUSrSEl9CIVzEqsOg
X-Google-Smtp-Source: ABdhPJzhjID5O0hs9dVvNkisAW79JP9/wSPy4zZ+fykuuiQaviQ2GaxlsbRxg65F5PWz5IrOOGqZd0wwcwJKtqYWe8g=
X-Received: by 2002:a67:eed4:: with SMTP id o20mr1544446vsp.29.1644635995958;
 Fri, 11 Feb 2022 19:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com> <20220207063338.6570-2-warp5tw@gmail.com>
 <YgaLZLuCwdpUgMea@robh.at.kernel.org>
In-Reply-To: <YgaLZLuCwdpUgMea@robh.at.kernel.org>
From:   warp5tw <warp5tw@gmail.com>
Date:   Sat, 12 Feb 2022 11:19:43 +0800
Message-ID: <CACD3sJYbS0_ak_BEJY0P9nYTP0NUZPmQ5re+-jL0qiWivZrL0g@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
To:     Rob Herring <robh@kernel.org>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        krzysztof.kozlowski@canonical.com, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
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

Hi Rob:

Thank you for your comments and they will be addressed.

Regards,
Tyrone


Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=8812=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Feb 07, 2022 at 02:33:33PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This commit adds compatible and syscon description for NPCM845 i2c modu=
le.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > index 128444942aec..05e58f44b03a 100644
> > --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > @@ -7,17 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml=
#
> >  title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
> >
> >  description: |
> > -  The NPCM750x includes sixteen I2C bus controllers. All Controllers s=
upport
> > -  both master and slave mode. Each controller can switch between maste=
r and slave
> > -  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIF=
O for TX and
> > -  RX.
> > +  The NPCM7XX includes sixteen I2C bus controllers and the NPCM8XX inc=
ludes
> > +  twenty-seven I2C bus controllers. NPCM8XX controllers 24-26 are conn=
ected on I2C
> > +  pins in parallel to controllers 8-10.
>
> How many instances is really outside the scope of this binding. And I
> don't want to be updating this for every new SoC. So rework it to cover
> both chips and the next one.
>
> > +  All controllers support both master and slave mode.
> > +  Each controller can switch between master and slave at run time (i.e=
. IPMB mode).
> > +  NPCM7XX I2C controller has two 16 byte HW FIFO for TX and RX and NPC=
M8XX I2C
> > +  controller has two 32 byte HW FIFO for TX and RX.
> >
> >  maintainers:
> >    - Tali Perry <tali.perry1@gmail.com>
> >
> >  properties:
> >    compatible:
> > -    const: nuvoton,npcm750-i2c
> > +    enum:
> > +      - nuvoton,npcm750-i2c
> > +      - nuvoton,npcm845-i2c
> >
> >    reg:
> >      maxItems: 1
> > @@ -36,11 +41,16 @@ properties:
> >      default: 100000
> >      enum: [100000, 400000, 1000000]
> >
> > +  syscon:
>
> nuvoton,sys-mgr or similar.
>
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of system manager register node.
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> >    - clocks
> > +  - syscon
> >
> >  allOf:
> >    - $ref: /schemas/i2c/i2c-controller.yaml#
> > @@ -57,6 +67,7 @@ examples:
> >          clock-frequency =3D <100000>;
> >          interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> >          compatible =3D "nuvoton,npcm750-i2c";
> > +        syscon =3D <&gcr>;
> >      };
> >
> >  ...
> > --
> > 2.17.1
> >
> >
