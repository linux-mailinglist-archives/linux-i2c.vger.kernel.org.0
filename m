Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825FB1E86DD
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 20:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgE2SmC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 14:42:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:20233 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgE2SmC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 May 2020 14:42:02 -0400
IronPort-SDR: UWhaR+UL10mY8740KpFdv8XbomGQSeV3hTwLTJISOAgV9I14JvwqznGxZJ73JgFWWbbNQAv7fB
 Z99ZVFTv32MQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 11:42:01 -0700
IronPort-SDR: YnaYNmjtqoQkNBq/X7sTU2hnpq92+KZ1gKzpfD4DBBzt33/sdEGOGUSdC++CUtvk4wiL4QUMcZ
 NjW1Rv+Bpsbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; 
   d="scan'208";a="311336112"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 29 May 2020 11:41:58 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jejxB-009fvG-Rd; Fri, 29 May 2020 21:42:01 +0300
Date:   Fri, 29 May 2020 21:42:01 +0300
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
Subject: Re: [PATCH v5 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200529184201.GX1634618@smile.fi.intel.com>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-3-Sergey.Semin@baikalelectronics.ru>
 <20200527153351.rmzguymz7lm6gvsx@mobilestation>
 <20200529181338.GA2676189@bogus>
 <20200529182256.3bp4uvvrvz3ddlrq@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529182256.3bp4uvvrvz3ddlrq@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 29, 2020 at 09:22:56PM +0300, Serge Semin wrote:
> On Fri, May 29, 2020 at 12:13:38PM -0600, Rob Herring wrote:
> > On Wed, May 27, 2020 at 06:33:51PM +0300, Serge Semin wrote:

> > you're sending 
> > new versions too fast. Give people time to review.
> 
> Yeah, you did. Sorry for sending the new versions very fast. Normally I prefer
> to keep up with comments so to past a particular maintainer review as fast as
> possible without long delays. In my experience the longer you wait, the lesser
> maintainers remember about your patchset, the harder for one to continue the
> next versions review.

Documentation/process/submitting-patches.rst:

"Wait for a minimum of one week before resubmitting or pinging reviewers -
possibly longer during busy times like merge windows."


-- 
With Best Regards,
Andy Shevchenko


