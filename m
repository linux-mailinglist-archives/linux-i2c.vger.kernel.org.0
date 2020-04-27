Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B920F1BABD3
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 19:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgD0R7R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 13:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726162AbgD0R7R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 13:59:17 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299BFC0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=02+2ywDJ91bOFiEzjkx6F8gAtkAK/zZpDklD+Zm4ybs=; b=UVmdl83Ct1Xau1YAyCfo90u50
        tc3jy3EFq3dH6frV8W5h4PTEcFlZvgq7EV5uvboJq9shAzqh+QYAaFNGVj93tnUZg7xbqHehTpkYT
        kRMsJq22qoGw0x3Rdg5R7OFS/pr6R/VURxvzQv6APdvelVQQIzDTvKYPWtKikNKnSgXIlpsHPwVE1
        JU/kzA23asEgeMl062yyyOTyY41d5O4c6cGP/JTG+UHwfY3NHd8DAYurcpNvToJv7oP4GaQhz+cda
        kXnr9XlU+vCWJLiIpIknl2mCsoACPDqwW2kdOFflxFpwJzWTSWF2jX9+42EKq4f/Zly43y0qcdXC5
        y/y9SnPlA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56374)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jT82D-0004Fa-Ji
        for linux-i2c@vger.kernel.org; Mon, 27 Apr 2020 18:59:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jT82C-0006r5-Tw
        for linux-i2c@vger.kernel.org; Mon, 27 Apr 2020 18:59:12 +0100
Date:   Mon, 27 Apr 2020 18:59:12 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH REPOST 01/12] i2c: pxa: use official address byte helper
Message-ID: <20200427175912.GJ25745@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
 <E1jT5N7-0001qk-HL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jT5N7-0001qk-HL@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 27, 2020 at 04:08:37PM +0100, Russell King wrote:
> i2c-pxa was created before i2c_8bit_addr_from_msg() was implemented,
> and used its own i2c_pxa_addr_byte() which is functionally the same.
> Sadly, it was never updated to use this new helper. Switch it over.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/i2c/busses/i2c-pxa.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 466e4f681d7a..2765dc530c36 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -716,16 +716,6 @@ static void i2c_pxa_slave_stop(struct pxa_i2c *i2c)
>   * PXA I2C Master mode
>   */
>  
> -static inline unsigned int i2c_pxa_addr_byte(struct i2c_msg *msg)
> -{
> -	unsigned int addr = (msg->addr & 0x7f) << 1;
> -
> -	if (msg->flags & I2C_M_RD)
> -		addr |= 1;
> -
> -	return addr;
> -}
> -
>  static inline void i2c_pxa_start_message(struct pxa_i2c *i2c)
>  {
>  	u32 icr;
> @@ -733,8 +723,8 @@ static inline void i2c_pxa_start_message(struct pxa_i2c *i2c)
>  	/*
>  	 * Step 1: target slave address into IDBR
>  	 */
> -	writel(i2c_pxa_addr_byte(i2c->msg), _IDBR(i2c));
> -	i2c->req_slave_addr = i2c_pxa_addr_byte(i2c->msg);
> +	i2c->req_slave_addr = i2c_8bit_addr_from_msg(i2c->msg);
> +	writel(i2c->req_slave_addr, _IDBR(i2c));
>  
>  	/*
>  	 * Step 2: initiate the write.
> @@ -963,6 +953,7 @@ static void i2c_pxa_master_complete(struct pxa_i2c *i2c, int ret)
>  static void i2c_pxa_irq_txempty(struct pxa_i2c *i2c, u32 isr)
>  {
>  	u32 icr = readl(_ICR(i2c)) & ~(ICR_START|ICR_STOP|ICR_ACKNAK|ICR_TB);
> +	u8 addr;

Looks like I didn't update this series of these patches with the problem
that was pointed out last time - one of the problems of having to
maintain four different copies of the same patch series. I'll resend
shortly.

>  
>   again:
>  	/*
> @@ -1047,8 +1038,8 @@ static void i2c_pxa_irq_txempty(struct pxa_i2c *i2c, u32 isr)
>  		/*
>  		 * Write the next address.
>  		 */
> -		writel(i2c_pxa_addr_byte(i2c->msg), _IDBR(i2c));
> -		i2c->req_slave_addr = i2c_pxa_addr_byte(i2c->msg);
> +		i2c->req_slave_addr = i2c_8bit_addr_from_msg(i2c->msg);
> +		writel(i2c->req_slave_addr, _IDBR(i2c));
>  
>  		/*
>  		 * And trigger a repeated start, and send the byte.
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
