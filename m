Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECDC662963
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 16:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbjAIPJG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 10:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237054AbjAIPIq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 10:08:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AC05F6C;
        Mon,  9 Jan 2023 07:08:44 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C0BE492;
        Mon,  9 Jan 2023 16:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673276921;
        bh=iOyxNvAb3VTxzY3eb/T4+G7PIFe/mbxptL+v1M3Hf9U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZAOb2W1gUzOWPr5usaYlXAbCSwm7jWSwMSmwlYI16ogJw+6YGqlz+HArwCdQo7dtB
         0w6s0SxmhNDPaRgn8+FX+cVFhH0eW3hIPBf1xo2/v1g6ItgJq7A9+8EA40ptIDJboH
         R0VLlAxDExSIQhdQSWbI1ee5cwPMhq5PiEW5YCLQ=
Message-ID: <10d25fee-999e-2930-f0fe-b1680d12cbd1@ideasonboard.com>
Date:   Mon, 9 Jan 2023 17:08:37 +0200
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
 <10d369c1-4aaf-f59d-dbdc-48f04424a030@ideasonboard.com>
 <Y7wgoXhWN7Ro3d/0@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y7wgoXhWN7Ro3d/0@smile.fi.intel.com>
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

On 09/01/2023 16:11, Andy Shevchenko wrote:
> On Mon, Jan 09, 2023 at 04:01:43PM +0200, Tomi Valkeinen wrote:
>> On 09/01/2023 15:58, Andy Shevchenko wrote:
>>> On Mon, Jan 09, 2023 at 03:55:39PM +0200, Andy Shevchenko wrote:
>>>> On Mon, Jan 09, 2023 at 02:59:01PM +0200, Tomi Valkeinen wrote:
>>>>> On 09/01/2023 13:07, Andy Shevchenko wrote:
>>>>>> On Sun, Jan 08, 2023 at 06:06:34AM +0200, Laurent Pinchart wrote:
>>>>>>> On Thu, Jan 05, 2023 at 04:03:06PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
>>>>>>>> +	gc->of_node = priv->client->dev.of_node;
>>>>>>
>>>>>> We don't have of_node anymore in gc. And if the parent device is set, you can
>>>>>> drop this line (it will work with older and newer kernels. Otherwise, use
>>>>>> fwnode.
>>>>>
>>>>> What do you mean "we don't have of_node anymore"?
>>>
>>> Just to add that you missed "gc" in the quote which is crucial to get
>>> what I meant.
>>
>> Well, the original text was just above...
> 
> Yes, but my point is that that part is crucial and since you left it out makes
> me think that you are talking about general of_node, which is of course won't
> gone any time soon :-)
> 
>>>> There is no of_node member of struct gpio_chip anymore. This will fail
>>>> to compile.
>>
>> It's in Linus' tree, but yes, now that I fetched linux-next I see it's gone.
> 
> Right. I expressed to Bart to include that change into one of the rcX, but he
> decided to go for next. Dunno how many cases like yours we may experience in
> this cycle.

Alright. Well, good that you caught this already. In the worst case we 
would have had a compilation break in the next merge window.

  Tomi

