Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F707354D3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 12:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbjFSK7Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 06:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbjFSK64 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 06:58:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECCB10F2;
        Mon, 19 Jun 2023 03:57:35 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59952DDA;
        Mon, 19 Jun 2023 12:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687172219;
        bh=cD5pqKTY5/ObcvKp271EhUpO47bHD0WwDTzCRMlW9Ng=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TdV0Ju26ZNebUaHN5/9bM4MNZNuAMA3ToCFYvHf9NrkG65IIPBcgXh9lkLmotE20l
         wybYH2rdiekkF1OKSbv821V3chou6EkYMRAydKIGa7eGdC6u5xr3IYDDfyJkolJ2/u
         enRIPVPhukWDi0ZRB+3DkwvJoBFvgN5K6WbpnQFs=
Message-ID: <3dda6808-cda2-e587-88a7-00621b2cfca3@ideasonboard.com>
Date:   Mon, 19 Jun 2023 13:57:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 18/18] media: i2c: ds90ub953: Support non-sync mode
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
 <20230616135922.442979-19-tomi.valkeinen@ideasonboard.com>
 <ZIx17WC7plfDPpmc@smile.fi.intel.com>
 <dc79de4e-4043-5448-db44-ef8f7749a376@ideasonboard.com>
 <ZJAyb9WHjWrdSsBw@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZJAyb9WHjWrdSsBw@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19/06/2023 13:48, Andy Shevchenko wrote:
> On Mon, Jun 19, 2023 at 12:00:57PM +0300, Tomi Valkeinen wrote:
>> On 16/06/2023 17:47, Andy Shevchenko wrote:
>>> On Fri, Jun 16, 2023 at 04:59:22PM +0300, Tomi Valkeinen wrote:
>>>> Add support for FPD-Link non-sync mode with external clock. The only
>>>> thing that needs to be added is the calculation for the clkout.
> 
> ...
> 
>>>> +	switch (priv->mode) {
>>>> +	case UB953_MODE_SYNC:
>>>> +		if (priv->hw_data->is_ub971)
>>>> +			return priv->plat_data->bc_rate * 160ull;
>>>> +		else
>>>> +			return priv->plat_data->bc_rate / 2 * 160ull;
>>>
>>> Redundant 'else'.
>>
>> True, but I like the symmetry in:
>>
>> if (foo)
>> 	return 123;
>> else
>> 	return 321;
> 
> At the same time it will be symmetry with other switch-case(s). That's why the
> question about fallthrough below.
> 
>>> Do I understand correctly you don't want to fallthrough because it will give
>>> ±160 in the rate (depending if it's even or odd)?
>>
>> Sorry, can you clarify? Fallthrough to what?
> 
> To the below case since '/ 2 * 160 ~= *80'. Why ~ because it might give
> off-by-one error due to even/odd input.

The below case is different. "priv->plat_data->bc_rate" vs 
"clk_get_rate(priv->clkin)".

As to the order of the calculation (/ 2 * 160 versus * 160 / 2), 
generally speaking, I have never figured out what are the correct ways 
to calculate clock rates.

I wrote "x / 2 * 160" as that's what the documentation gives (there's a 
hardware /2 divider in non-ub971 chips, followed by a 160 multiplier). 
But does the documentation presume that the calculation is done 
precisely, not in integers? If so, "x * 160 / 2" would be better (but 
then, do we need to round?). Or does the /2 hardware divider basically 
actually work as a an integer division, in case "x / 2 * 160" is the 
correct one.

>>>> +	case UB953_MODE_NONSYNC_EXT:
>>>> +		/* CLKIN_DIV = 1 always */
>>>> +		return clk_get_rate(priv->clkin) * 80ull;
> 

  Tomi

