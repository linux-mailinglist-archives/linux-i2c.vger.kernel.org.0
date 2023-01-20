Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B5C6758D5
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 16:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjATPhz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 10:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjATPhy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 10:37:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4768C9256;
        Fri, 20 Jan 2023 07:37:07 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60867514;
        Fri, 20 Jan 2023 16:37:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674229024;
        bh=2HCZlX0ybfHa9FB4nm34wAFz2riqSXuY7G4fB/sY36w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BPfwtKyww49ztjQbKIqzhHCRqj0FhUUPBqs1NvD9soczmnsyKLL/b61xhHxHIOHgM
         KYgO8y9wBFz0HXwCmCBcS3f7zKZUZXfhtf+Nxa7Fi8LfdeRalar44iue//75DycCXH
         DXPdPk1mttSUJ5ueILgsGLZNE7sj7Pbj/kYWMXy0=
Message-ID: <64a970f9-3339-3841-4b82-1cb4155630ad@ideasonboard.com>
Date:   Fri, 20 Jan 2023 17:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 0/7] i2c-atr and FPDLink
Content-Language: en-US
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230120153417.1156207-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230120153417.1156207-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/01/2023 17:34, Tomi Valkeinen wrote:
> Hi,
> 
> You can find v7 from:
> 
> https://lore.kernel.org/all/20230118124031.788940-1-tomi.valkeinen@ideasonboard.com/
> 
> Diff to v7 included below.
> 
> Main changes in v8:
> - Added missing 'link-frequencies' to ti,ds90ub960.yaml
> - Dropped ATR select/deselect ops
> - Don't use devm_kzalloc() in i2c_atr_new()
> - Fixed the reported error handling paths (mainly adding
>    fwnode_handle_puts)
> - Dropped all WARNs
> - Plenty of cosmetic/style changes
> 
> I saw the suggestion to change the i2c_atr to be embedded in the main
> driver's private data struct. That change has not been done in this
> version.

Ah, and just now I realized I did not pick the documentation changes 
from Luca.

  Tomi

