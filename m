Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2D6734F0E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 11:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjFSJFU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 05:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbjFSJE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 05:04:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58803AD;
        Mon, 19 Jun 2023 02:04:56 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 261E6FB;
        Mon, 19 Jun 2023 11:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687165460;
        bh=+SksVrsMHgEBW8BF4m3gnrQDCstsaJ2nBtdSpsK2iIQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pz7pjujvp5IQEz3T+uG+w2BFrFA3ezbQZamn6qoaWiUSORPnX1EAr5OSAQpFql5Tf
         JtaEGkuRplrTEnV+gMw93kx5vyRMQqnVcRriln+BDROW79niHcmNxCr5NN+Eco0Ob0
         5qAcI8U8hJnA6x8M9wIp3gV+alBgqhS84Pgy3ijk=
Message-ID: <47bdb323-9350-0b58-f956-39d286e16c45@ideasonboard.com>
Date:   Mon, 19 Jun 2023 12:04:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 16/18] media: i2c: ds90ub960: Allow FPD-Link async
 mode
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-17-tomi.valkeinen@ideasonboard.com>
 <ZIxy5qKjiMZluGOf@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZIxy5qKjiMZluGOf@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/06/2023 17:34, Andy Shevchenko wrote:
> On Fri, Jun 16, 2023 at 04:59:20PM +0300, Tomi Valkeinen wrote:
>> Allow using FPD-Link in async mode. The driver handles it correctly, but
>> the mode was blocked at probe time as there wasn't HW to test this with.
>> Now the mode has been tested, and it works.
> 
> Looks good, but I assume you will incorporate this into the original code.

Perhaps, but to be honest, I just want to get the basic set merged, as 
it's been circulating for so many years. So, as I mentioned in the 
earlier email, it was perhaps a mistake to include these additional 
changes...

If the reviews for the new commits are quick and easy, I can squash them 
and send a v15. But if there's anything that needs more discussions, I'd 
like to leave the rest for later.

  Tomi

