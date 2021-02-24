Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD32323CF1
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 14:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhBXM7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 07:59:36 -0500
Received: from mga18.intel.com ([134.134.136.126]:12671 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235266AbhBXMw5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Feb 2021 07:52:57 -0500
IronPort-SDR: 4eawBURkoU4OOMLMMXMVEDhXqOVgvGWhLiLkYZhaNahWzE4stpt5Pt/U1nNRkTf13bPcRf72j4
 MjcK5sNtoAvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="172809157"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; 
   d="scan'208";a="172809157"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2021 04:51:11 -0800
IronPort-SDR: NVhkLXqSmRpTe1KT9ucg9QFiHu/DzGjpEJ0jcAUrAQ0o2WQqR8s0tUDcL5L8XZpveRw1xi3l9F
 I7IY6T+e61Qg==
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; 
   d="scan'208";a="499567378"
Received: from unknown (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2021 04:51:10 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lEtdD-007lqb-Ky; Wed, 24 Feb 2021 14:51:07 +0200
Date:   Wed, 24 Feb 2021 14:51:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: cht-wc: Use fwnode for the controller and
 IRQ domain
Message-ID: <YDZLuzNivBP4HcPd@smile.fi.intel.com>
References: <20210223172231.2224-1-andriy.shevchenko@linux.intel.com>
 <fea7ce9a-01a9-cab8-8675-be5c44cb8a27@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fea7ce9a-01a9-cab8-8675-be5c44cb8a27@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 23, 2021 at 08:25:35PM +0100, Hans de Goede wrote:
> On 2/23/21 6:22 PM, Andy Shevchenko wrote:
> > It's better to describe the I²C controller and associated IRQ domain with
> > fwnode, so they will find their place in the hierarchy in sysfs and also
> > make easier to debug.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > 
> > Hans, unfortunately I have no device at hand with INT34D3. This is only compile
> > tested in that sense. Also I would like to hear if you like the idea in general.
> > 
> >  drivers/i2c/busses/i2c-cht-wc.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> > index f80d79e973cd..dbf55842b0dc 100644
> > --- a/drivers/i2c/busses/i2c-cht-wc.c
> > +++ b/drivers/i2c/busses/i2c-cht-wc.c
> > @@ -303,6 +303,7 @@ static struct bq24190_platform_data bq24190_pdata = {
> >  static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
> >  {
> >  	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
> > +	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
> 
> So this will point to the ACPi-companion fwnode of the CHT Whiskey Cove PMIC
> controller.

Right.

> >  	struct cht_wc_i2c_adap *adap;
> >  	struct i2c_board_info board_info = {
> >  		.type = "bq24190",
> > @@ -333,6 +334,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
> >  	strlcpy(adap->adapter.name, "PMIC I2C Adapter",
> >  		sizeof(adap->adapter.name));
> >  	adap->adapter.dev.parent = &pdev->dev;
> > +	set_primary_fwnode(&adap->adapter.dev, fwnode);
> 
> So now we have the main PMIC device i2c-client, the platform-device instantiated
> for the MFD-cell for the PMIC's builtin I2C-controller; and the device instantiated
> for the adapter-device all 3 share the same ACPI-companion fwnode.

Okay, this step in this patch maybe not needed (or should be a separate change,
but I don't see clearly what would be the benefit out of it).

> >  	/* Clear and activate i2c-adapter interrupts, disable client IRQ */
> >  	adap->old_irq_mask = adap->irq_mask = ~CHT_WC_EXTCHGRIRQ_ADAP_IRQMASK;
> > @@ -350,8 +352,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
> >  		return ret;
> >  
> >  	/* Alloc and register client IRQ */
> > -	adap->irq_domain = irq_domain_add_linear(pdev->dev.of_node, 1,
> > -						 &irq_domain_simple_ops, NULL);
> > +	adap->irq_domain = irq_domain_create_linear(fwnode, 1,
> > +						    &irq_domain_simple_ops, NULL);
> 
> Hmm, not sure this is right, admittedly the old code looks weird too, but now we
> are creating a second irq_domain at the same level as the irq_domain created for
> the IRQ-chip part of the PMIC. But this is really more of a child-domain of just
> the I2C-controller MFD-cell. The IRQ-CHIP part of the PMIC has a single IRQ for the
> I2C controller which gets raised both on i2c-transfer completions and when the
> pin on the PMIC which is reserved as input for the IRQ coming out of the charger-chip
> gets triggered.
> 
> IOW we have this:
> 
> 
>                PMIC
>                  |
>     ------------------------------
>     |       |        |           |
>    IRQ1   IRQ2      IRQ3       I2C-IRQ
>                                  |
>                    ----------------------------------
>                    |        |         |             |
>                  READIRQ   WRIRQ    NACKIRQ     CLIENT-IRQ
> 
> Where READIRQ, WRIRQ and NACKIRQ are directly consumed
> and the CLIENT-IRQ is being represented as a single IRQ on
> a new irqchip so that we can pass it along to the i2c-driver
> for the charger-chip which is connected to the Whiskey Cove's
> builtin I2C controller.
> 
> But doing as you suggest would model the IRQs as:
> 
>                PMIC
>                  |
>     --------------------------------------------------
>     |       |        |           |                    |
>    IRQ1   IRQ2      IRQ3       I2C-IRQ           CLIENT-IRQ
> 
> Which is not the same really. I guess it is better then what we
> have though ?

Hmm... There should not be difference in the hierarchy. add_linear ==
create_linear. The propagation of *device* (not an IRQ) fwnode is just
convenient way to have IRQ domain be named (instead of 'unknown-N' or so).
Maybe I have read __irq_domain_add() code wrongly.

Nevertheless, thinking more about it, why we don't add an IRQ chip via regmap
IRQ API?

> Note I can test any changes made here, but I'm not 100% convinced that
> the current version of this patch is correct.

If we settle on the idea first. I'm (slowly) looking forward to check another
CherryTrail device we have at the lab, but we lack of some (power) equipment
right now to setup it properly. I hope it may have the Whiskey Cove PMIC there.

-- 
With Best Regards,
Andy Shevchenko


