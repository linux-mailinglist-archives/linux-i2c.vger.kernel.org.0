Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13073E1497
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 14:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233472AbhHEMT1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 08:19:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:18318 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239378AbhHEMT1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Aug 2021 08:19:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="213868702"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="213868702"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 05:19:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="442377892"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 05:19:07 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 05 Aug 2021 15:19:05 +0300
Date:   Thu, 5 Aug 2021 15:19:05 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 03/10] i2c: i801: Make p2sb_spinlock a mutex
Message-ID: <YQvXOQWQS6OTUj9G@lahna>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <2e727b49-b59b-fad9-6ed3-febc5b98b8d4@gmail.com>
 <20210805104939.1dd2995a@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805104939.1dd2995a@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 05, 2021 at 10:49:39AM +0200, Jean Delvare wrote:
> On Sun, 01 Aug 2021 16:18:38 +0200, Heiner Kallweit wrote:
> > p2sb_spinlock is used in i801_add_tco_spt() only and in process context
> > only. Therefore a mutex is sufficient, and we can make the definition
> > local to i801_add_tco_spt().
> 
> Mika, no objection?

No objections from my side :)

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index bdb619bc0..504f02e1e 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1492,12 +1492,11 @@ static const struct itco_wdt_platform_data spt_tco_platform_data = {
> >  	.version = 4,
> >  };
> >  
> > -static DEFINE_SPINLOCK(p2sb_spinlock);
> > -
> >  static struct platform_device *
> >  i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
> >  		 struct resource *tco_res)
> >  {
> > +	static DEFINE_MUTEX(p2sb_mutex);
> 
> To be on the safe side, we should explicitly #include <linux/mutex.h>.
> 
> >  	struct resource *res;
> >  	unsigned int devfn;
> >  	u64 base64_addr;
> > @@ -1510,7 +1509,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
> >  	 * enumerated by the PCI subsystem, so we need to unhide/hide it
> >  	 * to lookup the P2SB BAR.
> >  	 */
> > -	spin_lock(&p2sb_spinlock);
> > +	mutex_lock(&p2sb_mutex);
> >  
> >  	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
> >  
> > @@ -1528,7 +1527,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
> >  	/* Hide the P2SB device, if it was hidden before */
> >  	if (hidden)
> >  		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
> > -	spin_unlock(&p2sb_spinlock);
> > +	mutex_unlock(&p2sb_mutex);
> >  
> >  	res = &tco_res[1];
> >  	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> -- 
> Jean Delvare
> SUSE L3 Support
