Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A51E74D933
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 16:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjGJOmn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 10:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjGJOmm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 10:42:42 -0400
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1906C3;
        Mon, 10 Jul 2023 07:42:40 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-345ff33d286so24253225ab.3;
        Mon, 10 Jul 2023 07:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689000160; x=1691592160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9youPIImCCAcdEckdoxFQrNpLYrygdk7W9ZtiP8w15k=;
        b=RNoulLSZHnHbR/2BYwKnhB6ZCVD59ktpzYmSlC+pFzHu5labOYQjxCMLjg4wmUaXA9
         5vfXG/4I3tImqbWLvdIksMoDeccqRRvd95Z32GFS3nPDNTnlnPJSrEEj7eJXJ/lWUeVr
         KE0J6gWiBOMpY2LkMZbDHluq+5lcDdGcHnLJ7RBFruBMlvha04KUuNUfZoQzW+chBW5k
         tYpEHrU4YrdlJ4bvtl7C/W8gUJqi1OXND3pnVB8oYKf6q004qRo/Ok5OdvnmQ5Zmd0bZ
         nJHvdsoQNiMnmosuh/Y9qGz6npMn4TZDJsXIpqcogTrhPKfeBcRGSvFNYBmn+el3NcTe
         /V7w==
X-Gm-Message-State: ABy/qLb0UTDG/EF+3cYvmQZXUUxjYHEQEXmHqRWXEJnqZ28alAfM/g8I
        jLTwmVejLmJaAiz/gfQnPg==
X-Google-Smtp-Source: APBJJlG3K/ro2oZtTnsZ7Banw1CdZJLy4OFKR61udj8GbrxlXMYjo+jeaSBEKYBDTKO2X9W4TkNn0w==
X-Received: by 2002:a92:502:0:b0:345:c8ce:ff4e with SMTP id q2-20020a920502000000b00345c8ceff4emr11579387ile.3.1689000160019;
        Mon, 10 Jul 2023 07:42:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id x7-20020a92d307000000b00342f537e3c3sm3560577ila.2.2023.07.10.07.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 07:42:39 -0700 (PDT)
Received: (nullmailer pid 1938541 invoked by uid 1000);
        Mon, 10 Jul 2023 14:42:35 -0000
Date:   Mon, 10 Jul 2023 08:42:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc:     Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
        olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
        mchehab@kernel.org, fabrice.gasnier@foss.st.com,
        andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
        lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
        arnd@kernel.org, richardcochran@gmail.com,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Message-ID: <20230710144235.GA1922048-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <20230706145108.GA3858320-robh@kernel.org>
 <0aaace47-1bb4-82c5-57a5-6f5d27eb4d45@foss.st.com>
 <20230707152056.GA317056-robh@kernel.org>
 <fb72b4e4-d5c6-d9be-269d-29aff996001c@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb72b4e4-d5c6-d9be-269d-29aff996001c@foss.st.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 10, 2023 at 10:22:10AM +0200, Gatien CHEVALLIER wrote:
> 
> 
> On 7/7/23 17:20, Rob Herring wrote:
> > On Fri, Jul 07, 2023 at 02:28:28PM +0200, Gatien CHEVALLIER wrote:
> > > Hello Rob,
> > > 
> > > On 7/6/23 16:51, Rob Herring wrote:
> > > > On Wed, Jul 05, 2023 at 07:27:53PM +0200, Gatien Chevallier wrote:
> > > > > feature-domains is an optional property that allows a peripheral to
> > > > > refer to one or more feature domain controller(s).
> > > > > 
> > > > > Description of this property is added to all peripheral binding files of
> > > > > the peripheral under the STM32 firewall controllers. It allows an accurate
> > > > > representation of the hardware, where various peripherals are connected
> > > > > to this firewall bus. The firewall can then check the peripheral accesses
> > > > > before allowing it to probe.
> > > > > 
> > > > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > > > ---
> > > > > 
> > > > > Disclaimer: Some error with dtbs_check will be observed as I've
> > > > > considered the property to be generic, as Rob asked
> > > > > 
> > > > >    Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
> > > > >    Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
> > > > >    Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
> > > > >    .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
> > > > >    .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
> > > > >    Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
> > > > >    .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
> > > > >    Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
> > > > >    Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
> > > > >    Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
> > > > >    Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
> > > > >    Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
> > > > >    .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
> > > > >    Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
> > > > >    Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
> > > > >    .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
> > > > >    Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
> > > > >    Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
> > > > >    24 files changed, 97 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > > > index b767ec72a999..daf8dcaef627 100644
> > > > > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > > > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > > > @@ -50,6 +50,10 @@ properties:
> > > > >      power-domains:
> > > > >        maxItems: 1
> > > > > +  feature-domains:
> > > > > +    minItems: 1
> > > > > +    maxItems: 3
> > > > 
> > > > What are the 3 entries?
> > > > 
> > > > Rob
> > > 
> > > I thought I was benefiting from the description of the pattern-property in
> > > the RIFSC YAML file. But yes anyway, it seems like it needs some description
> > > here as the dependency does not appear in this file.
> > 
> > Humm, that should limit the maximum entries to 2, so 3 would never work
> > (if RIFSC is the parent).
> > 
> > > I picked 3 as a maxItems for our ST needs, I'll give it some more thought
> > > when coming back with something clearer.
> > 
> > I'd expect you have 1 entry for register bus and 1 entry for DMA bus if
> > there is one. It's block specific for how many entries, so the RIFSC
> > schema should not be setting that. You could possibly say that
> > 'feature-domains' is required for all the child nodes though.
> 
> Ok, I will change to not specifying the number of entries in the
> RIFSC YAML file for V2.
> 
> > 
> > Rob
> Some hardware blocks may have a firewall ID for their device part and
> another ID for their master part as well. In the end, the number of
> entries could very well vary between different platforms. And the YAML
> files are common to these platforms.

A given device has a fixed number of buses. Usually 1 or 2. That does 
*not* vary by platform (unless the device is modified). You could have 
the same firewall controller and id for multiple buses, but that 
should not change the number of entries for the device. Now maybe a bus 
has no firewall on some platforms. In that case, you should make the 
optional firewall entry the last one, have a null phandle (0 or -1), or 
use -names to distinguish the entries.

> This property could be used for "extra" arguments as well, that are not
> firewall IDs.

The arg cells are dictated by the provider and opaque to the client.

> What do you suggest between picking a high maxItems value that would
> (hopefully) cover all cases and not specifying maxItems at all? Or maybe
> another property dedicated to such arguments?

You should not specify maxItems in the firewall controller binding.

Rob
