Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9E92FA206
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 14:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404801AbhARNrc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 08:47:32 -0500
Received: from mga18.intel.com ([134.134.136.126]:65233 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404795AbhARNr3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 08:47:29 -0500
IronPort-SDR: PHbFSyYwdZKF2dJwYf5oO1yoczyN55npoH3GI2HjEtf+akQ+WsJwzJD2dnfr+5XLjHCwQ0BHxk
 y4Ykk5KJTKgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="166470431"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="166470431"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 05:45:38 -0800
IronPort-SDR: PR+hv6hLqfNAtcPkVR04+0gnc9Nps5QoJuhmEnVa+uj3n6TC6qC5b0f0KRAHLvkbZ6i4z61E+3
 vByLHB6fpw9A==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="406222305"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 05:45:33 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1Urb-002Bz6-Fo; Mon, 18 Jan 2021 15:46:35 +0200
Date:   Mon, 18 Jan 2021 15:46:35 +0200
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
Subject: Re: [PATCH v2 5/7] gpio: gpiolib-acpi: Export acpi_get_gpiod()
Message-ID: <20210118134635.GL4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-6-djrscally@gmail.com>
 <20210118134502.GK4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118134502.GK4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 03:45:02PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 12:34:26AM +0000, Daniel Scally wrote:

And prefix: "gpiolib: acpi: ".

-- 
With Best Regards,
Andy Shevchenko


