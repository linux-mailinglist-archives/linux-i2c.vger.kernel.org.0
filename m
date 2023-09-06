Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487C67941BF
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 18:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbjIFQ4G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 12:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234699AbjIFQ4G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 12:56:06 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25F9199B;
        Wed,  6 Sep 2023 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sNT5Q34gaJqxFAzMyuR220ihuYNJNI4qn4J+v0HJKgg=; b=qgrWXZbpxvbI8vhw4vEIqO9JKI
        pFCV9fe0ukjHTp4uurXd5O3JljyAfUnSHyHml1eFErtkbL2ErjKPch9YmhTUZDEf7t+CpVoiOeSV7
        s4atnhAAcA1OaFly7quMx6MGM0Cy7X91Nouuy1oaRuJYPLGJoyJZ2xO4Gfj1PluWd/3j+7Q1Pksdf
        14Ka05TBPsVNrHkAmGco6cZBKMaS/UmBxU/uWQ1kmf0ukYxKkVS2GFqQy2GGGpEXe9hPZscmToOgD
        VxzdYERGjYqs7tP53H5gZrU9/D+R4o1BQs9qwcX9sPXN4YJVzS/qwpuJYJznfB20MXlGHb67iIScN
        IgTkxk4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51652)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qdvoq-0000qg-0D;
        Wed, 06 Sep 2023 17:55:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qdvoq-0004we-8Y; Wed, 06 Sep 2023 17:55:56 +0100
Date:   Wed, 6 Sep 2023 17:55:56 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     wsa@kernel.org, codrin.ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        luka.perkov@sartura.hr
Subject: Re: [RFC PATCH] i2c: core: dont change pinmux state to GPIO during
 recovery setup
Message-ID: <ZPivHKd0LWWnhPr/@shell.armlinux.org.uk>
References: <20230901114936.1319844-1-robert.marko@sartura.hr>
 <CA+HBbNEM6AfwX87DLRNAuJSWPKboGuuJJDRK_E+G3sJDF73oZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNEM6AfwX87DLRNAuJSWPKboGuuJJDRK_E+G3sJDF73oZA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 06, 2023 at 04:41:33PM +0200, Robert Marko wrote:
> On Fri, Sep 1, 2023 at 1:49 PM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > Ever since PXA I2C driver was moved to the generic I2C recovery, I2C has
> > stopped working completely on Armada 3720 if the pins are specified in DTS.
> >
> > After a while it was traced down to the only difference being that PXA
> > driver did not change the pinmux state to GPIO before trying to acquire the
> > GPIO pins.
> > And indeed as soon as this call is removed I2C starts working.
> >
> > To me it seems that this call is not required at all as devm_gpiod_get()
> > will result in the pinmux state being changed to GPIO via the pinmux
> > set_mux() op.
> >
> > Fixes: 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery")
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > I am aware this probably isnt the correct fix, so I am sending it as RFC
> > cause I have ran out of ideas.
> 
> CC-ing Russel as well since I forgot him.

So the generic recovery decided to set the pinmux state before calling
devm_gpiod_get(), where as the driver (and my code) originally did this
after calling devm_gpiod_get():

-       /*
-        * Claiming GPIOs can change the pinmux state, which confuses the
-        * pinctrl since pinctrl's idea of the current setting is unaffected
-        * by the pinmux change caused by claiming the GPIO. Work around that
-        * by switching pinctrl to the GPIO state here. We do it this way to
-        * avoid glitching the I2C bus.
-        */
-       pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
-
-       return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);

I'd suggest re-implementing my original scheme in the generic code
because this _does_ work on Armada 3720 hardware.

Removing the pinmux frobbing is likely to break stuff.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
