Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3267F41CA86
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 18:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbhI2QqY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 12:46:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:55676 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229561AbhI2QqX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 12:46:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="221781795"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="221781795"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 09:44:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="520894343"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 09:44:40 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mVchB-006sIX-9q;
        Wed, 29 Sep 2021 19:44:37 +0300
Date:   Wed, 29 Sep 2021 19:44:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        wsa@kernel.org, treding@nvidia.com, mirq-linux@rere.qmqm.pl,
        s.shtylyov@omp.ru, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
Message-ID: <YVSX9ZE5hJpYNgN5@smile.fi.intel.com>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
 <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 29, 2021 at 10:18:46AM +0300, Dmitry Osipenko wrote:
> 29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:

...

> return intr_handled ? IRQ_HANDLED : IRQ_NONE;

> Or turn intr_handled into "irqreturn_t ret" and return it directly.

Or
	return IRQ_RETVAL(...);

...

> > +static const struct pci_device_id pci1xxxx_i2c_pci_id_table[] = {
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI12000_I2C_PID) },
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11010_I2C_PID) },
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11101_I2C_PID) },
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11400_I2C_PID) },
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11414_I2C_PID) },

If you switch to PCI_VDEVIDE, you will see how you may improve the device ID
definitions.

> > +	{0, }

Redundant content inside curly braces.

> > +};

> > +

Redundant blank line.

> > +MODULE_DEVICE_TABLE(pci, pci1xxxx_i2c_pci_id_table);

-- 
With Best Regards,
Andy Shevchenko


