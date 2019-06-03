Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 507213293D
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 09:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfFCHWj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 03:22:39 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36365 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfFCHWj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 03:22:39 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190603072236euoutp01a0aa226968b2c2b73a0ae954601ed780~kn1SWuYi51235112351euoutp017
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jun 2019 07:22:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190603072236euoutp01a0aa226968b2c2b73a0ae954601ed780~kn1SWuYi51235112351euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559546556;
        bh=MyuEsZ6PL0/pxbfHhgO1iiqfyO05IR/ztP1mi9uP0gg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=vecp7GQWECNbNAIkRWnty9mIImNLMx2sJLC8CNa1p3FD/JfNPkyP3L1PCtDRKCsEz
         Jryu0pxm0B8fGBOqT1ypjZLZG8sZivI5byoUYTbQHqKy07ZA+uiIxWjYqb2lkLJS4c
         VXl6K04bNZT3ys3sFOaNTUF6NEaJt/6VLlVpdk8Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190603072236eucas1p1703c1e96ee19a03b6557962d98ef4549~kn1R6daj61069010690eucas1p1o;
        Mon,  3 Jun 2019 07:22:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id F6.CE.04298.BBAC4FC5; Mon,  3
        Jun 2019 08:22:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190603072235eucas1p1e635df44bb78198545667109fc4bc87e~kn1RJ6XEZ1069810698eucas1p1W;
        Mon,  3 Jun 2019 07:22:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190603072235eusmtrp16e71d56c0b4df572ff7be7ed27925164~kn1Q6Zhvs0229202292eusmtrp1r;
        Mon,  3 Jun 2019 07:22:35 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-8f-5cf4cabbb9af
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D8.FB.04140.ABAC4FC5; Mon,  3
        Jun 2019 08:22:35 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190603072234eusmtip2190122c2cbf154bcb75254f8a19453b2~kn1QjCUts1898018980eusmtip23;
        Mon,  3 Jun 2019 07:22:34 +0000 (GMT)
Subject: Re: [PATCH v2] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Doug Anderson <dianders@chromium.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <9f2611af-ec96-2559-a6cb-631564fc36eb@samsung.com>
Date:   Mon, 3 Jun 2019 09:22:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190601165931.17226-1-linus.walleij@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djPc7q7T32JMZjy3sTi7LKDbBbnz29g
        t5jyZzmTRcffL4wWK0/MYnZg9ZjdcJHFY9OqTjaPO9f2sHmcPPWExePzJrkA1igum5TUnMyy
        1CJ9uwSujMNrO9kLVtlUbPh8ibmBscegi5GTQ0LARGLXhUPsXYxcHEICKxgl9jQdZoFwvjBK
        nHh8ihnC+cwoMf/qTyaYlp7p11lBbCGB5YwSX29ZQhS9ZZR4MvEbG0hCWMBbYses6WANIgLZ
        Em9ub2MGsZkFgiQ6J1xgBLHZBAwlut52gdXzCthJfDi3DcxmEVCRmDD3ENgCUYEYia/7rzJD
        1AhKnJz5hAXE5gSqX/FlMhPETHmJ7W/nQM0Xl7j1ZD7UoYvYJc5OsYCwXSSeXbzGCmELS7w6
        voUdwpaROD25B+xlCYFmRomH59ayQzg9jBKXm2YwQlRZSxw+fhGomwNog6bE+l36IKaEgKPE
        xGO2ECafxI23ghAn8ElM2jadGSLMK9HRJgQxQ01i1vF1cFsPXrjEPIFRaRaSx2YheWYWkmdm
        IaxdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzDZnP53/NMOxq+Xkg4xCnAwKvHw
        zmD/EiPEmlhWXJl7iFGCg1lJhHel2ccYId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzVDA+ihQTS
        E0tSs1NTC1KLYLJMHJxSDYxiB9ndjvLe6uaf3BDBF9im+u9T/UqPnAjh33IPiu0swxIfPjx1
        qKP/tHPuiwd1K4VttpueEkoX4X4pHLP+jYyY7vU017O7jxpWdJ6VTp6wQ5db58PLA1tyXRTX
        GO+XOLPgclpVU0Xqtiv6vBUFHtetvsvWeoi38tkcfLGs6l/Jm9LFio6Jz5VYijMSDbWYi4oT
        ARKPxBsyAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xe7q7T32JMXgzh9Hi7LKDbBbnz29g
        t5jyZzmTRcffL4wWK0/MYnZg9ZjdcJHFY9OqTjaPO9f2sHmcPPWExePzJrkA1ig9m6L80pJU
        hYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jMNrO9kLVtlUbPh8
        ibmBscegi5GTQ0LARKJn+nVWEFtIYCmjxO/P/hBxGYmT0xpYIWxhiT/Xuti6GLmAal4zSmw8
        OJkNJCEs4C2xY9Z0JhBbRCBbYvvVrYwgNrNAkMS9WVPYIRomMko8/NwLVsQmYCjR9bYLrJlX
        wE7iw7ltYDaLgIrEhLmHwLaJCsRI9DWuYIGoEZQ4OfMJmM0JVL/iy2QmiAVmEvM2P2SGsOUl
        tr+dA2WLS9x6Mp9pAqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5
        mxiBEbbt2M8tOxi73gUfYhTgYFTi4f3A+SVGiDWxrLgy9xCjBAezkgjvSrOPMUK8KYmVValF
        +fFFpTmpxYcYTYGem8gsJZqcD4z+vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakF
        qUUwfUwcnFINjCf8vQzubyk8YbfWUu+Qwzs9uQkmb7MmqWwvPC7ySTPtm6a2vOVvjVr+p36f
        /rssDry5Juna6u9e0WLlqqo7hXZoMP3JP/TjVcr01rLV5+a41jMdjsxauPVWTOGPa6/SXI4y
        u3zQy8nOLSk7s2nV07X2fibfi3ZETu3dUr6q+sv6jYxTf8yNKVdiKc5INNRiLipOBABSF2BJ
        xgIAAA==
