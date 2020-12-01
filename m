Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDBD2C97A1
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 07:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgLAGqI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 01:46:08 -0500
Received: from retiisi.eu ([95.216.213.190]:43082 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbgLAGqI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 01:46:08 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3B65B634C24;
        Tue,  1 Dec 2020 08:44:21 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kjzOf-0002lH-Hu; Tue, 01 Dec 2020 08:44:21 +0200
Date:   Tue, 1 Dec 2020 08:44:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dan Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
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
Message-ID: <20201201064421.GR4351@valkosipuli.retiisi.org.uk>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130205203.GQ4351@valkosipuli.retiisi.org.uk>
 <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dan,

On Mon, Nov 30, 2020 at 11:06:03PM +0000, Dan Scally wrote:
> Hi Sakari
> 
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

Oops. I missed this indeed was not an I²C driver. So please ignore the
comment.

So I guess this wouldn't be an actual problem. I'd still like to test this
on a system with tps68470, as the rest of the set.

-- 
Kind regards,

Sakari Ailus
