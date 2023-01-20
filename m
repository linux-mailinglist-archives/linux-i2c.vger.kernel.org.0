Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4CE67596C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 17:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjATQBK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 11:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjATQBJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 11:01:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AE5457F2;
        Fri, 20 Jan 2023 08:01:04 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCC39514;
        Fri, 20 Jan 2023 17:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674230463;
        bh=dCrbUtIysS0XtsI7KvoCttFCbXL8nRcxzGx23S0+PbA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IRCKfrm9rY+7rQDZSOdmDMcXslFWoPjaU1FleNjwutSytLkMmzUOgW2i6EWVN/sUz
         Gs8FOlmrD/0CCl/NMCH4uQpFFrPky57j2QRo8cGu4bkIrD6c9XJpUJ44beZo/vXqzE
         fqx2lCOYm6KyA88MxCoYLOQGVfIw3e3G11NVMazo=
Message-ID: <430b7f94-fb54-c4dc-8b11-a1d5c27edee0@ideasonboard.com>
Date:   Fri, 20 Jan 2023 18:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
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
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
 <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
 <31562353-0794-8ad4-d609-3c117dd28d46@ideasonboard.com>
 <Y8q6JsDD7c0QCOq5@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y8q6JsDD7c0QCOq5@smile.fi.intel.com>
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

On 20/01/2023 17:58, Andy Shevchenko wrote:
> On Thu, Jan 19, 2023 at 12:01:33PM +0200, Tomi Valkeinen wrote:
>> On 18/01/2023 16:23, Andy Shevchenko wrote:
>>> On Wed, Jan 18, 2023 at 02:40:25PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
>>>> +	/* Ensure we have enough room to save the original addresses */
>>>> +	if (unlikely(chan->orig_addrs_size < num)) {
>>>> +		u16 *new_buf;
>>>> +
>>>> +		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
>>>
>>> I remember that I asked why we don't use krealloc_array() here... Perhaps
>>> that we don't need to copy the old mapping table? Can we put a short comment
>>> to clarify this in the code?
>>
>> Yes, we don't care about the old data, we just require the buffer to be
>> large enough.
>>
>> I'm not sure what kind of comment you want here. Isn't this a common idiom,
>> where you have a buffer for temporary data, but you might need to resize at
>> some point if you need a larger one?
> 
> Then why not krealloc_array()? That's the question I want to see the answer for
> in the comments:
> 
> 	/* We don't care about old data, hence no realloc() */

Ok, I'll add that.

  Tomi

