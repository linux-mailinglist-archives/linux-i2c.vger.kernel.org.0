Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601A36738DC
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 13:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjASMmn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 07:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjASMmD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 07:42:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5201BD9;
        Thu, 19 Jan 2023 04:40:28 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61D62501;
        Thu, 19 Jan 2023 13:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674132027;
        bh=Vg32i32f2imBTib0j/Ko9lOysVEymh2p42KNPQVGxlY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JRg9/KUM1U1F3PVPcTBAXiI8ttY/K8BocOMSCy29d1IbjHO3oq94SBrojLh4S1ODW
         4FmhaxEmyhraOJzDFUc7ieRPMkL3KR3aO9hNvB1a/s/IDDaoV7InGgDyS5z81rsl0G
         Amh5XwYiTZ53aW5kgIFdG/ilTuT/Ew7KqE2X2XVs=
Message-ID: <024c8127-5109-3ea5-efa0-8c0a8763e8b3@ideasonboard.com>
Date:   Thu, 19 Jan 2023 14:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 0/7] i2c-atr and FPDLink
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
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
 <bd6d6cc0-4e70-fa31-4b5e-e6bcddf62d36@ideasonboard.com>
 <Y8gvu/E5EoPqo8J1@smile.fi.intel.com> <20230119094358.010bc826@booty>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230119094358.010bc826@booty>
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

On 19/01/2023 10:43, Luca Ceresoli wrote:
> Hi Andy,
> 
> On Wed, 18 Jan 2023 19:43:23 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
>> On Wed, Jan 18, 2023 at 07:28:20PM +0200, Tomi Valkeinen wrote:
>>> On 18/01/2023 18:01, Andy Shevchenko wrote:
>>>> On Wed, Jan 18, 2023 at 02:40:24PM +0200, Tomi Valkeinen wrote:
>>>>> Hi,
>>>>>
>>>>> You can find the v6 from:
>>>>>
>>>>> https://lore.kernel.org/all/20230105140307.272052-1-tomi.valkeinen@ideasonboard.com/
>>>>>
>>>>> Main changes:
>>>>>
>>>>> * i2c-atr: Use bus notifier. This allows us to drop the patch that adds
>>>>>     the attach_client/detach_client callbacks. On the downside, it removes
>>>>>     the option for error handling if the translation setup fails, and also
>>>>>     doesn't provide us the pointer to the i2c_board_info. I belive both
>>>>>     are acceptable downsides.
>>>>>
>>>>> * Use fwnode in the fpdlink drivers instead of OF
>>>>>
>>>>> * Addressed all the review comments (I hope)
>>>>>
>>>>> * Lots of cosmetic or minor fixes which I came up while doing the fwnode
>>>>>     change
>>>>
>>>> I believe my comments to the first driver applies to the next two, so please
>>>> address them whenever you are agree / it's possible / it makes sense.
>>>>
>>>> About ATR implementation. We have the i2c bus (Linux representation of
>>>> the driver model) and i2c_adapter and i2c_client objects there. Can't we
>>>> have an i2c_client_aliased in similar way and be transparent with users?
>>
>>> Can you clarify what you mean here?
>>>
>>> The i2c_clients are not aware of the i2c-atr. They are normal i2c clients.
>>> The FPD-Link drivers are aware of the ATR, as the FPD-Link hardware contains
>>> the ATR support.
>>
>> Can't that hardware be represented as I2C adapter? In such case the ATR specifics
>> can be hidden from the client (drivers).
>>
>> I'm worrying about code duplication and other things that leak into drivers as
>> ATR callbacks.
> 
> Which callbacks do you refer to? i2c_atr_ops? I don't think we can do
> without the attach/detach_client ones, it's where the driver-specific
> implementation is hooked for the generic ATR infra to call it.
> 
> However now I noticed the select/deselect ops are still there. IIRC
> they are not used by any driver and in the past the plan was to just
> remove them. Tomi, do you think there is a good reason to keep them?

I thought you had a reason to add them, so I didn't remove them =). I 
can drop them.

  Tomi

