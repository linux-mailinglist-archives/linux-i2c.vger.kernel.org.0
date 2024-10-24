Return-Path: <linux-i2c+bounces-7536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB79AE20A
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 12:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189FD2843E5
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 10:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7751B21AD;
	Thu, 24 Oct 2024 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfMH7Pt3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067CC1B85DF;
	Thu, 24 Oct 2024 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764245; cv=none; b=f/CDA4ceCBucF0GXq4EHqRYuK5OyDtmM1zlq89ez/h3hrkgd/ELJqoLWViTvEe32p0K8tO29z77uTBTZMR8n017szbz7CTPsD9ClTnrrewsk8G8fhFMuSrDuk3mE3+x4swGFFPa1tUQmuyE58xxjslDVIZS9SjdPzm3lydGvKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764245; c=relaxed/simple;
	bh=DCLSjyVxD4E+9mxp2TmkqInRMBTjZIgH6PevLvpjvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtAc1N3+Wn+TyPD2DAbh+abZEEiEFEk+JEZ+pNGULyzEDw0TuZFJeRDuavbbZU8heEMzLlETnUBlnm3NYgcYMgbFuep+t8uQAHE/5hEQ8U/EQjgKH3bOLBhJXlmxLx3XTw1HUWJVQxRMZPTNW5gchmnjg9li+4hIIfWg8x1+008=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfMH7Pt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C975C4CEC7;
	Thu, 24 Oct 2024 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729764244;
	bh=DCLSjyVxD4E+9mxp2TmkqInRMBTjZIgH6PevLvpjvDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfMH7Pt3Slfn+IkPJz+EEREtdoLxD4HMjtuOFx/Gm7sM35LGlmr0ywDNu4huJVpIX
	 RSXbv/2Gj3QUZuV28TlHmMcXkCabzFJQvgufTSjZg7Nu8uy3QEtUqCbyafwaO2jtaq
	 aCIYypoI/wWQzULj5o2IIS/ba+Px59gAZOsf8QCoq2bv/c51J2f3+wxxsPd+moVox7
	 WZzVl+ZKQ3R2pP+lgBrR2IGh4PK5Xa6+hHHI7Br7uV2yrH4jB2p0/bBmhhDbCrd9Pd
	 CiiuRrG8rGAmIoCxLyhxOa4U+N9wVsgcUbe5shl/HrqJ3wCOCPKGki42biep3qH/8v
	 Imp7nB2S5Sl4Q==
Date: Thu, 24 Oct 2024 12:03:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-3-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021062732.5592-3-kfting@nuvoton.com>

Hi Tyrone,

...

> +	/*
> +	 * Previously, the 7-bit address was stored and being converted to
> +	 * the address of event in the following call to npcm_i2c_master_start_xmit().

Do we care how it was done previously? I think this is not a
useful information as the code readers will se the code the way
it is now, not the way it was done "previously".

(there is a related comment at the end)

> +	 * Since there are cases that the i2c_recover_bus() gets called at the
> +	 * early stage of npcm_i2c_master_xfer(), the address of event is stored
> +	 * and then used in the i2c_recover_bus().

I could rephrase this sentence to something like:

/*
 * Store the address early in a global position to ensure it is
 * accessible for a potential call to i2c_recover_bus().
 */

> +	 */
> +	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);
> +
>  	/*
>  	 * Check the BER (bus error) state, when ber_state is true, it means that the module
>  	 * detects the bus error which is caused by some factor like that the electricity
> @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	 * bus is busy.
>  	 */
>  	if (bus_busy || bus->ber_state) {
> +		/*
> +		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
> +		 * from the bus->dest_addr for the i2c_recover_bus() call later.
> +		 *
> +		 * The i2c_recover_bus() uses the address in a write direction to recover
> +		 * the i2c bus if some error condition occurs.
> +		 */
> +		bus->dest_addr &= ~I2C_M_RD;
> +
>  		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
>  		npcm_i2c_reset(bus);
>  		i2c_recover_bus(adap);
> @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	}
>  
>  	npcm_i2c_init_params(bus);
> -	bus->dest_addr = slave_addr;

We can now get rid of slave_addr. It's just used in
npcm_i2c_master_start_xmit(). Right?

Andi

>  	bus->msgs = msgs;
>  	bus->msgs_num = num;
>  	bus->cmd_err = 0;
> -- 
> 2.34.1
> 

