Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B7D18CA3C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 10:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgCTJY7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 05:24:59 -0400
Received: from mail.v3.sk ([167.172.186.51]:37792 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727000AbgCTJY6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 05:24:58 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id A9501DFC45;
        Fri, 20 Mar 2020 09:25:15 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id CB3O09jGeY6v; Fri, 20 Mar 2020 09:25:15 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id D57D7E0028;
        Fri, 20 Mar 2020 09:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id vyhPJH_CqW6F; Fri, 20 Mar 2020 09:25:14 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 6BB7CDFC45;
        Fri, 20 Mar 2020 09:25:14 +0000 (UTC)
Date:   Fri, 20 Mar 2020 10:24:52 +0100
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 13/28] dt-bindings: serial: move Marvell compatible
 string to 8250 binding doc
Message-ID: <20200320092452.GA24507@furthur.local>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-14-lkundrak@v3.sk>
 <CAL_Jsq+wG+DTZ8Vxcw=NR2isABGrkoDiBt-uG9+NF6qdWuU62Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+wG+DTZ8Vxcw=NR2isABGrkoDiBt-uG9+NF6qdWuU62Q@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 19, 2020 at 10:11:02AM -0600, Rob Herring wrote:
> On Tue, Mar 17, 2020 at 3:40 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> >
> > These ports are compatible with NS8250 and handled by the same driver.
> > Get rid of the extra document that fails to document the properties that
> > are actually supported.
> >
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > ---
> >  Documentation/devicetree/bindings/serial/8250.txt        | 2 ++
> >  Documentation/devicetree/bindings/serial/mrvl-serial.txt | 4 ----
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/serial/mrvl-serial.txt
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I'd really like to see 8250.txt converted to schema.

I'll follow up just with that.

Thanks quarantine.

> Rob

Lubo
