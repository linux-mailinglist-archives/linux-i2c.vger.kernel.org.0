Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11E3916C442
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgBYOnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:43:02 -0500
Received: from mga05.intel.com ([192.55.52.43]:22559 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728981AbgBYOnC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:43:02 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 06:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="350159283"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 25 Feb 2020 06:42:58 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 25 Feb 2020 16:42:57 +0200
Date:   Tue, 25 Feb 2020 16:42:57 +0200
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
Subject: Re: [PATCH 2/3] watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
Message-ID: <20200225144257.GD2667@lahna.fi.intel.com>
References: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
 <20200225123802.88984-3-mika.westerberg@linux.intel.com>
 <20200225143709.GA450@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225143709.GA450@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 25, 2020 at 06:37:09AM -0800, Guenter Roeck wrote:
> On Tue, Feb 25, 2020 at 03:38:01PM +0300, Mika Westerberg wrote:
> > The iTCO_wdt driver only needs ICH_RES_IO_SMI I/O resource when either
> > turn_SMI_watchdog_clear_off module parameter is set to match ->iTCO_version
> > (or higher), and when legacy iTCO_vendorsupport is set. Modify the driver
> > so that ICH_RES_IO_SMI is optional if the two conditions are not met.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/watchdog/iTCO_wdt.c | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> > index 156360e37714..f1692452bc25 100644
> > --- a/drivers/watchdog/iTCO_wdt.c
> > +++ b/drivers/watchdog/iTCO_wdt.c
> > @@ -460,7 +460,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
> >  		return -ENODEV;
> >  
> >  	p->smi_res = platform_get_resource(pdev, IORESOURCE_IO, ICH_RES_IO_SMI);
> > -	if (!p->smi_res)
> > +	if (!p->smi_res && iTCO_vendorsupport)
> >  		return -ENODEV;
> >  
> >  	p->iTCO_version = pdata->version;
> > @@ -492,15 +492,19 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
> >  	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
> >  	p->update_no_reboot_bit(p->no_reboot_priv, true);
> >  
> > -	/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
> > -	if (!devm_request_region(dev, p->smi_res->start,
> > -				 resource_size(p->smi_res),
> > -				 pdev->name)) {
> > -		pr_err("I/O address 0x%04llx already in use, device disabled\n",
> > -		       (u64)SMI_EN(p));
> > -		return -EBUSY;
> > -	}
> >  	if (turn_SMI_watchdog_clear_off >= p->iTCO_version) {
> > +		if (!p->smi_res) {
> > +			pr_err("SMI I/O resource is missing\n");
> > +			return -EINVAL;
> > +		}
> > +		/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
> > +		if (!devm_request_region(dev, p->smi_res->start,
> > +					 resource_size(p->smi_res),
> > +					 pdev->name)) {
> > +			pr_err("I/O address 0x%04llx already in use, device disabled\n",
> > +			       (u64)SMI_EN(p));
> > +			return -EBUSY;
> > +		}
> 
> The request_region call is also needed if iTCO_vendorsupport is true.
> Well, not strictly speaking, I guess, but then one could argue that
> it isn't needed at all.

Indeed, this is good point as well. Will be fixed in v2.

> In this context - looking into the vendorsupport code, I wonder if
> it is time to retire it. Separate patch, of course, but still.
> Any thoughts ?

No objections from me ;-)
