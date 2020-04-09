Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3D071A33EF
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Apr 2020 14:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgDIMQl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 08:16:41 -0400
Received: from mga01.intel.com ([192.55.52.88]:38844 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgDIMQl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Apr 2020 08:16:41 -0400
IronPort-SDR: r0IEr1w8EsmIQ4JoGQfikV63jpDd3KKLAwG3c1Oirb0kQ2kuvIPljsKn8/2aj5lbNKEVyClubF
 /LI244BeCvPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 05:16:36 -0700
IronPort-SDR: Y2JYJFsngT9ZyaRURNGBwPnRebEGAnS0/Xgb+jaNkq67JAV4/RVJtJ1+xBVd5Sj/IX/M2n9q3x
 jgBLf2oxVnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,362,1580803200"; 
   d="scan'208";a="362137736"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Apr 2020 05:16:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 09 Apr 2020 15:16:33 +0300
Date:   Thu, 9 Apr 2020 15:16:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Max Staudt <max@enpas.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1] i2c: icy: Don't use software node when it's an
 overkill
Message-ID: <20200409121633.GA1534509@kuha.fi.intel.com>
References: <20200408165247.13116-1-andriy.shevchenko@linux.intel.com>
 <5867ca8b-215e-5ccf-bee9-feefc2e507c8@enpas.org>
 <20200409103735.GV3676135@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409103735.GV3676135@smile.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 09, 2020 at 01:37:35PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 08, 2020 at 11:24:20PM +0200, Max Staudt wrote:
> > Thank you, that looks much nicer indeed. I have also tested it on my Amiga just to be sure - it works.
> 
> Thank you.
> 
> > However, no signature yet because the call stack is giving me a headache:
> > 
> > icy_probe()
> >  -> i2c_new_scanned_device()
> >  -> i2c_new_client_device()
> >  -> device_add_properties()
> > 
> > And here we are in drivers/base/property.c looking at device_add_properties():
> > 
> >  * WARNING: The callers should not use this function if it is known that there
> >  * is no real firmware node associated with @dev! In that case the callers
> >  * should create a software node and assign it to @dev directly.
> > 
> > 
> > Why is this warning there? It flies right in the face of what we're trying to achieve here.
> > 
> > It was introduced in 2018 with commit caf35cd52242 .
> > 
> > 
> > So either the warning is superfluous, or i2c_new_client_device() should be creating a software fwnode, I guess?
> 
> No and no.
> 
> First one because the mechanism is added to have quirks, it must not replace
> the actual possibility to provide this via firmware (DT / ACPI).
> 
> Second one, because software node API should have (has?) the same warning.
> 
> +Cc Heikki.
> 
> Heikki, am I correct?

In this case it should be possible supply a handle to a software node
with the board info. That should then later replace the fwnode and
properties members once the existing code is converted:

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f6b942150631..648ea384d480 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -409,8 +409,7 @@ struct i2c_board_info {
        const char      *dev_name;
        void            *platform_data;
        struct device_node *of_node;
-       struct fwnode_handle *fwnode;
-       const struct property_entry *properties;
+       const struct software_node *swnode
        const struct resource *resources;
        unsigned int    num_resources;
        int             irq;

I2C core would then need to take care of registering that swnode of
course.

thanks,

-- 
heikki
