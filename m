Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB2F418BBE6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 17:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgCSQJc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 12:09:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbgCSQJb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Mar 2020 12:09:31 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F9DF208C3;
        Thu, 19 Mar 2020 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584634170;
        bh=QFuqHMWKkiEerMDTcpgGsWBChtJHP2dAeiJte+5yHtU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uY30D1IJVRcRBK2B9fm6ObzhPw1OcuQ6AjL1Sbl31AkMpnQyITbcQo67FqiBml04n
         ibIaY5ScnLxTd3j3uqWZYBnmfqYfvFQNbrvf2Ku1MgINv6t9TSCaWhmGH+SljjA7zU
         Y/UF4llCpGOqqW8nybbfwI3nev70L/DomHyFsJ0M=
Received: by mail-yb1-f172.google.com with SMTP id s17so562687ybk.9;
        Thu, 19 Mar 2020 09:09:30 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3pB5DuU3+sucltyszQDUEMVz4erO9PddeaLwyTLmU0xTtKcE94
        +jGsbQShz/3WOTdGhLhvx0bUTZszLuMFM2Bu0w==
X-Google-Smtp-Source: ADFU+vvOh/l0kOoyAZeUv7XIEUUFdmB7bmrN34m9amh/dorM5bjQaVRBAARghBCDWKGdHkkLJf9QnHfG/DHcWYa2/hI=
X-Received: by 2002:a25:b5c3:: with SMTP id d3mr5901077ybg.358.1584634169779;
 Thu, 19 Mar 2020 09:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-14-lkundrak@v3.sk>
 <20200317134805.GO24270@lunn.ch>
In-Reply-To: <20200317134805.GO24270@lunn.ch>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 19 Mar 2020 10:09:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJZbk29iq5QargTK-VMBoR359dvfQ=VuBkKHFdMfJEU9w@mail.gmail.com>
Message-ID: <CAL_JsqJZbk29iq5QargTK-VMBoR359dvfQ=VuBkKHFdMfJEU9w@mail.gmail.com>
Subject: Re: [PATCH 13/28] dt-bindings: serial: move Marvell compatible string
 to 8250 binding doc
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Lubomir Rintel <lkundrak@v3.sk>,
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

On Tue, Mar 17, 2020 at 7:48 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
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

Yes, but that is independent of the binding.

The PXA driver (serial/pxa.c) is already deprecated in favor of
8250_pxa.c. That was 3.5 years ago now, so maybe time to remove the
old one.

Rob
