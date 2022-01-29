Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4ECF4A307C
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jan 2022 17:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343937AbiA2QSz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 11:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242424AbiA2QSy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jan 2022 11:18:54 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEB2C061714;
        Sat, 29 Jan 2022 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=73CZnjVYHIXhRB/BsZv3cHKLBCrUj4dQX035/VBBClc=; b=oF6JCHX6oJfFHVw0T1Ej1ZyxqV
        YFlVadlJ0l8r9yRM1sVyTv8B7UBO0L7aEqTPkPR4HAu3LhR3JC1pu1Zzxrg+vluL55X4iVGlyYiZ4
        2W4wmC/3NVIYmGK9bhFJUIGdGlpEXNVQXKRpIm8gbLF1y5jVWaQVB/Smj8hcLsbxpoFag8KfdK/tt
        NlP/Yd+0kEQupJKc6JvgqCiD/Hu/w2+NNBhC+6RfwtgX0O2aVGaLaj/QSjI4sFiliKcM7QcuJYq3d
        VtdSupwypCe4MFT4E71zVDmUu3vizsVH9Q1rn30Aeqvkzjd3t2JyybPgcj3FeVBXtSXCTwxhmBc7A
        +EOXCiag==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nDqR5-004tWW-GO; Sat, 29 Jan 2022 16:18:48 +0000
Message-ID: <c2ec8677-e7a2-c9cd-b291-9785e7e2800c@infradead.org>
Date:   Sat, 29 Jan 2022 08:18:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] i2c: npcm7xx: Fix typos
Content-Language: en-US
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-i2c@vger.kernel.org
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220129093907.2196730-1-j.neuschaefer@gmx.net>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220129093907.2196730-1-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/29/22 01:39, Jonathan Neuschäfer wrote:
> The comments in this driver have a few typos. Let's fix them.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2ad166355ec9b..71aad029425d8 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -781,7 +781,7 @@ static void npcm_i2c_set_fifo(struct npcm_i2c *bus, int nread, int nwrite)
>  		/*
>  		 * if we are about to read the first byte in blk rd mode,
>  		 * don't NACK it. If slave returns zero size HW can't NACK
> -		 * it immidiattly, it will read extra byte and then NACK.
> +		 * it immediately, it will read extra byte and then NACK.
>  		 */
>  		if (bus->rd_ind == 0 && bus->read_block_use) {
>  			/* set fifo to read one byte, no last: */
> @@ -981,7 +981,7 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
>  /*
>   * npcm_i2c_slave_wr_buf_sync:
>   * currently slave IF only supports single byte operations.
> - * in order to utilyze the npcm HW FIFO, the driver will ask for 16 bytes
> + * in order to utilize the npcm HW FIFO, the driver will ask for 16 bytes
>   * at a time, pack them in buffer, and then transmit them all together
>   * to the FIFO and onward to the bus.
>   * NACK on read will be once reached to bus->adap->quirks->max_read_len.
> @@ -1175,7 +1175,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
>  				/*
>  				 * the i2c module can response to 10 own SA.
>  				 * check which one was addressed by the master.
> -				 * repond to the first one.
> +				 * respond to the first one.
>  				 */
>  				addr = ((i2ccst3 & 0x07) << 7) |
>  					(i2ccst2 & 0x7F);
> @@ -1753,8 +1753,8 @@ static void npcm_i2c_recovery_init(struct i2c_adapter *_adap)
>  	/*
>  	 * npcm i2c HW allows direct reading of SCL and SDA.
>  	 * However, it does not support setting SCL and SDA directly.
> -	 * The recovery function can togle SCL when SDA is low (but not set)
> -	 * Getter functions used internally, and can be used externaly.
> +	 * The recovery function can toggle SCL when SDA is low (but not set)
> +	 * Getter functions used internally, and can be used externally.
>  	 */
>  	rinfo->get_scl = npcm_i2c_get_SCL;
>  	rinfo->get_sda = npcm_i2c_get_SDA;
> @@ -1768,10 +1768,10 @@ static void npcm_i2c_recovery_init(struct i2c_adapter *_adap)
> 
>  /*
>   * npcm_i2c_init_clk: init HW timing parameters.
> - * NPCM7XX i2c module timing parameters are depenent on module core clk (APB)
> + * NPCM7XX i2c module timing parameters are dependent on module core clk (APB)
>   * and bus frequency.
> - * 100kHz bus requires tSCL = 4 * SCLFRQ * tCLK. LT and HT are simetric.
> - * 400kHz bus requires assymetric HT and LT. A different equation is recomended
> + * 100kHz bus requires tSCL = 4 * SCLFRQ * tCLK. LT and HT are symmetric.
> + * 400kHz bus requires asymmetric HT and LT. A different equation is recommended
>   * by the HW designer, given core clock range (equations in comments below).
>   *
>   */
> --
> 2.34.1
> 

-- 
~Randy
