Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23A795AB403
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Sep 2022 16:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbiIBOsW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Sep 2022 10:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236498AbiIBOr7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Sep 2022 10:47:59 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1497AA9243;
        Fri,  2 Sep 2022 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662127713; x=1693663713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c7Z/N5tHcfEnQNOU6Imm0br8Q97DRPhQZDzGctYv+DQ=;
  b=XqE66Wpxhv7zBkkePnlarzFIqXXZgA9jMgXOw4zjxbAU9Ilw4MlBT8Ee
   CEXaL83yfLinFbvIv5Hw2/aa9VzUU/O61Q9+8f5raQrS1SyJ+gVRAWFFM
   ptg+cVDH+aKQFU4bl/PfsSq8xOuEaeC3UoJ3d1nyBANrN1LkKn2YohUWe
   g8568kW7mOUcRSyWbnbFWtpbE4VD8hRMDn6o2dKNWX4kozB/syffuRJYa
   9hXbJbSCNryjqwZ8/UcswtBq1h2ftB3keGt0KuxNCJ7N4M+cA05sAkw5z
   URLLrUTAyG3g+MCIWYeBQSz7ur7h63u+f5qGZTBdo3pEaPaJNkPRo41IY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="293565038"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="293565038"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 07:08:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="613046760"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 07:08:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oU7LN-007Pvx-0U;
        Fri, 02 Sep 2022 17:08:25 +0300
Date:   Fri, 2 Sep 2022 17:08:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tharunkumar.Pasumarthi@microchip.com
Cc:     UNGLinuxDriver@microchip.com, wsa@kernel.org, krzk@kernel.org,
        sven@svenpeter.dev, robh@kernel.org, semen.protsenko@linaro.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        olof@lixom.net, linux-i2c@vger.kernel.org, jsd@semihalf.com,
        arnd@arndb.de, rafal@milecki.pl
Subject: Re: [PATCH v2 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YxIOWMqjP2+k7MPi@smile.fi.intel.com>
References: <20220901013626.2213100-1-tharunkumar.pasumarthi@microchip.com>
 <YxD+NTWok2vkYos/@smile.fi.intel.com>
 <2345b4bcd0c529878307b2a84364ea849005eed9.camel@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2345b4bcd0c529878307b2a84364ea849005eed9.camel@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 02, 2022 at 11:31:11AM +0000, Tharunkumar.Pasumarthi@microchip.com wrote:
> On Thu, 2022-09-01 at 21:47 +0300, Andy Shevchenko wrote:

...

> > > +             if (buf)
> > > +                     memcpy_toio((i2c->i2c_base + SMBUS_MST_BUF), buf,
> > > transferlen);
> > 
> > Why do you need buf checks? Is your code can shoot itself in the foot?
> 
> Yes, buf will be passed as NULL in some cases. So, this check is required.

Can you show an excerpt of the caller which passes NULL?

...

> > Each long sleep (20 ms is quite long) has to be explained. But this entire
> > loop
> > looks like a band-aid of lack of IRQ or so. Why do you need to poll?
> 
> This handling takes care of special case when system is put to suspend when i2c
> transfer is progress in driver. We will wait until transfer completes.

This should be at least a comment in the code.

...

> > > +     pci1xxxx_i2c_init(i2c);
> > 
> > Here you need to wrap pci1xxxx_i2c_shutdown() to be devm_. See below.
> > 
> > > +     ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> > > +     if (ret < 0) {
> > > +             pci1xxxx_i2c_shutdown(i2c);
> 
> I am not getting. Are you suggesting to change API name to
> devm_pci1xxxx_i2c_shutdown?
> 
> > > +
> > > +     ret = devm_i2c_add_adapter(&pdev->dev, &i2c->adap);
> > > +     if (ret) {
> > > +             dev_err(&pdev->dev, "i2c add adapter failed = %d\n", ret);
> > 
> > > +             pci1xxxx_i2c_shutdown(i2c);
> > 
> > You can't mix devm_ and non-devm_ in such manner. It's asking for troubles at
> > ->remove() or unbind stages.
> 
> I am not getting this comment. Can you kindly explain more.
> 
> > > +             return ret;

Explanations [1] & [2]. Example how to workaround [3].

[1]: https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1949091.html
[2]: https://lore.kernel.org/all/YXktrG1LhK5tj2uF@smile.fi.intel.com/
[3]: https://www.spinics.net/lists/kernel/msg4433985.html

...

> > After fixing above, convert the error messages to use
> > 
> >         return dev_err_probe(...);
> > 
> > pattern.
> 
> Okay.

Will be result of above fix.

...

> > > +static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
> > > +{
> > > +     struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);
> > > +
> > > +     pci1xxxx_i2c_shutdown(i2c);
> > > +}
> > 
> > This will be gone.
> 
> I am not getting this comment also.

See above.

-- 
With Best Regards,
Andy Shevchenko


