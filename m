Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2EC735580
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 13:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjFSLLS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 07:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjFSLLR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 07:11:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3C194;
        Mon, 19 Jun 2023 04:11:16 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79FFE800;
        Mon, 19 Jun 2023 13:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687173041;
        bh=S3080ikOHVO3RJ+poYgiAYtDk6nSoVVq+AIJFWN2Qo4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=bo2W5gjH8eZntFU5WNGlxMgDP8Mcv5o75RzI/81zJpiTs1Fl5MBj8dZPN+sIbu2v9
         wOBRUiluoyXbmlNBUOVT4qexGVXnMCBv6ok6iao1fQVaEyN/yVTM5zZUkHDdSUtXuN
         zlc+/bgK3KMTt6Sq0c73mGqK2bIaeiycNP/gDa0k=
Message-ID: <3e915435-b4d0-e792-6bdc-02bbf8f08362@ideasonboard.com>
Date:   Mon, 19 Jun 2023 14:11:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 17/18] media: i2c: ds90ub953: Restructure clkout
 management
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
 <20230616135922.442979-18-tomi.valkeinen@ideasonboard.com>
 <ZIxzsUbuUz3ysA31@smile.fi.intel.com>
 <002e0475-23dd-5106-6f5c-e4b50a0c506f@ideasonboard.com>
 <ZJAxqFuJ/Tj5dIT8@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZJAxqFuJ/Tj5dIT8@smile.fi.intel.com>
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

On 19/06/2023 13:44, Andy Shevchenko wrote:
> On Mon, Jun 19, 2023 at 01:14:34PM +0300, Tomi Valkeinen wrote:
>> On 16/06/2023 17:37, Andy Shevchenko wrote:
>>> On Fri, Jun 16, 2023 at 04:59:21PM +0300, Tomi Valkeinen wrote:
>>>> Separate clkout calculations and register writes into two functions:
>>>> ub953_calc_clkout_params and ub953_write_clkout_regs, and add a struct
>>>> ub953_clkout_data that is used to store the clkout parameters.
> 
> ...
> 
>>>> +struct ub953_clkout_data {
>>>> +	u32 hs_div;
>>>> +	u32 m;
>>>> +	u32 n;
>>>
>>> Please, use struxt u32_fract instead of m/n.
>>
>> I'm not sure how that helps. The documentation talks about m and n. Using
>> different terms will make it more difficult to compare the code and the
>> docs.
> 
> You can always add a comment.
> 
> (For example in drivers/clk/clk-fractional-divider.c our documentation also
>   says about m/n, but most of the people understands that this is about
>   fractional divider and actually with properly spelled parameters it will
>   help others who are not experts in the CLK hardware.)

Yes, I would agree with you if this was a generic piece of code, but I 
don't see the reasoning as valid as this is specific to a piece of 
hardware. Here, I think, matching the code to the HW documentation is 
more important than possibly making the code more understandable to 
people who are not familiar with the HW.

Especially as for non-English people seeing "numerator" and 
"denominator" might require a check to figure out which one is which, 
whereas m and n are (I would guess) a bit more universal (or maybe it's 
just me).

  Tomi

