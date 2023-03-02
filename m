Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D42F6A859F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 16:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjCBPwf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 10:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCBPwe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 10:52:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDD442BCC;
        Thu,  2 Mar 2023 07:52:31 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAE1656A;
        Thu,  2 Mar 2023 16:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677772349;
        bh=B3YUBYx+IdonkuytCXScmef79tJe7ktce0HB6tmAONA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wjKJCeAJKwqc91icmw7y9i1YYuYFcLuWX+/Xq9wA36DUhh296ewxd50r8jYhdy6ui
         iaCehT/I+9qmyQzwyOEX9lqREbu3jQP43q6eVSb1gBCJomtxxfvufgTX+GHOWfaceW
         Nam91YstjMKgiEAFQfAUhU0Tfpxeg1T7sa8S41e0=
Message-ID: <96f8e0f9-d8cf-fa9b-a224-a5caad445992@ideasonboard.com>
Date:   Thu, 2 Mar 2023 17:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 0/8] i2c-atr and FPDLink
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
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
 <Y+5Rb17FTG4IxcE0@smile.fi.intel.com>
 <e4141652-53c0-fce1-dac7-5da5368e2240@ideasonboard.com>
 <Y+9j3cYOG+Z0zmyC@smile.fi.intel.com>
 <9f3f0744-f771-cd2c-3b8e-5b79f7a430c7@ideasonboard.com>
 <Y++E+Rr54p3vd8Jn@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y++E+Rr54p3vd8Jn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/02/2023 15:45, Andy Shevchenko wrote:
> On Fri, Feb 17, 2023 at 02:57:02PM +0200, Tomi Valkeinen wrote:
>> On 17/02/2023 13:24, Andy Shevchenko wrote:
>>> On Fri, Feb 17, 2023 at 08:57:32AM +0200, Tomi Valkeinen wrote:
>>>> On 16/02/2023 17:53, Andy Shevchenko wrote:
>>>>> On Thu, Feb 16, 2023 at 04:07:39PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
>>>>>>     	struct i2c_board_info ser_info = {
>>>>>> -		.of_node = to_of_node(rxport->remote_fwnode),
>>>>>> -		.fwnode = rxport->remote_fwnode,
>>>>>
>>>>>> +		.of_node = to_of_node(rxport->ser.fwnode),
>>>>>> +		.fwnode = rxport->ser.fwnode,
>>>>>
>>>>> Why do you need to have both?!
>>>>
>>>> I didn't debug it, but having only fwnode there will break the probing (no
>>>> match).
>>>
>>> This needs to be investigated. The whole fwnode approach, when we have both
>>> fwnode and legacy of_node fields in the same data structure, is that fwnode
>>> _OR_ of_node initialization is enough, when both are defined the fwnode
>>> should take precedence.
>>>
>>> If your testing is correct (and I have no doubts) it means we have a serious
>>> bug lurking somewhere.
>>
>> Having both defined or only of_node defined works for me.
> 
> But of_node is _legacy_ stuff. We should not really consider this option in the
> new code.
> 
>> Perhaps the issue is that these drivers only add of_match_table, and thus
>> having only .fwnode above is not enough.
> 
> No, the code should work with fwnode that carrying DT node or another.
> The matching table shouldn't affect this either.
> 
>> Looking at i2c_device_match(), i2c_of_match_device() only uses of_node, so
>> perhaps I would need CONFIG_ACPI for acpi_driver_match_device to do matching
>> with of_node? Although I don't see the acpi code using fwnode, just of_node.
>> Well, I have to say I have no idea without spending more time on this.
> 
> Again, there is a bug and that bug seems nasty one as it would allow to
> work the device in one environment and not in another.
> 
> Since it's about I²C board files, I believe that an issue is in I²C core.

I don't know if this is related in any way, but I see these when probing:

[   36.952697] i2c 4-0044: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@0/serializer/i2c/sensor@21/port/endpoint
[   36.969268] i2c 4-0044: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/ports/port@0/endpoint
[   36.983001] i2c 4-0044: Failed to create device link with 4-0044
[   36.992828] ds90ub953 4-0044: Found ub953 rev/mask 0x20
[   37.017761] i2c 5-0021: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@0/serializer/ports/port@0/endpoint
[   37.033843] i2c 5-0021: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@0/serializer
[   37.117492] i2c 4-0045: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@1/serializer/i2c/sensor@21/port/endpoint
[   37.134033] i2c 4-0045: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/ports/port@1/endpoint
[   37.147735] i2c 4-0045: Failed to create device link with 4-0045
[   37.156097] ds90ub953 4-0045: Found ub953 rev/mask 0x20
[   37.186584] i2c 6-0021: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@1/serializer/ports/port@0/endpoint
[   37.202636] i2c 6-0021: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@1/serializer

Then again, I see similar warnings/errors for some other devices too, when booting up (TI's DRA76 EVM).

  Tomi

