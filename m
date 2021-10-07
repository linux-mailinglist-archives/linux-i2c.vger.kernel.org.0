Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665554258ED
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 19:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242896AbhJGRKH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 13:10:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:39912 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242368AbhJGRKG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Oct 2021 13:10:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="249631415"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; 
   d="scan'208";a="249631415"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 10:06:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; 
   d="scan'208";a="522673087"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 10:05:57 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mYWq9-009bcw-Jj;
        Thu, 07 Oct 2021 20:05:53 +0300
Date:   Thu, 7 Oct 2021 20:05:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        wsa@kernel.org, treding@nvidia.com, mirq-linux@rere.qmqm.pl,
        s.shtylyov@omp.ru, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
Message-ID: <YV8o8agZ4O4bj6fa@smile.fi.intel.com>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
 <a63bbad2-b7b4-47da-93bd-4152a2c8b93f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a63bbad2-b7b4-47da-93bd-4152a2c8b93f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 07, 2021 at 07:40:04PM +0300, Dmitry Osipenko wrote:
> 29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:

...

> > +static int pci1xxxx_i2c_suspend(struct device *dev)
> > +{
> > +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> > +	struct pci_dev *pdev = to_pci_dev(dev);

How pdev is used?

> > +	u32 regval;
> > +
> > +	i2c_mark_adapter_suspended(&i2c->adap);
> > +
> > +	pci1xxxx_ack_high_level_intr(i2c, ALL_HIGH_LAYER_INTR);
> > +	pci1xxxx_i2c_config_high_level_intr(i2c, ALL_HIGH_LAYER_INTR, false);
> > +
> > +	/*
> > +	 * Enable the PERST_DIS bit to mask the PERST from
> > +	 * resetting the core regs
> > +	 */
> > +	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> > +	regval |= PERI_SMBUS_D3_RESET_DIS;
> > +	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pci1xxxx_i2c_resume(struct device *dev)
> > +{
> > +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);

> > +	struct pci_dev *pdev = to_pci_dev(dev);

Ditto.

> > +	u32 regval;
> > +
> > +	i2c_mark_adapter_resumed(&i2c->adap);
> > +
> > +	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> > +	regval &= ~PERI_SMBUS_D3_RESET_DIS;
> > +	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
> > +
> > +	return 0;
> > +}

-- 
With Best Regards,
Andy Shevchenko


