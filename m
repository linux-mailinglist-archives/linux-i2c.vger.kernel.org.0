Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9387072AB73
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 14:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbjFJMaF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 08:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbjFJMaD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 08:30:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1103AA6;
        Sat, 10 Jun 2023 05:30:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 195DE61532;
        Sat, 10 Jun 2023 12:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC23FC433EF;
        Sat, 10 Jun 2023 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686400201;
        bh=vLeqP+bFI0M3By2rXNETwrvsZvj4WpysLLNezIHwhVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RKurMEtK4kU53T5up+1HyTGa/IL42j1pxoyQK0M8uyyYAfc7/lg8/HWuH+yDTFxua
         qSKqhEtZ8C/HXm6/t9osdztAec3FkVZvGDkC0oRk0F2jAVi/hsmIOvPwhyeDOx//V0
         ehyI5OF6cj1sSVXDlSp0dwuXmNIzGoj5Ll+Ll/Ry95zjxlFA6hZI75x3SeIBk7vjDh
         eW0+uvxK8nmR7kX6gOmyc3HpYF2+38LJk7J84iRvXPC1v/IxTeAB1djHANTFaNRQRF
         oEYx4v7BwYeGEe1/Q+wboIADi5yIbD02eYJEEvBzDYFK6/VAYXFO0zieCyRJi1aI9V
         UGPjoBFqcoHrw==
Date:   Sat, 10 Jun 2023 14:29:57 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Piyush Malgujar <pmalgujar@marvell.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, rric@kernel.org, jannadurai@marvell.com,
        cchavva@marvell.com, Suneel Garapati <sgarapati@marvell.com>
Subject: Re: [PATCH 1/3] i2c: thunderx: Clock divisor logic changes
Message-ID: <20230610122957.zse5v3yaqp6qjklq@intel.intel>
References: <20230330133953.21074-1-pmalgujar@marvell.com>
 <20230330133953.21074-2-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330133953.21074-2-pmalgujar@marvell.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Suneel and Piuysh,

On Thu, Mar 30, 2023 at 06:39:51AM -0700, Piyush Malgujar wrote:
> From: Suneel Garapati <sgarapati@marvell.com>
> 
> Handle changes to clock divisor logic for OcteonTX2 SoC family using
> subsystem ID and using default reference clock source as 100MHz.
> 
> Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
> ---
>  drivers/i2c/busses/i2c-octeon-core.c     | 29 ++++++++++++++++++++----
>  drivers/i2c/busses/i2c-octeon-core.h     | 15 ++++++++++++
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c |  6 +++++
>  3 files changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
> index 845eda70b8cab52a0453c9f4cb545010fba4305d..dfd58bbec47b1f0554ae0c100c680b6ba9be61ec 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.c
> +++ b/drivers/i2c/busses/i2c-octeon-core.c
> @@ -17,6 +17,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  
>  #include "i2c-octeon-core.h"
>  
> @@ -658,31 +659,51 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  void octeon_i2c_set_clock(struct octeon_i2c *i2c)
>  {
>  	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
> -	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = 1000000;
> +	int mdiv_min = 2;
> +	/* starting value on search for lowest diff */
> +	const int huge_delta = 1000000;

would be nice to have this "1000000" value defined, also because
it's used in other parts of the code.

> +	/*
> +	 * Find divisors to produce target frequency, start with large delta
> +	 * to cover wider range of divisors, note thp = TCLK half period.
> +	 */
> +	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;

as you are changing them, they can also be unsigned.

Patch looks good to me and, even if it's not breaking anything
from the previous platforms, would be nice to have a comment from
Robert.

With the above comments:

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi

> +
> +	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {
> +		thp = 0x3;
> +		mdiv_min = 0;
> +	}
>  
>  	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {
>  		/*
>  		 * An mdiv value of less than 2 seems to not work well
>  		 * with ds1337 RTCs, so we constrain it to larger values.
>  		 */
> -		for (mdiv_idx = 15; mdiv_idx >= 2 && delta_hz != 0; mdiv_idx--) {
> +		for (mdiv_idx = 15; mdiv_idx >= mdiv_min && delta_hz != 0; mdiv_idx--) {
>  			/*
>  			 * For given ndiv and mdiv values check the
>  			 * two closest thp values.
>  			 */
>  			tclk = i2c->twsi_freq * (mdiv_idx + 1) * 10;
>  			tclk *= (1 << ndiv_idx);
> -			thp_base = (i2c->sys_freq / (tclk * 2)) - 1;
> +			if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
> +				thp_base = (i2c->sys_freq / tclk) - 2;
> +			else
> +				thp_base = (i2c->sys_freq / (tclk * 2)) - 1;
>  
>  			for (inc = 0; inc <= 1; inc++) {
>  				thp_idx = thp_base + inc;
>  				if (thp_idx < 5 || thp_idx > 0xff)
>  					continue;
>  
> -				foscl = i2c->sys_freq / (2 * (thp_idx + 1));
> +				if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
> +					foscl = i2c->sys_freq / (thp_idx + 2);
> +				else
> +					foscl = i2c->sys_freq /
> +						(2 * (thp_idx + 1));
>  				foscl = foscl / (1 << ndiv_idx);
>  				foscl = foscl / (mdiv_idx + 1) / 10;
>  				diff = abs(foscl - i2c->twsi_freq);
> +				/* Use it if smaller diff from target */
>  				if (diff < delta_hz) {
>  					delta_hz = diff;
>  					thp = thp_idx;
> diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
> index 9bb9f64fdda0392364638ecbaafe3fab5612baf6..8a0033c94a8a291fb255b0da03858274035c46f4 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.h
> +++ b/drivers/i2c/busses/i2c-octeon-core.h
> @@ -7,6 +7,7 @@
>  #include <linux/i2c-smbus.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/pci.h>
>  
>  /* Controller command patterns */
>  #define SW_TWSI_V		BIT_ULL(63)	/* Valid bit */
> @@ -211,6 +212,20 @@ static inline void octeon_i2c_write_int(struct octeon_i2c *i2c, u64 data)
>  	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));
>  }
>  
> +#define PCI_SUBSYS_DEVID_9XXX 0xB
> +/**
> + * octeon_i2c_is_otx2 - check for chip ID
> + * @pdev: PCI dev structure
> + *
> + * Returns TRUE if OcteonTX2, FALSE otherwise.
> + */
> +static inline bool octeon_i2c_is_otx2(struct pci_dev *pdev)
> +{
> +	u32 chip_id = (pdev->subsystem_device >> 12) & 0xF;
> +
> +	return (chip_id == PCI_SUBSYS_DEVID_9XXX);
> +}
> +
>  /* Prototypes */
>  irqreturn_t octeon_i2c_isr(int irq, void *dev_id);
>  int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
> diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> index a77cd86fe75ed7401bc041b27c651b9fedf67285..eecd27f9f1730e522dcccafc9f12ea891a3b59ef 100644
> --- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> @@ -205,6 +205,12 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>  	if (ret)
>  		goto error;
>  
> +	/*
> +	 * For OcteonTX2 chips, set reference frequency to 100MHz
> +	 * as refclk_src in TWSI_MODE register defaults to 100MHz.
> +	 */
> +	if (octeon_i2c_is_otx2(pdev))
> +		i2c->sys_freq = 100000000;
>  	octeon_i2c_set_clock(i2c);
>  
>  	i2c->adap = thunderx_i2c_ops;
> -- 
> 2.17.1
> 
