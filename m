Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9086B1D36
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 08:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjCIH72 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 02:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjCIH67 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 02:58:59 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744065FC6;
        Wed,  8 Mar 2023 23:57:51 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 5654932008FB;
        Thu,  9 Mar 2023 02:56:26 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 09 Mar 2023 02:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1678348585; x=1678434985; bh=Vq
        HIsQcXhmqCYt+w/wEu8RmoQ3k2P8+3OVZu3PbvqhE=; b=ZyKR18tm0jVHMTk0/g
        fEr4c5is3Y+8DOnmfQ8koV4ykwXfF2K7sni1t0+ukEoym+NrGqUgiWLEu5rPTyJw
        0YJM5pudrsxt8LzgOGh+hgE0OQ5jS2lY5cyw83Xhmlim0XjkCHM0H9qWimqmYycC
        jMZr7PhbnKrR6YPo3NULp+hFYo0LXakcP6Us1x7ZZq3P1cuIkQ5MK9g9m5pMMWAY
        94x0bpxOEonwuiBw+e9KS2EXFhKKOCu0kboq90Rb6LZ3pfmk6HoYl6K+vaxUSeNf
        nSWyjC3LN8IoYkrpMPY6uqpJCeSqM2nXl/4KiGEn0IfSm3wYg6kix6tCmq0pn6/T
        qj/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1678348585; x=1678434985; bh=VqHIsQcXhmqCY
        t+w/wEu8RmoQ3k2P8+3OVZu3PbvqhE=; b=kE2DfbWp52mBUvnYmds56m2l8GWvR
        6GisiRWu8lAU75Rv5FAF4jJ2hFJ/LC5tGjDStSyTS1iItd7/vS5hVccX0w1KHn7j
        AMAd1QJ/QpiUtF6G3AnzOa0Ot8irhJtBnd9UwowSATJtI/hGvpeXALZU/QOJ4gz+
        7/9zyNxa2IRRZzB1RrJ5abxNyi75ZkOHbk4H9I49QuQWX+0iw+hwBUMdW0zq+Xky
        8D/SGXUNP2rrlgZ2O8EETa7PFO/sGdFWZMdzbS37gl3JBjUb2v+8pFjj4lPa9zaC
        SgjcXwKL7pnFnXfSvIRlNwygO01bJ6N0erbQFzsxkXIu5so12+ruTqsIA==
X-ME-Sender: <xms:KZEJZEFzmjgvQ6uO2ftJj_-kxWGpZhRRGB_GkAVGwrxq9A03tly-5Q>
    <xme:KZEJZNWUMcNTL0GWBNYkqDhVDri41fz3kdz7Wg3srSjJkkSjBHFiguZIcVwzUa8dt
    nIKVTFu-g7oeAn0zIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:KZEJZOIUkInEUKpGIXLCFnAVXmNNPG5T0akKB765VFpDrnh6IdT_BQ>
    <xmx:KZEJZGFcV4YYZcEx5-_EJsWCtCjMAvUKr6pMJOHUc0Z-CYkZfsApXQ>
    <xmx:KZEJZKU_4TOUeTPHHuDUuOUSlhaFpcLokYxbsKbSXFh2Rc3DGU39xg>
    <xmx:KZEJZBNKmsfCZViwzTGZkeNK4ExQdsAcupMuQIxrtJLk2h7cBf53Qg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 777CBB60086; Thu,  9 Mar 2023 02:56:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <dcb805e1-2b48-481d-8e72-1b515c9d43e6@app.fastmail.com>
In-Reply-To: <20230309071100.2856899-2-xiang.ye@intel.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
Date:   Thu, 09 Mar 2023 08:56:05 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Ye Xiang" <xiang.ye@intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        "Lee Jones" <lee@kernel.org>, "Wolfram Sang" <wsa@kernel.org>,
        "Tyrone Ting" <kfting@nuvoton.com>,
        "Mark Brown" <broonie@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Sakari Ailus" <sakari.ailus@linux.intel.com>,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 9, 2023, at 08:10, Ye Xiang wrote:

> The minimum code in ASL that covers this board is
> Scope (\_SB.PCI0.DWC3.RHUB.HS01)
>     {
>         Device (GPIO)
>         {
>             Name (_ADR, Zero)
>             Name (_STA, 0x0F)
>         }
>
>         Device (I2C)
>         {
>             Name (_ADR, One)
>             Name (_STA, 0x0F)
>         }
>
>         Device (SPI)
>         {
>             Name (_ADR, 0x02)
>             Name (_STA, 0x0F)
>         }
>     }

I'm a bit confused by this bit, does that mean this only works
if the device is integrated on the mainboard and the BIOS is
aware of it? This won't work if  you plug it into a random
USB port, or have no ACPI firmware, right?

> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/usb/misc/Kconfig  |  13 +
>  drivers/usb/misc/Makefile |   1 +
>  drivers/usb/misc/ljca.c   | 969 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/ljca.h  |  95 ++++

Why is this in driver/usb/misc? It looks like a normal
mfd driver to me, and it evenhas the header in include/linux/mfd/

     Arnd
