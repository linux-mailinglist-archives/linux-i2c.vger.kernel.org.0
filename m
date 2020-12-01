Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6168F2CA2C6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 13:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgLAMec (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 07:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgLAMec (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 07:34:32 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37142C0613CF;
        Tue,  1 Dec 2020 04:33:52 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5B952634C89;
        Tue,  1 Dec 2020 14:32:44 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kk4po-0002qQ-Oo; Tue, 01 Dec 2020 14:32:44 +0200
Date:   Tue, 1 Dec 2020 14:32:44 +0200
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
Message-ID: <20201201123244.GT4351@valkosipuli.retiisi.org.uk>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130205203.GQ4351@valkosipuli.retiisi.org.uk>
 <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
 <20201201064421.GR4351@valkosipuli.retiisi.org.uk>
 <2a548835-78c6-8fe3-cceb-1fc000707157@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a548835-78c6-8fe3-cceb-1fc000707157@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dan,

On Tue, Dec 01, 2020 at 08:08:26AM +0000, Dan Scally wrote:
> 
> On 01/12/2020 06:44, Sakari Ailus wrote:
> > Hi Dan,
> >
> > On Mon, Nov 30, 2020 at 11:06:03PM +0000, Dan Scally wrote:
> >> Hi Sakari
> >>
> >> On 30/11/2020 20:52, Sakari Ailus wrote:
> >>>> +static const struct acpi_device_id int3472_device_id[] = {
> >>>> +	{ "INT3472", 0 },
> >>> The INT3472 _HID is really allocated for the tps68470 PMIC chip. It may not
> >>> be used by other drivers; people will want to build kernels where both of
> >>> these ACPI table layouts are functional.
> >>>
> >>> Instead, I propose, that you add this as an option to the tps68470 driver
> >>> that figures out whether the ACPI device for the tps68470 device actually
> >>> describes something else, in a similar fashion you do with the cio2-bridge
> >>> driver. I think it may need a separate Kconfig option albeit this and
> >>> cio2-bridge cannot be used separately.
> >> It actually occurs to me that that may not work (I know I called that
> >> out as an option we considered, but that was a while ago actually). The
> >> reason I wasn't worried about the existing tps68470 driver binding to
> >> these devices is that it's an i2c driver, and these dummy devices don't
> >> have an I2cSerialBusV2, so no I2C device is created by them the kernel.
> >>
> >>
> >> Won't that mean the tps68470 driver won't ever be probed for these devices?
> > Oops. I missed this indeed was not an I²C driver. So please ignore the
> > comment.
> >
> > So I guess this wouldn't be an actual problem. I'd still like to test this
> > on a system with tps68470, as the rest of the set.
> On my Go2, it .probes() for the actual tps68740 (that machine has both
> types of INT3472 device) but fails with EINVAL when it can't find the
> CLDB buffer that these discrete type devices have. My understanding is
> that means it's free for the actual tps68470 driver to grab the device;
> although that's not happening because I had to blacklist that driver or
> it stops the machine from booting at the moment - haven't gotten round
> to investigating yet.

Oh, then the problem is actually there. If it probes the tps68470 driver on
the systems with Windows ACPI tables, then it should be that driver which
works with the Windows ACPI tables, too.

Checking for random objects such as CLDB in multiple drivers and returning
an error based on them being there or not wouldn't be exactly neat.
Although I'm not sure thare are options that are obviosly pretty here. I
wouldn't two separate drivers checking for e.g. CLDB (tps68470 + this one).

The tps68470 driver is an MFD driver that instantiates a number of platform
devices. Alternatively, if you make this one a platform device, you can, in
case the CLDB (or whatever object) is present, in the tps68470 driver
instantiate a device for this driver instead of the rest.

So I'd think what matters is that both drivers can be selected at the same
time but the user does not need to manually select them. Both ways could
work I guess?

-- 
Kind regards,

Sakari Ailus
