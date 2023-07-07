Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F6E74B432
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 17:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbjGGP1f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 11:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbjGGP1c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 11:27:32 -0400
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BA62695;
        Fri,  7 Jul 2023 08:27:30 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3464c774f23so1059095ab.1;
        Fri, 07 Jul 2023 08:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743649; x=1691335649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSMX3fbwS3ZdQ14KbIA9PVvNgGYdtwwGwe8Mi8kgYeU=;
        b=EYdHMusEeHXVsH+mdtqPRDbZm3oh153aO23Ej6SfCO0Qz+ww8sbLAOX5CBPwylFWrR
         RT22WT+jxy+xBM5avAhrSFmgGThZ717vhOT55JHPKwbMb3MQdfBPHoc6tlOAuobnwGP8
         azql/ZOSIR9Fj/3wMufgQJWpVU8K6LMLutcj4t2VxN9pEKQhmhCe5BpYofmGeC8w7S7F
         GYMlpL9OYV1xAkLoo/O5s6XuHjB/I1SK10S+jU1Q4CvyrMzPPfe8AqvHvI/ivyo4tf61
         rRm3oI3SwuUD9DYBAXXwP5Dv/4GpcHygWPfR3+3ok3u6hskNHOTqPpv2Tt/oHGYDOrbH
         O+6g==
X-Gm-Message-State: ABy/qLYyUursuKJvkS/IrwuVaXOjsI1dBsI3MSWKLF10sCV2aev6bkw4
        xIrOdysTCe67y++X8b8IGQ==
X-Google-Smtp-Source: APBJJlGQb/+NSo1YY2XQiOfry0niDhsIK8kPOwBt3oTrgIhTVOV41ugAIwkpb1OfmPqwJ646BYkBgA==
X-Received: by 2002:a92:c70f:0:b0:345:c11e:d1ad with SMTP id a15-20020a92c70f000000b00345c11ed1admr5255201ilp.26.1688743649601;
        Fri, 07 Jul 2023 08:27:29 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ee17-20020a056638293100b0042b37080b23sm1279795jab.73.2023.07.07.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:27:28 -0700 (PDT)
Received: (nullmailer pid 334293 invoked by uid 1000);
        Fri, 07 Jul 2023 15:27:24 -0000
Date:   Fri, 7 Jul 2023 09:27:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
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
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Message-ID: <20230707152724.GA329615-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <875y6vzuga.fsf@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875y6vzuga.fsf@epam.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 07, 2023 at 02:07:18PM +0000, Oleksii Moisieiev wrote:
> 
> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
> 
> > feature-domains is an optional property that allows a peripheral to
> > refer to one or more feature domain controller(s).
> >
> > Description of this property is added to all peripheral binding files of
> > the peripheral under the STM32 firewall controllers. It allows an accurate
> > representation of the hardware, where various peripherals are connected
> > to this firewall bus. The firewall can then check the peripheral accesses
> > before allowing it to probe.
> >
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >
> > Disclaimer: Some error with dtbs_check will be observed as I've
> > considered the property to be generic, as Rob asked
> >
> >  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
> >  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
> >  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
> >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
> >  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
> >  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
> >  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
> >  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
> >  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
> >  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
> >  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
> >  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
> >  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
> >  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
> >  24 files changed, 97 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > index b767ec72a999..daf8dcaef627 100644
> > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > @@ -50,6 +50,10 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  feature-domains:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> 
> I beliewe feature-domains is generic binding. This means that maxItems
> can be implementation dependend. I would rather drop maxItems so the
> following format will be possible:
> 
>           feature-domains = <&etzpc 1>, <&etzpc 2>, <&some_other_domain 1 2 3 4>
>           feature-domain-names = "firewall 1", "firewall 2", "other_domain"

The above already allows this (not -names, but the number of entries).
> 
> Also I beliewe driver will handle feature-domain-names property so it
> will parse feature-domains only related to the firewall.

Now I'm curious. What's an example that's not a firewall?

(Note I'm still not happy with the naming of 'feature' as anything is a 
feature, but that's the least of the issues really.)

Rob
