Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035D674B7DE
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 22:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjGGUdW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 16:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjGGUdV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 16:33:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B1B1986;
        Fri,  7 Jul 2023 13:33:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05BCF61A71;
        Fri,  7 Jul 2023 20:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4ABC433C8;
        Fri,  7 Jul 2023 20:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688761999;
        bh=6QgMyrqXqeI6SEHa107HdWgEq35vmLXVAeALwcT+lDs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gx9KJf9fL/mmok1L7S1JEw98F7rQhqcE0z1w8BHJD17srLItsZuymDl+Vh6LuOMqc
         4alUEBZ5opvgHkrhgxf7bnhwEXvTA+lJ+2wjTvLnBj5RIOrUBEqvzoLMwkvr5kKOo5
         yISOGrruanfS4vCw4yBo4KjJkpCqE5P53NTnagcHPGIOblr6h6cNsX8ys6OcsyQ0H4
         qrXgMrqCQhWJISUHikJ+H6A9Rt5IkKe3q5S7a3IgZXRpoKmUEEfF3davdWD0SEJOLF
         x6HLSMnKxFc6bNn9fzW5yjsdHLXCNjC5gVSA2oPohD58IIKPy37fpI2og6S7rvH4ES
         9S5gMKOibrioQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b703a0453fso37141861fa.3;
        Fri, 07 Jul 2023 13:33:19 -0700 (PDT)
X-Gm-Message-State: ABy/qLZo43p2l+JUdXdAHHLr7x5By9lULZ0gvScQBahF8NzkZ7iGjFNj
        nBPFbytml/9kUDxgrPNEkwvjdPZ6fJwFGxB1DQ==
X-Google-Smtp-Source: APBJJlG4YuPBi7t5aJDihdeDntOW9LxmDKsR0D/L3YobFTVh86nYL2PgWf1QDLA9jOV+N7/XaSZs5aykFPftRmtwQjM=
X-Received: by 2002:a2e:8706:0:b0:2b2:104d:8f89 with SMTP id
 m6-20020a2e8706000000b002b2104d8f89mr5474388lji.0.1688761997303; Fri, 07 Jul
 2023 13:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com> <875y6vzuga.fsf@epam.com>
 <20230707152724.GA329615-robh@kernel.org> <87sf9zya79.fsf@epam.com>
In-Reply-To: <87sf9zya79.fsf@epam.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 7 Jul 2023 14:33:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJkkT4SZcHj-RLPpDpX+t3Oe6RHyjeBNh4arWbMx-J0Og@mail.gmail.com>
Message-ID: <CAL_JsqJkkT4SZcHj-RLPpDpX+t3Oe6RHyjeBNh4arWbMx-J0Og@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Peng Fan <peng.fan@nxp.com>
Cc:     Gatien Chevallier <gatien.chevallier@foss.st.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "jic23@kernel.org" <jic23@kernel.org>,
        "olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>,
        "arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "fabrice.gasnier@foss.st.com" <fabrice.gasnier@foss.st.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "will@kernel.org" <will@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "arnd@kernel.org" <arnd@kernel.org>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 7, 2023 at 10:10=E2=80=AFAM Oleksii Moisieiev
<Oleksii_Moisieiev@epam.com> wrote:
>
>
> Hi Rob,
>
> Rob Herring <robh@kernel.org> writes:
>
> > On Fri, Jul 07, 2023 at 02:07:18PM +0000, Oleksii Moisieiev wrote:
> >>
> >> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
> >>
> >> > feature-domains is an optional property that allows a peripheral to
> >> > refer to one or more feature domain controller(s).
> >> >
> >> > Description of this property is added to all peripheral binding file=
s of
> >> > the peripheral under the STM32 firewall controllers. It allows an ac=
curate
> >> > representation of the hardware, where various peripherals are connec=
ted
> >> > to this firewall bus. The firewall can then check the peripheral acc=
esses
> >> > before allowing it to probe.
> >> >
> >> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> >> > ---
> >> >
> >> > Disclaimer: Some error with dtbs_check will be observed as I've
> >> > considered the property to be generic, as Rob asked
> >> >
> >> >  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++=
++
> >> >  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++=
++
> >> >  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++=
++
> >> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++=
++
> >> >  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++=
++
> >> >  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++=
++
> >> >  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++=
++
> >> >  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++=
++
> >> >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++=
++
> >> >  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++=
++
> >> >  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++=
++
> >> >  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 ++=
+++
> >> >  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++=
++
> >> >  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++=
++
> >> >  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++=
++
> >> >  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++=
++
> >> >  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++=
++
> >> >  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++=
++
> >> >  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++=
++
> >> >  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++=
++
> >> >  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++=
++
> >> >  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++=
++
> >> >  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++=
++
> >> >  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++=
++
> >> >  24 files changed, 97 insertions(+)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.=
yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> >> > index b767ec72a999..daf8dcaef627 100644
> >> > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> >> > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> >> > @@ -50,6 +50,10 @@ properties:
> >> >    power-domains:
> >> >      maxItems: 1
> >> >
> >> > +  feature-domains:
> >> > +    minItems: 1
> >> > +    maxItems: 3
> >> > +
> >>
> >> I beliewe feature-domains is generic binding. This means that maxItems
> >> can be implementation dependend. I would rather drop maxItems so the
> >> following format will be possible:
> >>
> >>           feature-domains =3D <&etzpc 1>, <&etzpc 2>, <&some_other_dom=
ain 1 2 3 4>
> >>           feature-domain-names =3D "firewall 1", "firewall 2", "other_=
domain"
> >
> > The above already allows this (not -names, but the number of entries).
> >>
> >> Also I beliewe driver will handle feature-domain-names property so it
> >> will parse feature-domains only related to the firewall.
> >
> > Now I'm curious. What's an example that's not a firewall?
> >
> > (Note I'm still not happy with the naming of 'feature' as anything is a
> > feature, but that's the least of the issues really.)
> >
>
> The alternative usages of feature-domains was originally proposed by me
> here:
> https://lore.kernel.org/lkml/c869d2751125181a55bc8a88c96e3a892b42f37a.166=
8070216.git.oleksii_moisieiev@epam.com/
>
> Also I remember Peng Fan also was interested in those bindings.

It helps to Cc people when you talk about them.

If the parties interested in this want to see progress on this, you
all must work together and show this is a solution for multiple
platforms.

> I think the use-case when one node is protected by firewall and also is
> controlled by scmi feature-domain-controller (As was proposed in my
> patch series) may take place.

But isn't the SCMI device protection interface the same thing? Some
interface to say "can I access this device?" and/or control access to
it.

The other possible use I'm aware of is system partitioning. OpenAMP or
similar where an SoC is partitioned into multiple OS instances and
peripherals are assigned to different partitions.

> As for the naming maybe you have some thoughts about better name?

If I did, I would have. Something with 'access' in it is as far as I've got=
ten.

Rob
