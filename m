Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E56EA0350
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2019 15:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfH1Nel (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 09:34:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:61127 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbfH1Nel (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Aug 2019 09:34:41 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 06:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="197559083"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2019 06:34:37 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 28 Aug 2019 16:34:36 +0300
Date:   Wed, 28 Aug 2019 16:34:36 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: i801: Use iTCO version 6 in Cannon Lake PCH and
 beyond
Message-ID: <20190828133436.GA3177@lahna.fi.intel.com>
References: <20190809124553.67012-1-mika.westerberg@linux.intel.com>
 <20190809124553.67012-3-mika.westerberg@linux.intel.com>
 <20190828152420.10fd9ed6@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828152420.10fd9ed6@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 28, 2019 at 03:24:20PM +0200, Jean Delvare wrote:
> Hi Mika,

Hi,

> On Fri, 9 Aug 2019 15:45:53 +0300, Mika Westerberg wrote:
> > Intel Cannon Lake PCH moved the NO_REBOOT bit to reside as part of the
> > TCO registers instead so update the i2c-i801 driver so that for Cannon
> > Lake and beyond register platform device for iTCO using version 6. The
> > affected PCHs are Cannon Lake, Cedar Fork, Comet Lake, Elkhart Lake and
> > Ice Lake.
> 
> Looks overall good, with just minor comments inline below.
> 
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 138 +++++++++++++++++++++-------------
> >  1 file changed, 86 insertions(+), 52 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index f2956936c3f2..6918406d00a5 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -292,7 +292,8 @@ struct i801_priv {
> >  #define FEATURE_HOST_NOTIFY	BIT(5)
> >  /* Not really a feature, but it's convenient to handle it as such */
> >  #define FEATURE_IDF		BIT(15)
> > -#define FEATURE_TCO		BIT(16)
> > +#define FEATURE_TCO_SPT		BIT(16)
> > +#define FEATURE_TCO_CNL		BIT(17)
> >  
> >  static const char *i801_feature_names[] = {
> >  	"SMBus PEC",
> > @@ -1491,57 +1492,37 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
> >  }
> >  #endif
> >  
> > -static const struct itco_wdt_platform_data tco_platform_data = {
> > +static const struct itco_wdt_platform_data cnl_tco_platform_data = {
> > +	.name = "Intel PCH",
> > +	.version = 6,
> > +};
> > +
> > +static struct platform_device *
> > +i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
> > +		 struct resource *tco_res)
> > +{
> > +	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> > +					tco_res, 2, &cnl_tco_platform_data,
> > +					sizeof(cnl_tco_platform_data));
> > +}
> > +
> > +static const struct itco_wdt_platform_data spt_tco_platform_data = {
> >  	.name = "Intel PCH",
> >  	.version = 4,
> >  };
> 
> I think it would make more sense to put the oldest code (v4) first and
> then the newest code (v6)?

Makes sense. I'll do that in v2.

> > (...)
> > @@ -1695,13 +1719,23 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >  	switch (dev->device) {
> >  	case PCI_DEVICE_ID_INTEL_SUNRISEPOINT_H_SMBUS:
> >  	case PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_SMBUS:
> > -	case PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS:
> > -	case PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS:
> >  	case PCI_DEVICE_ID_INTEL_LEWISBURG_SMBUS:
> >  	case PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS:
> > -	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
> >  	case PCI_DEVICE_ID_INTEL_DNV_SMBUS:
> >  	case PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS:
> > +		priv->features |= FEATURE_I2C_BLOCK_READ;
> > +		priv->features |= FEATURE_IRQ;
> > +		priv->features |= FEATURE_SMBUS_PEC;
> > +		priv->features |= FEATURE_BLOCK_BUFFER;
> > +		/* If we have ACPI based watchdog use that instead */
> > +		if (!acpi_has_watchdog())
> 
> What about setting the flag unconditionally and moving the call to
> acpi_has_watchdog() inside i801_add_tco()? To avoid the duplication of
> comment and call, and make future v7 easier too.

Yes, works for me.

> > +			priv->features |= FEATURE_TCO_SPT;
> > +		priv->features |= FEATURE_HOST_NOTIFY;
> > +		break;
> > +
> > +	case PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS:
> > +	case PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS:
> > +	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
> >  	case PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS:
> >  	case PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS:
> >  	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
> > @@ -1713,7 +1747,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >  		priv->features |= FEATURE_BLOCK_BUFFER;
> >  		/* If we have ACPI based watchdog use that instead */
> >  		if (!acpi_has_watchdog())
> > -			priv->features |= FEATURE_TCO;
> > +			priv->features |= FEATURE_TCO_CNL;
> >  		priv->features |= FEATURE_HOST_NOTIFY;
> >  		break;
> >  
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks!
