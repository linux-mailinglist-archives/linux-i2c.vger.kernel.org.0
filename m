Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EAB2F9FD9
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 13:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390732AbhARMey (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 07:34:54 -0500
Received: from mga03.intel.com ([134.134.136.65]:33257 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404055AbhARMeu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 07:34:50 -0500
IronPort-SDR: MxqmXUfBU5LuYfmsxWK0knQc4fqoe5VGAz980ECJAZrhR8ukHLLiqyqst2RAXhPXhOSdhYx5ZU
 vy8psgIA2NZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="178882109"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="178882109"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:32:58 -0800
IronPort-SDR: KpQl6Qabvav18BtNcRapJV3kUkLwcUyZ1hPHgtgvtgXbRb3U/GdOt7sUgY3UXvOTcAKPfPy43I
 dxdGuYOAzxcg==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="365325419"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:32:53 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1TjH-0027kG-Q9; Mon, 18 Jan 2021 14:33:55 +0200
Date:   Mon, 18 Jan 2021 14:33:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
Message-ID: <20210118123355.GF4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-3-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 12:34:23AM +0000, Daniel Scally wrote:
> In some ACPI tables we encounter, devices use the _DEP method to assert
> a dependence on other ACPI devices as opposed to the OpRegions that the
> specification intends. We need to be able to find those devices "from"
> the dependee, so add a function to parse all ACPI Devices and check if
> the include the handle of the dependee device in their _DEP buffer.

Fix prefix to be "ACPI / utils: " and rebase on top of function name changes as
suggested by Laurent.

...

> +/**
> + * acpi_dev_get_next_dep_dev - Return next ACPI device dependent on input dev

Are you expecting some kind of for_each_*() macro to be added and used?
Otherwise there is probably no need to have it "_next_" in the name as it will
be a bit confusing.

> + * @adev: Pointer to the dependee device
> + * @prev: Pointer to the previous dependent device (or NULL for first match)
> + *
> + * Return the next ACPI device which declares itself dependent on @adev in
> + * the _DEP buffer.
> + *
> + * The caller is responsible to call put_device() on the returned device.
> + */

-- 
With Best Regards,
Andy Shevchenko


