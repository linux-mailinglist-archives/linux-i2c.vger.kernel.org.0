Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8DB2CAB2C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 19:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731236AbgLAS4t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 13:56:49 -0500
Received: from mga17.intel.com ([192.55.52.151]:65533 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbgLAS4t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 13:56:49 -0500
IronPort-SDR: ymHOwF9dz5a11dYhtIRfpEmCVUe7hDaCdE+ASviyymQRKnEj8N48P2+Bf5GPhpr9PWs25Ymgll
 f65XtC4rMqOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152716011"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="152716011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 10:55:08 -0800
IronPort-SDR: O1EQ8vM/QvOLK7AKHZagQtym6r3r7agEaHfKrsefFl/abSiMiZfy7LQEOEJzQYFMGdozDImMyB
 TZlyuPsZwQZA==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="361147132"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 10:54:58 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkAog-00BLBW-ML; Tue, 01 Dec 2020 20:55:58 +0200
Date:   Tue, 1 Dec 2020 20:55:58 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201201185558.GM4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130205203.GQ4351@valkosipuli.retiisi.org.uk>
 <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 11:06:03PM +0000, Dan Scally wrote:
> On 30/11/2020 20:52, Sakari Ailus wrote:
> >> +static const struct acpi_device_id int3472_device_id[] = {
> >> +	{ "INT3472", 0 },
> > The INT3472 _HID is really allocated for the tps68470 PMIC chip. It may not
> > be used by other drivers; people will want to build kernels where both of
> > these ACPI table layouts are functional.
> >
> > Instead, I propose, that you add this as an option to the tps68470 driver
> > that figures out whether the ACPI device for the tps68470 device actually
> > describes something else, in a similar fashion you do with the cio2-bridge
> > driver. I think it may need a separate Kconfig option albeit this and
> > cio2-bridge cannot be used separately.
> 
> It actually occurs to me that that may not work (I know I called that
> out as an option we considered, but that was a while ago actually). The
> reason I wasn't worried about the existing tps68470 driver binding to
> these devices is that it's an i2c driver, and these dummy devices don't
> have an I2cSerialBusV2, so no I2C device is created by them the kernel.
> 
> 
> Won't that mean the tps68470 driver won't ever be probed for these devices?

It won't be probed by kernel as long as it stays pure I²C driver..

-- 
With Best Regards,
Andy Shevchenko


