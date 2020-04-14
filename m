Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951811A7FF2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 16:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391018AbgDNOij (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 10:38:39 -0400
Received: from mga17.intel.com ([192.55.52.151]:17542 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390985AbgDNOih (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 10:38:37 -0400
IronPort-SDR: zMqtUcD1gsEQCBsOXimFOQkyIo6qDmeg4oVAT9cfiecL6w0lPaXp6SVB5/2FKDZFGMOakMuDL2
 jfxa8h88NU4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 07:38:37 -0700
IronPort-SDR: rm6d00DWkS4DoFutg4EYS4om06GEWiJAWju+GupMWGZ5nCt7BIPQ2zboBiVM0VZ1QZPJ9X7WLC
 iyqlNphP8ymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="298717797"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2020 07:38:35 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOMhx-000Y0b-Tb; Tue, 14 Apr 2020 17:38:37 +0300
Date:   Tue, 14 Apr 2020 17:38:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     linus.walleij@linaro.org, patrice.chotard@st.com, info@metux.net,
        allison@lohutok.net, nehal-bakulchandra.shah@amd.com,
        tglx@linutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: img-scb: remove duplicate dev_err()
Message-ID: <20200414143837.GV34613@smile.fi.intel.com>
References: <20200414142650.29359-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414142650.29359-1-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 14, 2020 at 10:26:50PM +0800, Dejin Zheng wrote:
> it will print an error message by itself when platform_get_irq()
> goes wrong. so don't need dev_err() in here again.

In the future, please use something like this
	scripts/get_maintainer.pl --git --git-min-percent=67
when retrieve Cc list for the mail.


FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
>  drivers/i2c/busses/i2c-img-scb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> index 422097a31c95..2f6de763816a 100644
> --- a/drivers/i2c/busses/i2c-img-scb.c
> +++ b/drivers/i2c/busses/i2c-img-scb.c
> @@ -1344,10 +1344,8 @@ static int img_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(i2c->base);
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "can't get irq number\n");
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	i2c->sys_clk = devm_clk_get(&pdev->dev, "sys");
>  	if (IS_ERR(i2c->sys_clk)) {
> -- 
> 2.25.0
> 

-- 
With Best Regards,
Andy Shevchenko


