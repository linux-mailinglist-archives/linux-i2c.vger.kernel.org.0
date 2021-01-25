Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F387304783
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jan 2021 20:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbhAZGAk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jan 2021 01:00:40 -0500
Received: from foss.arm.com ([217.140.110.172]:46534 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727848AbhAYMSs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Jan 2021 07:18:48 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DB8A11FB;
        Mon, 25 Jan 2021 04:00:13 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8D0B3F66E;
        Mon, 25 Jan 2021 04:00:10 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:59:32 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 18/21] dt-bindings: allwinner: Add H616 compatible
 strings
Message-ID: <20210125115932.6b9f148d@slackpad.fritz.box>
In-Reply-To: <c21019af-a6e4-4a06-5307-23b227d25934@sholland.org>
References: <20210118020848.11721-1-andre.przywara@arm.com>
        <20210118020848.11721-19-andre.przywara@arm.com>
        <c21019af-a6e4-4a06-5307-23b227d25934@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 17 Jan 2021 22:28:47 -0600
Samuel Holland <samuel@sholland.org> wrote:

Hi,


> On 1/17/21 8:08 PM, Andre Przywara wrote:
> > Add simple "allwinner,sun50i-h616-xxx" compatible names to existing
> > bindings, and pair them with an existing fallback compatible string,
> > as the devices are compatible.
> > This covers I2C, infrared, RTC and SPI.
> > 
> > Use enums to group all compatible devices together.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
> > ---
> >  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 21 +++++++------------
> >  .../media/allwinner,sun4i-a10-ir.yaml         | 16 ++++++--------
> >  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |  3 +++
> >  .../bindings/spi/allwinner,sun6i-a31-spi.yaml |  1 +
> >  4 files changed, 17 insertions(+), 24 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> > index 5b5ae402f97a..eb72dd571def 100644
> > --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> > @@ -18,21 +18,14 @@ properties:
> >            - const: allwinner,sun4i-a10-i2c
> >        - const: allwinner,sun6i-a31-i2c
> >        - items:
> > -          - const: allwinner,sun8i-a23-i2c
> > +          - enum:
> > +              - allwinner,sun8i-a23-i2c
> > +              - allwinner,sun8i-a83t-i2c
> > +              - allwinner,sun50i-a64-i2c
> > +              - allwinner,sun50i-a100-i2c
> > +              - allwinner,sun50i-h6-i2c
> > +              - allwinner,sun50i-h616-i2c
> >            - const: allwinner,sun6i-a31-i2c
> > -      - items:
> > -          - const: allwinner,sun8i-a83t-i2c
> > -          - const: allwinner,sun6i-a31-i2c
> > -      - items:
> > -          - const: allwinner,sun50i-a64-i2c
> > -          - const: allwinner,sun6i-a31-i2c
> > -      - items:
> > -          - const: allwinner,sun50i-a100-i2c
> > -          - const: allwinner,sun6i-a31-i2c
> > -      - items:
> > -          - const: allwinner,sun50i-h6-i2c
> > -          - const: allwinner,sun6i-a31-i2c
> > -
> >        - const: marvell,mv64xxx-i2c
> >        - const: marvell,mv78230-i2c
> >        - const: marvell,mv78230-a0-i2c
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > index 5fa19d4aeaf3..6d8395d6bca0 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > @@ -20,16 +20,12 @@ properties:
> >        - const: allwinner,sun5i-a13-ir
> >        - const: allwinner,sun6i-a31-ir
> >        - items:
> > -          - const: allwinner,sun8i-a83t-ir
> > -          - const: allwinner,sun6i-a31-ir
> > -      - items:
> > -          - const: allwinner,sun8i-r40-ir
> > -          - const: allwinner,sun6i-a31-ir
> > -      - items:
> > -          - const: allwinner,sun50i-a64-ir
> > -          - const: allwinner,sun6i-a31-ir
> > -      - items:
> > -          - const: allwinner,sun50i-h6-ir
> > +          - enum:
> > +              - allwinner,sun8i-a83t-ir
> > +              - allwinner,sun8i-r40-ir
> > +              - allwinner,sun50i-a64-ir
> > +              - allwinner,sun50i-h6-ir
> > +              - allwinner,sun50i-h616-ir
> >            - const: allwinner,sun6i-a31-ir
> >  
> >    reg:
> > diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > index 37c2a601c3fa..97928efd2bc9 100644
> > --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> > @@ -26,6 +26,9 @@ properties:
> >            - const: allwinner,sun50i-a64-rtc
> >            - const: allwinner,sun8i-h3-rtc
> >        - const: allwinner,sun50i-h6-rtc
> > +      - items:
> > +          - const: allwinner,sun50i-h616-rtc
> > +          - const: allwinner,sun50i-h6-rtc  
> 
> Since H6, the RTC manages the 24 MHz DCXO, so it provides a fourth clock
> output. If this is easy to change later, then it is fine for now, but
> maybe it is better to get the H616 binding correct from the beginning?

So you mean that RTC register +0x160 controls the system HOSC clock,
so the main input clock for all the PLLs and other clocks? And by
clearing bit 1 in there we can stop this?

And if that is the case, do you suggest that we should model this in
the DT, so that the fixed-clock "<&osc24M>" should be replaced with
"<&rtc 3>"?

So from a "the DT describes the hardware" point of view that would
probably the right way, but not sure if Linux is happy about that. At
the very least that would mean to extend the RTC driver to export a
fourth clock, and all devices would now depend on the RTC (also for
probing!). And Linux can realistically never turn that clock off
anyway (without grinding to a halt), so this register is more useful
for ARISC firmware?

So I am somewhat undecided: changing this for the H6 would make newer
DTs unusable on older kernels, without anything we really gain. When
we really want this, we should indeed use the opportunity to
introduce this at least for the H616 from day one, to avoid this
situation here.
But this requires more changes than just the binding, doesn't it?

Cheers,
Andre
  
> 
> >    reg:
> >      maxItems: 1
> > diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> > index 7866a655d81c..908248260afa 100644
> > --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> > @@ -25,6 +25,7 @@ properties:
> >            - enum:
> >                - allwinner,sun8i-r40-spi
> >                - allwinner,sun50i-h6-spi
> > +              - allwinner,sun50i-h616-spi
> >            - const: allwinner,sun8i-h3-spi
> >  
> >    reg:
> >   
> 

