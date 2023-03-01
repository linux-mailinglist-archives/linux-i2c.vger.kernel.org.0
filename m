Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32CC6A666E
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Mar 2023 04:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCADXl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 22:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjCADXk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 22:23:40 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291741557D;
        Tue, 28 Feb 2023 19:23:38 -0800 (PST)
Received: from pecola.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B7FAF2003E;
        Wed,  1 Mar 2023 11:23:33 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677641016;
        bh=IZsgVb8ZtIZq1XVBi515jr/CvL6YVLvbvd3LsvrHoaE=;
        h=Subject:From:To:Date:In-Reply-To:References;
        b=EFXUbuSeAez/QolDnTxDb614EnfQLrdARAaohwkNDRkO3nIx8ogpQL9LCq11oPeYD
         nWYH3tggxG0vVHVvASY836WVG22+I/SS8wFLjxB8EnNoiMeIbJ0zCkyxSvNkl0eRlD
         T9mk1HDFnHiCOtX+9P8TqDFdzZ5vIu5WYLWHvvXGrKbpKBl4V7ewlpBLr2BdORnUsw
         L8FWMT8VjY2yV4nvGaaFY0+X32eGNq8YhI19cliwEMM885RO7/amjiTp+DlNtbQDGq
         i2gQvni+P5YR/dKi/XL/LMHeb2++aqojE/1iAkrJmXQEQ2lieiRgcpvB1PVnbjYxSV
         J/nF2XVXYWKbw==
Message-ID: <c18b064b6b01bd547b2f03006dbf4bb6fdf9b91d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Ryan Chen <ryan_chen@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Wed, 01 Mar 2023 11:23:33 +0800
In-Reply-To: <SEZPR06MB52695281E21B27DB57A7B2FFF2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
         <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
         <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
         <SEZPR06MB52699858C92383E8E07D0832F2AF9@SEZPR06MB5269.apcprd06.prod.outlook.com>
         <f4cb3efc9825efa582aa94bd03657b1319ff38fd.camel@codeconstruct.com.au>
         <SEZPR06MB52695281E21B27DB57A7B2FFF2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ryan,

> Sorry, Do you mean add in description like following??
> =C2=A0 aspeed,xfer-mode:
> =C2=A0=C2=A0=C2=A0 description: |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I2C bus transfer mode selection.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERRATA "I2C DMA fa=
ils when DRAM bus is busy and it can not
> take DMA write data
> Immediately", only 1 i2c bus can be enable for DMA mode.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "byte": I2C bus byte transfer mode.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "buffered": I2C bus buffer register tran=
sfer mode.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "dma": I2C bus dma transfer mode (defaul=
t)

I would suggest putting some background about the transfer mode as a
top-level description in the binding.

There has been a lot of discussion here on why the binding specifies
the transfer mode; it would be useful (for future readers) to have a
bit of context on what modes they should use.

Perhaps something like:

    description: |
      [general binding description]

      ASPEED ast2600 platforms have a number of i2c controllers, and share =
a
      single DMA engine between the set. DTSes can specify the mode of data
      transfer to/from the device - either DMA or programmed I/O - but
      hardware limitations may require a DTS to manually allocate which
      controller can use DMA mode; the enable-dma property allows control o=
f
      this.

      In cases where one the hardware design results in a specific
      controller handling a larger amount of data, a DTS would likely
      allocate DMA mode for that one controller.

- adjusted for whatever property interface we settle on here, of course.

> > So, it sounds like:
> >=20
> > =C2=A0- there's no point in using byte mode, as buffer mode provides
> > =C2=A0=C2=A0 equivalent functionality with fewer drawbacks (ie, less in=
terrupt
> > =C2=A0=C2=A0 load)
> >=20
> > =C2=A0- this just leaves the dma and buffer modes
> >=20
> > =C2=A0- only one controller can use dma mode
> >=20
> > So: how about just a single boolean property to indicate "use DMA
> > on this controller"? Something like aspeed,enable-dma? Or if DT binding
> > experts can suggest something common that might be more suitable?
>=20
> If so, just leave enable-dma and only support for buffer mode and dma
> mode, am I right?

Yes, from what you have said so far, I think just a single switch
between DMA / not-DMA is all you need here (unless there is any time
that byte mode is preferable?)

If there is already an existing DT convention for indicating/enabling
DMA capability, I would suggest using that. Otherwise, just a boolean
flag with a sensible name would seem to work fine. The DT experts
probably have a good idea of what works best here :)

Cheers,


Jeremy
