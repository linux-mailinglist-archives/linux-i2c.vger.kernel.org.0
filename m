Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8E92CAB12
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 19:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392243AbgLASwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 13:52:14 -0500
Received: from mga02.intel.com ([134.134.136.20]:33403 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbgLASwN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 13:52:13 -0500
IronPort-SDR: XxytTCV696SNG8rjbZzqbYL/+TlWUqUY8eb7AqWqTcf17FcgiTc1DeAZnkt5nf0SPSGb2ldex7
 ftJZshn/5/3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="159941774"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="159941774"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 10:50:29 -0800
IronPort-SDR: WBLCjU8hs8KTtJeKHY4k7AiZLuc+sUFN5zv67WFS7pZvA4yhGHmU9/2KdxrFAU0Y+OchJYhCcY
 ssjz6SqDxflg==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="372868265"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 10:50:22 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkAkE-00BL8f-8T; Tue, 01 Dec 2020 20:51:22 +0200
Date:   Tue, 1 Dec 2020 20:51:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <djrscally@gmail.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201201185122.GK4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <f5aca6eb-cc41-64d6-cb72-19ee3a8afd1e@ideasonboard.com>
 <fba097b3-6c61-c1ad-2928-3cb55bff6d19@gmail.com>
 <20201201183139.GH4077@smile.fi.intel.com>
 <20201201183616.GD3085@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201201183616.GD3085@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 08:36:16PM +0200, Laurent Pinchart wrote:
> On Tue, Dec 01, 2020 at 08:31:39PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 30, 2020 at 11:20:55PM +0000, Dan Scally wrote:
> > > On 30/11/2020 16:17, Jean-Michel Hautbois wrote:

...

> > > but the ACPI table doesn't define an I2CSerialBusV2 for it. Instead it's
> > > rolled under the sensor's entry, there's a second entry in _CRS for the
> > > sensor that matches the address of the new device:
> > > 
> > > 
> > >             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> > >             {
> > >                 Name (SBUF, ResourceTemplate ()
> > >                 {
> > >                     I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
> > >                         AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> > >                         0x00, ResourceConsumer, , Exclusive,
> > >                         )
> > >                     I2cSerialBusV2 (0x000C, ControllerInitiated, 0x00061A80,
> > >                         AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> > >                         0x00, ResourceConsumer, , Exclusive,
> > >                         )
> > >                 })
> > >                 Return (SBUF) /* \_SB_.PCI0.CAM0._CRS.SBUF */
> > >             }
> > > 
> > > So that's another thing we need to work on. At the moment it doesn't
> > > exist as far as the kernel is concerned.
> > 
> > Maybe something along i2c-multi-instantiate can help here (maybe not).
> 
> It's two different devices really. That's also one of the "annoyances"
> related to this platform. The INT* HID for the camera sensor actually
> refers to a camera module, with VCM, EEPROM, ... On Chrome OS devices,
> the same HID refers to the camera sensor only. *sigh* :-(

But it's not a problem for i2c-multi-instantiate. It's kinda MFD approach for
I²C peripheral devices.

-- 
With Best Regards,
Andy Shevchenko


