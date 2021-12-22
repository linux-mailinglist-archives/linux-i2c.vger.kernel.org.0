Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A098A47D678
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 19:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbhLVSWo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 13:22:44 -0500
Received: from mga05.intel.com ([192.55.52.43]:49505 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233546AbhLVSWo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 13:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640197364; x=1671733364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UytwEb3+c8/wQ6EY9o2Yg0L5wZPBs2TXHcq2aYgeUnY=;
  b=Ew8keT0TF+j6hJbWd2F1KJ0qzoZADkR8zrkMptJvaBb4R8682ed/K62Q
   lkkvivMkxIqEAGwNC4kGJ/pUAfBuUmeFzaM0ij7KqRWcMB2X49gOGuLAt
   IUU4zZG8foG4JuBpg40h+6e8qRuQbdz1Dd5x1WuUQEdw8WNCG/jmezpvd
   Ss+6jPtzBCvuQZQjKerGSV0aZriRaUVk0hNf3/+x5OK/uwQsnxKZ5ycoI
   QKhp4HBYvgbww8GaaohHKVvUTrE6P8q8odUonQXmnJHl1zorZ5ZW8HcAX
   afkA1XQDXxUOLjHOB2F6maNUmt2iH+PSFLJqg6t0JT85KxK/dtM2yW9ak
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="326992133"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="326992133"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 10:22:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="607514029"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 10:22:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n06El-000url-R8;
        Wed, 22 Dec 2021 20:21:15 +0200
Date:   Wed, 22 Dec 2021 20:21:15 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, mw@semihalf.com, jaz@semihalf.com,
        upstream@semihalf.com
Subject: Re: [RFC 0/2] i2c-designware: Add support for AMD PSP semaphore
Message-ID: <YcNsm+/JRJIlo/h2@smile.fi.intel.com>
References: <20211222094558.2098791-1-jsd@semihalf.com>
 <YcMP/9ATna3/yckC@smile.fi.intel.com>
 <20211222175621.7gikyvqu7xvc2qxb@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222175621.7gikyvqu7xvc2qxb@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 22, 2021 at 08:56:21PM +0300, Serge Semin wrote:
> On Wed, Dec 22, 2021 at 01:46:07PM +0200, Andy Shevchenko wrote:
> > On Wed, Dec 22, 2021 at 10:45:56AM +0100, Jan Dabros wrote:
> > > This patchset comprises support for new i2c-designware controller setup on some
> > > AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
> > > controller and acts as an i2c arbitrator there (x86 is leasing bus from it).
> > > 
> > > First commit aims to improve generic i2c-designware code by adding extra locking
> > > on probe() and disable() paths. I would like to ask someone with access to
> > > boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
> > > behavior of my changes on such setup.
> > > 
> > > Second commit adds support for new PSP semaphore arbitration mechanism.
> > > Implementation is similar to the one from i2c-designware-baytrail.c however
> > > there are two main differences:
> > > 1) Add new ACPI ID in order to protect against silent binding of the old driver
> > > to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added to this
> > > new _HID allows to recognize setup with PSP.
> > > 2) Beside acquire_lock() and release_lock() methods we are also applying quirks
> > > to the lock_bus() and unlock_bus() global adapter methods. With this in place
> > > all i2c clients drivers may lock i2c bus for a desired number of i2c
> > > transactions (e.g. write-wait-read) without being aware of that such bus is
> > > shared with another entity.
> > > 
> > > Mark this patchset as RFC, since waiting for new ACPI ID value. As a temporary
> > > measure use "AMDI9999". Once proper one will be ready, will re-send this CL for
> > > review & merge.
> > > 
> > > Looking forward to some feedback.
> > 
> > If I am not mistaken something similar happened in Baikal T1.
> > Perhaps Serge has something to share.
> 
> No, Baikal-T1 doesn't have such specific interface sharing since it
> doesn't have any co-processor (though a scenario of booting different
> kernels on each CPU core was at consideration by some our customers).
> So the only peculiar things the SoC has got are two interfaces with
> non-standard access:
> 1) DW SPI controller with memory mapped 16MB direct EEPROM access. DW
> SPI CSR/EEPROM mapping are switched by a multiplexer (basically just a
> flag) embedded into the system controller.
> 2) DW i2c controller with indirect registers access. Originally it was
> supposed to be used by the system bootloader for some bootloading
> stuff, but the actual usage scenario wasn't described by the SoC
> engineers. The chip initially loads the code from the SPI-flash only,
> which can be of up to 16MB size. It's more than enough to start pretty
> complex systems, so an additional i2c interface turned to be not
> really needed. Anyway other than having an indirectly accessible
> CSRs it's pretty much normal DW I2C controller.
> 
> But you are right in a reference to another BE-chip - Baikal-M1. The
> i2c/spi/gpio/uart interfaces sharing support might get to be needed
> for it since aside with four 2-cored Cortex-A57 clusters it has got an
> embedded SCP co-processor which can access the same SoC interfaces as
> the CPU cores. Though Baikal-M1 isn't supported by the mainline kernel
> at the moment. We are going to start working on it on the next year.
> Then we'll most likely need to implement the interface sharing feature
> like the one introduced in this RFC. But for now alas I can't be much
> helpful.

Anyway, thanks for your insights!

-- 
With Best Regards,
Andy Shevchenko


