Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749132FA1E8
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 14:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404721AbhARNmc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 08:42:32 -0500
Received: from mga07.intel.com ([134.134.136.100]:10492 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404711AbhARNmU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 08:42:20 -0500
IronPort-SDR: P/aLfYNCWzZvOjW8PltsiVEmZxWvYjNJTnsfgR63y3irYHV1Un0vZt6W5PlNQ2NEkF7dIRIvHp
 MfwR11kJ2IQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="242873211"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="242873211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 05:40:26 -0800
IronPort-SDR: rnA36ufbqqksn8ZusWPXOFeFsAE/uuC4PAfY6JkJptU8DoskRgGs6S40MSrnT1xooUagruogc0
 MxI+8e0K7sow==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="346878970"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 05:40:21 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1UmZ-002Bg5-Mn; Mon, 18 Jan 2021 15:41:23 +0200
Date:   Mon, 18 Jan 2021 15:41:23 +0200
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
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Message-ID: <20210118134123.GJ4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-5-djrscally@gmail.com>
 <YAVSf7+iTPNYf5XS@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAVSf7+iTPNYf5XS@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 11:18:55AM +0200, Laurent Pinchart wrote:
> On Mon, Jan 18, 2021 at 12:34:25AM +0000, Daniel Scally wrote:

...

> > +/**
> > + * i2c_acpi_dev_name - Construct i2c device name for devs sourced from ACPI
> > + * @adev:     ACPI device to construct the name for
> > + *
> > + * Constructs the name of an i2c device matching the format used by
> > + * i2c_dev_set_name() to allow users to refer to an i2c device by name even
> > + * before they have been instantiated.
> > + *
> > + * The caller is responsible for freeing the returned pointer.
> > + */
> > +char *i2c_acpi_dev_name(struct acpi_device *adev)
> > +{
> > +	return kasprintf(GFP_KERNEL, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
> 
> There's a real danger of a memory leak, as the function name sounds very
> similar to dev_name() or acpi_dev_name() and those don't allocate
> memory. I'm not sure what a better name would be, but given that this
> function is only used in patch 6/7 and not in the I2C subsystem itself,
> I wonder if we should inline this kasprintf() call in the caller and
> drop this patch.

Dan, I'm fine with either choice.

> > +}

-- 
With Best Regards,
Andy Shevchenko


