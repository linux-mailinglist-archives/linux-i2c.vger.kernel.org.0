Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AD43E16DE
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 16:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237913AbhHEOYt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 10:24:49 -0400
Received: from mga01.intel.com ([192.55.52.88]:43414 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233040AbhHEOYs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Aug 2021 10:24:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="236130824"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="236130824"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 07:24:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="437808153"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 07:24:32 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 05 Aug 2021 17:24:29 +0300
Date:   Thu, 5 Aug 2021 17:24:29 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 07/10] i2c: i801: Improve i801_acpi_probe/remove functions
Message-ID: <YQv0nXYD/FZn/BU8@lahna>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <064c1f0b-9f79-3fb2-cac1-35ef26c33296@gmail.com>
 <20210805153857.442ca8e7@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805153857.442ca8e7@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 05, 2021 at 03:38:57PM +0200, Jean Delvare wrote:
> On Sun, 01 Aug 2021 16:21:54 +0200, Heiner Kallweit wrote:
> > By using ACPI_HANDLE() the handler argument can be retrieved directly.
> > Both address space handler functions check the handler argument and
> > return an error if it's NULL. This allows to further simplify the code.
> > 
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 23 +++++++----------------
> >  1 file changed, 7 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index 5b9eebc1c..5fa8dc1cb 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1633,31 +1633,22 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
> >  
> >  static int i801_acpi_probe(struct i801_priv *priv)
> >  {
> > -	struct acpi_device *adev;
> > +	acpi_handle ah = ACPI_HANDLE(&priv->pci_dev->dev);
> >  	acpi_status status;
> >  
> > -	adev = ACPI_COMPANION(&priv->pci_dev->dev);
> > -	if (adev) {
> > -		status = acpi_install_address_space_handler(adev->handle,
> > -				ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler,
> > -				NULL, priv);
> > -		if (ACPI_SUCCESS(status))
> > -			return 0;
> > -	}
> > +	status = acpi_install_address_space_handler(ah, ACPI_ADR_SPACE_SYSTEM_IO,
> > +						    i801_acpi_io_handler, NULL, priv);
> > +	if (ACPI_SUCCESS(status))
> > +		return 0;
> >  
> >  	return acpi_check_resource_conflict(&priv->pci_dev->resource[SMBBAR]);
> >  }
> >  
> >  static void i801_acpi_remove(struct i801_priv *priv)
> >  {
> > -	struct acpi_device *adev;
> > -
> > -	adev = ACPI_COMPANION(&priv->pci_dev->dev);
> > -	if (!adev)
> > -		return;
> > +	acpi_handle ah = ACPI_HANDLE(&priv->pci_dev->dev);
> >  
> > -	acpi_remove_address_space_handler(adev->handle,
> > -		ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
> > +	acpi_remove_address_space_handler(ah, ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
> >  }
> >  #else
> >  static inline int i801_acpi_probe(struct i801_priv *priv) { return 0; }
> 
> Looks completely reasonable.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> 
> Mika, no objection?

No.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
