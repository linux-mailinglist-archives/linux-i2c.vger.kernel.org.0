Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11FBC18857E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 14:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgCQN2B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 09:28:01 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:40402 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgCQN2B (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 09:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=VAJNmJGDz7LxwkvAwdf4Cm01CfteTfdSaGSxNxZJLrc=; b=c6tX9aULtp/MTuaZ+y+tKr6lBy
        lD+ZuLwcnOjBbrzAHUiolz6YZpNcNmt72H+rlcMsxU1wLfdIdM+jZ0p7gN1WMFNWjSFU6qBJBBQL+
        DwTEyTbzbzcC/knvMWhll3K5IZfMnvv0CwmMGEmdesC+/0NRS7EYg+T8SkJWBLuna2Gc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jECG2-0006S1-BJ; Tue, 17 Mar 2020 14:27:46 +0100
Date:   Tue, 17 Mar 2020 14:27:46 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Lubomir Rintel <lkundrak@v3.sk>
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
Subject: Re: [PATCH 04/28] ARM: dts: pxa168: Fix the gpio interrupt cell
 number
Message-ID: <20200317132746.GE24270@lunn.ch>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-5-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-5-lkundrak@v3.sk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 10:38:58AM +0100, Lubomir Rintel wrote:
> gpio-pxa uses two cell to encode the interrupt source: the pin number
> and the trigger type. Adjust the device node accordingly.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
