Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9963450242
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 11:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237589AbhKOKWr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 05:22:47 -0500
Received: from mga07.intel.com ([134.134.136.100]:31378 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237490AbhKOKWf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 05:22:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="296844996"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="296844996"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 02:19:38 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="547971933"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 02:19:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mmZ5C-0071YO-P9;
        Mon, 15 Nov 2021 12:19:26 +0200
Date:   Mon, 15 Nov 2021 12:19:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Lawrence,Wang" <lawrence.wang@nokia-sbell.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wang@wrlinb193.emea.nsn-net.net
Subject: Re: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Message-ID: <YZI0LuDK63+Wb7wi@smile.fi.intel.com>
References: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 15, 2021 at 10:35:55AM +0100, Lawrence,Wang wrote:
> From: "Wang, Lawrence" <lawrence.wang@nokia-sbell.com>
> 
> Current code support config the HCNT/LCNT only via ACPI method. for those
> platform that not support ACPI, will get the HCNT/LCNT value based on input
> clock. But it is not always accuracy. for example in some platform will get
> lower speed(320khz) in fast mode, and get faster speed(105khz/even more) in
> standard mode.
> 
> This patch makes it possible for the non-ACPI platform to pass more optimal
> HCNT/LCNT values to the core driver via dts if they are known beforehand.
> If these are not set we use the calculated values.

Besides the fact it misses DT schema update, why this is needed at all?
What's wrong with the existing DT timings?

So far seems NAK to me.

...

> +	ret = device_property_read_u16_array(dev->dev, "dw-i2c-scl-timing",
> +					(u16 *)&i2c_scl_timing, sizeof(i2c_scl_timing)/sizeof(u16));
> +	if (ret)
> +		return;

No, you have to have one property per each value AFAIU DT schema requirements,
Ask Rob Herring about it.

-- 
With Best Regards,
Andy Shevchenko


