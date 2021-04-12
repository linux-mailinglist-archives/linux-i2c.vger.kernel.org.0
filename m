Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC60535CF60
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 19:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244044AbhDLRYw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 13:24:52 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:41966 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239577AbhDLRYw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 13:24:52 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13CHOElf025170
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Apr 2021 19:24:14 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.41.180])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 13CHGs9O017427;
        Mon, 12 Apr 2021 19:16:54 +0200
Date:   Mon, 12 Apr 2021 19:16:53 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        "Jonathan Yong" <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, <hdegoede@redhat.com>
Subject: Re: [PATCH v1 6/7] mfd: lpc_ich: Add support for pinctrl in
 non-ACPI system
Message-ID: <20210412191653.0a53985d@md1za8fc.ad001.siemens.net>
In-Reply-To: <YHR8Wd5oShhTricb@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
        <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
        <20210412180106.7dc524e8@md1za8fc.ad001.siemens.net>
        <20210412184001.2fc359c1@md1za8fc.ad001.siemens.net>
        <YHR8Wd5oShhTricb@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon, 12 Apr 2021 19:59:05 +0300
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> On Mon, Apr 12, 2021 at 06:40:01PM +0200, Henning Schild wrote:
> > Tan or Andy,
> > 
> > maybe you can point me to a user of that patch. I guess there might
> > be an out-of-tree driver or userland code on how to use the GPIOs
> > from there.  
> 
> I'm confused. User of this patch is pinctrl-broxton driver.
> It's in upstream.

Should this appear in /sys/class/gpio as chip so that pins can be
exported?

That is what i tried and failed with.

> Using GPIOs from it is something as done in a few drivers already
> (Assuming we have no resources described in the ACPI). I.e. you need
> to register in board file the GPIO mapping table with help of
> devm_acpi_dev_add_driver_gpios() and use one of gpiod_get() family of
> functions to request it.
> 
> In case of LEDs you simple describe GPIO device name in lookup table
> and that's it. The drivers/platform/x86/pcengines-apuv2.c not the
> best but will give you an idea how to use "leds-gpio" driver in board
> files.

I am aware of that driver and had a look at it. In order to figure out
the arguments for the macros/functions i was hoping for userland gpio
"export", but maybe that does not work here ...
For now i will assume that it does not show up in sysfs and can maybe
still be used, and try to build on top.

regards,
Henning

> 
> > Feel free to send directly to me in case it is not published
> > anywhere and should not yet be on the list, i could just use it for
> > inspiration. A driver will likely be GPL anyways.  
> 

