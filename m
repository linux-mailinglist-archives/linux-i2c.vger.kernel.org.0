Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133121886B2
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 15:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgCQOAM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 10:00:12 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:40808 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgCQOAL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 10:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=FrLx3+zGH3oU0Jo8/lq72eF8fifQc3xB2bQg8gY6tl8=; b=cGnLnBuVsp6fkYfQcJ+N0lP7Zi
        1CQ0257uMP73Zssq480GqtOsiT6dtz3j4jFY4auOWYouzd6Noyy4GBuZ2grQ+9xBQnBkb7o8JyQgO
        LYVpPM0bbhZnw1Ygcjk+w5hK1jV6VmA0mj+VI2m8UsxHjo1atAFpbrGsSPzlUpACujao=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jEClA-0006j0-3H; Tue, 17 Mar 2020 14:59:56 +0100
Date:   Tue, 17 Mar 2020 14:59:56 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/28] DT: Improve validation for Marvell SoCs
Message-ID: <20200317135956.GQ24270@lunn.ch>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317134609.GN24270@lunn.ch>
 <20200317135551.GE3448@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317135551.GE3448@piout.net>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 02:55:59PM +0100, Alexandre Belloni wrote:
> On 17/03/2020 14:46:09+0100, Andrew Lunn wrote:
> > On Tue, Mar 17, 2020 at 10:38:54AM +0100, Lubomir Rintel wrote:
> > > Hello World,
> > 
> > Yah, that is an issue here. Marvell have a few different SoC families,
> > each with there own maintainers. Gregory and I tend to look after
> > 'mvebu', aka orion5x, kirkwood, dove, berlin and a few others. All the
> > others are 'Somebody elses' problem'.
> > 
> 
> Hum, berlin is not mvebu, it was the same BU as the MMP and it has been
> sold to synopsys a while ago.

Yes, the boundaries are a bit fluffy. At least the early work by
Sebastian was merged via the mvebu maintainers, even if it is not
technically part of mvebu.

This is also part of the discussion about how this lot actually gets
merged.

	   Andrew
