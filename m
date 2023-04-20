Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1F66E8B76
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Apr 2023 09:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbjDTHaq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 03:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233819AbjDTHap (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 03:30:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C7BC6;
        Thu, 20 Apr 2023 00:30:26 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A92A75B;
        Thu, 20 Apr 2023 09:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681975817;
        bh=LSTUdwSzih54Ne5MHSrVZTV2gSAf73YZM/ix1OR5sSM=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=eINLHip+7W7yspC8vrI6Q7upOEFVPAKsa5wFC3BBqLZAiiQvtAnllddOvVgD9oKDu
         AeDmRW7Ngr4Auw3rvYLCIGkkHTnT7naDl5pMxjxx7ktoLAenkSgqm4OG2gX+FYNJEe
         uBNocvBtFJAo/N02BDS5hJnB+IA/Q9pWdRLyrT/I=
Message-ID: <b85a2198-dffd-6c1e-53ea-61bc4d14ce2a@ideasonboard.com>
Date:   Thu, 20 Apr 2023 10:30:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 5/8] dt-bindings: media: add TI DS90UB960 FPD-Link III
 Deserializer
To:     Wolfram Sang <wsa@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-6-tomi.valkeinen@ideasonboard.com>
 <ZD6VwpRya6SGBAt5@shikoro>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZD6VwpRya6SGBAt5@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/04/2023 16:06, Wolfram Sang wrote:
> 
>> +  i2c-alias-pool:
>> +    $ref: /schemas/types.yaml#/definitions/uint16-array
>> +    description:
>> +      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
>> +      used to access the remote peripherals on the serializer's I2C bus. The
>> +      addresses must be available, not used by any other peripheral. Each
>> +      remote peripheral is assigned an alias from the pool, and transactions to
>> +      that address will be forwarded to the remote peripheral, with the address
>> +      translated to the remote peripheral's real address. This property is not
>> +      needed if there are no I2C addressable remote peripherals.
> 
> After some initial discussion with Tomi on IRC, this question is
> probably more for Luca:
> 
> Why is "i2c-alias-pool" in the drivers binding and not a regular i2c

Where should be the binding documented? A new 
Documentation/devicetree/bindings/i2c/i2c-atr.yaml file that only 
contains the i2c-alias-pool?

> binding? Same question for the implementation of the alias-pool
> handling. Shouldn't this be in the i2c-atr library? I'd think managing
> the list of aliases would look all the same in the drivers otherwise?

I think this is fine, but I also think that we need to keep the door 
open to other kinds of alias management. We only have a single user for 
this for now. A driver/device might have other requirements for its 
i2c-atr. Say, a pool per link, or perhaps runtime events may affect the 
pool.

If we dictate the use of i2c-alias-pool property and the i2c-atr will 
automatically get an alias from that pool, i2c-atr won't be usable for 
the hypothetical drivers that have other needs.

With that in mind the current binding and i2c-atr.c is safe, as the 
i2c-atr.c isn't even aware of the pool.

We can easily re-arrange the code later if and when we get more users 
and understand their needs. But the bindings are important to get 
right(-ish) now. So:

- Is the "i2c-alias-pool" property a driver property or a common 
property for all drivers using i2c-atr?

- It the property mandatory or optional? It must be optional, as a setup 
(meaning, e.g., what cameras you happen to connect) might not have any 
i2c addressable remote devices, in which case the driver doesn't even 
need i2c-atr (even if it supports i2c-atr). But is it optional even in 
the case where the driver needs i2c-atr? In other words, do we allow 
some other way to manage the aliases?

How does this sound:

- If "i2c-alias-pool" is present in the DT data of the device passed to 
i2c_atr_new(), i2c_atr_new() will parse the property. i2c-atr.c will 
export functions to get a new alias and to release a previously reserved 
alias. The driver can use those functions in attach/detach_client() 
callbacks. In other words, the alias pool management wouldn't be fully 
automatic inside the i2c-atr, but it would provide helpers for the 
driver to do the common work.

- If "i2c-alias-pool" is not present, i2c-atr.c will behave as it does 
now, and expects the driver to manage the aliases.

Also, looking at the ub960 code... I don't think this will simplify the 
attach/detach_client callbacks much. Most of the code in those functions 
is about managing the UB960's registers related to ATR, not managing the 
address pool itself. However, it will remove the probe time 
"i2c-alias-pool" parsing from the driver, which is nice.

  Tomi

