Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5791216C439
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730805AbgBYOkx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:40:53 -0500
Received: from mga05.intel.com ([192.55.52.43]:22384 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730532AbgBYOkw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:40:52 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 06:40:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="350159059"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 25 Feb 2020 06:40:48 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 25 Feb 2020 16:40:47 +0200
Date:   Tue, 25 Feb 2020 16:40:47 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: i801: Do not add ICH_RES_IO_SMI if PMC device
 is not present
Message-ID: <20200225144047.GC2667@lahna.fi.intel.com>
References: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
 <20200225123802.88984-4-mika.westerberg@linux.intel.com>
 <2dec872e-26fb-eefc-5606-cfb1bf55d02e@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dec872e-26fb-eefc-5606-cfb1bf55d02e@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 25, 2020 at 06:21:16AM -0800, Guenter Roeck wrote:
> On 2/25/20 4:38 AM, Mika Westerberg wrote:
> > Martin noticed that nct6775 driver does not load properly on his system
> > in v5.4+ kernels. The issue was bisected to commit b84398d6d7f9 ("i2c:
> > i801: Use iTCO version 6 in Cannon Lake PCH and beyond") but it is
> > likely not the culprit because the faulty code has been in the driver
> > already since commit 9424693035a5 ("i2c: i801: Create iTCO device on
> > newer Intel PCHs"). So more likely some commit that added PCI IDs of
> > recent chipsets made the driver to create the iTCO_wdt device on Martins
> > system.
> > 
> > The issue was debugged to be PCI configuration access to the PMC device
> > that is not present. This returns all 1's when read and this caused the
> > iTCO_wdt driver to accidentally request resourses used by nct6775.
> > 
> > Fix this by checking that the PMC device is there and only then populate
> > the iTCO_wdt ICH_RES_IO_SMI resource. Since the resource is now optional
> > the iTCO_wdt driver should continue to work on recent systems without it.
> > 
> > Link: https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com/
> > Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> > Reported-by: Martin Volf <martin.volf.42@gmail.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >   drivers/i2c/busses/i2c-i801.c | 45 +++++++++++++++++++++--------------
> >   1 file changed, 27 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index ca4f096fef74..7fa58375bd4b 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1519,7 +1519,7 @@ static DEFINE_SPINLOCK(p2sb_spinlock);
> >   static struct platform_device *
> >   i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
> > -		 struct resource *tco_res)
> > +		 struct resource *tco_res, size_t nres)
> >   {
> >   	struct resource *res;
> >   	unsigned int devfn;
> > @@ -1563,7 +1563,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
> >   	res->flags = IORESOURCE_MEM;
> >   	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> > -					tco_res, 3, &spt_tco_platform_data,
> > +					tco_res, nres + 1, &spt_tco_platform_data,
> 
> Does this work as intended ? It still adds ICH_RES_MEM_OFF at index 2,
> but if there is no SMI resource it will only pass two sets of resources
> to the wdt driver, one of which (the SMI resource) would be empty,
> ie have start == NULL and size == 0.

Good point that would not work as expected. I'll fix this one in the
next version.
