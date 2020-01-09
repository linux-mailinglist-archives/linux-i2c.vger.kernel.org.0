Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9115D1362C0
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 22:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgAIVlI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 16:41:08 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:59130 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgAIVlI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 16:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1CEGALxxCt60dkPM/9o3pNjK/xYFlCaTlDJJUbF6OBQ=; b=j6n5s6bnpsPGF9mSoPuJe2OkE
        38W4nCVlHL1lmlhI5JIYA5ZfaNrB3qdIVyv15Wm21KNA3UAKcqXnvVqkiiUIU0mWwycmKAtafqgFU
        I/Ojl6Pl7AcvAHpNm8zTOSmXyJtEleoG4tSMubkPipH93qIOa5o+kQYNJ5lHGjeFjiUhj4oxTkcRX
        iOKJeVuckDwEsgcIRje5KiF4/3768xyDr1NyshPw927+0uWYagZsz75iQLKHwO34zZXEgZxLYtXKl
        jiALfzl3+x8o+j3SvIs3YfPyiYLUBF1TKryZrWwB+fvAAWtS5l2hh66NDiDfagEQPtOhnz8vu6Gw7
        r3ESKd17g==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:52794)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ipfY7-0007V5-UE; Thu, 09 Jan 2020 21:41:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ipfY7-0000qF-46; Thu, 09 Jan 2020 21:41:03 +0000
Date:   Thu, 9 Jan 2020 21:41:03 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: fix bus recovery stop mode timing
Message-ID: <20200109214103.GU25745@shell.armlinux.org.uk>
References: <E1igWvB-0001ib-PV@rmk-PC.armlinux.org.uk>
 <20200109212410.GA3046@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109212410.GA3046@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 09, 2020 at 10:24:10PM +0100, Wolfram Sang wrote:
> On Sun, Dec 15, 2019 at 04:39:05PM +0000, Russell King wrote:
> > The I2C specification states that tsu:sto for standard mode timing must
> > be at minimum 4us. Pictographically, this is:
> > 
> > SCL: ____/~~~~~~~~~
> > SDA: _________/~~~~
> >        ->|    |<- 4us minimum
> > 
> > We are currently waiting 2.5us between asserting SCL and SDA, which is
> > in violation of the standard. Adjust the timings to ensure that we meet
> > what is stipulated as the minimum timings to ensure that all devices
> > correctly interpret the STOP bus transition.
> > 
> > This is more important than trying to generate a square wave with even
> > duty cycle.
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Applied to for-current with the comment kept, thanks!

Thanks.  Sorry, I haven't had _any_ time what so ever to do anything
further on any of the I2C patches I submitted in December - this is
the first day since the weekend that I've actually had much time at
the computer, and I've had other stuff to attend to.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
