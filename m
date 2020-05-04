Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BE11C3C6A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 16:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbgEDOKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 10:10:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:36898 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbgEDOKF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 May 2020 10:10:05 -0400
IronPort-SDR: h7pYE2A7n5zElFB4SrB6UYluG05dKdDC1EITlthQgnG9LJJmB7+77S1z0FaIcF8c+xqFlhPHTg
 4rGVprbH+fLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 07:10:04 -0700
IronPort-SDR: LRaJEeCip1QvSd7iFhaT3EMa6AFcu1oiy2kpCBSBxwI8r4Jkl44AF5/tolkUMFJwLqZ14O4QjU
 9CrZmHwfuvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; 
   d="scan'208";a="460677147"
Received: from tthayer-hp-z620.an.intel.com (HELO [10.122.105.146]) ([10.122.105.146])
  by fmsmga005.fm.intel.com with ESMTP; 04 May 2020 07:10:04 -0700
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH] i2c: altera: Remove superfluous error message in
 altr_i2c_probe()
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200503124833.15070-1-aishwaryarj100@gmail.com>
From:   Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <d8dd2831-c067-61f1-d76f-aec9c86f21b6@linux.intel.com>
Date:   Mon, 4 May 2020 09:10:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503124833.15070-1-aishwaryarj100@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/3/20 7:48 AM, Aishwarya Ramakrishnan wrote:
> The function platform_get_irq can log an error by itself.
> This omit a redundant message for exception handling in the
> calling function.
> 
> Suggested by Coccinelle.
> 
> Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
> ---
>   drivers/i2c/busses/i2c-altera.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index f5c00f903df3..af6985f0ae63 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -395,10 +395,8 @@ static int altr_i2c_probe(struct platform_device *pdev)
>   		return PTR_ERR(idev->base);
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "missing interrupt resource\n");
> +	if (irq < 0)
>   		return irq;
> -	}
>   
>   	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
>   	if (IS_ERR(idev->i2c_clk)) {
> 

Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>
