Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E64284A13
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 12:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgJFKCa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 06:02:30 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2959 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725939AbgJFKC3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Oct 2020 06:02:29 -0400
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.106])
        by Forcepoint Email with ESMTP id 339F145D8CC503B2B5EB;
        Tue,  6 Oct 2020 11:02:25 +0100 (IST)
Received: from localhost (10.52.123.13) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 6 Oct 2020
 11:02:22 +0100
Date:   Tue, 6 Oct 2020 11:00:36 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Rob Herring <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "Andrew Lunn" <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        <dmaengine@vger.kernel.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Lars-Peter Clausen" <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "Marc Zyngier" <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "MyungJoo Ham" <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        "Peter Meerwald-Stadler" <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Vignesh Raghavendra" <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-can@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-ide@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-pci@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
Message-ID: <20201006100036.00007ec7@Huawei.com>
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
References: <20201005183830.486085-1-robh@kernel.org>
        <20201005183830.486085-5-robh@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.123.13]
X-ClientProxiedBy: lhreml716-chm.china.huawei.com (10.201.108.67) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 5 Oct 2020 13:38:30 -0500
Rob Herring <robh@kernel.org> wrote:

> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

>  Documentation/devicetree/bindings/iio/common.yaml            | 2 ++
For IIO

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>  ...


