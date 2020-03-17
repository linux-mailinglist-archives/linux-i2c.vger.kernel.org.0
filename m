Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29000188DC0
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 20:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgCQTJV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 15:09:21 -0400
Received: from mail.v3.sk ([167.172.186.51]:46710 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726388AbgCQTJV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 15:09:21 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 2340FE021B;
        Tue, 17 Mar 2020 19:09:38 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id DLLls_Mq1N8K; Tue, 17 Mar 2020 19:09:36 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 44473E0116;
        Tue, 17 Mar 2020 19:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id vjvflx8zMQmd; Tue, 17 Mar 2020 19:09:36 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id C22C4DFFBE;
        Tue, 17 Mar 2020 19:09:35 +0000 (UTC)
Date:   Tue, 17 Mar 2020 20:09:13 +0100
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/28] dt-bindings: serial: move Marvell compatible
 string to 8250 binding doc
Message-ID: <20200317190913.GA24359@furthur.local>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-14-lkundrak@v3.sk>
 <20200317134805.GO24270@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317134805.GO24270@lunn.ch>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 02:48:05PM +0100, Andrew Lunn wrote:
> On Tue, Mar 17, 2020 at 10:39:07AM +0100, Lubomir Rintel wrote:
> > These ports are compatible with NS8250 and handled by the same driver.
> > Get rid of the extra document that fails to document the properties that
> > are actually supported.
> 
> Hi Lubmir
> 
> This is needs a bit closer examination. By the PXA maintainers. It
> appears there are two serial drivers, the 8250 and a PXA specific
> driver.

Well, for "mrvl,mmp-uart", there are three: SERIAL_OF_PLATFORM,
SERIAL_8250_PXA and SERIAL_PXA:

  drivers/tty/serial/8250/8250_of.c:      { .compatible = "mrvl,mmp-uart",
  drivers/tty/serial/8250/8250_pxa.c:     { .compatible = "mrvl,mmp-uart", },
  drivers/tty/serial/pxa.c:       { .compatible = "mrvl,mmp-uart", },

For that matter, the hardware is also compatible with intel,xscale-uart
and the mrvl,mmp-uart compatible string is perhaps entirely unnecessary.

I guess the story is somewhat similar for mrvl,pxa-uart; I can not
verify though.

I suppose SERIAL_PXA is not really needed at this point and if support
for mrvl,pxa-uart was added to SERIAL_OF_PLATFORM, then SERIAL_8250_PXA
would only be useful for platforms that don't use DT and the DT bits
could be stripped from it eventually. That is -- if PXA maintainers
agree, of course.

> 	Andrew

Regards
Lubo
