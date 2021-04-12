Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D341E35CF88
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 19:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240002AbhDLRfM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 13:35:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:59905 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239298AbhDLRfL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 13:35:11 -0400
IronPort-SDR: +rCKRX1l6hIpehkJeu6ro5WmhqNSUhY7y58mihrx1tzNoiAxrFvkEbFAwEOeY/46w0ClH4qdXr
 1gS0tv4gAfRw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="193804990"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="193804990"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 10:34:53 -0700
IronPort-SDR: VgP71Ev+CcKJ5sC+DXWVvwvpybjKlEAKWOxSqwfG0chYSKxuZ4aoZdud530kY6M2Lv5o3cSZ8T
 y0CDpI8rlRKg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="460255052"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 10:34:49 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lW0ST-003WRL-KB; Mon, 12 Apr 2021 20:34:45 +0300
Date:   Mon, 12 Apr 2021 20:34:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com
Subject: Re: [PATCH v1 6/7] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <YHSEtc1660b+qXKG@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
 <20210412180106.7dc524e8@md1za8fc.ad001.siemens.net>
 <20210412184001.2fc359c1@md1za8fc.ad001.siemens.net>
 <YHR8Wd5oShhTricb@smile.fi.intel.com>
 <20210412191653.0a53985d@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412191653.0a53985d@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 12, 2021 at 07:16:53PM +0200, Henning Schild wrote:
> Am Mon, 12 Apr 2021 19:59:05 +0300
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > On Mon, Apr 12, 2021 at 06:40:01PM +0200, Henning Schild wrote:
> > > Tan or Andy,
> > > 
> > > maybe you can point me to a user of that patch. I guess there might
> > > be an out-of-tree driver or userland code on how to use the GPIOs
> > > from there.  
> > 
> > I'm confused. User of this patch is pinctrl-broxton driver.
> > It's in upstream.
> 
> Should this appear in /sys/class/gpio as chip so that pins can be
> exported?

No. Sysfs interface is deprecated. It should appear as /dev/gpiochip0 or so.

> That is what i tried and failed with.
> 
> > Using GPIOs from it is something as done in a few drivers already
> > (Assuming we have no resources described in the ACPI). I.e. you need
> > to register in board file the GPIO mapping table with help of
> > devm_acpi_dev_add_driver_gpios() and use one of gpiod_get() family of
> > functions to request it.
> > 
> > In case of LEDs you simple describe GPIO device name in lookup table
> > and that's it. The drivers/platform/x86/pcengines-apuv2.c not the
> > best but will give you an idea how to use "leds-gpio" driver in board
> > files.
> 
> I am aware of that driver and had a look at it. In order to figure out
> the arguments for the macros/functions i was hoping for userland gpio
> "export", but maybe that does not work here ...
> For now i will assume that it does not show up in sysfs and can maybe
> still be used, and try to build on top.

Just switch to use libgpiod and associated tools / bindings in user space.
Sysfs ABI is not being developed anymore.

-- 
With Best Regards,
Andy Shevchenko


