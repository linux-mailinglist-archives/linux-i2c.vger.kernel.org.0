Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D2577F16E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 09:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348543AbjHQHpn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 03:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348562AbjHQHpT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 03:45:19 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7082E2D59;
        Thu, 17 Aug 2023 00:45:16 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 345082000B;
        Thu, 17 Aug 2023 07:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1692258315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NU5V/SoFtbjbDTK+iK4TleJsud7mzfxbuVy/GuI/lko=;
        b=Y39egPNIJBfK4k4dV+Wr5U/6BX5pj8dMSFr4N4/4/NYOnomSDxuvU+OTQ2ObovhTSrWLQT
        8dE95DTjgMF+FSetBUMlr0RGrk0/0p7MTjs9mYO3mLto+5GLU077uN8w1LEQg6uS4fyBTR
        pnEE0O78dNbPx8i5GiFlbe3gHh5A8zQvupAxzoWwlfJ5hWCmMwXQ2cpmF3eP0J+1wUM7HI
        LgEbPLim++lhHUeeDZ3+47nbJY1SfNkZ6E/TARL10Kd+eeZ0d3y6WyyNt3TddWzxyHH0ZR
        ct6DXYGTeYfSfJX/Ju+OoEsl8fKO5FhxWc2wJrmOsabk5E/WStsR9uPUp0OlyA==
Date:   Thu, 17 Aug 2023 09:45:12 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Make I2C_ATR invisible
Message-ID: <20230817094512.38b3d45b@booty>
In-Reply-To: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
References: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On Tue, 15 Aug 2023 17:29:11 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> I2C Address Translator (ATR) support is not a stand-alone driver, but a
> library.  All of its users select I2C_ATR.  Hence there is no need for
> the user to enable this symbol manually, except when compile-testing.
> 
> Fixes: a076a860acae77bb ("media: i2c: add I2C Address Translator (ATR) support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Do we care yet about out-of-tree drivers that need this functionality?
> ---
>  drivers/i2c/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index c6d1a345ea6d8aee..9388823bb0bb960c 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -72,7 +72,7 @@ config I2C_MUX
>  source "drivers/i2c/muxes/Kconfig"
>  
>  config I2C_ATR
> -	tristate "I2C Address Translator (ATR) support"
> +	tristate "I2C Address Translator (ATR) support" if COMPILE_TEST

Either as-is, or with an anonymous tristate:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
