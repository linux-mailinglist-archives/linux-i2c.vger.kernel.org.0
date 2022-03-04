Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7824CD52B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Mar 2022 14:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236972AbiCDNbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Mar 2022 08:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237292AbiCDNbp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Mar 2022 08:31:45 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7F11B718A;
        Fri,  4 Mar 2022 05:30:57 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id k15so4336576vkn.13;
        Fri, 04 Mar 2022 05:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MGgY2v0s5BT836XDhQECk+NogjRLUOp9BRBkCXbFGdE=;
        b=W+AlDFDSvyHdz+MtMZtyjMynfsbtrZdN4krhD52GcopRw9cRaXbi/bhu7j7HHAibnt
         n0aRc95MXdcNLJCnsrV3uRFi9XFWtYRxybbkrFTLfCwHPKE7JZ/7Nw1fsTS+rtckUFRq
         Hpkk/NpltymaaxMX2hEvIwxmMOmTOgk2vIQOnhHqSACkozDRle214D406Ma8USbdBnir
         Ln/MmyXaYRJsJo2Y3MJn+gjFzynk3b9Qdoc18N32hs3nkTOPNFcL91kmqvNfo8Uo6z3A
         bKRr2/Yuh9JrsPEm6rf7F0ZfpDUuiXfJ6mfHa+aXUA+M7KuUbaEE77QgqNdRyPrhqNSc
         WPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MGgY2v0s5BT836XDhQECk+NogjRLUOp9BRBkCXbFGdE=;
        b=uB0ZulY/4VhnyPFyP+o1pcpNTPqZqohf94B2SkcvaoSuTxFLPEep5ako79Ru7re0U1
         n0x+0pem5zlsjCP/hBVKGyzFbsgd/YhUjMx0ZHntVFfziQo4/B4IXAWgrXE/8MB3r4Zk
         M0QfL7BcIrms6N1ew7DympVCeEz7AcTwrNm3XnyfjCrPViSfvkiXYU/+lox4ytha6vKB
         nXyd29JbLdemSHBwpJG3Q5wBDJPM2ABGkVWASE7uhELxYFDubr6ISb0Mbv9yWoMkBnUm
         pksgrCv57iyqybR5/zGcZ/6XKv5wVW9WauczpWfKMGDig0+hY2/Gan3jcHC3bl9iv/Ck
         YfqA==
X-Gm-Message-State: AOAM530eqh6EFuKd6rKKYQlAX8EDdacFxcXGWQtSm+sB1EyLcry1+uHh
        MbQ5M4MZBoPufsYkwnY4AbOvEcoUko/bILN6Ww==
X-Google-Smtp-Source: ABdhPJz6QhEJNTkvH8FmjEHlGwXeFvno4ykiadnrc8k7pR/6sf9X8gA8U1sfYQot8EAtmzyHIEtTNg6IV4fnn5eXZC4=
X-Received: by 2002:a05:6122:17a6:b0:31e:d699:29e0 with SMTP id
 o38-20020a05612217a600b0031ed69929e0mr18646190vkf.1.1646400656386; Fri, 04
 Mar 2022 05:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-3-warp5tw@gmail.com>
 <cb77935e-64e0-c8b6-9fba-9835a3be432f@canonical.com>
In-Reply-To: <cb77935e-64e0-c8b6-9fba-9835a3be432f@canonical.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Fri, 4 Mar 2022 21:30:44 +0800
Message-ID: <CACD3sJYBjKg6u5bJXAymgT8NeoDRcWr5k57SQHXeAdwJSdEh2g@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: i2c: npcm: support NPCM845
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, yangyicong@hisilicon.com,
        semen.protsenko@linaro.org, wsa@kernel.org, jie.deng@intel.com,
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

Hi Krzysztof:

Thank you for your comment and it'll be addressed.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=883=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:38=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On 03/03/2022 09:31, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 26 +++++++++++++++----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > index 128444942aec..37976ddcf406 100644
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
> > +    enum:
> > +      - nuvoton,npcm750-i2c
> > +      - nuvoton,npcm845-i2c
> >
> >    reg:
> >      maxItems: 1
> > @@ -36,6 +37,10 @@ properties:
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
> > @@ -44,6 +49,16 @@ required:
> >
> >  allOf:
> >    - $ref: /schemas/i2c/i2c-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const:
> > +              - nuvoton,npcm845-i2c
>
> This should be one line in const (not an enum).
>
> Rest looks good to me.
>
> Best regards,
> Krzysztof

Best regards,
Tyrone
