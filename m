Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B4245028A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 11:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhKOKbd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 05:31:33 -0500
Received: from mga12.intel.com ([192.55.52.136]:5595 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231135AbhKOKb3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 05:31:29 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="213450191"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="213450191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 02:28:33 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="471863092"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 02:28:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mmZDq-0071ir-Qu;
        Mon, 15 Nov 2021 12:28:22 +0200
Date:   Mon, 15 Nov 2021 12:28:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Lawrence,Wang" <lawrence.wang@nokia-sbell.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wang@wrlinb193.emea.nsn-net.net
Subject: Re: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Message-ID: <YZI2RnFgO0Y75KlF@smile.fi.intel.com>
References: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
 <YZI0LuDK63+Wb7wi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZI0LuDK63+Wb7wi@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 15, 2021 at 12:19:26PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 15, 2021 at 10:35:55AM +0100, Lawrence,Wang wrote:
> > From: "Wang, Lawrence" <lawrence.wang@nokia-sbell.com>
> > 
> > Current code support config the HCNT/LCNT only via ACPI method. for those
> > platform that not support ACPI, will get the HCNT/LCNT value based on input
> > clock. But it is not always accuracy. for example in some platform will get
> > lower speed(320khz) in fast mode, and get faster speed(105khz/even more) in
> > standard mode.
> > 
> > This patch makes it possible for the non-ACPI platform to pass more optimal
> > HCNT/LCNT values to the core driver via dts if they are known beforehand.
> > If these are not set we use the calculated values.
> 
> Besides the fact it misses DT schema update, why this is needed at all?
> What's wrong with the existing DT timings?

Just for your convenience an excerpt from
Documentation/devicetree/bindings/i2c/i2c.txt

- i2c-scl-falling-time-ns
Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
specification.

- i2c-scl-internal-delay-ns
Number of nanoseconds the IP core additionally needs to setup SCL.

- i2c-scl-rising-time-ns
Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
specification.

- i2c-sda-falling-time-ns
Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
specification.

-- 
With Best Regards,
Andy Shevchenko


