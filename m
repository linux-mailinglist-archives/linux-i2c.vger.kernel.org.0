Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0412DA3C4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 23:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441322AbgLNW5C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 17:57:02 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34485 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441315AbgLNW44 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Dec 2020 17:56:56 -0500
Received: by mail-ot1-f65.google.com with SMTP id a109so17486403otc.1;
        Mon, 14 Dec 2020 14:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6eV+/H1+wuql5Xj175B7CxNiRq52AmncCnPannTivxU=;
        b=n3W4VjXTlZqubB9cX6CaLRjRvKNvwDkeqODi6O2W5sgAyiunW5ufkPn2UNhK1B6vB+
         uzRrh2Y44HMqPdKkzPaaXVVms8nLXjsvyhxgJ2hpYH1Bj/1wCg/9f5L6r4/iMEDU9NH3
         9MXZ/W18UXJG4MImvnqHGXgbm7Uqw0+h3j2N8gJptb+EvSVd+1QszMFrcfjPHnDWUTl4
         A0m96F3SboloSzencuzWvF858q4y/jyNSymlvWQdljC9IvPJt/xOqVVoYuN/8wkyxWOL
         SIQnp7irm44iosmy2wFjIebeTNu7PIUCfTdJh5qGzqTvwy7SPLL7mQPHHKI4zPbZ+Zov
         nXtQ==
X-Gm-Message-State: AOAM533qpBFBQe+443otamBeX+Cqs3NabILLTvTzkUzD+zB0199bWgO3
        +FwRDyWSGnHxQkAgZY6nDA==
X-Google-Smtp-Source: ABdhPJwDM6U4udpEYiXAy2gSlbztGdngQOcnWX4uPjrYbFwopnc0V36ZUTQRqWQ5M1hiz15LkX+/Lw==
X-Received: by 2002:a05:6830:4b9:: with SMTP id l25mr20777707otd.218.1607986575094;
        Mon, 14 Dec 2020 14:56:15 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a18sm4611657oia.29.2020.12.14.14.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 14:56:14 -0800 (PST)
Received: (nullmailer pid 2536446 invoked by uid 1000);
        Mon, 14 Dec 2020 22:56:12 -0000
Date:   Mon, 14 Dec 2020 16:56:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>,
        Icenowy Zheng <icenowy@aosc.xyz>, linux-i2c@vger.kernel.org,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-spi@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 18/21] dt-bindings: allwinner: Add H616 compatible
 strings
Message-ID: <20201214225612.GA2536414@robh.at.kernel.org>
References: <20201211011934.6171-1-andre.przywara@arm.com>
 <20201211011934.6171-19-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211011934.6171-19-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 11 Dec 2020 01:19:31 +0000, Andre Przywara wrote:
> Add simple "allwinner,sun50i-h616-xxx" compatible names to existing
> bindings, and pair them with an existing fallback compatible string,
> as the devices are compatible.
> This covers I2C, infrared, RTC and SPI.
> 
> Use enums to group all compatible devices together.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 21 +++++++------------
>  .../media/allwinner,sun4i-a10-ir.yaml         | 16 ++++++--------
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |  3 +++
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml |  1 +
>  4 files changed, 17 insertions(+), 24 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
