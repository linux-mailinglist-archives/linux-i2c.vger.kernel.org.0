Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABF3284104
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 22:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgJEUe1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 16:34:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34827 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgJEUeY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 16:34:24 -0400
Received: by mail-wr1-f66.google.com with SMTP id n15so5296976wrq.2;
        Mon, 05 Oct 2020 13:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M4VHJO7NZXzhdbY1PrU7kRksiXBWJAga7ZRKvTmHhdY=;
        b=n3Mf2RY23M8mYkTF3/u+jtGKqwng7/Asl+N8rEUYCgXx6Z/lGC+Mp9ZuaUIZlSXoWK
         nprpsmNbfYP+1gp0H0W1yho/Be0+0abcWoHW4E5mChbSbdW4lBO7xzHs/GOHJaKFSamM
         A0BnNRNkh+fFTx0b7IqYMuMSx1okJWfW3+aP7Srhab05Z2MRfOUMqscirdDG0uDyMONW
         bOeNKLHhkufizEFFR4LC1bU/Gm4Omue+ry3mY7hrpWMmJNrwfTumOnvWEpZRwcR0Zi/l
         j1rD5P3efnQNB0G+i6HBv7Py+8zb5bKcqc9Z0FmuK6PbI+zf3eC/Oa/TDDqmoXcvECz5
         +7eA==
X-Gm-Message-State: AOAM532bOuy96i9neV55UhyjyC1ZDpKdrnkCvgmJXzUXC9oH84Hn5gPh
        KqrwNHohSLR1r/J/bM0ROOE=
X-Google-Smtp-Source: ABdhPJxCxtgn6aaeKulLwuz8wKsCo89p4EM2tZybvC7kIZ+95SJyA3hC3jBlEekC53H0JnM4JTmd2Q==
X-Received: by 2002:a5d:480a:: with SMTP id l10mr1120451wrq.238.1601930058858;
        Mon, 05 Oct 2020 13:34:18 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id a127sm907143wmh.13.2020.10.05.13.34.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 13:34:17 -0700 (PDT)
Date:   Mon, 5 Oct 2020 22:34:12 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: Explicitly allow additional properties
 in board/SoC schemas
Message-ID: <20201005203412.GC23742@kozik-lap>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-4-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-4-robh@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 05, 2020 at 01:38:29PM -0500, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As the top-level
> board/SoC schemas always have additional properties, add
> 'additionalProperties: true'.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
