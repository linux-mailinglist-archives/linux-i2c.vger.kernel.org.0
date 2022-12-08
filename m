Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D20A6471FF
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 15:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiLHOlI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 09:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiLHOlH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 09:41:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76D54299F;
        Thu,  8 Dec 2022 06:41:04 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2861B25B;
        Thu,  8 Dec 2022 15:41:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670510462;
        bh=7JK1mcWK7ctuZSJVmKN+aaMKQHCYvzcv6b0fzVlOa7Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SOVBFZ+wXPdn7+spHkeH8ZjDrQuWrS5pt1BYvt9XDf23vR2xJQAueCdTSSLw+dTGn
         BngW/zXk3AU/gsukA0kDYr4P5l9NPojFmc0Dex+HG0b9r7bojvsndmes0tyXolB7Q2
         GRu2R8TPjEWovcG5OOOEw4JQPXyZSxLk1SsUJK24=
Message-ID: <0340d15c-be0a-cd28-4149-7976896f8eb1@ideasonboard.com>
Date:   Thu, 8 Dec 2022 16:40:58 +0200
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y5HYBzZlkTrsdjfX@smile.fi.intel.com>
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

Hi Andy,

On 08/12/2022 14:26, Andy Shevchenko wrote:
> On Thu, Dec 08, 2022 at 12:42:13PM +0200, Tomi Valkeinen wrote:
>> On 08/12/2022 12:39, Tomi Valkeinen wrote:
> 
> ...
> 
>> +#include <linux/fwnode.h>
>>   #include <linux/i2c-atr.h>
>>   #include <linux/i2c.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>> -#include <linux/of.h>
>>   #include <linux/slab.h>
> 
> + Blank line here?
> 

There is a blank line there.

>> +#define ATR_MAX_ADAPTERS 99	/* Just a sanity limit */
>> +#define ATR_MAX_SYMLINK_LEN 16	/* Longest name is 10 chars: "channel-99" */
> 
> ...
> 
>> +		u16 *new_buf;
>> +
>> +		new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]),
>> +					GFP_KERNEL);
> 
> 		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
> 
> ?

Yes, I think that looks better here.

>> +		if (!new_buf)
>>   			return -ENOMEM;
> 
> ...
> 
>>   	struct i2c_atr_cli2alias_pair *c2a;
>> -	u16 alias_id = 0;
>> -	int ret = 0;
>> +	u16 alias_id;
>> +	int ret;
> 
> Is it mangled or it's missing blank line here?

Also here there is a blank line. Is the mail somehow mangled on your 
side? On lore it looks fine:

https://lore.kernel.org/all/c5eac6a6-f44b-ddd0-d27b-ccbe01498ae9@ideasonboard.com/

>>   	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
>>   	if (!c2a)
> 
> ...
> 
>>   struct device;
>>   struct i2c_atr;
>> +struct fwnode_handle;
> 
> Order?

Yep, I'll fix.

> ...
> 
>>   /**
>> - * Helper to add I2C ATR features to a device driver.
>> + * struct i2c_atr - Represents the I2C ATR instance
>>    */
> 
> This is incomplete. Have you run kernel doc validator against this file?

What's kernel doc validator? Do you mean that it's incomplete and kernel 
doc doesn't work correctly, or that there should be more information here?

I don't get any errors/warnings from any tool I have used. But I agree 
it looks a bit odd with only the name of the struct in the doc.

  Tomi

