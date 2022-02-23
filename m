Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CABD4C0AA4
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 04:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbiBWDmp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Feb 2022 22:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234108AbiBWDmo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Feb 2022 22:42:44 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16EF3FD88;
        Tue, 22 Feb 2022 19:42:04 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id n142so11567238vkf.5;
        Tue, 22 Feb 2022 19:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OqWoqSkj2pZq4XW3/OjAW4W3K2FZ5HzyuMQBgaaFWjQ=;
        b=ak+w4ldjGF9jIQB4I06Xh2miBcGoHM1wkGJR6KN9Bw5HhzaOBVaLpvtYS8UxAmYeDf
         DzCTY/lUOsnQAxJ/H2bcZolvw0m6k08oh6xeS7JhJZo26xlsBbzAk0alEOeovANt8nMi
         4337ygGwF+9Sb6qGjffrxXJqByOnOMhziBdwga2F7JEy7T1nMTb4YCn/shzdF3scN0Y0
         P0zT6v773LQf9YgzUQFQsSkdMqJvZ9zKbLD2flbeEGm9/quiPbPI2dH+EvFnRLRlzUH0
         Qnm7NjaDPvu131EbaGiMjzS5GUPEcJsD7lmLR7B0pEsI7Xy8pXchEjl81VhRGR7m/gag
         ElhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OqWoqSkj2pZq4XW3/OjAW4W3K2FZ5HzyuMQBgaaFWjQ=;
        b=0ExRE2jo5K9I+7PafzMPkeMr59qhCYlFpVfGp+5u6vSEaxdbotVhMJ/zvEJQsVljsl
         UzdQ678i6js36xdwHLP0LUO8B8Vl68nFQWPiLoR7jllUUW23mQduaXvBM89etOGRNVPL
         YkXRZWwmwOf61DFsvAg+By6iaK2QMSvbxlfkcXz9pVcdHgtWraWBvoQBnA/11Fbmxvs0
         MhYSiSeDomIXzuvczdb8BNyNWjD0mAQ8/zVDJ5da8tG7TL8Y10aITTjEuOfORQlNbBbM
         TXo5+Otv4N/5pSSB55bmkJkUMR8Z1IkoPPFr6xoLjwoYzw2q/d0tpuaP2zg5x9hzEuMF
         GnTg==
X-Gm-Message-State: AOAM533X4j8/zZAgQljHJS73cmAqvG/BfzmJ8QIDsRFMYssR/FVV/jb2
        aNpxt7DFx9m1n++YrPTTlnB7Mwve6Ud/pFBu/g==
X-Google-Smtp-Source: ABdhPJyvh/72b/1Os/zmPvR6IUg6qz3wiks0x71QCYLQFhOUwWN2mEXlb45uXlPQftu9wGfF+zrwGDRF6/QeQ486dSM=
X-Received: by 2002:a05:6122:180b:b0:330:ee39:966e with SMTP id
 ay11-20020a056122180b00b00330ee39966emr11364658vkb.5.1645587723401; Tue, 22
 Feb 2022 19:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <20220220035321.3870-3-warp5tw@gmail.com>
 <YhUj3uRQinOVF4eM@robh.at.kernel.org>
In-Reply-To: <YhUj3uRQinOVF4eM@robh.at.kernel.org>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Wed, 23 Feb 2022 11:41:51 +0800
Message-ID: <CACD3sJZo4GvGxira9nM1g_58OkN9UNhUV_f=JKyKiok6_=uoSQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
To:     Rob Herring <robh@kernel.org>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        krzysztof.kozlowski@canonical.com, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
        olof@lixom.net, arnd@arndb.de, digetx@gmail.com,
        andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Thank you for your comment and it'll be addressed.

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Sun, Feb 20, 2022 at 11:53:12AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > index 128444942aec..809c51ac32fe 100644
> > --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > @@ -7,17 +7,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml=
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
> > +  I2C bus controllers of the NPCM series support both master and
> > +  slave mode. Each controller can switch between master and slave at r=
un time
> > +  (i.e. IPMB mode). HW FIFO for TX and RX are supported.
> >
> >  maintainers:
> >    - Tali Perry <tali.perry1@gmail.com>
> >
> >  properties:
> >    compatible:
> > -    const: nuvoton,npcm750-i2c
> > +     enum:
> > +      - nuvoton,npcm750-i2c
> > +      - nuvoton,npcm845-i2c
> >
> >    reg:
> >      maxItems: 1
> > @@ -36,11 +37,16 @@ properties:
> >      default: 100000
> >      enum: [100000, 400000, 1000000]
> >
> > +  nuvoton,sys-mgr:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of system manager register node.
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> >    - clocks
> > +  - nuvoton,sys-mgr
>
> You can't make nuvoton,sys-mgr required for existing users. You can add
> an if/then schema for nuvoton,npcm845-i2c if you want to make it
> required in that case.
>
> Rob

Best regards,
Tyrone
