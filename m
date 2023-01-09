Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62556627FE
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 15:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237167AbjAIODU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 09:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237153AbjAIODA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 09:03:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5472A2;
        Mon,  9 Jan 2023 06:01:50 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0506A6CF;
        Mon,  9 Jan 2023 15:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673272908;
        bh=Da0e2+6JV7BXvqC1k2nu/Yn2oEiFT2mbWd4tL+IOTEw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LCNS06L8T7yYRtE1Y1OVET6PaoWohWAXgmbeqypT9Z9LuyRxD6lRg56cg9wcxV13X
         GglIR0BAkn44+16ATtppVwjws1nelI6APtc5abvLUAElej/D8K355juJgOfWL1g+TI
         o+HGT2tiwy6/7rzVusUh+bEERjehQHyAfGb7TnZw=
Message-ID: <10d369c1-4aaf-f59d-dbdc-48f04424a030@ideasonboard.com>
Date:   Mon, 9 Jan 2023 16:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 7/8] media: i2c: add DS90UB913 driver
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
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
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-8-tomi.valkeinen@ideasonboard.com>
 <Y7pBSq49dL8Fzxsc@pendragon.ideasonboard.com>
 <Y7v1Wrma/Ev8KEzy@smile.fi.intel.com>
 <5173a16a-83c5-5cfe-f6ce-03e1c90e8790@ideasonboard.com>
 <Y7wc2lX8eGPITx30@smile.fi.intel.com> <Y7wdePnmFx1XDGvB@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y7wdePnmFx1XDGvB@smile.fi.intel.com>
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

On 09/01/2023 15:58, Andy Shevchenko wrote:
> On Mon, Jan 09, 2023 at 03:55:39PM +0200, Andy Shevchenko wrote:
>> On Mon, Jan 09, 2023 at 02:59:01PM +0200, Tomi Valkeinen wrote:
>>> On 09/01/2023 13:07, Andy Shevchenko wrote:
>>>> On Sun, Jan 08, 2023 at 06:06:34AM +0200, Laurent Pinchart wrote:
>>>>> On Thu, Jan 05, 2023 at 04:03:06PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
>>>>>> +	gc->of_node = priv->client->dev.of_node;
>>>>
>>>> We don't have of_node anymore in gc. And if the parent device is set, you can
>>>> drop this line (it will work with older and newer kernels. Otherwise, use
>>>> fwnode.
>>>
>>> What do you mean "we don't have of_node anymore"?
> 
> Just to add that you missed "gc" in the quote which is crucial to get
> what I meant.

Well, the original text was just above...

>> There is no of_node member of struct gpio_chip anymore. This will fail
>> to compile.

It's in Linus' tree, but yes, now that I fetched linux-next I see it's gone.

  Tomi

