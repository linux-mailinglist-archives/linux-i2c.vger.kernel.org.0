Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E0F16AF38
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 19:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgBXSd1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 13:33:27 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:48726 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgBXSd1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 13:33:27 -0500
X-Greylist: delayed 445 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Feb 2020 13:33:26 EST
Received: from tarshish (unknown [10.0.8.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 019B14407C1;
        Mon, 24 Feb 2020 20:25:56 +0200 (IST)
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com> <20200224151530.31713-12-andriy.shevchenko@linux.intel.com>
User-agent: mu4e 1.2.0; emacs 26.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 12/40] i2c: digicolor: Use generic definitions for bus frequencies
In-reply-to: <20200224151530.31713-12-andriy.shevchenko@linux.intel.com>
Date:   Mon, 24 Feb 2020 20:25:56 +0200
Message-ID: <87lforon9n.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Feb 24 2020, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
>  drivers/i2c/busses/i2c-digicolor.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
> index 3adf72540db1..79bf187a90b1 100644
> --- a/drivers/i2c/busses/i2c-digicolor.c
> +++ b/drivers/i2c/busses/i2c-digicolor.c
> @@ -18,7 +18,6 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  
> -#define DEFAULT_FREQ		100000
>  #define TIMEOUT_MS		100
>  
>  #define II_CONTROL		0x0
> @@ -300,7 +299,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
>  
>  	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>  				 &i2c->frequency))
> -		i2c->frequency = DEFAULT_FREQ;
> +		i2c->frequency = I2C_STANDARD_MODE_FREQ;
>  
>  	i2c->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, i2c);

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
