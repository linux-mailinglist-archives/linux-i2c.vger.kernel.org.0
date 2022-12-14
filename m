Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373F564C409
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 07:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiLNGt2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 01:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237454AbiLNGtH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 01:49:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DADE10C4;
        Tue, 13 Dec 2022 22:48:46 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D60D4A7;
        Wed, 14 Dec 2022 07:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671000524;
        bh=aWvF6R8clbwuZGWiji4dHrljqrYWOPhc/SD7bKTJUq0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RK3HB20rcl0riCXzpYcLQipuvhcvlB9FFTMu/vD9sHou82a8haJheiASdyYjJeHtJ
         spLmyA8u0BdckJn5JDAT8yA7eQyhXTYX4u/D4sjnydc594vFcGRGojIi/XVVh1sAsO
         5wkAYssHrumXkRp+fL9ddMRaL5vU4Mi7D1a6GRsg=
Message-ID: <894c40aa-3dae-4b4b-1ad9-f3608bcaacab@ideasonboard.com>
Date:   Wed, 14 Dec 2022 08:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 7/8] media: i2c: add DS90UB913 driver
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
 <20221208104006.316606-8-tomi.valkeinen@ideasonboard.com>
 <Y5YiazDtaxtLJyL0@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y5YiazDtaxtLJyL0@pendragon.ideasonboard.com>
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

Hi Laurent,

On 11/12/2022 20:33, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Dec 08, 2022 at 12:40:05PM +0200, Tomi Valkeinen wrote:
>> Add driver for TI DS90UB913 FPDLink-3 Serializer.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/i2c/Kconfig     |  13 +
>>   drivers/media/i2c/Makefile    |   2 +-
>>   drivers/media/i2c/ds90ub913.c | 892 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 906 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/media/i2c/ds90ub913.c

Many of your comments here also apply to the ub953 driver. I'll fix those.

  Tomi

