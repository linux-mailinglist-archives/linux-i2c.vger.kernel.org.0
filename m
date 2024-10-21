Return-Path: <linux-i2c+bounces-7489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC28B9A5C17
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 09:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E04E1F21F72
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 07:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCBC1D0E3F;
	Mon, 21 Oct 2024 07:09:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4531940A2;
	Mon, 21 Oct 2024 07:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729494565; cv=none; b=QctpYKHUdeBab30ISW1CPObPwj5NyesSGzCv3ZxdThn+bR6+hmgJKkU9mttHFCft7fo1NulKXUv3OuHnJbsxSnjfR/YpnRfDDHpeawmMeil4zpkDr8XPYFAUqM+PIJZxgfHhvcSCi8brqcLErdOZC2euNeRZA5gA68FK3hE5xOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729494565; c=relaxed/simple;
	bh=BuMoBbEJv0QBFc+iaOOPJLqEUE148FEUiylWOCRFXpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixuSOk8Vqe4ESX7iRrsAkuSMr1J7nppyjhaAiX5GUZrz85852WBMHW3dApq8Ez0zhcUpp+uHM9lZthfBSvEMaEEwVaYRG3+Ccfc3Knbf7MvY0GMANGYWV8HXlHwsI4dQsSH8tfIqf2QpPODJBlmNwDoB9FDZc3r8lmVDwPFMVo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5ae835.dynamic.kabel-deutschland.de [95.90.232.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 92D0261E5FE05;
	Mon, 21 Oct 2024 09:01:15 +0200 (CEST)
Message-ID: <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de>
Date: Mon, 21 Oct 2024 09:01:14 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com, wsa@kernel.org,
 rand.sec96@gmail.com, wsa+renesas@sang-engineering.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-3-kfting@nuvoton.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20241021062732.5592-3-kfting@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Tyrone,


Thank you for your patch.

Am 21.10.24 um 08:27 schrieb Tyrone Ting:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Store the client address earlier since it might get called in
> the i2c_recover_bus() logic flow at the early stage of
> npcm_i2c_master_xfer().

Thank you for the description. For the summary/title it’d be great, if 
you were more specific. For example:

i2c: npcm: Assign client address earlier for `i2c_recover_bus()`

It’d be great if you noted the commit, your patch fixes, so it’s clear 
since when the problem has been present.

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Tali Perry <tali.perry1@gmail.com>
> ---
>   drivers/i2c/busses/i2c-npcm7xx.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index c96a25d37c14..a9a9b21f1f0b 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2155,6 +2155,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   
>   	} while (time_is_after_jiffies(time_left) && bus_busy);
>   
> +	/*
> +	 * Previously, the 7-bit address was stored and being converted to
> +	 * the address of event in the following call to npcm_i2c_master_start_xmit().
> +	 *
> +	 * Since there are cases that the i2c_recover_bus() gets called at the
> +	 * early stage of npcm_i2c_master_xfer(), the address of event is stored
> +	 * and then used in the i2c_recover_bus().
> +	 */
> +	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);
> +
>   	/*
>   	 * Check the BER (bus error) state, when ber_state is true, it means that the module
>   	 * detects the bus error which is caused by some factor like that the electricity
> @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	 * bus is busy.
>   	 */
>   	if (bus_busy || bus->ber_state) {
> +		/*
> +		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
> +		 * from the bus->dest_addr for the i2c_recover_bus() call later.
> +		 *
> +		 * The i2c_recover_bus() uses the address in a write direction to recover
> +		 * the i2c bus if some error condition occurs.
> +		 */
> +		bus->dest_addr &= ~I2C_M_RD;
> +
>   		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
>   		npcm_i2c_reset(bus);
>   		i2c_recover_bus(adap);
> @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	}
>   
>   	npcm_i2c_init_params(bus);
> -	bus->dest_addr = slave_addr;
>   	bus->msgs = msgs;
>   	bus->msgs_num = num;
>   	bus->cmd_err = 0;


Kind regards,

Paul

