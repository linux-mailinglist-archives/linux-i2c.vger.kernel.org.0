Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CE7422121
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 10:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhJEIvT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 04:51:19 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43061 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhJEIvT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 04:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1633423769; x=1664959769;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WNVpdwYZisfJCIhpCVBvPn0kt5a/f2Y6zS5O5OknR7E=;
  b=yT/CgEn6g2zDnW0Bpuu80X52E4K2VT0+vqSXeGyK+qEmhbtjr57xq5Ah
   Y9mNpUDAl+eh1ZKMe/VpOrUEKjrjOXCdoen3WDaQQoWIvjWQ13Ka48Vkj
   Ler/A7Z8viItsTxgUXKWftIbEo7i/b0szanYBDpEPMfTK7pKpzMa1rd4E
   3xnvmjYjtFzQba/lbcFcXz6UTvOSPk/LMaOiBdspK875mZ2mWaiue6ie6
   9IacnTYxz3EeDZd0P6Q6a93v2xJLgbgxLJXpzs0sZtns8mgD0llebiiME
   xXdbx1kxxKIFG6J/m3B74q9dYSTu3kZUtgDwIw2DWXVivxc9+mx92AN9R
   w==;
IronPort-SDR: g3A9k2qWzuWTJ+/dzll6kZoYZgYsCOukPWtJlY7D/ZOVLC8qmrOxHd0RZLFRVLvkdZ63tkcN2h
 J9vk6J7ZTpmbw0g3uW/dhKOqo/U/el7SUsxVO6zm8V2IHo5MncIogIF/IjsNBPEgEs4DovLEp+
 HTCmbL6fgS7+mnDaZnFoRcMun01tCum6Co19BVfdgipSx9GpO7L5PahinAJqUePXxwTtWOTG/t
 J4nMcH42WXvMiPBAYsrbmcZH5g4FFqbQeQ5g4QeW5A3mr6U/Cy7IaDMM9rH9mB5JBLPe9HOMgS
 hsMf/T4h8TEj9w/015iDWEfi
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="138489542"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2021 01:49:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 5 Oct 2021 01:49:28 -0700
Received: from CHE-LT-I41642.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 5 Oct 2021 01:49:24 -0700
Message-ID: <c49d3e03075b136b8d5717be8291bccb35564b62.camel@microchip.com>
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
From:   LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     <wsa@kernel.org>, <treding@nvidia.com>, <mirq-linux@rere.qmqm.pl>,
        <s.shtylyov@omp.ru>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>
Date:   Tue, 5 Oct 2021 14:19:23 +0530
In-Reply-To: <YVSX9ZE5hJpYNgN5@smile.fi.intel.com>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
         <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
         <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
         <YVSX9ZE5hJpYNgN5@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2021-09-29 at 19:44 +0300, Andy Shevchenko wrote:
> [Some people who received this message don't often get email from
> andriy.shevchenko@linux.intel.com. Learn why this is important at 
> http://aka.ms/LearnAboutSenderIdentification.]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Wed, Sep 29, 2021 at 10:18:46AM +0300, Dmitry Osipenko wrote:
> > 29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:
> 
> ...
> 
> > return intr_handled ? IRQ_HANDLED : IRQ_NONE;
> > Or turn intr_handled into "irqreturn_t ret" and return it directly.
> 
> Or
>         return IRQ_RETVAL(...);

Ok. I will change it.

> 
> ...
> 
> > > +static const struct pci_device_id pci1xxxx_i2c_pci_id_table[] =
> > > {
> > > +   { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI12000_I2C_PID) },
> > > +   { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11010_I2C_PID) },
> > > +   { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11101_I2C_PID) },
> > > +   { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11400_I2C_PID) },
> > > +   { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11414_I2C_PID) },
> 
> If you switch to PCI_VDEVIDE, you will see how you may improve the
> device ID
> definitions.

ok.Got it.Will change it.

> 
> > > +   {0, }
> 
> Redundant content inside curly braces.

ok. I will remove the contents inside curly braces.

> 
> > > +};
> > > +
> 
> Redundant blank line.

ok. I will remove it.

> 
> > > +MODULE_DEVICE_TABLE(pci, pci1xxxx_i2c_pci_id_table);
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 

