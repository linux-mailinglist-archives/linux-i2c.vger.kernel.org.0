Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8AE18BD0B
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 17:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgCSQvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 12:51:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:43790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727146AbgCSQvx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Mar 2020 12:51:53 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CEEA208D6;
        Thu, 19 Mar 2020 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584636712;
        bh=2ze8n/wWhmgGRIbVHJ5udG/S1t4TMsDq+0bbeXYtPok=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QyKov4bFHWG3H4hqZq/lODVKCwb4/xh/+2s+wxcX/FYj+zjf13+HhN7+F6mOULrBB
         vmZMrFP/4fhhqc/NBLvzJF3B7n4gPr2AM+J7JrT/cEV9I4gCg0kQxBKbTnjmTJlCeg
         FutoxiHKgH9se4LVod9K+eTPSF/xdCCBH2IwvFms=
Received: by mail-qk1-f170.google.com with SMTP id d11so3815434qko.3;
        Thu, 19 Mar 2020 09:51:52 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3sI98XCdliM+lwcqbN3kpkqfwrS002EuDto4BH875pyfycAn+9
        iBAPvg/lZRa7XLf61TZRptPu3D0XOgMCq+IsUA==
X-Google-Smtp-Source: ADFU+vsvey+cEo1Zx1LSphcQZh7dQXaoi8CO+gHGsvltymHnmg94ayjCcsPJFezmZufjX/oGzMXW4LGH8CCJv+tB70E=
X-Received: by 2002:a37:aa92:: with SMTP id t140mr3544418qke.119.1584636711194;
 Thu, 19 Mar 2020 09:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-13-lkundrak@v3.sk>
In-Reply-To: <20200317093922.20785-13-lkundrak@v3.sk>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 19 Mar 2020 10:51:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKMHyDeToZfHpkXEQySoUk=pM+B3+VrpkY4WO2hrJP6SQ@mail.gmail.com>
Message-ID: <CAL_JsqKMHyDeToZfHpkXEQySoUk=pM+B3+VrpkY4WO2hrJP6SQ@mail.gmail.com>
Subject: Re: [PATCH 12/28] spi: dt-bindings: spi-controller: Slaves have no
 address cells
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
> SPI controllers in slave mode have a single child node that has no
> address. Enforce #address-cells of zero instead of one.

Geert has fixed this making 'spi-slave' and '#address-cells' mutually exclusive.

https://lore.kernel.org/linux-devicetree/20200306085038.8111-2-geert+renesas@glider.be/

Rob
