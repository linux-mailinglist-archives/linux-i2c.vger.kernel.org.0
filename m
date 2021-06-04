Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC05F39B963
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 15:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhFDNDi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 09:03:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:16771 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230019AbhFDNDh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 09:03:37 -0400
IronPort-SDR: pEXOvpOtTvrxJAeHNwXUzM87VYl/SxPN4rai7Gfkkx4eMQ7UAxQCPHOVaBUMZS/C7zhPJDCzVp
 01hzPRr+5LSA==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="265447303"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="265447303"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 06:01:51 -0700
IronPort-SDR: YXattzU+nD0Pt4rfrx5zmfQeaWPVg2k6kE9A+mYBGNQ3kbckhw8SDqemjUyWPeOmzTYB/iDguh
 Gz2fgiP7EW7g==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="551154548"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 06:01:44 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lp9SH-00HE4p-S9; Fri, 04 Jun 2021 16:01:41 +0300
Date:   Fri, 4 Jun 2021 16:01:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 4/6] gpiolib: acpi: Add acpi_gpio_get_io_resource()
Message-ID: <YLokNQCJ7WXKZepR@smile.fi.intel.com>
References: <20210603224007.120560-1-djrscally@gmail.com>
 <20210603224007.120560-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603224007.120560-5-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 03, 2021 at 11:40:05PM +0100, Daniel Scally wrote:
> Add a function to verify that a given acpi_resource represents an IO
> type GPIO resource, and return it if so.

I would rephrase this to something like:

"Add a function to verify that a given ACPI resource represents a GpioIo() type
of resource, and return it if so."

I can amend when applying to my branch.

-- 
With Best Regards,
Andy Shevchenko