X-CMS-MailID: 20190603072235eucas1p1e635df44bb78198545667109fc4bc87e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190601165941epcas3p37be60b9f09a51980c2bb63c4e6961578
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190601165941epcas3p37be60b9f09a51980c2bb63c4e6961578
References: <CGME20190601165941epcas3p37be60b9f09a51980c2bb63c4e6961578@epcas3p3.samsung.com>
        <20190601165931.17226-1-linus.walleij@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Linus,

On 2019-06-01 18:59, Linus Walleij wrote:
> Instead of complex code picking GPIOs out of the device tree
> and keeping track of polarity for each GPIO line, use descriptors
> and pull polarity handling into the gpiolib.
>
> We look for "our-claim" and "their-claim" since the gpiolib
> code will try e.g. "our-claim-gpios" and "our-claim-gpio" in
> turn to locate these GPIO lines from the device tree.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Samsung Snow Chromebook works fine with linux-next 20190603 and this patch.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> ChangeLog v1->v2:
> - Print some errors if we fail to obtain GPIOs.
> - Switch to devm_gpiod_get_index() and !IS_ERR() on the result
>    to check for an unsupported multimaster set-up.
> - Especially handle if the second master returns -EPROBE_DEFER
>    even in the case of the optional GPIO that we explicitly bail
>    out on if found, as it may be a sign that the GPIO controllers
>    are not yet up.
> ---
>   drivers/i2c/muxes/i2c-arb-gpio-challenge.c | 79 ++++++++--------------
>   1 file changed, 27 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> index 812b8cff265f..a664f637bc3d 100644
> --- a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> +++ b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> @@ -15,12 +15,11 @@
>    */
>   
>   #include <linux/delay.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/kernel.h>
>   #include <linux/i2c.h>
>   #include <linux/i2c-mux.h>
>   #include <linux/module.h>
> -#include <linux/of_gpio.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   
> @@ -28,22 +27,16 @@
>   /**
>    * struct i2c_arbitrator_data - Driver data for I2C arbitrator
>    *
> - * @our_gpio: GPIO we'll use to claim.
> - * @our_gpio_release: 0 if active high; 1 if active low; AKA if the GPIO ==
> - *   this then consider it released.
> - * @their_gpio: GPIO that the other side will use to claim.
> - * @their_gpio_release: 0 if active high; 1 if active low; AKA if the GPIO ==
> - *   this then consider it released.
> + * @our_gpio: GPIO descriptor we'll use to claim.
> + * @their_gpio: GPIO descriptor that the other side will use to claim.
>    * @slew_delay_us: microseconds to wait for a GPIO to go high.
>    * @wait_retry_us: we'll attempt another claim after this many microseconds.
>    * @wait_free_us: we'll give up after this many microseconds.
>    */
>   
>   struct i2c_arbitrator_data {
> -	int our_gpio;
> -	int our_gpio_release;
> -	int their_gpio;
> -	int their_gpio_release;
> +	struct gpio_desc *our_gpio;
> +	struct gpio_desc *their_gpio;
>   	unsigned int slew_delay_us;
>   	unsigned int wait_retry_us;
>   	unsigned int wait_free_us;
> @@ -64,15 +57,15 @@ static int i2c_arbitrator_select(struct i2c_mux_core *muxc, u32 chan)
>   	stop_time = jiffies + usecs_to_jiffies(arb->wait_free_us) + 1;
>   	do {
>   		/* Indicate that we want to claim the bus */
> -		gpio_set_value(arb->our_gpio, !arb->our_gpio_release);
> +		gpiod_set_value(arb->our_gpio, 1);
>   		udelay(arb->slew_delay_us);
>   
>   		/* Wait for the other master to release it */
>   		stop_retry = jiffies + usecs_to_jiffies(arb->wait_retry_us) + 1;
>   		while (time_before(jiffies, stop_retry)) {
> -			int gpio_val = !!gpio_get_value(arb->their_gpio);
> +			int gpio_val = gpiod_get_value(arb->their_gpio);
>   
> -			if (gpio_val == arb->their_gpio_release) {
> +			if (!gpio_val) {
>   				/* We got it, so return */
>   				return 0;
>   			}
> @@ -81,13 +74,13 @@ static int i2c_arbitrator_select(struct i2c_mux_core *muxc, u32 chan)
>   		}
>   
>   		/* It didn't release, so give up, wait, and try again */
> -		gpio_set_value(arb->our_gpio, arb->our_gpio_release);
> +		gpiod_set_value(arb->our_gpio, 0);
>   
>   		usleep_range(arb->wait_retry_us, arb->wait_retry_us * 2);
>   	} while (time_before(jiffies, stop_time));
>   
>   	/* Give up, release our claim */
> -	gpio_set_value(arb->our_gpio, arb->our_gpio_release);
> +	gpiod_set_value(arb->our_gpio, 0);
>   	udelay(arb->slew_delay_us);
>   	dev_err(muxc->dev, "Could not claim bus, timeout\n");
>   	return -EBUSY;
> @@ -103,7 +96,7 @@ static int i2c_arbitrator_deselect(struct i2c_mux_core *muxc, u32 chan)
>   	const struct i2c_arbitrator_data *arb = i2c_mux_priv(muxc);
>   
>   	/* Release the bus and wait for the other master to notice */
> -	gpio_set_value(arb->our_gpio, arb->our_gpio_release);
> +	gpiod_set_value(arb->our_gpio, 0);
>   	udelay(arb->slew_delay_us);
>   
>   	return 0;
> @@ -116,8 +109,7 @@ static int i2c_arbitrator_probe(struct platform_device *pdev)
>   	struct device_node *parent_np;
>   	struct i2c_mux_core *muxc;
>   	struct i2c_arbitrator_data *arb;
> -	enum of_gpio_flags gpio_flags;
> -	unsigned long out_init;
> +	struct gpio_desc *dummy;
>   	int ret;
>   
>   	/* We only support probing from device tree; no platform_data */
> @@ -138,45 +130,28 @@ static int i2c_arbitrator_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, muxc);
>   
> -	/* Request GPIOs */
> -	ret = of_get_named_gpio_flags(np, "our-claim-gpio", 0, &gpio_flags);
> -	if (!gpio_is_valid(ret)) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Error getting our-claim-gpio\n");
> -		return ret;
> -	}
> -	arb->our_gpio = ret;
> -	arb->our_gpio_release = !!(gpio_flags & OF_GPIO_ACTIVE_LOW);
> -	out_init = (gpio_flags & OF_GPIO_ACTIVE_LOW) ?
> -		GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW;
> -	ret = devm_gpio_request_one(dev, arb->our_gpio, out_init,
> -				    "our-claim-gpio");
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Error requesting our-claim-gpio\n");
> -		return ret;
> +	/* Request GPIOs, our GPIO as unclaimed to begin with */
> +	arb->our_gpio = devm_gpiod_get(dev, "our-claim", GPIOD_OUT_LOW);
> +	if (IS_ERR(arb->our_gpio)) {
> +		dev_err(dev, "could not get \"our-claim\" GPIO (%ld)\n",
> +			PTR_ERR(arb->our_gpio));
> +		return PTR_ERR(arb->our_gpio);
>   	}
>   
> -	ret = of_get_named_gpio_flags(np, "their-claim-gpios", 0, &gpio_flags);
> -	if (!gpio_is_valid(ret)) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Error getting their-claim-gpio\n");
> -		return ret;
> -	}
> -	arb->their_gpio = ret;
> -	arb->their_gpio_release = !!(gpio_flags & OF_GPIO_ACTIVE_LOW);
> -	ret = devm_gpio_request_one(dev, arb->their_gpio, GPIOF_IN,
> -				    "their-claim-gpio");
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Error requesting their-claim-gpio\n");
> -		return ret;
> +	arb->their_gpio = devm_gpiod_get(dev, "their-claim", GPIOD_IN);
> +	if (IS_ERR(arb->their_gpio)) {
> +		dev_err(dev, "could not get \"their-claim\" GPIO (%ld)\n",
> +			PTR_ERR(arb->their_gpio));
> +		return PTR_ERR(arb->their_gpio);
>   	}
>   
>   	/* At the moment we only support a single two master (us + 1 other) */
> -	if (gpio_is_valid(of_get_named_gpio(np, "their-claim-gpios", 1))) {
> +	dummy = devm_gpiod_get_index(dev, "their-claim", 1, GPIOD_IN);
> +	if (!IS_ERR(dummy)) {
>   		dev_err(dev, "Only one other master is supported\n");
>   		return -EINVAL;
> +	} else if (PTR_ERR(dummy) == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
>   	}
>   
>   	/* Arbitration parameters */

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

