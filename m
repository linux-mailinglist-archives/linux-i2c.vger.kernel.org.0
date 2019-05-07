Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57A0B166AC
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 17:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfEGP0f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 11:26:35 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:57402 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfEGP0f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 May 2019 11:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=OkTpX7RWUbjuME+/eeEVFHbIEAAPGfKhpXcTTXB8fsA=; b=tGuK8yine8+CeCqekOK6Fj7uyR
        vhkqK4SQ1EblJ3PetQVg6ZcqF1S0xcaNh6pdjZOWBjNVuk9ygFZ9wmKQOZEMBS1QLU3xRDSiraAPt
        3xtJAXBkry1Z1rlqQA1HK1XUkEZ5/KZ23mxVAUIlxYvio1oinbirgQs07WRE2u8Fh8WA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hO1z8-0001CD-Er; Tue, 07 May 2019 17:26:26 +0200
Date:   Tue, 7 May 2019 17:26:26 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 v2 2/3] i2c-ocore: sifive: add support for i2c device
 on FU540-c000 SoC.
Message-ID: <20190507152626.GD25013@lunn.ch>
References: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
 <1557242108-13580-3-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557242108-13580-3-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 07, 2019 at 08:45:07PM +0530, Sagar Shrikant Kadam wrote:
> Update device id table for Opencores I2C master used in HiFive Unleashed
> platform having FU540-c000 chipset.
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  drivers/i2c/busses/i2c-ocores.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index 4e1a077..7bf7b0c 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -85,6 +85,7 @@ struct ocores_i2c {
>  
>  #define TYPE_OCORES		0
>  #define TYPE_GRLIB		1
> +#define TYPE_SIFIVE_REV0	2
>  
>  static void oc_setreg_8(struct ocores_i2c *i2c, int reg, u8 value)
>  {
> @@ -465,6 +466,10 @@ static u32 ocores_func(struct i2c_adapter *adap)
>  		.data = (void *)TYPE_OCORES,
>  	},
>  	{
> +		.compatible = "sifive,fu540-c000-i2c",
> +		.data = (void *)TYPE_SIFIVE_REV0,
> +	},

If you list "sifive,i2c0" in the binding document, it should be here
as well.

> +	{
>  		.compatible = "aeroflexgaisler,i2cmst",
>  		.data = (void *)TYPE_GRLIB,
>  	},
> -- 
> 1.9.1
> 
> 
> -- 
> The information transmitted is intended only for the person or entity to 
> which it is addressed and may contain confidential and/or privileged 
> material. If you are not the intended recipient of this message please do 
> not read, copy, use or disclose this communication and notify the sender 
> immediately. It should be noted that any review, retransmission, 
> dissemination or other use of, or taking action or reliance upon, this 
> information by persons or entities other than the intended recipient is 
> prohibited.
