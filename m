Return-Path: <linux-i2c+bounces-6997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5449198678E
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 22:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0665D1F21BA1
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 20:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D79148304;
	Wed, 25 Sep 2024 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXloNiwu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8313E028;
	Wed, 25 Sep 2024 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727295743; cv=none; b=d4fwKejc/d7In4U+DEoPJZV2ns1vp4c1CZMwalE5N6GdGTD6Ecxpp258VU6TGJH+10dvZfNISWMnQCrljl9A/CrnyAPRbfDGrODQwJ374ByHBO/+nTyO1gsdTt3yJ3GlBGjai2wMrPcdP3ZcOlbqLddpcRUw7h+qR04S1uMstsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727295743; c=relaxed/simple;
	bh=IYT0NZPI+6ZXgmuWyku06saAwAd0cl9dv1o2DqjdDBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsAdSID5BDOh+dLBUQNjdvoTwjJOmlqI0NYzfXxYZr1NVB3mBgHFjh27J+/qJ+59Xrtjh8EJ/hgo9qOshQMrhwEA895VRB8EoFqhW30b2PQyqt440Du4ORTt2BiOYgwbYyRXKg1Rox6P+lSGurqdxbhbHA1PbhbvWlJCjcx+n00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXloNiwu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA632C4CEC3;
	Wed, 25 Sep 2024 20:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727295743;
	bh=IYT0NZPI+6ZXgmuWyku06saAwAd0cl9dv1o2DqjdDBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXloNiwu/ChGh+4tTEN5C53VTxiRNWdO7yYqWBP/J9WPobh8Z8GqaVkRrIljYvgYD
	 gPbeAfYrh6As5fc0ReHD52Zo2AplgEaJsfTw4BLokqaB6OIgdtBnw+rTrHxuT6rezi
	 a3mj9moFzGL3OiC+pl/FFB394e0L0GKHXfgXp9iG1O6dNGrLA350896Xm0EN5sDs7i
	 jtPHk96f8BY+JTD9IqeBlz5Z6y12KSz+hrYqZIW68YAq+qVR0Ft3qRU5UEJd7bwW0n
	 /CLhqpBn+txVzkn/lt25Qh+9QkI3vEfliJ99GGI4+6sRt//7YW3vMxpoSqm1yQVPoi
	 yfvXkOS1K+yCw==
Date: Wed, 25 Sep 2024 22:22:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: warp5tw@gmail.com
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] i2c: npcm: use a software flag to indicate a BER
 condition
Message-ID: <5mxsciw6443k5rlpymrs7addvme53f5v3zuj5u7tvlggfeirik@dy2bvyz2lyue>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-3-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-3-kfting@nuvoton.com>

Hi Tyrone,

patch looks good, but...

On Fri, Sep 20, 2024 at 06:18:16PM GMT, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> If not clearing the BB (bus busy) condition in the BER (bus error)
> interrupt, the driver causes a timeout and hence the i2c core
> doesn't do the i2c transfer retry but returns the driver's return
> value to the upper layer instead.
> 
> Clear the BB condition in the BER interrupt and a software flag is
> used. The driver does an i2c recovery without causing the timeout
> if the flag is set.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2b76dbfba438..2d034503d8bc 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -334,6 +334,7 @@ struct npcm_i2c {
>  	u64 nack_cnt;
>  	u64 timeout_cnt;
>  	u64 tx_complete_cnt;
> +	bool ber_state;

I need some comment here, what is this ber state? You described
it in the commit log, but people won't be browsing much of the
commit log rather than the code itself.

You could perhaps mention the meaning as:

	bool ber_state; /* brief description */

and...

>  };
>  
>  static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
> @@ -1521,6 +1522,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
>  	if (npcm_i2c_is_master(bus)) {
>  		npcm_i2c_master_abort(bus);
>  	} else {
> +		bus->ber_state = true;
>  		npcm_i2c_clear_master_status(bus);
>  
>  		/* Clear BB (BUS BUSY) bit */
> @@ -1699,6 +1701,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
>  		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
>  			bus->num, bus->dest_addr);
>  		npcm_i2c_reset(bus);
> +		bus->ber_state = false;
>  		return 0;
>  	}
>  
> @@ -1763,6 +1766,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
>  		if (bus->rec_succ_cnt < ULLONG_MAX)
>  			bus->rec_succ_cnt++;
>  	}
> +	bus->ber_state = false;
>  	return status;
>  }
>  
> @@ -2158,7 +2162,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  	} while (time_is_after_jiffies(time_left) && bus_busy);
>  
> -	if (bus_busy) {
> +	if (bus_busy || bus->ber_state) {

/*
 * Check the BER (bus error) state, if it's true means that blah
 * blah blah, while when it's false blah blah blah and we should
 * or should not do blah blah blah
 */
if (bus_busy || bus->ber_state) {
	...
}

Thanks,
Andi

>  		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
>  		npcm_i2c_reset(bus);
>  		i2c_recover_bus(adap);
> -- 
> 2.34.1
> 

