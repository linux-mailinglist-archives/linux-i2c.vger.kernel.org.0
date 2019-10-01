Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7CADC3E9A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 19:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbfJARb2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Oct 2019 13:31:28 -0400
Received: from mga18.intel.com ([134.134.136.126]:54419 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727118AbfJARb1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Oct 2019 13:31:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 10:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="203305761"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 01 Oct 2019 10:31:23 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iFLzX-0003hq-RB; Tue, 01 Oct 2019 20:31:15 +0300
Date:   Tue, 1 Oct 2019 20:31:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Patrick Williams <alpawi@amazon.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>, Stefan Roese <sr@denx.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: pxa: migrate to new i2c_slave APIs
Message-ID: <20191001173115.GS32742@smile.fi.intel.com>
References: <20191001160001.2388-1-alpawi@amazon.com>
 <20191001160001.2388-2-alpawi@amazon.com>
 <20191001162913.GR32742@smile.fi.intel.com>
 <20191001163910.GA2307@8c859006a84e.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001163910.GA2307@8c859006a84e.ant.amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 01, 2019 at 11:39:10AM -0500, Patrick Williams wrote:
> Thanks for the review Andy.
> 
> On Tue, Oct 01, 2019 at 07:29:13PM +0300, Andy Shevchenko wrote:
> > 
> > 
> > On Tue, Oct 01, 2019 at 10:59:59AM -0500, Patrick Williams wrote:
> > There are quite a few people in the Cc list. I'm not sure they all are
> > interested in this. I deliberately dropped few names, sorry, if I was mistaken.
> 
> Agree it was kind of a big list.  Just chose what was given to me by
> get_maintainer.pl.  It seems like there isn't a direct identified
> maintainer of this file.

Hint: `scripts/get_maintainer.pl --git --git-min-percent=67 ...`

> > > +			i2c_slave_event(i2c->slave, I2C_SLAVE_READ_REQUESTED,
> > > +					&byte);

> > > +			i2c_slave_event(i2c->slave, I2C_SLAVE_WRITE_REQUESTED,
> > > +					NULL);

> The two different paths also require READ_REQUEST vs WRITE_REQUESTED.  I
> could do a ternary there but it seemed more obvious to just unroll the
> logic.

Ah, I see now.

-- 
With Best Regards,
Andy Shevchenko


