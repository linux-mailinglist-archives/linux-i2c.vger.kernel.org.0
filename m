Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 536F817580B
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Mar 2020 11:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgCBKMQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Mar 2020 05:12:16 -0500
Received: from mga03.intel.com ([134.134.136.65]:26807 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727076AbgCBKMQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Mar 2020 05:12:16 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 02:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; 
   d="scan'208";a="351511538"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 02 Mar 2020 02:12:11 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 02 Mar 2020 12:12:10 +0200
Date:   Mon, 2 Mar 2020 12:12:10 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i2c: i801: Fix iTCO_wdt resource creation if PMC
 is not present
Message-ID: <20200302101210.GW2667@lahna.fi.intel.com>
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
 <20200228170342.GC1130@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228170342.GC1130@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 28, 2020 at 06:03:42PM +0100, Wolfram Sang wrote:
> On Wed, Feb 26, 2020 at 04:21:19PM +0300, Mika Westerberg wrote:
> > Hi all,
> > 
> > This series aims to fix the issue reported by Martin Volf [1] that prevents
> > the nct6775 driver from loading.
> > 
> > I added Fixes tag to the last patch but not stable tag because the other
> > two patches it depends are not really stable material IMO. Please let me
> > know if there is a better way to organize these :)
> > 
> > I tested this on Intel Whiskey Lake based system (CNL derived) and on Comet
> > Lake-V based system (SPT derived and the iTCO_wdt still works and I can see
> > the expected resources in /proc/ioports and /proc/iomem.
> > 
> > The previous version of the patch series can be found here:
> > 
> >   https://lore.kernel.org/linux-hwmon/20200225123802.88984-1-mika.westerberg@linux.intel.com/
> > 
> > Changes from the previous version:
> > 
> >   * Call request_region() also for iTCO_vendorsupport
> >   * Drop the core populating ICH_RES_IO_SMI completely from i2c-i801.c
> > 
> > [1] https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com/
> 
> I can take this series via I2C. Just wanted to let you know that I am
> aiming for rc5, because I'd like to have this in linux-next for a week
> to make sure we don't regress again (despite all precautions) somewhere
> else.

Makes sense, thanks!
