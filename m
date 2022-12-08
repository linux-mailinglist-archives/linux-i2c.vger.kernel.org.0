Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292AA6473EC
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 17:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiLHQKo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 11:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiLHQKn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 11:10:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9A0193FD;
        Thu,  8 Dec 2022 08:10:42 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7288725B;
        Thu,  8 Dec 2022 17:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670515840;
        bh=0KuDf7gADX+BMGPTe21mxwGrjbzK1dVw3aK5ZAKvjGo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=NE1MigI2gS30q2ZpGdBvqUxaAUpoVc4/MZ70CyJ6MSLqax4IZX1YFvDB3E5DoiLz1
         hZ9EZjB0zcEQ7v5SxSrsZ4XScBEmO7JdMrRFAoto7xuAHZ12VtVks9iAL6XXnySwjL
         kYD1/oHQyIA3+VjTFT6kD0yYGDzTy7zhbqPTsKVU=
Message-ID: <6d424d13-f563-beed-6441-3981baab3777@ideasonboard.com>
Date:   Thu, 8 Dec 2022 18:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 1/8] i2c: core: let adapters be notified of client
 attach/detach
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
 <Y5HY4/Ho48KrGFoR@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y5HY4/Ho48KrGFoR@smile.fi.intel.com>
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

On 08/12/2022 14:30, Andy Shevchenko wrote:
> On Thu, Dec 08, 2022 at 12:39:59PM +0200, Tomi Valkeinen wrote:
>> From: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> An adapter might need to know when a new device is about to be
>> added. This will soon bee needed to implement an "I2C address
>> translator" (ATR for short), a device that propagates I2C transactions
>> with a different slave address (an "alias" address). An ATR driver
>> needs to know when a slave is being added to find a suitable alias and
>> program the device translation map.
>>
>> Add an attach/detach callback pair to allow adapter drivers to be
>> notified of clients being added and removed.
> 
> ...
> 
>> +	if (adap->attach_ops &&
>> +	    adap->attach_ops->attach_client &&
>> +	    adap->attach_ops->attach_client(adap, info, client) != 0)
>> +		goto out_remove_swnode;
> 
> With a temporary variable it becomes better
>

Ok.

  Tomi

