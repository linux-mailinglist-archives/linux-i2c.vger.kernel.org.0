Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA08D6EA3B6
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 08:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjDUGT3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Apr 2023 02:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjDUGSy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Apr 2023 02:18:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFA8358B;
        Thu, 20 Apr 2023 23:18:50 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAFE510A;
        Fri, 21 Apr 2023 08:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682057919;
        bh=54AEpK2Lhks/cVE8toCu23zDhRa6jQHC/5KdhVgYezI=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=Va3dxkvsdQ0eQN9H8oz9zrTcH3cjJzFk73BL8dfCFTpDK8wpKkwCm9y5HG9EeGGa+
         O6RL2BPT2azgOJAV6lrlpVqNTrLkByDqNa5qqzt39xVf+QgtJXSRcRvkZlXcSQWhda
         Fxwcf2ziNwo+tcdcDPzHc35JdJy4rzFp3JCBgIJQ=
Message-ID: <9130e2da-dcd1-e6aa-ed0a-935f79727f84@ideasonboard.com>
Date:   Fri, 21 Apr 2023 09:18:42 +0300
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
 <b85a2198-dffd-6c1e-53ea-61bc4d14ce2a@ideasonboard.com>
 <ZEGItAqsvNGQm1l+@shikoro>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZEGItAqsvNGQm1l+@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/04/2023 21:47, Wolfram Sang wrote:
> Hi Tomi,
> 
>> How does this sound:
>>
>> - If "i2c-alias-pool" is present in the DT data of the device passed to
>> i2c_atr_new(), i2c_atr_new() will parse the property. i2c-atr.c will export
>> functions to get a new alias and to release a previously reserved alias. The
>> driver can use those functions in attach/detach_client() callbacks. In other
>> words, the alias pool management wouldn't be fully automatic inside the
>> i2c-atr, but it would provide helpers for the driver to do the common work.
>>
>> - If "i2c-alias-pool" is not present, i2c-atr.c will behave as it does now,
>> and expects the driver to manage the aliases.
> 
> So, how does a driver manage the aliases without a pool of available
> addresses? I can't imagine another way right now.
> 
> In general, your above proposal sounds good to me. With my lack of
> imagination regarding a different alias handling, I could also see that
> i2c-atr already provides the alias to the attach callback. But if you
> teach me another way of alias handling, then I could agree that your
> proposal makes sense as is.

Oh, my imagination doesn't go so far to give you concrete examples. If 
the driver has to do runtime decisions on the pool, a fixed pool handled 
by the i2c-atr won't work. But why exactly would there be runtime events 
affecting the pool... I don't know.

Maybe that doesn't matter here. We can start with the i2c-atr providing 
the alias to the attach callback, and if we ever need something else, 
the (kernel internal) API can be changed accordingly. The DT bindings 
should be fine in either case.

  Tomi

