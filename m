Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B13BD65CE3A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jan 2023 09:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbjADI01 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Jan 2023 03:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbjADI0Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Jan 2023 03:26:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD13186D3;
        Wed,  4 Jan 2023 00:26:22 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13BF36C7;
        Wed,  4 Jan 2023 09:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672820780;
        bh=SeeLZDyqRZZDEu55JzGB0YU4joDF6QeMuk29dAr59mY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KFKZS6jqJ8VB5rzBzep4KAI0hfl0kqoKzEpzuSgzzdgvEQQFAz99q9aRu/goNlut2
         5Lv9cvo6EK2dOgsLbAR7IsfC5yaeOCRpPomCCzI/xNT0JN4wjHzXBgT0L+HuumJKdh
         4hSGvuRASezPAG+iQKAT2kcA/7STulL0hdEJU9GM=
Message-ID: <1369118d-3311-f12e-e5d7-a981969baaaa@ideasonboard.com>
Date:   Wed, 4 Jan 2023 10:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 4/8] dt-bindings: media: add bindings for TI DS90UB953
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
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
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-5-tomi.valkeinen@ideasonboard.com>
 <20221209212744.GA3868990-robh@kernel.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221209212744.GA3868990-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On 09/12/2022 23:27, Rob Herring wrote:
> On Thu, Dec 08, 2022 at 12:40:02PM +0200, Tomi Valkeinen wrote:
>> Add DT bindings for TI DS90UB953 FPDLink-3 Serializer.
> 
> Seems like this and DS90UB913 binding could be combined. I couldn't spot
> a difference.

They are indeed quite similar, but there are a few diffs, especially 
after fixing Laurent's review comments.

E.g, as the UB913 is a parallel video serializer and the UB953 is a 
CSI-2 serializer, the input port on UB913 has 'pclk-sample' property but 
UB953 has 'data-lanes' property. The descriptions differ also a bit for 
the above mentioned difference.

The above points would still allow combining the bindings, though. But I 
feel the UB913 is somewhat a different class of serializer device 
compared to UB953 (and UB971 which the UB953's binding also supports), 
so my gut feeling says it's better to keep them separate. But I don't 
have much experience on maintaining such bindings, and, afaik, we could 
always split the bindings later if needed.

So... Do you have a preference on either way? Or maybe we can come back 
to this after I send the next version with the updates.

> In the subjects, drop 'binding for'. The prefix says this is a binding.
> Maybe add 'Serializer'.

Ok.

  Tomi

