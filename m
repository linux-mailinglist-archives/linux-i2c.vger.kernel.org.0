Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4D72825F3
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Oct 2020 20:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgJCSyS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Oct 2020 14:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgJCSyS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 3 Oct 2020 14:54:18 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88B6C0613D0;
        Sat,  3 Oct 2020 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ShausBGebfFRLyt2+59SVmhWPvWC+7ycryEAzaFpAdQ=; b=cH+yk6WLMuSPIN5kWWeSQTvlT
        l2Z0ZNAZ5OIrVkLPmTqd+R/nVPaHOZ1zzn+eHcZv4mBgx5a3B4FigpSSx2T8ME3/s73TUqP6QII2p
        EkbmmbQGbgt87G5dGTbf3Z73xH6V0I+P5RTFdFZrBSJQbBUf3RFIEaQzNWPP9rwTUBb53u7w4/v9C
        qsuCuqIFadfCEorxIt0qQyH+RDh4L3ltVUZdDmzLTPenYavGgRb8GqccCLFZRJd3pM/4hNRwKq+Su
        pTgScjww1idpdw0tvAhQYnltbEWmc60qfcXq74pOh55+EuZwn/VaEjzP3xCZ9hy43ttcCRq4KcvIK
        8Vf9UmpdQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41526)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kOmfW-0007o9-Nk; Sat, 03 Oct 2020 19:54:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kOmfU-0005MD-UA; Sat, 03 Oct 2020 19:54:04 +0100
Date:   Sat, 3 Oct 2020 19:54:04 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wsa@kernel.org,
        alpawi@amazon.com
Subject: Re: [PATCH] i2c: pxa: move to generic GPIO recovery
Message-ID: <20201003185404.GH1551@shell.armlinux.org.uk>
References: <20201003162141.925518-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201003162141.925518-1-codrin.ciubotariu@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 03, 2020 at 07:21:41PM +0300, Codrin Ciubotariu wrote:
> Starting with
> commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
> GPIO bus recovery is supported by the I2C core, so we can remove the
> driver implementation and use that one instead.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
> 
> This patch is not tested.
> The only different thing should be the fact that the pinctl state is
> now switched back to the default state after the bus is enabled.
> 
>  drivers/i2c/busses/i2c-pxa.c | 75 +++---------------------------------
>  1 file changed, 6 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 35ca2c02c9b9..dd357b6e6c61 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -264,9 +264,6 @@ struct pxa_i2c {
>  	u32			hs_mask;
>  
>  	struct i2c_bus_recovery_info recovery;
> -	struct pinctrl		*pinctrl;
> -	struct pinctrl_state	*pinctrl_default;
> -	struct pinctrl_state	*pinctrl_recovery;
>  };
>  
>  #define _IBMR(i2c)	((i2c)->reg_ibmr)
> @@ -1305,8 +1302,6 @@ static void i2c_pxa_prepare_recovery(struct i2c_adapter *adap)
>  	 */
>  	gpiod_set_value(i2c->recovery.scl_gpiod, ibmr & IBMR_SCLS);
>  	gpiod_set_value(i2c->recovery.sda_gpiod, ibmr & IBMR_SDAS);
> -
> -	WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery));
>  }
>  
>  static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
> @@ -1325,8 +1320,6 @@ static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
>  		i2c_pxa_do_reset(i2c);
>  	}
>  
> -	WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default));
> -

This won't fly. We need to put the pinctrl back into i2c mode _before_
we re-enable the I2C module, otherwise the I2C block will see logic 0
on both SCL and SDA which could confuse the block.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
