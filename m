Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0FD92FA1FD
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 14:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392435AbhARNqc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 08:46:32 -0500
Received: from mga11.intel.com ([192.55.52.93]:58227 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404811AbhARNpx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 08:45:53 -0500
IronPort-SDR: YVKC/RrNayi3QTgOns1OXrPKeJqrorlG9bcC4oxrVWB0BKdozmyse2/jzYyuz318kLCPlYf4pt
 me6GLoDNLVzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="175299744"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="175299744"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 05:44:04 -0800
IronPort-SDR: TPsyVrYJR9OGHy5R0vjWblow2vDgGF86pUVmq7voWqOMcO93kUOG/n+IiOYzumPmj0D/Rgw5Zg
 9aaSA5sDg2MA==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="402051887"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 05:44:00 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1Uq6-002BtL-2N; Mon, 18 Jan 2021 15:45:02 +0200
Date:   Mon, 18 Jan 2021 15:45:02 +0200
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
Message-ID: <20210118134502.GK4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-6-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 12:34:26AM +0000, Daniel Scally wrote:
> I need to be able to translate GPIO resources in an acpi_device's _CRS

ACPI device's

> into gpio_descs. Those are represented in _CRS as a pathname to a GPIO

into GPIO descriptor array

> device plus the pin's index number: this function is perfect for that
> purpose.

...

> diff --git a/include/linux/acpi.h b/include/linux/acpi.h

Wrong header. Please use gpio/consumer.h.

-- 
With Best Regards,
Andy Shevchenko


