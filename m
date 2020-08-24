Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB1A24F4D4
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Aug 2020 10:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgHXIl2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Aug 2020 04:41:28 -0400
Received: from mga05.intel.com ([192.55.52.43]:11470 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728497AbgHXIl1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Aug 2020 04:41:27 -0400
IronPort-SDR: UHlqZmGEyUWaHbTeeEvdXkZoSZQJ+6HvZ+Bfz9rxCE9z24sxwEKD3HiQmx9q8ZJBPO6HCDUWKe
 HFb9PnRJE0GQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="240681270"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="240681270"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 01:41:27 -0700
IronPort-SDR: 8RBpJr6UX0xwHHO7Xy1rP4gzwxC5YS1pzpIQmis9wlfT40h5uviIkq2MIo1dAwQBUuvU9TqakO
 4FqcVf/7UXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="402251077"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 24 Aug 2020 01:41:25 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 24 Aug 2020 11:41:24 +0300
Date:   Mon, 24 Aug 2020 11:41:24 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: core: Don't fail PRP0001 enumeration when no
 ID table exist
Message-ID: <20200824084124.GZ1375436@lahna.fi.intel.com>
References: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 21, 2020 at 08:03:33PM +0300, Andy Shevchenko wrote:
> When commit c64ffff7a9d1 ("i2c: core: Allow empty id_table in ACPI case
> as well") fixed the enumeration of I²C devices on ACPI enabled platforms
> when driver has no ID table, it missed the PRP0001 support.
> 
> i2c_device_match() and i2c_acpi_match_device() differently match
> driver against given device. Use acpi_driver_match_device(), that is used
> in the former, in i2c_device_probe() and don't fail PRP0001 enumeration
> when no ID table exist.
> 
> Fixes: c64ffff7a9d1 ("i2c: core: Allow empty id_table in ACPI case as well")
> BugLink: https://stackoverflow.com/q/63519678/2511795
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
