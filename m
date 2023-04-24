Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2BEE6ECAB0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbjDXKwJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbjDXKv6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:51:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A5010D1;
        Mon, 24 Apr 2023 03:51:53 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88A289DE;
        Mon, 24 Apr 2023 12:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682333501;
        bh=k41FYnFPuVa5kdvlRxv3/uNLC9gxaLBYMO4s1pcl8sc=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=SBhIRp0/AaG5awrt23WH7HYVNKSZdeYT+K1bFuzeLC3vEEKeAAwaFsdMQpPv1ijcO
         Qs9ivefncmwybLmxqurAfGdZM1kvxaTEtd808dny/B+iJDRyzEzlhVA4/EGvje7Z8f
         QHTXCdmjfMSiRvy5xNAHR1mtLyHdXVoqOHcSyzvw=
Message-ID: <f9be2c5d-1303-1b91-c672-7e5a476277e7@ideasonboard.com>
Date:   Mon, 24 Apr 2023 13:51:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 1/7] i2c: add I2C Address Translator (ATR) support
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
        Luca Ceresoli <luca@lucaceresoli.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230421101833.345984-1-tomi.valkeinen@ideasonboard.com>
 <20230421101833.345984-2-tomi.valkeinen@ideasonboard.com>
 <ZEZafj6j+EurGWJ7@sai>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZEZafj6j+EurGWJ7@sai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/04/2023 13:31, Wolfram Sang wrote:
> On Fri, Apr 21, 2023 at 01:18:27PM +0300, Tomi Valkeinen wrote:
>> From: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>> slave "upstream" port and N master "downstream" ports, and forwards
>> transactions from upstream to the appropriate downstream port. But it
>> is different in that the forwarded transaction has a different slave
>> address. The address used on the upstream bus is called the "alias"
>> and is (potentially) different from the physical slave address of the
>> downstream chip.
>>
>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>> implementing ATR features in a device driver. The helper takes care or
>> adapter creation/destruction and translates addresses at each transaction.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This looks good to me. Dunno if the DT folks want the binding as a
> seperate patch, but this is good to go as far as I am concerned.

Ah, right. I'll resend with the DT bindings separate.

  Tomi

