Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 540036738D4
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 13:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjASMmR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 07:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjASMlt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 07:41:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEBA7ED50;
        Thu, 19 Jan 2023 04:39:15 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BB09501;
        Thu, 19 Jan 2023 13:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674131953;
        bh=2lco+Qsukw0ceEpuYI7PTg9Sfe2fOQKgi2R/lhYHdgw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=P91nYFU9Cm5iINXxvJ1Rk14xRc4nHhpTxabESN4Fn4EgJFfBSbilUCd/8vmW//InW
         pyN7RDmaPeP5qxirGYqkXaIpcglmdsZ2uhiJfO3EQ5jNhdS0vID45qgtOVMKbSHN1D
         JI0iOJLOcPkXcuJl43PIPe1oxwxblJpyLen7Pep4=
Message-ID: <ddbf82d0-155f-9189-44df-1f796c028b53@ideasonboard.com>
Date:   Thu, 19 Jan 2023 14:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
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
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
 <Y8gA+cz9m7PaEhfP@smile.fi.intel.com> <20230118181753.7a325953@booty>
 <Y8gu4mlXUlyiFKZD@smile.fi.intel.com> <20230119092115.02cbbab3@booty>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230119092115.02cbbab3@booty>
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

On 19/01/2023 10:21, Luca Ceresoli wrote:
> Hi Andy,
> 
> On Wed, 18 Jan 2023 19:39:46 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
>> On Wed, Jan 18, 2023 at 06:17:53PM +0100, Luca Ceresoli wrote:
>>> On Wed, 18 Jan 2023 16:23:53 +0200
>>> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>>
>> ...
>>
>>>>> +A typical example follows.
>>>>> +
>>>>> +Topology::
>>>>> +
>>>>> +                      Slave X @ 0x10
>>>>> +              .-----.   |
>>>>> +  .-----.     |     |---+---- B
>>>>> +  | CPU |--A--| ATR |
>>>>> +  `-----'     |     |---+---- C
>>>>> +              `-----'   |
>>>>> +                      Slave Y @ 0x10
>>>>> +
>>>>> +Alias table:
>>>>> +
>>>>> +.. table::
>>>>> +
>>>>> +   ======   =====
>>>>> +   Client   Alias
>>>>> +   ======   =====
>>>>> +   X        0x20
>>>>> +   Y        0x30
>>>>> +   ======   =====
>>>>> +
>>>>> +Transaction:
>>>>> +
>>>>> + - Slave X driver sends a transaction (on adapter B), slave address 0x10
>>>>> + - ATR driver rewrites messages with address 0x20, forwards to adapter A
>>>>> + - Physical I2C transaction on bus A, slave address 0x20
>>>>> + - ATR chip propagates transaction on bus B with address translated to 0x10
>>>>> + - Slave X chip replies on bus B
>>>>> + - ATR chip forwards reply on bus A
>>>>> + - ATR driver rewrites messages with address 0x10
>>>>> + - Slave X driver gets back the msgs[], with reply and address 0x10
>>>>
>>>> I'm not sure I got the real / virtual status of the adapters. Are the B and C
>>>> virtual ones, while A is the real?
>>>
>>> Let me reply, as I wrote these docs back at the times and thus I feel
>>> guilty in case that's unclear. :)
>>>
>>> I don't like the word "virtual" in this situation. A, B and C are all
>>> physical busses, made of copper and run by electrons on PCBs. B and C
>>> are the "remote" or "downstream" busses (w.r.t. the CPU), where the i2c
>>> devices are and where transactions happen using the address that the
>>> chip responds to. A is the "local" or "upstream" bus that is driven
>>> directly by the CPU (*) and where address aliases are used. Using
>>> aliases there is necessary because using address 0x10 would be
>>> ambiguous as there are two 0x10 chips out there.
>>>
>>> (*) There could be more layers of course, but still A is "closer to the
>>> CPU than B and C", for the sake of completeness.
>>
>> Can the diagram and/or text be updated to elaborate this?
> 
> Let's see whether the text below is better. I haven't changed the
> image, I don't think we can do much more in ASCII, but maybe we can
> replace it with an SVG [0]?
> 
> [0]
> https://github.com/lucaceresoli/docs/blob/master/video-serdes-linux/images/i2c-ti.svg
> 
> A typical example follows.
> 
> Topology::
> 
>                        Slave X @ 0x10
>                .-----.   |
>    .-----.     |     |---+---- B
>    | CPU |--A--| ATR |
>    `-----'     |     |---+---- C
>                `-----'   |
>                        Slave Y @ 0x10

Slightly beside the point of this discussion, but one thing (I think) I 
tried to highlight in some older cover letter was that we don't really 
have the above structure. We have something like this (a quick edit, sorry):

                             .------.  Slave X @ 0x10
                 .------.    | FPDS |   |
     .-----.     | FPDD |-F1-`------'---+---- B
     | CPU |--A--| ATR  |
     `-----'     |      |-F2-.------.---+---- C
                 `------'    | FPDS |   |
                             `------'  Slave Y @ 0x10

Where FPDD = Deserializer, FPDS = Serializer, F1/F2 = FPD-Link bus 1/2.

So the ATR functionality is in the deserializer, but the actual remote 
i2c bus is on the serializer.

The current code manages this so that the deserializer driver owns the 
ATR and programs the HW (as the ATR is part of the deserializer), but 
it's the serializer driver that adds the remote adapter to the ATR 
(using i2c_atr pointer given by the deserializer driver).

  Tomi

