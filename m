Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FD12FA26A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 15:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391512AbhARMan (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 07:30:43 -0500
Received: from mga07.intel.com ([134.134.136.100]:10055 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391503AbhARMaj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 07:30:39 -0500
IronPort-SDR: nUwFUPJV6CSSo518YJoIPh6QYXAsuZMMB2c9JMkiVvps0LfDPy9QM6a39QgjQ1KhD1lwDqAPOf
 25ZwWjMvfLoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="242866894"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="242866894"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:28:53 -0800
IronPort-SDR: 6iH2ILx1Vuk7B7LU89OE6QX3T0bl5uWmnLgdqabGa401cHoG+kpRpyXtCNjDmh0DUPh5ZxHfA4
 5T0Cd9pQihGg==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="346860180"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:28:48 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1TfK-0027Uk-F1; Mon, 18 Jan 2021 14:29:50 +0200
Date:   Mon, 18 Jan 2021 14:29:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, lee.jones@linaro.org, hdegoede@redhat.com,
        mgross@linux.intel.com, robert.moore@intel.com,
        erik.kaneda@intel.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 1/7] acpi: utils: move acpi_lpss_dep() to utils
Message-ID: <20210118122950.GE4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-2-djrscally@gmail.com>
 <YAU3msXszVZ8CLjs@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAU3msXszVZ8CLjs@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 09:24:10AM +0200, Laurent Pinchart wrote:
> On Mon, Jan 18, 2021 at 12:34:22AM +0000, Daniel Scally wrote:

...

> > +bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle);
> 
> "lpss" stands for low power subsystem, an Intel device within the PCH
> that handles I2C, SPI, UART, ... I think the function should be renamed,
> as it's now generic. acpi_dev_has_dep() is a potential candidate, I'm
> sure better ones exist. A bit of kerneldoc would also not hurt.

Actually a good suggestions. Please apply my tag after addressing above.

-- 
With Best Regards,
Andy Shevchenko


