Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E867E72DE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 21:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbjKIUbM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 15:31:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234819AbjKIUa6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 15:30:58 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED8B49F5;
        Thu,  9 Nov 2023 12:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jCDg8l+bLFOyfpkTMVePNt58JlOfAD84FfzK2R7LN84=; b=OArBkgxEiBaUsr1YQTHPUWo5ag
        puw+/usHu8W7u1ZOgH4ks66ZMDjWLTv5Qs9D205fSzY+ATFUTdjBK2xcyOfdOOXsdx1+ds7bp8sAr
        eJxnSzu9S6AfRvdinwu0CEKz55zw9e0wNPlIbAYB5I0o8xBJwx/oDLit2dTvvxKjgBx177DgWocV3
        4PxhSLtby2HYDghZA38C4n9Y2ssAfvrPZpWsBtcMJsoShDiSQoGBOsVzVdumbKyzgYK8wa3c7qSTn
        LJaf7kiXIa4rcF/CRXtujCK4KBJTPn5FRy9NJ6ipJMKMjG2RXu82cG50zBF7XKEyDUgUckBZJflio
        5LZ7f/1w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44636)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1r1Bf7-0002sg-0k;
        Thu, 09 Nov 2023 20:30:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1r1Bf8-0000qM-Kr; Thu, 09 Nov 2023 20:30:02 +0000
Date:   Thu, 9 Nov 2023 20:30:02 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Robert Marko <robert.marko@sartura.hr>, wsa@kernel.org,
        codrin.ciubotariu@microchip.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] i2c: core: dont change pinmux state to GPIO during
 recovery setup
Message-ID: <ZU1BSmyD931BRwSD@shell.armlinux.org.uk>
References: <20230926160255.330417-1-robert.marko@sartura.hr>
 <CACRpkdZem9Gtd==gQM4EQ9R8MN2ZQ0JCyMCoTjg0kqCNDjuFMA@mail.gmail.com>
 <CA+HBbNFeVmc2CJeo+u9jbZrzsrDTOttW_4+aeLJFcOjDJ8DwyQ@mail.gmail.com>
 <CACRpkdYUW-mO6vhh-zkZAuqQOHpwMeJsNw=jSLzbgoEtoCTtNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYUW-mO6vhh-zkZAuqQOHpwMeJsNw=jSLzbgoEtoCTtNQ@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 09, 2023 at 09:04:29PM +0100, Linus Walleij wrote:
> Hi Robert!
> 
> Thanks for getting back on this issue.
> 
> On Thu, Nov 9, 2023 at 8:10 PM Robert Marko <robert.marko@sartura.hr> wrote:
> 
> > Yes, I2C recovery is required on this board as otherwise the I2C bus will
> > get stuck after a certain number of SFP module plug/unplug events or
> > sometimes even just randomly, I2C recovery allows the bus to recover
> > and continue working.
> 
> OK makes sense.
> 
> > Maybe my commit message was confusing, so I will try and explain further.
> > I2C recovery did work on Armada 3720 just fine until the driver was converted
> > to use the generic I2C recovery which is now part of the I2C core.
> >
> > After it was converted to it, the I2C bus completely stopped working
> > on Armada 3720
> > if I2C recovery is enabled by making the recovery pinctrl available in DTS.
> 
> Shouldn't we just revert that patch until we can figure this out then?

Note that when I wrote the i2c-pxa recovery code (which was developed
and tested on Armada 3720 - the uDPU) it had to work... when the
suggestion came up to implement generic recovery, I stated:

http://archive.lwn.net:8080/linux-kernel/20200705210942.GA1055@kunai/T/#mf7f862fcd53245f14fb650d33c29cf139d41039d

> > I then spent quite a while trying to bisect the exact change that
> > causes this issue
> > in the conversion as code is almost identical to what the driver was
> > doing previously,
> > and have bisected it down to pinctrl_select_state(bri->pinctrl,
> > bri->pins_gpio) being
> > called before SDA and SCL pins are obtained via devm_gpiod_get().

Yes, indeed. That's because the pinctrl internals get confused. I sent
you an email about it on 6th December 2019

"pinctrl states vs pinmux vs gpio (i2c bus recovery)"

which is why i2c-pxa did things the way it did in my commit
"i2c: pxa: implement generic i2c bus recovery".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
