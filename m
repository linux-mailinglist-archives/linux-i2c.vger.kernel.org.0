Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BC76C1DA6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 18:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjCTRVW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 13:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbjCTRUy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 13:20:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD43812F3A;
        Mon, 20 Mar 2023 10:16:50 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DDE0B6C;
        Mon, 20 Mar 2023 18:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679332553;
        bh=EtloMJtVOSZ7X0F3GelvhtXn9Uc+JmrNunKBY6hpZrY=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
        b=jjvlCa00TY1Seag3XuFDhTgasxGbNJFQ05XrzpZriMCmkDv3MElrGTL9TGCrK44ef
         i2DC+LCaGXRrEZo3Y2UMYCLVYPpN9khkr4uHiJjkG7IsS8vtd9iKTESfMznuGszjSy
         urglxA3Yp6RRkon27rRu0pria9OW7+IrqoA+eZmg=
Message-ID: <96794a9a-889b-0ddd-0da6-6622ba27ff64@ideasonboard.com>
Date:   Mon, 20 Mar 2023 19:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 1/8] i2c: add I2C Address Translator (ATR) support
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
 <204f124a-1030-99bd-9c84-25ed067991b6@ideasonboard.com>
 <ZBiRNpvITuOT03rE@ninjato>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZBiRNpvITuOT03rE@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 20/03/2023 19:00, Wolfram Sang wrote:
> Hi Tomi,
> 
>> Wolfram, do you have any comments on this?
> 
> Not yet. I need to dive into the previous discussions again to
> understand what we agreed on and what potential problems we had to face.
> However, holiday season is near, it could be that I won't have really
> time for this until Mid-April or so. I'll try earlier but no promises :/
> 
>> Things have been calming down, I think, and I'd like to merge the series
>> soon if nothing major comes up. The easiest way would be to merge the whole
>> series via linux-media, as most of the patches are for media. If this looks
>> good, can you ack it and I'll send a pull request to linux-media
>> maintainers?
> 
> I'd think this is a too elemental (is this a word?) change for someone
> else to pull it. But no worries, I would offer an immutable branch right
> when I am done with reviewing so other subsystems can pull it. Or are
> there other technical reasons I missed?

An immutable branch is fine too.

  Tomi

