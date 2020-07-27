Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF81B22EA5E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 12:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgG0Kuc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 06:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgG0Kub (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 06:50:31 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9870CC061794;
        Mon, 27 Jul 2020 03:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=sz/TXSzKwrYpkCffdtkbnq911qx5/h9PjyH0klXmmJw=; b=M/MiaHAOnlt9dU1zcY/+kbZe/
        RGtAileyMy1i+S48GiEmkxHX7esL9e6iwzpPcLsWUgLPEhjxVOMMMebakXM6STpuVBEW+RPq4oOc5
        Ziqt3TBKdnG4P+6mBToqfLYS+CmmSJUeSCQVzpPzFCXO7bjIer+31/R/p9Uw3gmPwnoIVxUoZh2T7
        DL1kizMauNiNmAVSuT6tdOp6V+cKnwqi/SX8G8fGlRSl2HERQ6qbenSNYUsroptTFcRKKKdUh5vHn
        Ls+mrpzyYsuXozjFPYrBmB3Y3/pMiQ9IZf/d2O41yaIRctFm7RRg/JzgpCuP0OZ9SPglxroF2R32N
        Bb3Q00I3g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44768)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1k00iE-0002kY-A8; Mon, 27 Jul 2020 11:50:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1k00iD-0003av-UM; Mon, 27 Jul 2020 11:50:29 +0100
Date:   Mon, 27 Jul 2020 11:50:29 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Codrin.Ciubotariu@microchip.com
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, kamel.bouhara@bootlin.com
Subject: Re: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Message-ID: <20200727105029.GI1551@shell.armlinux.org.uk>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
 <20200705211918.GB1055@kunai>
 <20200724193913.GD1227@ninjato>
 <20200724205209.GC1551@shell.armlinux.org.uk>
 <b3a04528-0053-16bf-f092-147685298ced@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3a04528-0053-16bf-f092-147685298ced@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 27, 2020 at 10:44:57AM +0000, Codrin.Ciubotariu@microchip.com wrote:
> On 24.07.2020 23:52, Russell King - ARM Linux admin wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Fri, Jul 24, 2020 at 09:39:13PM +0200, Wolfram Sang wrote:
> >> On Sun, Jul 05, 2020 at 11:19:18PM +0200, Wolfram Sang wrote:
> >>>
> >>>> +- pinctrl
> >>>> + add extra pinctrl to configure SCL/SDA pins to GPIO function for bus
> >>>> + recovery, call it "gpio" or "recovery" state
> >>>
> >>> I think we should stick with "gpio" only. That is what at91 and imx have
> >>> in their bindings. pxa uses "recovery" as a pinctrl state name but I
> >>> can't find any further use or documentation of that. PXA is not fully
> >>> converted to the best of my knowledge, so maybe it is no problem for PXA
> >>> to switch to "gpio", too? We should ask Russell King (cced).
> > 
> > Fully converted to what?  The generic handling where the i2c core layer
> > handles everything to do with recovery, including the switch between
> > modes?
> > 
> > i2c-pxa _intentionally_ carefully handles the switch between i2c mode and
> > GPIO mode, and I don't see a generic driver doing that to avoid causing
> > any additional glitches on the bus.  Given the use case that this recovery
> > is targetted at, avoiding glitches is very important to keep.
> 
> Why is it not possbile to handle glitches in a generic way? I guess it 
> depends on the pinctl, but we could treat a worst-case scenario to 
> assure the switch between states is done properly.

Please look at how i2c-pxa switches between the two, and decide whether
the generic implementation can do the same.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
