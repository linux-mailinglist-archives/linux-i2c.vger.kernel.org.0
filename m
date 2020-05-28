Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D5C1E5C91
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 12:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387565AbgE1KAC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 06:00:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:39342 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387535AbgE1KAB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 May 2020 06:00:01 -0400
IronPort-SDR: 3eTb4oBxZKr8AD5gXY9zeg+FJ+UVykDX39EUnWqBeP5gvpdNPVY6BIt9KnNfOTTlDNOpJbwOig
 yDIJFN3TiT1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 03:00:01 -0700
IronPort-SDR: C422pIESa4+FCLd5eukMTbvxYRexqJQsydMgHFSYaVD8nn2JqrmmyMX5EiITzUwVB49luQE+0J
 rM1juCqmjPyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; 
   d="scan'208";a="270799732"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 28 May 2020 02:59:58 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jeFKS-009P7x-UZ; Thu, 28 May 2020 13:00:00 +0300
Date:   Thu, 28 May 2020 13:00:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200528100000.GF1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-3-Sergey.Semin@baikalelectronics.ru>
 <20200527171204.GA2348490@bogus>
 <20200527171841.am2iaynff243xoep@mobilestation>
 <20200527175624.GT1634618@smile.fi.intel.com>
 <20200528083923.yjlm5ur7cslgxdau@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200528083923.yjlm5ur7cslgxdau@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 28, 2020 at 11:39:23AM +0300, Serge Semin wrote:
> On Wed, May 27, 2020 at 08:56:24PM +0300, Andy Shevchenko wrote:
> > On Wed, May 27, 2020 at 08:18:41PM +0300, Serge Semin wrote:
> > > On Wed, May 27, 2020 at 11:12:04AM -0600, Rob Herring wrote:
> > > > On Wed, May 27, 2020 at 03:01:02PM +0300, Serge Semin wrote:
> > > > > dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> > > > > i2c "reg" property. If it is the compiler will print a warning:
> > > > > 
> > > > > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > > > > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> > > > > 
> > > > > In order to silence dtc up let's discard the flag from the DW I2C DT
> > > > > binding example for now. Just revert this commit when dtc is fixed.
> > 
> > > > >        eeprom@64 {
> > > > >          compatible = "linux,slave-24c02";
> > > > > -        reg = <0x40000064>;
> > > > > +        reg = <0x64>;
> > > > 
> > > > But the compatible is a slave, so you need an example with a different 
> > > > device.
> > > 
> > 
> > > Ok. I'll replace the sub-node with just "atmel,24c02" compatible string then.
> > 
> > But how it will be different to the another slave connected to the master?
> > 
> > This example is specifically to show that DesingWare I²C controller may be
> > switched to slave mode.
> 
> Well, dtc doesn't support it and prints warning that the address is invalid.
> Though I do understand you concern and is mostly agree with it. Let's do this in
> the next way. I'll resend the series with eeprom@64 sub-node replaced with just
> a normal eeprom-device. The message log will have an info why this has been
> done. In the non-mergeable section of the patch I'll suggest to Rob reconsider
> the patch acking, since we can leave the slave-marked sub-node and just live
> with the dtc warning until it's fixed in there.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


