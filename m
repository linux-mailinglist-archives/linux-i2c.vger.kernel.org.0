Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21476A03AF
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 09:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbjBWITz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 03:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbjBWITu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 03:19:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3E82332E;
        Thu, 23 Feb 2023 00:19:49 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 700BE4DE;
        Thu, 23 Feb 2023 09:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677140387;
        bh=5EOibZQ0HJbQ6x9yMUFp5YDt5+g4o8fKiW3Z+uQtCuU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GQuSYsy0zR5uyNYtB1IbKCcE9We8ROM9oesyGuEA2ogLVQ+9Cn5jZqsgXWUjo2vsO
         KtT0EskdmSzw6/N5956nT1omZnnAA0+YAv61+yE9TJBNYatcUIxHetllKMAh7fWOEz
         Pe8abxdHxgnThV5kw5jl2cvSJNaCQ0vpRalMzglU=
Message-ID: <e7ab123a-5899-8eba-8255-b0e18bf8944f@ideasonboard.com>
Date:   Thu, 23 Feb 2023 10:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 0/8] i2c-atr and FPDLink
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <Y/YjlW2byyHKamxl@smile.fi.intel.com> <Y/Yj8OnYHLyiinMi@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y/Yj8OnYHLyiinMi@smile.fi.intel.com>
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

On 22/02/2023 16:17, Andy Shevchenko wrote:
> On Wed, Feb 22, 2023 at 04:15:50PM +0200, Andy Shevchenko wrote:
>> On Wed, Feb 22, 2023 at 03:28:59PM +0200, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> You can find v9 from:
>>>
>>> https://lore.kernel.org/all/20230216140747.445477-1-tomi.valkeinen@ideasonboard.com/
>>>
>>> Diff to v9 included below.
>>>
>>> Main changes in v10:
>>> - Switch pre-increments to post-increments
>>> - Add macros for FPD3_RX_ID lengths
>>> - Use regmap_bulk_read in 16 bit reg accessors
>>
>> Thanks!
>> I have no more remarks, nice job!
>>
>> One thing below to just look at and if you want / have time / chance update.
> 
> ...
> 
>>> +	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);
>>
>> sizeof()
>>
>> ...
>>
>>> +	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);
>>
>> Ditto.
> 
> Here is a formal tag for patches 1, 2, 6, 7, and 8
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for the thorough reviews!

I'll do the changes above.

I also got kernel test bot mails about the "ID '%.*s'\n" printks (have 
to typecast the sizeof to int), which I also need to fix.

  Tomi

