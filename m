Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136EA30A59E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 11:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbhBAKkz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 05:40:55 -0500
Received: from mga11.intel.com ([192.55.52.93]:53264 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233332AbhBAKkk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 05:40:40 -0500
IronPort-SDR: YTZ+V0lCXmIe1zYXMfF8siWCwRbKE74t7Hr9m/E6fX+CwoMmh6tt429Ls3u1JYezlV7+ifMD9j
 4WjDqQmhNp1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="177158282"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="177158282"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 02:38:50 -0800
IronPort-SDR: Tom3amIGGirqc4JKwoq6x18HoCce2aZEX+Avb9Akh1mQgGGpD59NwSwwxvUfQNknwUv6MHqTpF
 JzUJmFJusHTQ==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="390847886"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 02:38:48 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l6WbV-0016OE-By; Mon, 01 Feb 2021 12:38:45 +0200
Date:   Mon, 1 Feb 2021 12:38:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     mail@richard-neumann.de
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: i2c-amd-mp2: Remove unused macro
Message-ID: <YBfaNQbiUNRvQNli@smile.fi.intel.com>
References: <20210129192553.55906-1-mail@richard-neumann.de>
 <20210129192553.55906-3-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129192553.55906-3-mail@richard-neumann.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 29, 2021 at 08:25:53PM +0100, mail@richard-neumann.de wrote:
> From: Richard Neumann <mail@richard-neumann.de>
> 
> Remove unused work_amd_i2c_common macro.

I think I gave you a tag on this. If no, here it is
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Please carry it on in a new versions (as a part of the commit message,
tag block, usually after your SoB in chronological order of receiving).

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


