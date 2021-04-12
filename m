Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FC035CF0C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 19:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243612AbhDLRBW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 13:01:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:33850 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243585AbhDLRA2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 13:00:28 -0400
IronPort-SDR: KLijf7P1KIbvylLEDq91OhGqUZp80T/6UQkFW9hp4UJb15LoHdQiNY18vWYeUj0tuVM3IkG+F3
 gUiUnKYIQ16w==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181754710"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="181754710"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 09:59:12 -0700
IronPort-SDR: vksfThiOB1ACjlncEiNsVbTqUMwQvTiV9+4N802d0CeSxE/1KvVvd7sxGejzGejXmCf1oPjxdP
 lyfku2W0Y8BA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="450053256"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 09:59:08 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lVztx-003W0m-HV; Mon, 12 Apr 2021 19:59:05 +0300
Date:   Mon, 12 Apr 2021 19:59:05 +0300
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
Message-ID: <YHR8Wd5oShhTricb@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
 <20210412180106.7dc524e8@md1za8fc.ad001.siemens.net>
 <20210412184001.2fc359c1@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412184001.2fc359c1@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 12, 2021 at 06:40:01PM +0200, Henning Schild wrote:
> Tan or Andy,
> 
> maybe you can point me to a user of that patch. I guess there might be
> an out-of-tree driver or userland code on how to use the GPIOs from
> there.

I'm confused. User of this patch is pinctrl-broxton driver.
It's in upstream.

Using GPIOs from it is something as done in a few drivers already
(Assuming we have no resources described in the ACPI). I.e. you need to
register in board file the GPIO mapping table with help of
devm_acpi_dev_add_driver_gpios() and use one of gpiod_get() family of functions
to request it.

In case of LEDs you simple describe GPIO device name in lookup table and
that's it. The drivers/platform/x86/pcengines-apuv2.c not the best but
will give you an idea how to use "leds-gpio" driver in board files.


> Feel free to send directly to me in case it is not published anywhere
> and should not yet be on the list, i could just use it for inspiration.
> A driver will likely be GPL anyways.

-- 
With Best Regards,
Andy Shevchenko


