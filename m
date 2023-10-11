Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF217C602E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 00:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233771AbjJKWKy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 18:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233640AbjJKWKx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 18:10:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E4391;
        Wed, 11 Oct 2023 15:10:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BC7C433C7;
        Wed, 11 Oct 2023 22:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697062251;
        bh=ODNo1oRkg6rySy+/wpgW4ma0FpFpbslF4H2He5+lkAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IcSBKP6DTKITyKIKvGvZCKPNolhtg9u6aoPVPBaan2YAZcTQfxnHd72YJtlchGbKq
         k7a99SEpmSsyDtn275EVzoLZG3TasTgKJWYLu+kWFUbYC3xnrxi0L8rXP+hfIZkezY
         jpgsx/rYlf/IhFha1gcaybESAMQ75jRPmddQjUb3GAwERCmf3BzXstdyUltfQrMUV+
         Pq6lrhBHzElvL7PIzWZlLTUCFUdgQa0RiULTVqNw35npOOhgjtU/P73k1FVN9xOZlk
         FfgwGqCgQ6dtRvkpxwN4fLQ7Th1sZu7zHbn0bsPESfcDrgGbPjN2xxzxW9xG848tqk
         KKoDjMPZEmN/w==
Date:   Thu, 12 Oct 2023 00:10:45 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3] i2c: exynos5: add support for atomic transfers
Message-ID: <20231011221045.r26impqekjuepui7@zenone.zhora.eu>
References: <CGME20231006150811eucas1p1a9e2b98d191bb8093daf38daba14e9a0@eucas1p1.samsung.com>
 <20231006150804.4113844-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006150804.4113844-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

...

> +static bool exynos5_i2c_poll_irqs_timeout(struct exynos5_i2c *i2c,
> +					  unsigned long timeout)
> +{
> +	unsigned long time_left = jiffies + timeout;
> +
> +	while (time_before(jiffies, time_left) &&
> +	       !((i2c->trans_done && (i2c->msg->len == i2c->msg_ptr)) ||
> +	         (i2c->state < 0))) {
> +		while (readl(i2c->regs + HSI2C_INT_ENABLE) &
> +		       readl(i2c->regs + HSI2C_INT_STATUS))
> +			exynos5_i2c_irq(i2c->irq, i2c);
> +		usleep_range(100, 200);
> +	}
> +	return time_before(jiffies, time_left);
> +}
> +
>  static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
>  			      struct i2c_msg *msgs, int stop)
>  {
> @@ -725,8 +746,13 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
>  
>  	exynos5_i2c_message_start(i2c, stop);
>  
> -	timeout = wait_for_completion_timeout(&i2c->msg_complete,
> -					      EXYNOS5_I2C_TIMEOUT);
> +	if (!i2c->atomic)
> +		timeout = wait_for_completion_timeout(&i2c->msg_complete,
> +						      EXYNOS5_I2C_TIMEOUT);
> +	else
> +		timeout = exynos5_i2c_poll_irqs_timeout(i2c,
> +							EXYNOS5_I2C_TIMEOUT);

what's a bit bothering here is that one function returns a
boolean while the other returns a timeout stored in an unsigned
long.

Anyway, exynos5_i2c_poll_irqs_timeout() is used only here as a
boolean, so that I guess it's fine.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
