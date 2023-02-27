Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3E16A3A9A
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 06:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjB0FkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 00:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB0FkT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 00:40:19 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FD8976F;
        Sun, 26 Feb 2023 21:40:16 -0800 (PST)
Received: from pecola.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CB3652003E;
        Mon, 27 Feb 2023 13:40:12 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677476415;
        bh=reKxI7sW0i4ltCDJTvKHcAaH9AmY4ryoZsjHKDcfMCY=;
        h=Subject:From:To:Date:In-Reply-To:References;
        b=UN5VOnm0rPJsYccuS4TGHKJv6cIomIM7hzAY5SFFKHUbKuT5deuBvy1uKT8zZDZk4
         kOdLiWJQzZi9Kxu4H3henInU2gZGDWGanqbocR5aALKtRA2Yhp0CcRQZGzMOV7UQZj
         sZh00wNgJLA8ANcv0ZUo6MLthTqDu4JTXOZs+Q82JhQNOU3qxrPeEQdJhcmVGn78hA
         cSXILtC9ki4JOxi5PqGSOWZ1rDuJsdpE+di7PtbzJmUrx0esIMcC1GBXBZ8tzTMPFi
         bNEEh89jhf8roauQCKJLOu9yStst/pA8r8SlpSrEupvyVAoQ8oQLT1pG99kdP1f3e+
         /1qskQMnr4x3w==
Message-ID: <f4cb3efc9825efa582aa94bd03657b1319ff38fd.camel@codeconstruct.com.au>
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
Date:   Mon, 27 Feb 2023 13:40:12 +0800
In-Reply-To: <SEZPR06MB52699858C92383E8E07D0832F2AF9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
         <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
         <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
         <SEZPR06MB52699858C92383E8E07D0832F2AF9@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

> Yes, I2C controller share the same dma engine. The original thought
> can be enable in all i2c channel. But in AST2600 have ERRATA "I2C DMA
> fails when DRAM bus is busy and it can not take DMA write data
> immediately", So it means only 1 i2c bus can be enable for DMA mode.

OK, this is a pretty important detail! I'd suggest putting it in the
binding document.

Anything in the cover letter will get lost after review. If there is
documentation that would be useful for a DTS author, I'd suggest putting
it in the binding.

> It means only 1 bus channel can be enable DMA for use case.
> That following example for board-specific selection.
> It is description in cover-letter.
> The following is board-specific design example.
> Board A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Board B
> -------------------------=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ------------------------
> > i2c bus#1(master/slave)=C2=A0 <=3D=3D=3Dfingerprint =3D=3D=3D> i2c bus#=
x (master/slave)|
> > i2c bus#2(master)-> tmp i2c device |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > i2c bus#3(master)-> adc i2c device |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> -------------------------=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ------------------------
>=20
> - in bus#1 situation, you should use DMA mode.
> Because bus#1 have trunk data needed for transfer, it can enable bus
> dma mode to reduce cpu utilized.

What is "trunk data" in this context? Is this just a statement about the
amount of expected transfers?

> - in bus#2/3 situation, you should use buffer/byte mode
> bus#2/3 is small package transmit, it can enable buffer mode or byte
> mode to reduce memory cache flush overhead.
> Buffer mode is better, because byte mode have interrupt
> overhead(interrupt per byte data transmit),
>=20
> -But if you more bus#4 that still have trunk data needed for transfer
> (master/slave),
> it also use buffer mode to transmit. Because bus#1 have been use for
> DMA mode.

So, it sounds like:

 - there's no point in using byte mode, as buffer mode provides
   equivalent functionality with fewer drawbacks (ie, less interrupt
   load)

 - this just leaves the dma and buffer modes

 - only one controller can use dma mode

So: how about just a single boolean property to indicate "use DMA on
this controller"? Something like aspeed,enable-dma? Or if DT binding
experts can suggest something common that might be more suitable?

Cheers,


Jeremy
