Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71315009DF
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Apr 2022 11:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbiDNJco (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Apr 2022 05:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241836AbiDNJci (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Apr 2022 05:32:38 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55166E574;
        Thu, 14 Apr 2022 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649928614; x=1681464614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8s3rGSjMBycltpqxd2saKbu43OqpVO3Ts473nGWm8cM=;
  b=mAG8YU1R7UZ7V5uevTNvVCDgIztTghQllr8KoZilVqZkSXn5riQ1NMgU
   TYvxpnFxX4NIx4J8S7DhhzasqSoOBNKZZuNn8xxQU7T1NBmDjxbZ4YbwV
   nwRoyTRyvCwV4TIKqmW5oymEZvvJTMXpGfbQ3z7y6kaKLGFVsUcY7U7WF
   GQH4uhVqLmWmKEnIaQ5WkEQslqjd6ulOa2r6yRpyM2rdYrfLk4aTmOh5i
   mvzpYqYc1Xhao0JG5OgYRZx6wC6LE6oieJDSc3jfVckn9s3+yXkrd048r
   i18yrTtZy1BWkAcnuOwBNyJaTiN1MSDt7oysrNYTkfC8yVb87vb41QBRo
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262335328"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="262335328"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 02:30:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="560112789"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 02:29:59 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id C33EB2030F;
        Thu, 14 Apr 2022 12:29:57 +0300 (EEST)
Date:   Thu, 14 Apr 2022 12:29:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jacopo Mondi <jmondi@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, rafael@kernel.org,
        linux-acpi@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        tfiga@chromium.org, bingbu.cao@intel.com,
        andriy.shevchenko@intel.com
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <YlfplRQYDYhFvc5U@paasikivi.fi.intel.com>
References: <YitLit9LC2zlOfdh@paasikivi.fi.intel.com>
 <YitMt7hVA2okuQ8x@pendragon.ideasonboard.com>
 <YitPaq2yYnrKsq4f@paasikivi.fi.intel.com>
 <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
 <Yi3z2nR8j+ee4E4m@paasikivi.fi.intel.com>
 <Yi38zOHsh68FrrKK@pendragon.ideasonboard.com>
 <Yi+e/IK+eVpKit/F@paasikivi.fi.intel.com>
 <Yi+gEVB0FuOcY5qn@pendragon.ideasonboard.com>
 <Yi+vdvMeXqb/BvKo@paasikivi.fi.intel.com>
 <YkMDfvuhAvsrjbON@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkMDfvuhAvsrjbON@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent,

On Tue, Mar 29, 2022 at 04:02:54PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Mar 14, 2022 at 11:11:18PM +0200, Sakari Ailus wrote:
> > On Mon, Mar 14, 2022 at 10:05:37PM +0200, Laurent Pinchart wrote:
> > ...
> > > > > Yes, after reading the version register (or doing any other harware
> > > > > access). Actually the full code would be
> > > > > 
> > > > > 
> > > > >  	pm_runtime_enable(dev);
> > > > >  	pm_runtime_resume_and_get(dev);
> > > > > 
> > > > > 	/* Hardware access */
> > > > > 
> > > > > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > 	pm_runtime_use_autosuspend(dev);
> > > > > 	pm_runtime_put_autosuspend(dev);
> > > > > 
> > > > > (plus error handling).
> > > > > 
> > > > > If the probe function doesn't need to access the hardware, then
> > > > > the above becomes
> > > > > 
> > > > > 	pm_runtime_enable(dev);
> > > > > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > 	pm_runtime_use_autosuspend(dev);
> > > > > 
> > > > > instead of having to power up the device just in case !PM.
> > > > > 
> > > > > > Also the latter only works on DT-based systems so it's not an option for
> > > > > > most of the drivers.
> 
> Does the former work on ACPI systems ?

Yes (i.e. the one that was above the quoted text).

> 
> > > > > How so, what's wrong with the above for ACPI-based system ?
> > > > 
> > > > I²C devices are already powered on for probe on ACPI based systems.
> > > 
> > > Not through RPM I suppose ?
> > 
> > Runtime PM isn't involved, this takes place in the ACPI framework (via
> > dev_pm_domain_attach() called in i2c_device_probe()).
> 
> How can we fix this ? It may have made sense a long time ago, but it's
> making RPM handling way too difficult in I2C drivers now. We need
> something better instead of continuing to rely on cargo-cult for probe
> functions. Most drivers are broken.

Some could be broken, there's no question of that. A lot of drivers support
either ACPI or DT, too, so not _that_ many need to work with both. Albeit
that number is probably increasing constantly for the same devices are used
on both.

Then there are drivers that prefer not powering on the device in probe (see
<URL:https://lore.kernel.org/linux-acpi/20210210230800.30291-2-sakari.ailus@linux.intel.com/T/>),
it gets complicated to support all the combinatios of DT/ACPI (with or
without the flag / property for waiving powering device on for probe) and
CONFIG_PM enabled/disabled.

What I think could be done to add a flag for drivers that handle power on
their own, or perhaps rather change how I2C_DRV_ACPI_WAIVE_D0_PROBE flag
works. Right now it expects a property on the device but that check could
be moved to existing drivers using the flag. Not many drivers are currently
using the flag. I think this would simplify driver implementation as both
firmware interfaces would work the same way in this respect.

You'd have to change one driver at a time, and people should be encouraged
to write new drivers with that flag. Or add the flag to all existing
drivers and not accept new ones with it.

These devices I think are all I²C but my understanding is that such
differences exist elsewhere in the kernel, too. If they are to be
addressed, it would probably be best to have a unified approach towards it.

Added a few more people and lists to cc.

-- 
Kind regards,

Sakari Ailus
