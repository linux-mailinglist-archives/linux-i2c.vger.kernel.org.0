Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CF9158455
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 21:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgBJUkK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 15:40:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:46762 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727331AbgBJUkK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Feb 2020 15:40:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 12:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,426,1574150400"; 
   d="scan'208";a="347123723"
Received: from tthayer-hp-z620.an.intel.com (HELO [10.122.105.146]) ([10.122.105.146])
  by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2020 12:40:09 -0800
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH] i2c: altera: Use 64-bit arithmetic instead of 32-bit
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200210192656.GA8412@embeddedor>
From:   Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <e8516462-c912-5add-963c-583557a1fbf7@linux.intel.com>
Date:   Mon, 10 Feb 2020 14:42:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200210192656.GA8412@embeddedor>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/10/20 1:26 PM, Gustavo A. R. Silva wrote:
> Add suffix ULL to constant 300 in order to avoid a potential integer
> overflow and give the compiler complete information about the proper
> arithmetic to use. Notice that this constant is being used in a context
> that expects an expression of type u64, but it's currently evaluated
> using 32-bit arithmetic.
> 
> Addresses-Coverity: 1458369 ("Unintentional integer overflow")
> Fixes: 0560ad576268 ("i2c: altera: Add Altera I2C Controller driver")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>   drivers/i2c/busses/i2c-altera.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 5255d3755411..526f453f0ff7 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -171,7 +171,8 @@ static void altr_i2c_init(struct altr_i2c_dev *idev)
>   	/* SCL Low Time */
>   	writel(t_low, idev->base + ALTR_I2C_SCL_LOW);
>   	/* SDA Hold Time, 300ns */
> -	writel(div_u64(300 * clk_mhz, 1000), idev->base + ALTR_I2C_SDA_HOLD);
> +	writel(div_u64(300ULL * clk_mhz, 1000),
> +	       idev->base + ALTR_I2C_SDA_HOLD);
>   
>   	/* Mask all master interrupt bits */
>   	altr_i2c_int_enable(idev, ALTR_I2C_ALL_IRQ, false);
> 
Thank you.

Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>
