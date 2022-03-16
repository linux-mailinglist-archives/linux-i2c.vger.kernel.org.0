Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB13D4DB32B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Mar 2022 15:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243886AbiCPO0c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Mar 2022 10:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235985AbiCPO0b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Mar 2022 10:26:31 -0400
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7423A1BD;
        Wed, 16 Mar 2022 07:25:16 -0700 (PDT)
Received: from [77.244.183.192] (port=63008 helo=[192.168.178.75])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nUUaQ-000DFG-2U; Wed, 16 Mar 2022 15:25:14 +0100
Message-ID: <02af807d-c35e-afc6-7a41-22eafd3c46f9@lucaceresoli.net>
Date:   Wed, 16 Mar 2022 15:25:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFCv3 2/6] i2c: add I2C Address Translator (ATR) support
Content-Language: en-US
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <20220206115939.3091265-3-luca@lucaceresoli.net>
 <a8796cde-e97b-7157-33ac-1b6020053c5d@fi.rohmeurope.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <a8796cde-e97b-7157-33ac-1b6020053c5d@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matti,

On 16/03/22 15:11, Vaittinen, Matti wrote:
> Hi dee Ho peeps!
> 
> On 2/6/22 13:59, Luca Ceresoli wrote:
>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>> slave "upstream" port and N master "downstream" ports, and forwards
>> transactions from upstream to the appropriate downstream port. But is
>> is different in that the forwarded transaction has a different slave
>> address. The address used on the upstream bus is called the "alias"
>> and is (potentially) different from the physical slave address of the
>> downstream chip.
>>
>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>> implementing ATR features in a device driver. The helper takes care or
>> adapter creation/destruction and translates addresses at each transaction.
>>
> 
> snip
> 
>> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
>> index 438905e2a1d0..c6d1a345ea6d 100644
>> --- a/drivers/i2c/Kconfig
>> +++ b/drivers/i2c/Kconfig
>> @@ -71,6 +71,15 @@ config I2C_MUX
>>   
>>   source "drivers/i2c/muxes/Kconfig"
>>   
>> +config I2C_ATR
>> +	tristate "I2C Address Translator (ATR) support"
>> +	help
>> +	  Enable support for I2C Address Translator (ATR) chips.
>> +
>> +	  An ATR allows accessing multiple I2C busses from a single
>> +	  physical bus via address translation instead of bus selection as
>> +	  i2c-muxes do.
>> +
> 
> I continued playing with the ROHM (de-)serializer and ended up having 
> .config where the I2C_ATR was ='m', while my ATR driver was ='y' even 
> though it selects the I2C_ATR.
> 
> Yep, most probably my error somewhere.
> 
> Anyways, this made me think that most of the I2C_ATR users are likely to 
> just silently select the I2C_ATR, right? The I2C_ATR has no much reason 
> to be compiled in w/o users, right? So perhaps the menu entry for 
> selecting the I2C_ATR could be dropped(?) Do we really need this entry 
> in already long list of configs to be manually picked?

Maybe we could make it a blind option, sure. The only reason it could be
useful that it's visible is that one might implement a user driver could
be written out of tree. I don't care very much about that, but it is
possible. Maybe it's the reason for I2C_MUX to be a visible option too.
Peter?

>> +struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
>> +			    const struct i2c_atr_ops *ops, int max_adapters)
>> +{
>> +	struct i2c_atr *atr;
>> +
>> +	if (!ops || !ops->attach_client || !ops->detach_client)
>> +		return ERR_PTR(-EINVAL);
>> +
> 
> I believe that most of the attach_client implementations will have 
> similar approach of allocating and populating an address-pool and 
> searching for first unused address. As a 'further dev' it'd be great to 
> see a common helper implementation for attach/detach - perhaps so that 
> the atr drivers would only need to specify the slave-address 
> configuration register(s) / mask and the use a 'generic' attach/detach 
> helpers. Well, just thinking how to reduce the code from actual IC 
> drivers but this is really not something that is required during this 
> initial series :)
> 
> Also, devm-variants would be great - although that falls to the same 
> category of things that do not need to be done immediately - but would 
> perhaps be worth considering in the future.

Both of your proposals make sense, however I did deliberately not
generalize too much because I knew only one chipset. I don't like trying
to generalize for an unpredictable future use case, it generally leads
(me) to generalizing in the wrong direction. That means you'd be very
welcome to propose helpers and/or devm variants, possibly in the same
patchset as the first Rohm serdes driver. ;)

> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Thanks for your review!

-- 
Luca
