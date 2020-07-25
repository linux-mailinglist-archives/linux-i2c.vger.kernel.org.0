Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2654B22D87A
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 17:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgGYPjn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 11:39:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:57289 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgGYPjn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 11:39:43 -0400
IronPort-SDR: z2LVcyuuCqU77035vR7XDNpsWGB8A4Aag6j1NAwaeBxlEf1r/SOsx6HYLJeUk6pBLJGPMHJ81s
 7+3qLbPcp1Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9693"; a="130397563"
X-IronPort-AV: E=Sophos;i="5.75,395,1589266800"; 
   d="scan'208";a="130397563"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2020 08:39:42 -0700
IronPort-SDR: Ga7AVMpyLsiPYE/5MiFSmGw5wzqOfBaSs1IrClb6F6dkF1YZ2585Cxzn10p5/0ljbe7GJJ679R
 mwrUSEnQmR9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,395,1589266800"; 
   d="scan'208";a="289286463"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 25 Jul 2020 08:39:41 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jzMGz-003ysV-DA; Sat, 25 Jul 2020 18:39:41 +0300
Date:   Sat, 25 Jul 2020 18:39:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: also convert placeholder function to return errno
Message-ID: <20200725153941.GI3703480@smile.fi.intel.com>
References: <20200725140736.3629-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725140736.3629-1-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jul 25, 2020 at 04:07:36PM +0200, Wolfram Sang wrote:
> All i2c_new_device-alike functions return ERR_PTR these days, but this
> fallback function was missed.

I think either will work.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks!

> Fixes: 2dea645ffc21 ("i2c: acpi: Return error pointers from i2c_acpi_new_device()")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> I recall that -ENOSYS is returned in case something is not compiled in.
> I am open for -ENODEV if this is deemed better...
> 
>  include/linux/i2c.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index b8b8963f8bb9..83fe48304781 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -1001,7 +1001,7 @@ static inline u32 i2c_acpi_find_bus_speed(struct device *dev)
>  static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>  					int index, struct i2c_board_info *info)
>  {
> -	return NULL;
> +	return ERR_PTR(-ENOSYS);
>  }
>  static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
>  {
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


