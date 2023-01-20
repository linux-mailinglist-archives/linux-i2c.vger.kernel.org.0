Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38D5D6759C7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 17:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjATQVT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 11:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjATQVQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 11:21:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB3956483;
        Fri, 20 Jan 2023 08:20:59 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 259BC514;
        Fri, 20 Jan 2023 17:20:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674231657;
        bh=TGw+9CqZ256cySJaKQjXSViSWw8UUagtG2DMuiJ6f30=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pbKHdaPQw04NikCqa0MGBl4kIGWAHGvr7G2B7Y3X3Y4P3lzbBFCsdt4j7v8BDRra9
         gd5yHuYhjjWZngkA5Fzz+9/4Kh9vyrR7FbNCTEzy02XnSxlab30cYuxwNlsK150csh
         sbIZ46aA0Vy/saKhqeRuYsDSPkShvVLufNJTYiIw=
Message-ID: <515a21fa-17f4-1f73-ed5c-adcc7f74ddb3@ideasonboard.com>
Date:   Fri, 20 Jan 2023 18:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 0/7] i2c-atr and FPDLink
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
        Marek Vasut <marex@denx.de>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <Y8gX0krXayfOa4Hi@smile.fi.intel.com>
 <bd6d6cc0-4e70-fa31-4b5e-e6bcddf62d36@ideasonboard.com>
 <Y8gvu/E5EoPqo8J1@smile.fi.intel.com> <20230119094358.010bc826@booty>
 <Y8q6ggmOsygyVdTT@smile.fi.intel.com> <20230120171718.3674af61@booty>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230120171718.3674af61@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/01/2023 18:17, Luca Ceresoli wrote:
> Hi Andy,
> 
> On Fri, 20 Jan 2023 18:00:02 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
>> On Thu, Jan 19, 2023 at 09:43:58AM +0100, Luca Ceresoli wrote:
>>> On Wed, 18 Jan 2023 19:43:23 +0200
>>> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>>>> On Wed, Jan 18, 2023 at 07:28:20PM +0200, Tomi Valkeinen wrote:
>>>>> On 18/01/2023 18:01, Andy Shevchenko wrote:
>>>>>> On Wed, Jan 18, 2023 at 02:40:24PM +0200, Tomi Valkeinen wrote:
>>
>> ...
>>
>>>>> Can you clarify what you mean here?
>>>>>
>>>>> The i2c_clients are not aware of the i2c-atr. They are normal i2c clients.
>>>>> The FPD-Link drivers are aware of the ATR, as the FPD-Link hardware contains
>>>>> the ATR support.
>>>>
>>>> Can't that hardware be represented as I2C adapter? In such case the ATR specifics
>>>> can be hidden from the client (drivers).
>>>>
>>>> I'm worrying about code duplication and other things that leak into drivers as
>>>> ATR callbacks.
>>>
>>> Which callbacks do you refer to? i2c_atr_ops? I don't think we can do
>>> without the attach/detach_client ones, it's where the driver-specific
>>> implementation is hooked for the generic ATR infra to call it.
>>>
>>> However now I noticed the select/deselect ops are still there. IIRC
>>> they are not used by any driver and in the past the plan was to just
>>> remove them. Tomi, do you think there is a good reason to keep them?
>>>    
>>>> It might be that I didn't get how hw exactly functioning on this
>>>> level and why we need those callbacks.
>>>
>>> As far as "how hw exactly works", in case you haven't seen that, the
>>> best explanation I was able to give is in my ELCE 2019 talk, at minute
>>> ~22. It's a 2-3 minute watch. The slides have pointers to other talks
>>> and discussion.
>>
>> Probably I have missed the URL in the discussion, care to resend?
> 
> I hadn't sent any URL :)
> 
> Here's the shortcut to go straight to the ATR description:
> https://youtu.be/7hLv6fYAW-E?t=1350
> 
> Slides:
> https://elinux.org/images/f/fc/Ceresoli-elce2019-video-serdes-linux.pdf

A small note: the current implementation doesn't match the slides, as 
the adapter is now (at least kind of) in the serializer (the "ideal 
solution" in the slides.

  Tomi

