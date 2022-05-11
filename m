Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E39C52287C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 02:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239632AbiEKA3A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 20:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239649AbiEKA2y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 20:28:54 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD80266C93;
        Tue, 10 May 2022 17:28:53 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id z144so390564vsz.13;
        Tue, 10 May 2022 17:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ArJ+P0yP41IspvL16vZgXyp5wGPDg81O0e5eE6H/vks=;
        b=TmeVRx9py0dFnEm1+1TQ/UZnrTgHHdOLlw2Hg/DmfL9RPjUBspUNsO6IaFp9AHo04x
         CyrG9eP8kVS+Q0M5scz+SpJ+oPm5ftB+uKdpygdqfsG5TGs2lgT5BbmFpW6uig2eAc+x
         L92C4Sl0SGJgJ1RqYttF7dIj/CbeT/+aEjlFJKtUYsjG3bSf19nn3hxMK5psMj/Kdyev
         vwUkLPp4Sd6DoHsVVgWFTywVAA93pVhPOmL2jh0RvBmDjYLuHXHeN/8moU7QoL1dXddI
         dO9j3yGjXudx0e7cszWgN7B/Rupgac9uvTPYxwqmewbBjQww9y8hsZGjGVohCqNKHbsE
         YuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ArJ+P0yP41IspvL16vZgXyp5wGPDg81O0e5eE6H/vks=;
        b=DFdvEJsmn8t3ZysHbhyEcfUMMbwdnGXZCqGXFA8T8sOT9rgyc8WbfrFkr9076BNVqm
         zVFNeCe963tFF7+TOrJ0R5IkyYBzg0KXxGOJb7pRviJh+Uh3Es3LjuJpHRNN00N1U9YD
         nvMkOxu4MIs+T37Uz2Jd1NjD7Qj6NwdCY8ohDJzhMukQMnf2yl4UZaCwKZNrc+0lo97O
         sgyTg/Ujszq5QH4TxBsJVxx93ikiNIAP/gnVi2kqPtR2VofPf/mD54ahHJa/h2yNgOqO
         BP0UL+UYNSOWmQGZ2qTq+q+yjDNBnwWB61JRitWNFN92+UgOLoHc7b0J1j9QjuyXYH7Y
         NJDQ==
X-Gm-Message-State: AOAM530W6OkLaTm5XKx30KsPggVdnn9HuuUwOnVnAiD6UNrdogZXaQxy
        7yn2LJxDy4nO2wHV32jhoTC8MUvDARDY6LV5AQ==
X-Google-Smtp-Source: ABdhPJxhZxAx7pGH4pYIhNGd5w1vurCriRZkY02XBkZ32jUrSC70/SiZ/pB1dgdPFtRowcflumM3uWIdxBgBCnQZs4Q=
X-Received: by 2002:a67:ec48:0:b0:32c:e56b:6e85 with SMTP id
 z8-20020a67ec48000000b0032ce56b6e85mr12394926vso.50.1652228932835; Tue, 10
 May 2022 17:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220510100328.9191-1-warp5tw@gmail.com> <20220510100328.9191-2-warp5tw@gmail.com>
 <28029d30-6d18-d28c-a7d2-d86b9ab9ad35@linaro.org> <CACD3sJa6qEPDD58NqiXJ+hHHSSbB6BRqEPXuX+m49ei8HrHF+g@mail.gmail.com>
In-Reply-To: <CACD3sJa6qEPDD58NqiXJ+hHHSSbB6BRqEPXuX+m49ei8HrHF+g@mail.gmail.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Wed, 11 May 2022 08:28:40 +0800
Message-ID: <CACD3sJa2qdocMXX3QFj5OdjFGd95M5nArJqPpEMjCYmb2ZvgHA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>, robh+dt@kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        sven@svenpeter.dev, jsd@semihalf.com, lukas.bulwahn@gmail.com,
        olof@lixom.net, arnd@arndb.de, Tyrone Ting <warp5tw@gmail.com>,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting <kfting@nuvoton.com>
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
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

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2022=E5=B9=B45=E6=9C=8811=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=888:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Krzysztof:
>
> Thank you for your review and it will be addressed.
>
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B45=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:59=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >
> > On 10/05/2022 12:03, Tyrone Ting wrote:
> > >
> > >  maintainers:
> > >    - Tali Perry <tali.perry1@gmail.com>
> > >
> > >  properties:
> > >    compatible:
> > > -    const: nuvoton,npcm750-i2c
> > > +    enum:
> > > +      - nuvoton,npcm750-i2c
> > > +      - nuvoton,npcm845-i2c
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -36,6 +37,10 @@ properties:
> > >      default: 100000
> > >      enum: [100000, 400000, 1000000]
> > >
> > > +  nuvoton,sys-mgr:
> > > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> >
> > Minor nit: No quotes. The other places don't have it.
> >
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> >
> > Best regards,
> > Krzysztof
>
> Best regards,
> Tyrone
