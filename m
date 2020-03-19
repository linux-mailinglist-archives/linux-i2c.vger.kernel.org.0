Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB0518BBFE
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 17:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgCSQLP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 12:11:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727436AbgCSQLP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Mar 2020 12:11:15 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F27E20663;
        Thu, 19 Mar 2020 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584634274;
        bh=Oq6OzcJ1pRJcVvHx5D+K9KmKO9NwGHb+oIM0SQfrTGs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KzU80ZHDeVWY/ZNhn0HPi7cNIDTjzPgDKJdmPAv1jjgRoKscNnggHw5HB5RUHV63q
         nM9OGEN6mPxLr1rnJjWGSLEv4KZ4vZwUvUUl3MEQTedHm0AGmNV4WMICiZrgqotvpx
         pnDSIKDyMY+KKWeD9jJFnmHMnh6cA5gnf04e2fGA=
Received: by mail-yb1-f174.google.com with SMTP id g206so565717ybg.11;
        Thu, 19 Mar 2020 09:11:14 -0700 (PDT)
X-Gm-Message-State: ANhLgQ39SFbQHZA5wHLdGEf2uFUaC2C4BFqkZOWehVCu5IaHn9u7t7zh
        UEAPvJDLkjZ2gmcCepQnpJG1jRKBqAnESBWmog==
X-Google-Smtp-Source: ADFU+vvLsEep/vx8qHUUkolYGJcIcerwEptFuq/LXBSqDUZWP4P71Gah1wXv8Hn1g+bbgxKGowiIJN9Kj3EiKfBUm/U=
X-Received: by 2002:a5b:48e:: with SMTP id n14mr6129045ybp.462.1584634273454;
 Thu, 19 Mar 2020 09:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-14-lkundrak@v3.sk>
In-Reply-To: <20200317093922.20785-14-lkundrak@v3.sk>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 19 Mar 2020 10:11:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+wG+DTZ8Vxcw=NR2isABGrkoDiBt-uG9+NF6qdWuU62Q@mail.gmail.com>
Message-ID: <CAL_Jsq+wG+DTZ8Vxcw=NR2isABGrkoDiBt-uG9+NF6qdWuU62Q@mail.gmail.com>
Subject: Re: [PATCH 13/28] dt-bindings: serial: move Marvell compatible string
 to 8250 binding doc
To:     Lubomir Rintel <lkundrak@v3.sk>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 3:40 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> These ports are compatible with NS8250 and handled by the same driver.
> Get rid of the extra document that fails to document the properties that
> are actually supported.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/serial/8250.txt        | 2 ++
>  Documentation/devicetree/bindings/serial/mrvl-serial.txt | 4 ----
>  2 files changed, 2 insertions(+), 4 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/mrvl-serial.txt

Reviewed-by: Rob Herring <robh@kernel.org>

I'd really like to see 8250.txt converted to schema.

Rob
