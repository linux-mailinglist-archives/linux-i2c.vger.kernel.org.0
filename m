Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFE8308CCE
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 19:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhA2Sxw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 13:53:52 -0500
Received: from mga17.intel.com ([192.55.52.151]:42163 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230249AbhA2Sxv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Jan 2021 13:53:51 -0500
IronPort-SDR: Bnw53z9N5IeGLdv1QfyXjfeTxka4jx+mDfMJn8PU0Djd6Meobu/pDOz33BqHPOt4OvM/1DcABJ
 ssn+fBWORfPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="160239891"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="160239891"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 10:52:05 -0800
IronPort-SDR: /G/aiajG3klOvHX+Q9XE4sY9PUo0wqyC/ctfzGgJLpV/ttUHQmG0Zsoiobswk81m5KxGotvQ+W
 UUoHUQ9JUYbA==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="475049426"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 10:52:03 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l5YsC-000SA0-W3; Fri, 29 Jan 2021 20:52:00 +0200
Date:   Fri, 29 Jan 2021 20:52:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     mail@richard-neumann.de
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Removed unused work_amd_i2c_common macro
Message-ID: <YBRZUHv+21FIQ/2g@smile.fi.intel.com>
References: <20210129182606.41518-1-mail@richard-neumann.de>
 <20210129182606.41518-3-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129182606.41518-3-mail@richard-neumann.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 29, 2021 at 07:26:06PM +0100, mail@richard-neumann.de wrote:
> From: Richard Neumann <mail@richard-neumann.de>
> 
> The macro work_amd_i2c_common is not used anywhere in the driver.
> Removed it.

After addressing Subject as per comment against the previous patch, feel free
to add

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Richard Neumann <mail@richard-neumann.de>
> ---
>  drivers/i2c/busses/i2c-amd-mp2.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
> index 6b91e285745d..ddecd0c88656 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2.h
> +++ b/drivers/i2c/busses/i2c-amd-mp2.h
> @@ -185,9 +185,6 @@ struct amd_mp2_dev {
>  	unsigned int probed;
>  };
>  
> -#define work_amd_i2c_common(__work) \
> -	container_of(__work, struct amd_i2c_common, work.work)
> -
>  /* PCIe communication driver */
>  
>  int amd_mp2_rw(struct amd_i2c_common *i2c_common, enum i2c_cmd reqcmd);
> -- 
> 2.30.0
> 

-- 
With Best Regards,
Andy Shevchenko


