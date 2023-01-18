Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDC36724DA
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 18:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjARR23 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 12:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjARR22 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 12:28:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FB636FDD;
        Wed, 18 Jan 2023 09:28:28 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A64031056;
        Wed, 18 Jan 2023 18:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674062904;
        bh=Nf5ZWT8c4jEQ+3HgXGzjRAYkLQMxtH5vS18YV+gTWAw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QJS8g57Pei163/e1x8G8Z2tKqfzCZrarP8akW055bjbRBmPJCBMOk4Lk9gwM07jN4
         FyGVWn+hWisgPxK2mW1Zo7ijmZSaQ+LSlCm6TthMZOSW68k253baNmKaoPUW6vLjSL
         4z14eXLtHdpafggHWB2tM6YbYNNTgMyxDIn08rBk=
Message-ID: <bd6d6cc0-4e70-fa31-4b5e-e6bcddf62d36@ideasonboard.com>
Date:   Wed, 18 Jan 2023 19:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 0/7] i2c-atr and FPDLink
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
        Marek Vasut <marex@denx.de>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <Y8gX0krXayfOa4Hi@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y8gX0krXayfOa4Hi@smile.fi.intel.com>
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

On 18/01/2023 18:01, Andy Shevchenko wrote:
> On Wed, Jan 18, 2023 at 02:40:24PM +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> You can find the v6 from:
>>
>> https://lore.kernel.org/all/20230105140307.272052-1-tomi.valkeinen@ideasonboard.com/
>>
>> Main changes:
>>
>> * i2c-atr: Use bus notifier. This allows us to drop the patch that adds
>>    the attach_client/detach_client callbacks. On the downside, it removes
>>    the option for error handling if the translation setup fails, and also
>>    doesn't provide us the pointer to the i2c_board_info. I belive both
>>    are acceptable downsides.
>>
>> * Use fwnode in the fpdlink drivers instead of OF
>>
>> * Addressed all the review comments (I hope)
>>
>> * Lots of cosmetic or minor fixes which I came up while doing the fwnode
>>    change
> 
> I believe my comments to the first driver applies to the next two, so please
> address them whenever you are agree / it's possible / it makes sense.
> 
> About ATR implementation. We have the i2c bus (Linux representation of
> the driver model) and i2c_adapter and i2c_client objects there. Can't we
> have an i2c_client_aliased in similar way and be transparent with users?

Can you clarify what you mean here?

The i2c_clients are not aware of the i2c-atr. They are normal i2c 
clients. The FPD-Link drivers are aware of the ATR, as the FPD-Link 
hardware contains the ATR support.

  Tomi

