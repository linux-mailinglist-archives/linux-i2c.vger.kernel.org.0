Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD1DE17BF9F
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 14:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgCFNys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 08:54:48 -0500
Received: from mga17.intel.com ([192.55.52.151]:41481 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726182AbgCFNys (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 08:54:48 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 05:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,522,1574150400"; 
   d="scan'208";a="287977630"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Mar 2020 05:54:43 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jADR7-007NGR-NA; Fri, 06 Mar 2020 15:54:45 +0200
Date:   Fri, 6 Mar 2020 15:54:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] i2c: designeware: Add Baikal-T1 SoC DW I2C specifics
 support
Message-ID: <20200306135445.GE1748204@smile.fi.intel.com>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

First of all, I got only 3 out of 6 patches. Are you sure you properly prepared
the series?

On Fri, Mar 06, 2020 at 04:19:49PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <fancer.lancer@gmail.com>

Same comment as per DMA series, try next time to link the cover letter to the
series correctly.

> There are three DW I2C controllers embedded into the Baikal-T1 SoC. Two
> of them are normal with standard DW I2C IP-core configurations and registers
> accessible over normal MMIO space - so they are acceptable by the available
> DW I2C driver with no modification.

> But there is a third, which is a bit
> different. Its registers are indirectly accessed be means of "command/data
> in/data out" registers tuple. In order to have it also supported by the DW
> I2C driver, we must modify the code a bit. This is a main purpose of this
> patchset.
> 
> First of all traditionally we replaced the legacy plain text-based dt-binding
> file with yaml-based one. Then we found and fixed a bug in the DW I2C FIFO size
> detection algorithm which tried to do it too early before dw_readl/dw_writel
> methods could be used.

So far so good (looks like, I think colleagues of mine and myself will review
individual patches later on).

> Finally we introduced a platform-specific flag
> ACCESS_INDIRECT, which would enable the indirect access to the DW I2C registers
> implemented for one of the Baikal-T1 SoC DW I2C controllers. See the commit
> message of the corresponding patch for details.

This is quite questionable. In Intel SoCs we have indirect I²C controllers to
access (inside PMIC, for example). The approach used to do that is usually to
have an IPC mechanism and specific bus controller driver. See i2c-cht-wc.c for
instance.

I'm not sure if it makes a lot of duplication and if actually switching I²C
DesignWare driver to regmap API will solve it. At least that is the second
approach I would consider.

But I'll wait others to comment on this. We have to settle the solution before
going further.

> This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> commit 98d54f81e36b ("Linux 5.6-rc4").

`git format-patch --base ...` should do the job.

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>

Same comment as per UART patch. Who is the Alexey in relation to the work done?

-- 
With Best Regards,
Andy Shevchenko


