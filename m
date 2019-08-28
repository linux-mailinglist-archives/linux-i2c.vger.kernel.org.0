Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B65DA031C
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2019 15:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfH1NYP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 09:24:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:56554 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726407AbfH1NYP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Aug 2019 09:24:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 364B0AF90;
        Wed, 28 Aug 2019 13:24:13 +0000 (UTC)
Date:   Wed, 28 Aug 2019 15:24:20 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: i801: Use iTCO version 6 in Cannon Lake PCH
 and beyond
Message-ID: <20190828152420.10fd9ed6@endymion>
In-Reply-To: <20190809124553.67012-3-mika.westerberg@linux.intel.com>
References: <20190809124553.67012-1-mika.westerberg@linux.intel.com>
        <20190809124553.67012-3-mika.westerberg@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mika,

On Fri, 9 Aug 2019 15:45:53 +0300, Mika Westerberg wrote:
> Intel Cannon Lake PCH moved the NO_REBOOT bit to reside as part of the
> TCO registers instead so update the i2c-i801 driver so that for Cannon
> Lake and beyond register platform device for iTCO using version 6. The
> affected PCHs are Cannon Lake, Cedar Fork, Comet Lake, Elkhart Lake and
> Ice Lake.

Looks overall good, with just minor comments inline below.

> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 138 +++++++++++++++++++++-------------
>  1 file changed, 86 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f2956936c3f2..6918406d00a5 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -292,7 +292,8 @@ struct i801_priv {
>  #define FEATURE_HOST_NOTIFY	BIT(5)
>  /* Not really a feature, but it's convenient to handle it as such */
>  #define FEATURE_IDF		BIT(15)
> -#define FEATURE_TCO		BIT(16)
> +#define FEATURE_TCO_SPT		BIT(16)
> +#define FEATURE_TCO_CNL		BIT(17)
>  
>  static const char *i801_feature_names[] = {
>  	"SMBus PEC",
> @@ -1491,57 +1492,37 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
>  }
>  #endif
>  
> -static const struct itco_wdt_platform_data tco_platform_data = {
> +static const struct itco_wdt_platform_data cnl_tco_platform_data = {
> +	.name = "Intel PCH",
> +	.version = 6,
> +};
> +
> +static struct platform_device *
> +i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
> +		 struct resource *tco_res)
> +{
> +	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> +					tco_res, 2, &cnl_tco_platform_data,
> +					sizeof(cnl_tco_platform_data));
> +}
> +
> +static const struct itco_wdt_platform_data spt_tco_platform_data = {
>  	.name = "Intel PCH",
>  	.version = 4,
>  };

I think it would make more sense to put the oldest code (v4) first and
then the newest code (v6)?

> (...)
> @@ -1695,13 +1719,23 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	switch (dev->device) {
>  	case PCI_DEVICE_ID_INTEL_SUNRISEPOINT_H_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_LEWISBURG_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_DNV_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS:
> +		priv->features |= FEATURE_I2C_BLOCK_READ;
> +		priv->features |= FEATURE_IRQ;
> +		priv->features |= FEATURE_SMBUS_PEC;
> +		priv->features |= FEATURE_BLOCK_BUFFER;
> +		/* If we have ACPI based watchdog use that instead */
> +		if (!acpi_has_watchdog())

What about setting the flag unconditionally and moving the call to
acpi_has_watchdog() inside i801_add_tco()? To avoid the duplication of
comment and call, and make future v7 easier too.

> +			priv->features |= FEATURE_TCO_SPT;
> +		priv->features |= FEATURE_HOST_NOTIFY;
> +		break;
> +
> +	case PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS:
> +	case PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS:
> +	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS:
>  	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
> @@ -1713,7 +1747,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		priv->features |= FEATURE_BLOCK_BUFFER;
>  		/* If we have ACPI based watchdog use that instead */
>  		if (!acpi_has_watchdog())
> -			priv->features |= FEATURE_TCO;
> +			priv->features |= FEATURE_TCO_CNL;
>  		priv->features |= FEATURE_HOST_NOTIFY;
>  		break;
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
