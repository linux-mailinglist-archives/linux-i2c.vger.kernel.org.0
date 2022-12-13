Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C352D64B666
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 14:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbiLMNhB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 08:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235706AbiLMNg4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 08:36:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DBF1AD89;
        Tue, 13 Dec 2022 05:36:55 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EEEF7C5;
        Tue, 13 Dec 2022 14:36:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670938613;
        bh=yz95QcmUw/zJmophSOTte9cvua4UsCpsbavzC/vzCrU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=O316pwCtcsI8PSiWT895jsDXF5a0BndzoWqMuAM6aTc+VhEMZEp9iOXEcGwdFhsCq
         0JhmmxBS4GvauqqXxW9kzIIKwvxJx0YIEFQtDt9d8O7U0yneyKWOc8J544j19jxyPh
         N0iErI+eFXaucOjDOmTI10M2kGwJm2/AvLkzWH2E=
Message-ID: <d39841c6-868c-408b-4142-5f9a4bd4e3c6@ideasonboard.com>
Date:   Tue, 13 Dec 2022 15:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 3/8] dt-bindings: media: add bindings for TI DS90UB913
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
 <20221208104006.316606-4-tomi.valkeinen@ideasonboard.com>
 <Y5YPpGVJxAhkNJmC@pendragon.ideasonboard.com>
 <Y5YRj8emzJsB1BgK@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y5YRj8emzJsB1BgK@pendragon.ideasonboard.com>
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

On 11/12/2022 19:21, Laurent Pinchart wrote:
> I missed one issue.
> 
> On Sun, Dec 11, 2022 at 07:13:10PM +0200, Laurent Pinchart wrote:
>> Hi Tomi,
>>
>> Thank you for the patch.
>>
>> On Thu, Dec 08, 2022 at 12:40:01PM +0200, Tomi Valkeinen wrote:
>>> Add DT bindings for TI DS90UB913 FPDLink-3 Serializer.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   .../bindings/media/i2c/ti,ds90ub913.yaml      | 121 ++++++++++++++++++
>>>   1 file changed, 121 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
>>> new file mode 100644
>>> index 000000000000..3a5b34c6bb64
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
>>> @@ -0,0 +1,121 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub913.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Texas Instruments DS90UB913 FPD-Link 3 Serializer
>>
>> I think TI consistently writes it "FPD-Link III". If you rename it,
>> please do so through the whole series.
>>
>>> +
>>> +maintainers:
>>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> +
>>> +description:
>>> +  The TI DS90UB913 is an FPD-Link 3 video serializer for parallel video.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ti,ds90ub913a-q1
>>
>> Is the -q1 suffix needed, are there other variants ?
>>
>>> +
>>> +  '#gpio-cells':
>>> +    const: 2
>>> +
>>> +  gpio-controller: true
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +    description:
>>> +      Reference clock connected to the CLKIN pin.
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: clkin
>>> +
>>> +  '#clock-cells':
>>> +    const: 0
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description: CSI-2 input port
> 
> This should be "Parallel input port".

Oops...

>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +            unevaluatedProperties: false
> 
> Should at least the bus-width property be mandatory, as the device
> supports both 10- and 12-bit inputs ?

Hmm... It supports 10-bit, 12-bit HF and 12-bit LF modes. If we need to 
configure the mode based on DT, we need one more property for the HF/LF. 
Then again, the HF/LF is separate from the input port, it's more about 
internal operation and the link to the deserializer.

However, this (the mode) should always be set in the HW via the MODE 
pins. And the driver can read the HW's MODE from the registers. Only in 
some very odd circumstances should the mode be configured by hand (and 
then carefully, as the link to the deserializer will drop).

So the bus-width is not something that the driver would normally use. If 
we would need to define the bus-width and HF/LF in the DT for some 
reason in the future, I think an "old" DT without those specified should 
continue working fine, as the mode can be read from a register.

That said, to complicate matters, the deserializer needs to know the 
serializer's mode before it can communicate with it (and thus, before we 
can read the mode). This is set with the deserializer's "ti,rx-mode" 
property, where you find RAW10, RAW12LF and RAW12HF modes (and for 
ub953, CSI-2 sync and non-sync modes).

So if we would define the bus-width and HF/LF in ub913's properties, the 
deserializer could go peeking the mode from there. But is that a good 
idea... I'm not so sure.

  Tomi

