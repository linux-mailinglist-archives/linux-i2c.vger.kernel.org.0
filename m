Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2267734EF3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 11:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjFSJBQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 05:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjFSJBN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 05:01:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B497FC;
        Mon, 19 Jun 2023 02:01:03 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BFC6547;
        Mon, 19 Jun 2023 11:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687165227;
        bh=++FuKg5OCQoRLQpRm46B0DJduC3B6dQ7Oavq6P5dx/Q=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FdjLvWrTnc+nxExh2hxZUMsyrZISKWnSAYl2N9/GmyWduhRGZNThmezGzBfF3pydT
         U1mmAoy7Fg/9OtPfRkiq/4a5CkK69W68iyMLUB67Hb6qEhfzFRR8Iw9+ry+bDsOYU8
         G5tQVhi5pOLhmMiVWdYiiE1XhYLtV84lSndDtaes=
Message-ID: <dc79de4e-4043-5448-db44-ef8f7749a376@ideasonboard.com>
Date:   Mon, 19 Jun 2023 12:00:57 +0300
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZIx17WC7plfDPpmc@smile.fi.intel.com>
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

On 16/06/2023 17:47, Andy Shevchenko wrote:
> On Fri, Jun 16, 2023 at 04:59:22PM +0300, Tomi Valkeinen wrote:
>> Add support for FPD-Link non-sync mode with external clock. The only
>> thing that needs to be added is the calculation for the clkout.
> 
> ...
> 
>> +	switch (priv->mode) {
>> +	case UB953_MODE_SYNC:
>> +		if (priv->hw_data->is_ub971)
>> +			return priv->plat_data->bc_rate * 160ull;
>> +		else
>> +			return priv->plat_data->bc_rate / 2 * 160ull;
> 
> Redundant 'else'.

True, but I like the symmetry in:

if (foo)
	return 123;
else
	return 321;

> Do I understand correctly you don't want to fallthrough because it will give
> ±160 in the rate (depending if it's even or odd)?

Sorry, can you clarify? Fallthrough to what?

>> +	case UB953_MODE_NONSYNC_EXT:
>> +		/* CLKIN_DIV = 1 always */
>> +		return clk_get_rate(priv->clkin) * 80ull;
>> +
>> +	default:
>>   		/* Not supported */
>>   		return 0;
>>   	}
> 

