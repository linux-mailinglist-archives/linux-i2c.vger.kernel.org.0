Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3EC6469F7
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 08:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiLHH43 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 02:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiLHH43 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 02:56:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276772228C;
        Wed,  7 Dec 2022 23:56:28 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2889E25B;
        Thu,  8 Dec 2022 08:56:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670486185;
        bh=BcjJ1h797aI+fqI1juhLazjJ1X7XpWhj4GlVjAbTGJs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fitqq8LHhlDI0Ku8bMPEjvMGzQCncvxbOdrt0PAhttaQQenhoH4DhHZd8ZT/S/wu3
         uw+lTCnyCDVXrTJgnkt/pEfTJwCMHYBogX0VnbWECi2yzoF0855mpcMbNJ0gOCoLdm
         5WJpmNJD7+T4KnBUCfBW0dYmOsCeIrAUC4aNDQuE=
Message-ID: <11b87742-bb92-7f8f-8939-2e403d2652e5@ideasonboard.com>
Date:   Thu, 8 Dec 2022 09:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/8] i2c: add I2C Address Translator (ATR) support
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-3-tomi.valkeinen@ideasonboard.com>
 <Y2EtnSNqBOfGRDMO@smile.fi.intel.com>
 <cc510516-c961-9efb-bcdf-2abea795433a@ideasonboard.com>
 <20221107124055.0495031f@booty>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221107124055.0495031f@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/11/2022 13:40, Luca Ceresoli wrote:
> On Fri, 4 Nov 2022 13:59:06 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> Hi Andy,
>>
>> On 01/11/2022 16:30, Andy Shevchenko wrote:
>>> On Tue, Nov 01, 2022 at 03:20:26PM +0200, Tomi Valkeinen wrote:
>>>> From: Luca Ceresoli <luca@lucaceresoli.net>
>>>>
>>>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>>>> slave "upstream" port and N master "downstream" ports, and forwards
>>>> transactions from upstream to the appropriate downstream port. But is
>>>> is different in that the forwarded transaction has a different slave
>>>> address. The address used on the upstream bus is called the "alias"
>>>> and is (potentially) different from the physical slave address of the
>>>> downstream chip.
>>>>
>>>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>>>> implementing ATR features in a device driver. The helper takes care or
>>>> adapter creation/destruction and translates addresses at each transaction.
> 
> First of all, thank you for bringing this work on!
> 
>>> ...
>>>    
>>>> +I2C ADDRESS TRANSLATOR (ATR)
>>>> +M:	Luca Ceresoli <luca@lucaceresoli.net>
>>>
>>> Hmm... Are you going to maintain this? Or Review? Why not?
>>
>> We haven't discussed with Luca if he wants to maintain this (this is
>> mostly his code). But, indeed, I should add my name there.
> 
> I think at this point you are probably in a better position to be the
> maintainer, but I'm OK with being listed here as reviewer (R:).
> 
> Ah, would you please use my bootlin dot com address here?

Ok, I've added your bootlin address as R:

  Tomi

