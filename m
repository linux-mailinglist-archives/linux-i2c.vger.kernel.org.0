Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE3BD16BA96
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 08:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbgBYHaQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 02:30:16 -0500
Received: from mga06.intel.com ([134.134.136.31]:54837 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbgBYHaQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 02:30:16 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 23:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; 
   d="scan'208";a="316999407"
Received: from mylly.fi.intel.com (HELO [10.237.72.61]) ([10.237.72.61])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2020 23:30:13 -0800
Subject: Re: [PATCH v1 04/40] i2c: altera: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Thor Thayer <thor.thayer@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-4-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <71a245ee-a3a4-a90f-4c2d-155b1dd1afde@linux.intel.com>
Date:   Tue, 25 Feb 2020 09:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224151530.31713-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 2/24/20 5:14 PM, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Cc: Thor Thayer <thor.thayer@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-altera.c | 8 ++++----
>   include/linux/i2c.h             | 1 +
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 5255d3755411..1f70bbd6e084 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -142,12 +142,12 @@ static inline void altr_i2c_stop(struct altr_i2c_dev *idev)
>   static void altr_i2c_init(struct altr_i2c_dev *idev)
>   {
>   	u32 divisor = clk_get_rate(idev->i2c_clk) / idev->bus_clk_rate;
> -	u32 clk_mhz = clk_get_rate(idev->i2c_clk) / 1000000;
> +	u32 clk_mhz = clk_get_rate(idev->i2c_clk) / HZ_PER_MHZ;

IMHO these kind of defines don't improve readability in formulas. What 
is HZ_PER_MHZ? You have to go and grep it first in order to be sure. Of 
course it protects against typos like "100000" or "10000000" that are 
difficult to spot at quick look.

Better would be just "1MHz" or even better calc_something_MHz().

-- 
Jarkko
