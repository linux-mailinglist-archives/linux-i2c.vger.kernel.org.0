Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4F960B519
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 20:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbiJXSMv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 14:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbiJXSMU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 14:12:20 -0400
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C56126C452;
        Mon, 24 Oct 2022 09:53:44 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 011D42B066F0;
        Mon, 24 Oct 2022 09:19:09 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 24 Oct 2022 09:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1666617549; x=1666624749; bh=dNk4I7ELz1
        Q72dRob/8j+4seSTYFKAZT/RUPASjRJ5c=; b=q+NqZuUcR73y8BnZPPG5dx1Zsk
        6km9xLqa6tEkJrornmVIrbgVsoTaG0EQRj//U3P/qs5FFUR0kQj3xsDpIMDiHNAP
        KHymuWr00P67rJl6tNZNMaSvfwBvDXs8mjOeO+DtIb91LFvy9u7IqPZlLBHzDqVY
        OqQ+UV/5sGJOiUEzmGUI9NOmwTaSDzu4RgOGbpc9QTg1ReluTq9aBn60FamJs6vN
        DKIJe0X1BrhoAYInvyHnNd5GZdOejs+w4Suvb5ImKHNqRwAYBvpipR0/HvaVLckd
        CHTLMlrLH5H5bEpdNq1ZJ2ZVvg8gjN0DzzHIiqNjzW420ViiiKKJHNZdB8zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666617549; x=1666624749; bh=dNk4I7ELz1Q72dRob/8j+4seSTYF
        KAZT/RUPASjRJ5c=; b=uYEImk9/JaoBLZkHmS4JMUN51UUW3Adz4NZ33zTXfhfn
        X2zc+bMCIXUEr4nNHo354GqKRASijikTpJx4FFU+epgcfr8J1IPlgZPNpNiYVB9M
        w8ihE4tr46Zh/a1sL2xOLJxavoW+rkvJ5mUtViAoLX1JGrLBO17yVcJcaCCL+4DZ
        U79zEm+ybsbN3XMbJe7XZH2qegoAJbChw5mNkbbe1D33ukaTT9FYQuJEpTpQ+3Cm
        dcgc9DJADBfxr4sonBlprzuNuFtddjyQxgp5OFhdXtZwXkncp0R9eBa1XvUUpv5H
        Fai3j/IlJ8ZfnHiUrjBdKzUP8vcWG93GWsi2JgpEew==
X-ME-Sender: <xms:zZBWY4d6hZdrWDWBmQnXOunjtmGBLNtVOGtYlcpUAkqGnIq3nQ_ULg>
    <xme:zZBWY6ORVL4inZtEZ347UGYnYKlOyas-DedRgWZhgJSTlHghoiUBMTH5Vdl7j2SlB
    orGRM2A45E3sznwkiE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:zZBWY5jMfpgYOekZ5Xiy1zZWPWGF2N1SaGbKcsqvIIsAoksVTelYew>
    <xmx:zZBWY98Y0Yr03VdtjC58Vfn64oQoe8znN7FH4bLecym0d8-7ie150w>
    <xmx:zZBWY0u1N4N4cR6ZhhO6MwuQK8N3p7TbkgEiIMvu0C2hnaFTg0G-QA>
    <xmx:zZBWY2px7fOBs4XObZs9jNKaCaM5g4TthCLLA4wr0bUEo7pzc_VBCiqJhiU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3DDB5B60086; Mon, 24 Oct 2022 09:19:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <e5aa233d-526b-45ab-9acb-ab792b8686bc@app.fastmail.com>
In-Reply-To: <20221024130035.GA1645003-robh@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221024130035.GA1645003-robh@kernel.org>
Date:   Mon, 24 Oct 2022 15:18:41 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Rob Herring" <robh@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, "Ben Dooks" <ben-linux@fluff.org>,
        "Simtec Linux Team" <linux@simtec.co.uk>,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
Content-Type: text/plain
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 24, 2022, at 15:00, Rob Herring wrote:
> On Fri, Oct 21, 2022 at 10:22:28PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The s3c24xx platform was marked as deprecated a while ago,
>> and for the s3c64xx platform, we marked all except one legacy
>> board file as unused.
>> 
>> This series removes all of those, leaving only s3c64xx support
>> for DT based boots as well as the cragg6410 board file.
>> 
>> About half of the s3c specific drivers were only used on
>> the now removed machines, so these drivers can be retired
>> as well. I can either merge the driver removal patches through
>> the soc tree along with the board file patches, or subsystem
>> maintainers can pick them up into their own trees, whichever
>> they prefer.
>
> [...]
>
>>  Documentation/arm/index.rst                   |    1 -
>>  Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
>>  .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
>>  Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 --
>>  Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
>>  Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
>>  Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
>>  .../arm/samsung-s3c24xx/overview.rst          |  311 ---
>>  Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 -
>>  Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
>>  .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
>>  Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
>>  .../arm/samsung-s3c24xx/usb-host.rst          |   91 -
>>  Documentation/arm/samsung/overview.rst        |   13 -
>
> What about?:
>
> Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
> Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
> Documentation/devicetree/bindings/mmc/samsung,s3cmci.txt

Good catch!

I've removed these three now and and will add the removal to
the same patch, also the related
samsung,s3c2412-clock.txt and samsung,s3c2443-clock.txt
files.

> Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

samsung,s3c2412-nand is apparently still used on s3c6400,
and the driver is selectable on that platform, so I think
that should remain in there until we remove s3c64xx in 2024,
even if it is not referenced by the dts files in the kernel.

> Documentation/devicetree/bindings/usb/s3c2410-usb.txt

Similarly, the driver is used on the crag6410 board
(without DT), and probably just works with the DT based
boards if one adds a node to s3c64xx.dtsi.

I've also checked if any of the other removed drivers
matches of_device_id[] strings to see if there are more
bindings to kill off, but I don't see any that have
now become obsolete. It did point me to pxa2xx_ac97_dt_ids,
which Robert already complained about, this apparently
is still used with dts files outside of mainline.

      Arnd
