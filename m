Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C08456281
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 19:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbhKRSkm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 13:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbhKRSkl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 13:40:41 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3FFBC061574;
        Thu, 18 Nov 2021 10:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=NMsSVSlICaw3KxLzwPPUCPeVdNgwg5v8aK2nEdXuhtA=; b=DILZx
        /TB9pZ1072e6u6lM8weFHFpm1OxAnji/1mVME5ECSH4vCffcOLqzZVLl9ABFp1eiHkfUCzM9/B40F
        p0DdAQ4KvHFi0GD2q+1d5twBHNIo4IcyJtFIXmysJ7uhOU9U3XXAGHEFqZ9pJNOP+g9HzavcKLD80
        BQwOrZZasBUwPK1JWN97LcMLNGOlQDEy8vzTah0QqgBwmdoZ98DNRr+1AzoM0YiPrRrgTgbmC1CdP
        A078lmkh22euzzTvJAzI0hqn9qpHoLBc+Ws5DguYxd2tDAVxLEzYrLikydU9V+bw2BMPKBh0dCKwr
        sGusX9DDSrYh9JmSuyaa7f6MEUD2w==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mnmHu-0005Py-OZ; Thu, 18 Nov 2021 18:37:34 +0000
Date:   Thu, 18 Nov 2021 18:37:33 +0000
From:   John Keeping <john@metanate.com>
To:     Ondrej Jirman <megous@megous.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH] i2c: rk3x: Handle a spurious start completion
 interrupt flag
Message-ID: <YZadbTw0q4NA2XWs@donbot>
References: <20210924111528.2924251-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924111528.2924251-1-megous@megous.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 24, 2021 at 01:15:27PM +0200, Ondrej Jirman wrote:
> In a typical read transfer, start completion flag is being set after
> read finishes (notice ipd bit 4 being set):
> 
> trasnfer poll=0
> i2c start
> rk3x-i2c fdd40000.i2c: IRQ: state 1, ipd: 10
> i2c read
> rk3x-i2c fdd40000.i2c: IRQ: state 2, ipd: 1b
> i2c stop
> rk3x-i2c fdd40000.i2c: IRQ: state 4, ipd: 33
> 
> This causes I2C transfer being aborted in polled mode from a stop completion
> handler:
> 
> trasnfer poll=1
> i2c start
> rk3x-i2c fdd40000.i2c: IRQ: state 1, ipd: 10
> i2c read
> rk3x-i2c fdd40000.i2c: IRQ: state 2, ipd: 0
> rk3x-i2c fdd40000.i2c: IRQ: state 2, ipd: 1b
> i2c stop
> rk3x-i2c fdd40000.i2c: IRQ: state 4, ipd: 13
> i2c stop
> rk3x-i2c fdd40000.i2c: unexpected irq in STOP: 0x10
> 
> Clearing the START flag after read fixes the issue without any obvious
> side effects.
> 
> This issue was dicovered on RK3566 when adding support for powering
> off the RK817 PMIC.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---

I haven't seen the issue described here, so I can't test whether this
fix works, but the explanation makes sense, so:

Reviewed-by: John Keeping <john@metanate.com>

>  drivers/i2c/busses/i2c-rk3x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 819ab4ee517e..02ddb237f69a 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -423,8 +423,8 @@ static void rk3x_i2c_handle_read(struct rk3x_i2c *i2c, unsigned int ipd)
>  	if (!(ipd & REG_INT_MBRF))
>  		return;
>  
> -	/* ack interrupt */
> -	i2c_writel(i2c, REG_INT_MBRF, REG_IPD);
> +	/* ack interrupt (read also produces a spurious START flag, clear it too) */
> +	i2c_writel(i2c, REG_INT_MBRF | REG_INT_START, REG_IPD);
>  
>  	/* Can only handle a maximum of 32 bytes at a time */
>  	if (len > 32)
