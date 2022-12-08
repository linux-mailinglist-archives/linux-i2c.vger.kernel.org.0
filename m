Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF076473DF
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 17:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbiLHQFd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 11:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiLHQFb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 11:05:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98CA59D2E6;
        Thu,  8 Dec 2022 08:05:30 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60C4E25B;
        Thu,  8 Dec 2022 17:05:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670515528;
        bh=QWLlEdgzVfuNXMkoGAKaN0y9Ur+bmlx22FQ8K/0EgQM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RRWNwDoShHDB0lrSWIswvEn4+bCch6wO0vXQEmSKxoj03bCftQir6L9FDAWXE06Ud
         B7wldYXo+QRNOECs1dLvRQDRXPK4DIKFSiKX1VajC4plCsu+RVXnF6uh7gx8KcUDxv
         ccEDfN3Ba4kex/Ylvb0lZ9Hr/wY11sJ6QWbmbZEY=
Message-ID: <d95b9cfc-159a-895e-808d-0c93469936fd@ideasonboard.com>
Date:   Thu, 8 Dec 2022 18:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 0/8] i2c-atr and FPDLink
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <c5eac6a6-f44b-ddd0-d27b-ccbe01498ae9@ideasonboard.com>
 <Y5HYBzZlkTrsdjfX@smile.fi.intel.com>
 <0340d15c-be0a-cd28-4149-7976896f8eb1@ideasonboard.com>
 <Y5IJY2nUkt/6BoKm@smile.fi.intel.com> <Y5IJlpWlngrvZemy@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y5IJlpWlngrvZemy@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/12/2022 17:58, Andy Shevchenko wrote:
> On Thu, Dec 08, 2022 at 05:57:23PM +0200, Andy Shevchenko wrote:
>> On Thu, Dec 08, 2022 at 04:40:58PM +0200, Tomi Valkeinen wrote:
>>> On 08/12/2022 14:26, Andy Shevchenko wrote:
>>>> On Thu, Dec 08, 2022 at 12:42:13PM +0200, Tomi Valkeinen wrote:
>>>>> On 08/12/2022 12:39, Tomi Valkeinen wrote:
> 
> ...
> 
>>>>>    /**
>>>>> - * Helper to add I2C ATR features to a device driver.
>>>>> + * struct i2c_atr - Represents the I2C ATR instance
>>>>>     */
>>>>
>>>> This is incomplete. Have you run kernel doc validator against this file?
>>>
>>> What's kernel doc validator? Do you mean that it's incomplete and kernel doc
>>> doesn't work correctly, or that there should be more information here?
>>>
>>> I don't get any errors/warnings from any tool I have used. But I agree it
>>> looks a bit odd with only the name of the struct in the doc.
>>
>> ...
>>
>> $ scripts/kernel-doc -none -v include/linux/i2c.h
>> include/linux/i2c.h:79: warning: No description found for return value of 'i2c_master_recv'
>> include/linux/i2c.h:94: warning: No description found for return value of 'i2c_master_recv_dmasafe'
>> include/linux/i2c.h:109: warning: No description found for return value of 'i2c_master_send'
>> include/linux/i2c.h:124: warning: No description found for return value of 'i2c_master_send_dmasafe'
>> 4 warnings
> 
> Note, this is just example against existing file, not your case.

Yes, I tested with scripts/kernel-doc, it doesn't give any warnings 
about i2c-atr.h.

  Tomi

