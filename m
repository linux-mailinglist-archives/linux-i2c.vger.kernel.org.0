Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFC965D536
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jan 2023 15:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239515AbjADON2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Jan 2023 09:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239698AbjADONY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Jan 2023 09:13:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FB639B;
        Wed,  4 Jan 2023 06:13:22 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C47926F0;
        Wed,  4 Jan 2023 15:13:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672841600;
        bh=O9jLiS+NekK0ccBdWVz+/nUK2tFJYyYF1AsBtNyXgDE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=a6p6egW73JcVl/lTmZktBm4XTYCs+mKP+y5XnxQxUIHatPAWQSCLtzbjx12c9Cbgi
         n1flf/ISkrWd1itQ2fThIGo1xzEZs/sDfcmKplFbedyeWC275DnJT6ltiYOcsckVCe
         4z3UVmQOteLNUgaiNzIYA+yWFUIR6+L15Jybkfco=
Message-ID: <dddcfe51-5dec-2826-61c3-12edaf04da4e@ideasonboard.com>
Date:   Wed, 4 Jan 2023 16:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 7/8] media: i2c: add DS90UB913 driver
Content-Language: en-US
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
        Marek Vasut <marex@denx.de>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-8-tomi.valkeinen@ideasonboard.com>
 <Y5YiazDtaxtLJyL0@pendragon.ideasonboard.com>
 <4d349785-ca37-d930-db3c-2581bba9fde0@ideasonboard.com>
 <7ddd576f-6e8a-7581-178c-2e8575227811@ideasonboard.com>
 <Y6nSVlmlweUuUwJf@pendragon.ideasonboard.com>
 <61729020-0977-521a-6137-3bd89f300652@ideasonboard.com>
 <Y7WFaR5+NNSXLLow@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y7WFaR5+NNSXLLow@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04/01/2023 15:55, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Dec 26, 2022 at 09:25:34PM +0200, Tomi Valkeinen wrote:
>> On 26/12/2022 18:56, Laurent Pinchart wrote:
>>> On Wed, Dec 14, 2022 at 08:36:47AM +0200, Tomi Valkeinen wrote:
>>>> On 14/12/2022 08:29, Tomi Valkeinen wrote:
>>>>
>>>>>> wondering if the struct device of the DS90UB913 could be passed instead
>>>>>> of the port, to avoid passing the port throught
>>>>>> ds90ub9xx_platform_data.
>>>>>
>>>>> Interesting thought. That would limit the number of remote i2c busses to
>>>>> one, though. Not a problem for FPD-Link, but I wonder if that's assuming
>>>>> too much for the future users. Then again, this is an in-kernel API so
>>>>> we could extend it later if needed. So I'll try this out and see if I
>>>>> hit any issues.
>>>>
>>>> Right, so the issue with this one would be that it would prevent a
>>>> single device uses. E.g. a single chip which acts as an ATR (similar to
>>>> i2c-mux chips), i.e. it contains both the main and the remote i2c busses.
>>>
>>> I don't think I understand this, sorry.
>>
>> What you are suggesting above means that we'd have a separate device for
>> each port of the ATR. Which is fine in our current case, as the i2c
>> master busses are behind separate remote devices.
>>
>> But if you consider a case similar to i2c-mux, where we have a single
>> chip with the slave bus and, say, 4 master busses. We would probably
>> have only a single device for that.
> 
> Hmmm... Yes you're right, it won't work in that case. Maybe we could
> have two functions, the existing i2c_atr_add_adapter(), and another one
> that wraps it ? It would be nice if we could get rid of the platform
> data for the UB913 and UB953 drivers.

I wouldn't mind that at all, but we already have the bc_rate there. And 
I have a feeling that we might need more if we implement more features.

And we also have the atr pointer there. Or do you think that could be 
dropped also? In your mail above you only mention the port, but maybe 
the deser could register the serializer device and port to the ATR, and 
then the ser could just use its device pointer instead of atr & port.

  Tomi

