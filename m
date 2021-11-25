Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F369C45E37F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 00:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbhKYXol (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 18:44:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37388 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbhKYXml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 18:42:41 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59FF7FD7;
        Fri, 26 Nov 2021 00:39:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637883566;
        bh=e/88nyQPFqvYKj8EETiiJv+//BkB8gj96nheD+iYq7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lkb9OAOJJnIWFaIvu4Ar1l+5rc1in50j6aLb5V/UbDmKuO7xxy0noL4+60JzJCGjN
         By4Wiy9K3MwjUv5EdEzD9rM1xDOJn6GW/Q3gayy9DeI0L5vt045EsTpNFil/w3D51l
         rri7NyOjYiYIT97v4wsrCISxSfR5mGWAR0If8N4c=
Date:   Fri, 26 Nov 2021 01:39:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 07/15] platform/x86: int3472: Enable I2c daisy chain
Message-ID: <YaAel9HuAvemRg2s@pendragon.ideasonboard.com>
References: <20211125165412.535063-1-hdegoede@redhat.com>
 <20211125165412.535063-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125165412.535063-8-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Nov 25, 2021 at 05:54:04PM +0100, Hans de Goede wrote:
> From: Daniel Scally <djrscally@gmail.com>
> 
> The TPS68470 PMIC has an I2C passthrough mode through which I2C traffic
> can be forwarded to a device connected to the PMIC as though it were
> connected directly to the system bus. Enable this mode when the chip
> is initialised.

Is there any drawback doing this unconditionally, if nothing is
connected to the bus on the other side (including no pull-ups) ?

> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  .../x86/intel/int3472/intel_skl_int3472_tps68470.c         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
> index c05b4cf502fe..42e688f4cad4 100644
> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
> @@ -45,6 +45,13 @@ static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
>  		return ret;
>  	}
>  
> +	/* Enable I2C daisy chain */
> +	ret = regmap_write(regmap, TPS68470_REG_S_I2C_CTL, 0x03);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable i2c daisy chain\n");
> +		return ret;
> +	}
> +
>  	dev_info(dev, "TPS68470 REVID: 0x%02x\n", version);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
