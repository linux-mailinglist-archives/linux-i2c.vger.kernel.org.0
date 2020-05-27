Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6351E4C73
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 19:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388560AbgE0R4Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 13:56:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:56350 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387653AbgE0R4Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 13:56:24 -0400
IronPort-SDR: yy5htggTAGCEhGJELTFS7dIFq8V4VKvkHmfwz8su24INBMqkFXT+AGlHty+XZcjeEVNYgDGwmV
 emtC9qeIM3ZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 10:56:24 -0700
IronPort-SDR: BUCmUzmT5hqdJlG/DUNApFH70adMolehOUn/c+8TgUocuItasvW4AvY+/8Pri0JuJK2agIQ2qK
 424U6mDOdreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; 
   d="scan'208";a="255540259"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2020 10:56:21 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1je0Hw-009GwD-0t; Wed, 27 May 2020 20:56:24 +0300
Date:   Wed, 27 May 2020 20:56:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Rob Herring <robh@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200527175624.GT1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-3-Sergey.Semin@baikalelectronics.ru>
 <20200527171204.GA2348490@bogus>
 <20200527171841.am2iaynff243xoep@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200527171841.am2iaynff243xoep@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 08:18:41PM +0300, Serge Semin wrote:
> On Wed, May 27, 2020 at 11:12:04AM -0600, Rob Herring wrote:
> > On Wed, May 27, 2020 at 03:01:02PM +0300, Serge Semin wrote:
> > > dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> > > i2c "reg" property. If it is the compiler will print a warning:
> > > 
> > > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> > > 
> > > In order to silence dtc up let's discard the flag from the DW I2C DT
> > > binding example for now. Just revert this commit when dtc is fixed.

> > >        eeprom@64 {
> > >          compatible = "linux,slave-24c02";
> > > -        reg = <0x40000064>;
> > > +        reg = <0x64>;
> > 
> > But the compatible is a slave, so you need an example with a different 
> > device.
> 

> Ok. I'll replace the sub-node with just "atmel,24c02" compatible string then.

But how it will be different to the another slave connected to the master?

This example is specifically to show that DesingWare I²C controller may be
switched to slave mode.

> > >        };
> > >      };
> > >    - |

-- 
With Best Regards,
Andy Shevchenko


