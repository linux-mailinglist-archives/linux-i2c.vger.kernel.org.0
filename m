Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E6A661446
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jan 2023 10:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbjAHJZK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 Jan 2023 04:25:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjAHJZJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 Jan 2023 04:25:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFF4101CB;
        Sun,  8 Jan 2023 01:25:06 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88EB36CF;
        Sun,  8 Jan 2023 10:25:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673169903;
        bh=sJs7Ppbi3G3hierAzEkA9g+MrKJHmMhM9EkUX5dPlbo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=COiQYSvTDJ4eI66dEg8pn830E3GipuNZ9pv5wWRYbwyFD6o59MmCRcAeT/a51d951
         ZeEzxCPdLVEmnto3g3C+0boWZ1uFQrlrjlq7Ij3km5HZOCRklTBEe+ii0ARPAhI5+x
         mnFpgElC0+Uab2/r/m3spRX/L+X316krgOCFRyAc=
Message-ID: <90bc0464-fa49-bd57-5460-d7d2a4bb6b65@ideasonboard.com>
Date:   Sun, 8 Jan 2023 11:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 1/8] i2c: core: let adapters be notified of client
 attach/detach
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-2-tomi.valkeinen@ideasonboard.com>
 <Y7o0zn9WdsLr15r9@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y7o0zn9WdsLr15r9@pendragon.ideasonboard.com>
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

On 08/01/2023 05:13, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Jan 05, 2023 at 04:03:00PM +0200, Tomi Valkeinen wrote:
>> From: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> An adapter might need to know when a new device is about to be
>> added. This will soon bee needed to implement an "I2C address
>> translator" (ATR for short), a device that propagates I2C transactions
>> with a different slave address (an "alias" address). An ATR driver
>> needs to know when a slave is being added to find a suitable alias and
>> program the device translation map.
>>
>> Add an attach/detach callback pair to allow adapter drivers to be
>> notified of clients being added and removed.
> 
> I've asked in the review of v6 if we could instead use the
> BUS_NOTIFY_ADD_DEVICE and BUS_NOTIFY_DEL_DEVICE bus notifiers. There's
> been a follow up discussion with Andy, but no reply from you AFAICS.
> Have you given this a try ? It's not a mandatory requirement, but if it
> can't be done (or shouldn't be done), I'd like to know why.

Sorry, I meant to mention this in the cover letter, but forgot:

I haven't looked at the bus notifiers yet, but will have a look. I 
wanted to send a new revision due to the large amount of changes already 
done.

  Tomi

