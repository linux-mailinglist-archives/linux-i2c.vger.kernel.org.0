Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0887352BE
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 12:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbjFSKho (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 06:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbjFSKhi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 06:37:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F14102;
        Mon, 19 Jun 2023 03:37:37 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDD9BFB;
        Mon, 19 Jun 2023 12:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687171021;
        bh=j9D//YVQRuMR4JMg7qTsktMpiYHgQzslyET9vXnkYSM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wkRCdL384dHyrzyc5/AzEr1y4PG/e063YSnYU+MjC1opw04AURFAkbt/QT8cR9k6q
         NhmK2GmVrH0HG+KDKRUSgPg/qXK0rlAQXIlZGtWWpuOMCMA/DHNBPRLQ7368ZgmSEB
         QF+KWfY5QTRlgZvqdaPDvjG8TM75ZqiMQh7BMVF0=
Message-ID: <e0df1839-5c00-7d4a-8322-527bd93420bb@ideasonboard.com>
Date:   Mon, 19 Jun 2023 13:37:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 15/18] media: i2c: ds90ub953: Handle
 V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-16-tomi.valkeinen@ideasonboard.com>
 <ZIxyqTdEsS40emBV@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZIxyqTdEsS40emBV@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/06/2023 17:33, Andy Shevchenko wrote:
> On Fri, Jun 16, 2023 at 04:59:19PM +0300, Tomi Valkeinen wrote:
>> Handle V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag to configure the CSI-2 RX
>> continuous/non-continuous clock register.
> 
> ...
> 
>>   	struct regmap		*regmap;
> 
> I forgot if we discussed this along with i2c_client *client nearby. Since I
> reviewed Hans' patches the pure struct device *dev (instead of *client) might
> make more sense, despite being duplicative with regmap associated device.
> 
>>   	u32			num_data_lanes;
>> +	bool			non_cont_clk;
>>   
>>   	struct gpio_chip	gpio_chip;
> 
> And also try to place this as a first member and see (by using bloat-o-meter,
> for example) if it saves bytes.
> 
> I'm wondering if we have tools like pahole but which suggests the better layout
> based on the code generation... Maybe something along with clang?

Isn't all this a bit on the side of pointless micro-optimizations? We're 
talking about possibly saving a few tens of bytes in a struct that's 
likely allocated a few times, by possibly messing up the (cosmetic) 
grouping and ordering of the fields in the struct?

If there's a common rule-of-thumb wrt. struct members that everyone 
should follow, I'm good with that and can change this accordingly. But 
just trying to hunt for a field order that happens to save a few bytes 
here... It doesn't sound like time well spent.

If things were perfect, this would be something the compiler would 
optimize, presuming the field ordering in the struct doesn't matter.

  Tomi

