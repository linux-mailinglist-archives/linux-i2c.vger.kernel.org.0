Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0F1615D4F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 09:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiKBIFZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 04:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbiKBIFX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 04:05:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35F827168;
        Wed,  2 Nov 2022 01:05:20 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B93E810D2;
        Wed,  2 Nov 2022 09:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667376317;
        bh=nEN27WtNls/1wXLTvXo+jO3/nuFgNwPbR4HWZHPU4sE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=t6uQ6IOgjDgFrjk6ZvUif4roImt4eTcv07i1/jZ4zTfSzgHDqnAgAlQ3w9VAIBSJG
         p8D1c831YAywy01cED1f26f7BkZubjLpveewtRLy3LlaBw9Xo+vrvehkvJkNcn+E1D
         PsJRZGasBiX+8+0Lyijd6pVd6XgXWXUTmp44dboI=
Message-ID: <bb565f1e-a17c-a32d-145a-631ab12d2acd@ideasonboard.com>
Date:   Wed, 2 Nov 2022 10:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 6/8] media: i2c: add DS90UB960 driver
Content-Language: en-US
To:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
 <20221101132032.1542416-7-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221101132032.1542416-7-tomi.valkeinen@ideasonboard.com>
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

On 01/11/2022 15:20, Tomi Valkeinen wrote:
> Add driver for TI DS90UB960 FPDLink-3 Deserializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/media/i2c/Kconfig     |   16 +
>   drivers/media/i2c/Makefile    |    2 +
>   drivers/media/i2c/ds90ub960.c | 4198 +++++++++++++++++++++++++++++++++
>   include/media/i2c/ds90ub9xx.h |   16 +
>   4 files changed, 4232 insertions(+)
>   create mode 100644 drivers/media/i2c/ds90ub960.c
>   create mode 100644 include/media/i2c/ds90ub9xx.h
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7806d4b81716..2a78889e3487 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1595,4 +1595,20 @@ config VIDEO_THS7303
>   
>   endmenu
>   
> +#
> +# Video serializers and deserializers (e.g. FPDLink)
> +#
> +
> +menu "Video serializers and deserializers"
> +
> +config VIDEO_DS90UB960
> +	tristate "TI DS90UB960 Deserializer"
> +	depends on OF_GPIO
> +	select I2C_ATR
> +	help
> +	  Device driver for the Texas Instruments DS90UB960
> +	  FPD-Link III Deserializer
> +
> +endmenu

Looks like I'm missing proper dependencies and selects from this and the 
ub913 and ub953 drivers. I'll fix those.

  Tomi

