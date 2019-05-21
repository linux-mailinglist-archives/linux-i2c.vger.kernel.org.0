Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F5124FFA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 15:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfEUNUI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 09:20:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:64558 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfEUNUI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 09:20:08 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 06:20:07 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga003.jf.intel.com with ESMTP; 21 May 2019 06:20:05 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hT4gW-0008JJ-FK; Tue, 21 May 2019 16:20:04 +0300
Date:   Tue, 21 May 2019 16:20:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 3/5] i2c: core: Move ACPI IRQ handling to probe time
Message-ID: <20190521132004.GG9224@smile.fi.intel.com>
References: <20190520084936.10590-1-ckeepax@opensource.cirrus.com>
 <20190520084936.10590-4-ckeepax@opensource.cirrus.com>
 <20190521112728.GX2781@lahna.fi.intel.com>
 <20190521125704.GF9224@smile.fi.intel.com>
 <20190521131104.GB99937@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521131104.GB99937@ediswmail.ad.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 02:11:04PM +0100, Charles Keepax wrote:
> On Tue, May 21, 2019 at 03:57:04PM +0300, Andy Shevchenko wrote:
> > On Tue, May 21, 2019 at 02:27:28PM +0300, Mika Westerberg wrote:
> > > On Mon, May 20, 2019 at 09:49:34AM +0100, Charles Keepax wrote:
> > > > Bring the ACPI path in sync with the device tree path and handle all the
> > > > IRQ fetching at probe time. This leaves the only IRQ handling at device
> > > > registration time being that which is passed directly through the board
> > > > info as either a resource or an actual IRQ number.
> > > 
> > > I don't see issues with this approach. Cc'd Jarkko and Andy just in case
> > > I missed something.
> > 
> > I failed to see the i2c_acpi_get_irq() in the current code.
> > What kernel version do you use?
> > Can we see the changes against vanilla / i2c-next?
> > 
> 
> It's added by the first patch in the chain:
> 
> https://lkml.org/lkml/2019/5/20/281
> 
> I could resend the series with you and Jarkko on CC if that would
> be better.

That would be better.

-- 
With Best Regards,
Andy Shevchenko


