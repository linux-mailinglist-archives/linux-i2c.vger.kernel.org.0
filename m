Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9CDD9259E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 15:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfHSN55 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 09:57:57 -0400
Received: from mga02.intel.com ([134.134.136.20]:60030 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726987AbfHSN55 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 19 Aug 2019 09:57:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Aug 2019 06:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; 
   d="scan'208";a="207012387"
Received: from mylly.fi.intel.com (HELO [10.237.72.162]) ([10.237.72.162])
  by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2019 06:56:49 -0700
Subject: Re: [PATCH v1] i2c: designware: assert reset when error happen at
 ->probe()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>
References: <20190819102423.73683-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <eb14fc95-c613-6303-8869-b3e849179122@linux.intel.com>
Date:   Mon, 19 Aug 2019 16:56:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819102423.73683-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/19/19 1:24 PM, Andy Shevchenko wrote:
> The commit c62ebb3d5f0d ("i2c: designware: Add support for an interface clock")
> introduced an optional clock while missed correct error handling.
> assert reset line back if error happen at ->probe().
> 
> Fixes: c62ebb3d5f0d ("i2c: designware: Add support for an interface clock")
> Cc: Phil Edworthy <phil.edworthy@renesas.com>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index ddfb81872906..4624ef8fbae8 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -346,8 +346,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   
>   	/* Optional interface clock */
>   	dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> -	if (IS_ERR(dev->pclk))
> -		return PTR_ERR(dev->pclk);
> +	if (IS_ERR(dev->pclk)) {
> +		ret = PTR_ERR(dev->pclk);
> +		goto exit_reset;
> +	}
>   
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
