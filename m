Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746901E43BB
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388188AbgE0Nck (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:32:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:9462 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387730AbgE0Nck (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 09:32:40 -0400
IronPort-SDR: /k1OCIB27SeYHqVbfY3TcuJcuLXq6ZXxPJpRSvU5KEq5Sae4YrAEi907AmssbW7TTvWzl4Z8Ey
 0DeYw37lDnUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:32:38 -0700
IronPort-SDR: y3NspjWgFG1J+UZl/YxfmJ4wNPX09yXygA3E/BCkabYnk3lkK4EcGux5jegpuSDNaZunG3kwdy
 IvYNfpQXDENw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="345532773"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2020 06:32:34 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jdwAf-009Eer-Mb; Wed, 27 May 2020 16:32:37 +0300
Date:   Wed, 27 May 2020 16:32:37 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/12] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200527133237.GU1634618@smile.fi.intel.com>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
 <20200526215528.16417-4-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VdHC+fZNgc5oFbgYaNDebudDROcM_peRzOZpTVy55+tJg@mail.gmail.com>
 <20200527120716.4dke6psqpw726wrd@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120716.4dke6psqpw726wrd@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:07:16PM +0300, Serge Semin wrote:
> On Wed, May 27, 2020 at 12:30:04PM +0300, Andy Shevchenko wrote:
> > On Wed, May 27, 2020 at 1:00 AM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> > > dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> > > i2c "reg" property. If it is the compiler will print a warning:
> > 
> > Shouldn't be dtc whatever tools fixed?
> 
> See the first patch in the series.

I can't by the reason that I have no such. I also answered to cover letter
about it.

> > > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> > >
> > > In order to silence dtc up let's discard the flag from the DW I2C DT
> > > binding example for now. Just revert this commit when dtc is fixed.
> > 
> > Doesn't sound like a good idea. If user happens in between of these
> > ping-pong change, how they will know this subtle issue?
> 
> As I see it, there are three ways we can follow.
> 1) Apply the patch and revert when dtc is fixed.
> 2) Apply the patch, but add a comment above the property, that we need
>    to get the 0x40000064 address back when dtc is dixed.
> 3) Leave this ugly warning be until dtc is fixed.
> 
> In a comment to v2 Rob mentioned a solution like 1). Personally I am ok with
> either, though I'd like to see a Rob's final comment about this.

Yes, let's follow what Rob proposes.

-- 
With Best Regards,
Andy Shevchenko


