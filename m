Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFE22DB640
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Dec 2020 23:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgLOWEt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Dec 2020 17:04:49 -0500
Received: from mga03.intel.com ([134.134.136.65]:63171 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727704AbgLOWEr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Dec 2020 17:04:47 -0500
IronPort-SDR: ZRwVvvkwg6+13uGvURCrJJ3sHmz3f9BtmJ5jMCa00OFqdnsJZRn0H/nNMp8BoXhpsuxR7VR5F2
 uHZHcyG4mvJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="175066824"
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; 
   d="scan'208";a="175066824"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 14:02:59 -0800
IronPort-SDR: 3k+W1bsmGCEDFS/ev7nhXCUu9Im+pNFC6hVZwG2WORMezjAFKRDwNlW+hUsdVmQTiPPQ9r3IYa
 faUukrNiGjZA==
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; 
   d="scan'208";a="384001989"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 14:02:52 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D88CF2063B; Wed, 16 Dec 2020 00:02:49 +0200 (EET)
Date:   Wed, 16 Dec 2020 00:02:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201215220249.GG26370@paasikivi.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130203551.GP4351@valkosipuli.retiisi.org.uk>
 <5238fc28-350b-a785-0a33-edeba9dfb096@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5238fc28-350b-a785-0a33-edeba9dfb096@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On Tue, Dec 15, 2020 at 10:28:59AM +0000, Daniel Scally wrote:
> Morning Sakari
> 
> On 30/11/2020 20:35, Sakari Ailus wrote:
> >> +/*
> >> + * Extend this array with ACPI Hardware ID's of devices known to be working.
> >> + * Do not add a HID for a sensor that is not actually supported.
> >> + */
> >> +static const char * const cio2_supported_devices[] = {
> >> +	"INT33BE",
> >> +	"OVTI2680",
> > 
> > I guess we don't have the known-good frequencies for the CSI-2 bus in
> > firmware?
> > 
> > One option would be to put there what the drivers currently use. This
> > assumes the support for these devices is, well, somewhat opportunistic but
> > I guess there's no way around that right now at least.
> > 
> > As the systems are laptops, they're likely somewhat less prone to EMI
> > issues to begin with than mobile phones anyway.
> 
> Just looking at this; we're currently using this with the ov2680 driver
> that's in mainline currently (with very minor tweaks) plus a
> hacked-into-roughly-working version of the atomisp-ov5693 driver (ACPI
> ID INT33BE = ov5693 physical device). Neither of those drivers lists any
> link frequencies, nor provides a link frequency control for v4l2 to work
> with.
> 
> On the other hand, the ov5648 [1] and ov8865 [2] drivers which Paul has
> submitted recently, which we also want to be able to support, _do_
> include that. I can register the frequencies Paul's defined there as a
> link-frequencies property but this gives rise to two questions:
> 
> 
> 1. Is this _mandatory_? Do I need to be finding the link-frequencies for
> the OV2680 and OV5693 drivers too? Or can I skip that property where the
> driver doesn't handle it anyway. Seems to be working fine without
> controlling it in driver.

Receiver drivers generally need the information to program the receiver
timing. It may work for you without using the correct frequency, but the
risk of failure on another unit increases.

> 2. Can I trust all the values in the drivers to be available on each
> platform? For example for the ov5648 Paul lists these as available:
> 
>  938static const s64 ov5648_link_freq_menu[] = {
> 
> 
>  939        210000000,
> 
> 
>  940        168000000,
> 
> 
>  941};
> 
> But can I safely register a link-frequencies property for both of those
> and trust that that'll work on all IPU3 platforms with an ov5648 in them?

Ideally we'd know which frequency Windows uses, and use the same.

Using another frequency may have adverse effects elsewhere in the system.
AFAIU mostly this concerns radios of all sorts.

Now that this is in the kernel in any case, it can be fixed later on so I'm
not too worried about it. Having still a comment there that the
configuration is opportunistic would be nice.

-- 
Kind regards,

Kind regards,

Sakari Ailus
