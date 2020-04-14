Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA251A807A
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 16:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405332AbgDNOyY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 10:54:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:59994 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405331AbgDNOyV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 10:54:21 -0400
IronPort-SDR: Tnf+7iZm+UX4ZJ/B6tSJYWouIi3kHNz+9NEZQMUf2poZ1B93ZifUym+MCjJwPZ6x1CvUFedm/y
 RBV05mEVfwHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 07:54:17 -0700
IronPort-SDR: SHf9jv5IL3rdLY0MJo+MhKsrV/9MG3a/3555wa478pgycaHs8dKdOA2y72RSrtGutcUO6hakUD
 ah9jZfBs4yYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="363394996"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 14 Apr 2020 07:54:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 14 Apr 2020 17:54:14 +0300
Date:   Tue, 14 Apr 2020 17:54:14 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Max Staudt <max@enpas.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1] i2c: icy: Don't use software node when it's an
 overkill
Message-ID: <20200414145414.GJ2828150@kuha.fi.intel.com>
References: <20200408165247.13116-1-andriy.shevchenko@linux.intel.com>
 <5867ca8b-215e-5ccf-bee9-feefc2e507c8@enpas.org>
 <20200409103735.GV3676135@smile.fi.intel.com>
 <20200409121633.GA1534509@kuha.fi.intel.com>
 <e2c36d3a-0932-42f5-170a-49432f835fed@enpas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2c36d3a-0932-42f5-170a-49432f835fed@enpas.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 10, 2020 at 01:51:58AM +0200, Max Staudt wrote:
> On 4/9/20 2:16 PM, Heikki Krogerus wrote:
> > On Thu, Apr 09, 2020 at 01:37:35PM +0300, Andy Shevchenko wrote:
> >> Heikki, am I correct?
> > 
> > In this case it should be possible supply a handle to a software node
> > with the board info. That should then later replace the fwnode and
> > properties members once the existing code is converted:
> > 
> > [... snip sample patch ...]
> > 
> > I2C core would then need to take care of registering that swnode of
> > course.
> 
> Are you saying that the comment in property.c is correct, and
> i2c_new_client_device() shall *not* call device_add_properties() ?
> 
> I mean, the code works and stuff, except that the swnode that
> device_add_properties() created won't be freed as far as I can see.

They actually are freed when device_del() is finally called, which is
pretty damn confusing. That is actually one of the reasons why we
should avoid the old device_add/del_properties() API.

> In other words, should the current properties code in i2c_new_client_device()
> be replaced by something that creates a swnode, just like the i2c-icy driver
> currently does manually when it instantiates the ltc2990 I2C client?

Yes. The subsystem needs to take care of that, not the drivers.

thanks,

-- 
heikki
