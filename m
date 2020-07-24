Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46EE22D005
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 22:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgGXUwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 16:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgGXUwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jul 2020 16:52:14 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CA5C0619D3;
        Fri, 24 Jul 2020 13:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xVoSEin0oXCI9Z11WKA8dMlCCn4fz58veTFmYbww9j4=; b=rM03taNBaiVcGPukQ/TrRYqMy
        ndpmAXRoMO9TzFyK8ljLIRdNw5cEnWPMmcB4HSplfNAAdMp78OqLjPvcI5k0vpulmZ+eeFayiErRd
        SHL8/TmJko0KeyKcioSPPwbA9YNwX5D/OzH+fwcw57pGGrKGxgjXOIBMe3mnhfg699K7jZUuCcRPw
        HNUpsLY4bzS854NtWp61QwU3FlJRmGe7QZENJ/UOl6rbJhbCtECTulLjX6MEL2Cw5350Ns1zziFpg
        tf2gLiv9fLOZYESI2SzBLdmz3Gmqv+GzEjZvCu5f1Hp3gzWu3xi/+DAz5gsjrWxmvA0qEvZwiMvTY
        9IVwehB/g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43698)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jz4fq-0000Oe-6P; Fri, 24 Jul 2020 21:52:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jz4fp-0000u2-Gc; Fri, 24 Jul 2020 21:52:09 +0100
Date:   Fri, 24 Jul 2020 21:52:09 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        kamel.bouhara@bootlin.com
Subject: Re: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Message-ID: <20200724205209.GC1551@shell.armlinux.org.uk>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
 <20200705211918.GB1055@kunai>
 <20200724193913.GD1227@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724193913.GD1227@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 24, 2020 at 09:39:13PM +0200, Wolfram Sang wrote:
> On Sun, Jul 05, 2020 at 11:19:18PM +0200, Wolfram Sang wrote:
> > 
> > > +- pinctrl
> > > +	add extra pinctrl to configure SCL/SDA pins to GPIO function for bus
> > > +	recovery, call it "gpio" or "recovery" state
> > 
> > I think we should stick with "gpio" only. That is what at91 and imx have
> > in their bindings. pxa uses "recovery" as a pinctrl state name but I
> > can't find any further use or documentation of that. PXA is not fully
> > converted to the best of my knowledge, so maybe it is no problem for PXA
> > to switch to "gpio", too? We should ask Russell King (cced).

Fully converted to what?  The generic handling where the i2c core layer
handles everything to do with recovery, including the switch between
modes?

i2c-pxa _intentionally_ carefully handles the switch between i2c mode and
GPIO mode, and I don't see a generic driver doing that to avoid causing
any additional glitches on the bus.  Given the use case that this recovery
is targetted at, avoiding glitches is very important to keep.

> > Russell, do you object naming the pinctrl state for bus recovery in
> > the pxa i2c driver from "recovery" to "gpio"?
> 
> No response, so far. I suggest now to support the "recovery" naming but
> mark it as deprecated. Opinions?

I don't have a preference on the exact naming.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
