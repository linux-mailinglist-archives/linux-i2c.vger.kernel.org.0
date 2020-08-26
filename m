Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221E3252ACF
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 11:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgHZJyB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 05:54:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:49869 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728015AbgHZJyA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 05:54:00 -0400
IronPort-SDR: LjdUoW53qu+1uUy75Z8qe39RUcls+12BM29IMRIthutdQGl37GHMUXjZWm2HZY92ZDbUahb8km
 ejhtGbPm4Q0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="153685914"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="153685914"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 02:54:00 -0700
IronPort-SDR: HqiwYhheKSRXgUX9Wqj4PebZedUQtOZ3bkxHdV1FhUOYsmxvnvpEGDPctHo7bU83QTOjOEQtXe
 9DEKdUomlBKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="329167851"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2020 02:53:58 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kAs7w-00BXF7-He; Wed, 26 Aug 2020 12:53:56 +0300
Date:   Wed, 26 Aug 2020 12:53:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826095356.GG1891694@smile.fi.intel.com>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826052544.GA500@jagdpanzerIV.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 26, 2020 at 02:25:44PM +0900, Sergey Senozhatsky wrote:
> On (20/08/26 07:08), Wolfram Sang wrote:
> > On Wed, Aug 26, 2020 at 01:29:37PM +0900, Sergey Senozhatsky wrote:
> > > Unlike acpi_match_device(), acpi_driver_match_device() does
> > > consider devices that provide of_match_table and performs
> > > of_compatible() matching for such devices. The key point here is
> > > that ACPI of_compatible() matching - acpi_of_match_device() - is
> > > part of ACPI and does not depend on CONFIG_OF.
> > > 
> > > Consider the following case:
> > > o !CONFIG_OF system
> > > o probing of i2c device that provides .of_match_table, but no .id_table
> > > 
> > >  i2c_device_probe()
> > >  ...
> > >    if (!driver->id_table &&
> > >        !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
> > >        !i2c_of_match_device(dev->driver->of_match_table, client)) {
> > >        status = -ENODEV;
> > >        goto put_sync_adapter;
> > >    }
> > > 
> > > i2c_of_match_device() depends on CONFIG_OF and, thus, is always false.
> > > i2c_acpi_match_device() does ACPI match only, no of_comtatible() matching
> > > takes place, even though the device provides .of_match_table and ACPI,
> > > technically, is capable of matching such device. The result is -ENODEV.
> > > Probing will succeed, however, if we'd use .of_match_table aware ACPI
> > > matching.

Looks like you read same StackOverflow question :-)

> > > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > 
> > We have currently this in for-current which is even removing
> > i2c_acpi_match_device():
> > 
> > http://patchwork.ozlabs.org/project/linux-i2c/list/?series=196990&state=*
> 
> Oh, nice!
> Can we go a bit further and use i2c_device_match() in i2c_device_probe()
> instead of a mix of APIs from different subsystems?

> E.g.
> 
>         if (!driver->id_table &&
> -           !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
> -           !i2c_of_match_device(dev->driver->of_match_table, client)) {
> +           !(client && i2c_device_match(&client->dev, dev->driver))) {

You probably meant simply:

	if (!i2c_device_match(dev, dev->driver)) {

>                 status = -ENODEV;
>                 goto put_sync_adapter;
>         }

On the first glance it will work the same way but slightly longer in case of ID
table matching.

Send a patch!

-- 
With Best Regards,
Andy Shevchenko


