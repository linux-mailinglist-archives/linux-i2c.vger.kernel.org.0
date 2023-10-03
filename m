Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 051C17B6F64
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 19:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjJCRQh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Oct 2023 13:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240639AbjJCRQg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 13:16:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D24FC9;
        Tue,  3 Oct 2023 10:16:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D7EC433C7;
        Tue,  3 Oct 2023 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696353393;
        bh=F/q5FdCpTXptzB2goqPSXt3V+oWWX+WpmBEJWVvOADI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=puKvn6mdRY7PJozEAWmS+PbOh7VRriWSdl8bqUHNrn03BZD8Dp0bXq6J6BQwrDz7T
         X7N5hZq1PlohbS42kMhcYqZFwnOHIgILzqYSe00hhQURH/r4K6skOWvOy2OOlpdB8f
         fGd/wIOmdCv23ACQrtpXK/ZajrabloTy8ChvzEdYL3Hocm6Le5KaWmrhDEkcZzZoOu
         MuPEByQdoEi3AS7lTwuzS8JjVu4bRz3WOEHa/YRym8yLlojzmxW7j5tRLzAGnynCS7
         yyqkT54kO8VVStupnQrlaFuDwc3ZVL1MMkIbiRuubS7sddaUo3wCQE5lfbbwR7/aDF
         oJfO1pCPcEo4g==
Date:   Tue, 3 Oct 2023 19:16:27 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: exynos5: add support for atomic transfers
Message-ID: <20231003171627.xf4g3eex2m7tqhaq@zenone.zhora.eu>
References: <CGME20230929113851eucas1p28d902fbb6054951d57314ff181985e30@eucas1p2.samsung.com>
 <20230929113841.1272625-1-m.szyprowski@samsung.com>
 <20230929225728.uuptlphev4tg7jnf@zenone.zhora.eu>
 <7b850f2f-82a2-43ae-9cbd-0fcc41b2bec0@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b850f2f-82a2-43ae-9cbd-0fcc41b2bec0@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

> >> +static unsigned long exynos5_i2c_polled_irqs_timeout(struct exynos5_i2c *i2c,
> >> +						     unsigned long timeout_ms)
> >> +{
> >> +	ktime_t start, now;
> >> +
> >> +	start = now = ktime_get();
> >> +	while (ktime_ms_delta(now, start) < timeout_ms &&
> >> +	       !((i2c->trans_done && (i2c->msg->len == i2c->msg_ptr)) ||
> >> +	         (i2c->state < 0))) {
> >> +		while (readl(i2c->regs + HSI2C_INT_ENABLE) &
> >> +		       readl(i2c->regs + HSI2C_INT_STATUS))
> >> +			exynos5_i2c_irq(i2c->irq, i2c);
> >> +		usleep_range(100, 200);
> >> +		now = ktime_get();
> >> +	}
> >> +	return ktime_ms_delta(now, start) < timeout_ms;
> > what are you returning here?
> 
> Values similar to wait_for_completion_timeout(); 0 means timeout and 
> non-zero that the waiting condition has been reached, please check how 
> it is used in exynos5_i2c_xfer_msg(). Maybe the function should be named 
> a bit different, but I had no good idea so far.

but you are returning a boolean here. Make it a boolean then, no?

It's true that the timeout is treated as a 1/0, but still it's a
bit misleading.

Andi
