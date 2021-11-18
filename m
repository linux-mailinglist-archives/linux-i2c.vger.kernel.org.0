Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A381456276
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 19:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbhKRSi7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 13:38:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbhKRSi7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 13:38:59 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247C3C061574;
        Thu, 18 Nov 2021 10:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=QKgxJEyKREs5TCvjoyhQ6xe2fnBuo6nhs1/99d9iV9Q=; b=c65u9
        HcBQSG3ZOrz7WhpKNvFBToTxxuOwoB0mdqh3XDrgGoB31WfiXiYY+hQEF/DqIegvpf/8NkwtUTtLK
        lZQ8lNpUNFBl4yJxn+sT3qwMH7/9Eg28IyOHWc/ayLGnOS8ELY3GJopKNuHb5mPyXwO8wP1vUleug
        NR7FFbSpb13IGjWgozLMj2h9wCtDjumWgxlGJisGTKjK/aFnjP9Y71Fr5Dphg6wELmhQFmxiuV4+U
        EuBWHyYgaxeaUc5bBmnDiZoLCPI8/wc5wkXwE8NeVp+k1ZQWFCzd/BUqid272fkfYBqAj25II99gr
        uycuGlr8Raey+Ij0FFKkmo1lVLRjQ==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mnmGE-0005PJ-QL; Thu, 18 Nov 2021 18:35:50 +0000
Date:   Thu, 18 Nov 2021 18:35:49 +0000
From:   John Keeping <john@metanate.com>
To:     Tobias Schramm <t.schramm@manjaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] i2c: rk3x: disable and reenable I2C after timeouts to
 fix stuck low SDA
Message-ID: <YZadBW3TGhVSEtQP@donbot>
References: <20210826174632.91887-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826174632.91887-1-t.schramm@manjaro.org>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 26, 2021 at 07:46:32PM +0200, Tobias Schramm wrote:
> Previously the SDA line sometimes remained stuck low after timeouts
> rendering the I2C bus unusable. Testing has shown that disabling and
> reenabling the I2C peripheral after sending the stop condition seems to
> unstick SDA reliably.
> Disable and reenable the I2C controller on timeout after sending stop
> condition to unstick SDA.
> 
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>

I haven't seen the issue described here, so I can't test whether this
fix works, but the explanation makes sense, so:

Reviewed-by: John Keeping <john@metanate.com>

> ---
>  drivers/i2c/busses/i2c-rk3x.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 819ab4ee517e..fc330cc3686a 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1108,6 +1108,16 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
>  			val |= REG_CON_EN | REG_CON_STOP;
>  			i2c_writel(i2c, val, REG_CON);
>  
> +			/*
> +			 * Sometimes SDA remains stuck low after timeouts.
> +			 * Disable and reenable the I2C peripheral to unstick
> +			 * SDA.
> +			 */
> +			val &= ~REG_CON_EN;
> +			i2c_writel(i2c, val, REG_CON);
> +			val |= REG_CON_EN;
> +			i2c_writel(i2c, val, REG_CON);
> +
>  			i2c->state = STATE_IDLE;
>  
>  			ret = -ETIMEDOUT;
