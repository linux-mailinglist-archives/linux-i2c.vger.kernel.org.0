Return-Path: <linux-i2c+bounces-6282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16F96E517
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 23:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 879771F256FD
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C231AD24F;
	Thu,  5 Sep 2024 21:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjqXgjvM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1CC14F121;
	Thu,  5 Sep 2024 21:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725571771; cv=none; b=Avzh6DN23socr5gfnlSmqZ9GdBrX1AxdRhxoyl2ygiGUeqsbkRT3Ty98Rbio75PoKTnyX5i5l8KKzeRLvxaGjCAzcqJXpIdg+w+Pv0YaiYN1W6fnDdM1SvLwSBSnHzQfVMFVCyiEpYXIHxlpxftZhsn+u/FvKjXH7SG/5X0ypWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725571771; c=relaxed/simple;
	bh=OmBgrEF/RkgsDad9jaNJHIgbQrpptrQqnbEiyIW5bb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhFjjqZkrVER4D9rxmUlqdTFR2lCAneNtQEIQCIGBx9ARJGoUHNN26NvrslHeRmYM5treR66nz+dUStdPUykfr+/UO9wDBAzZV6Ps9Aa+oNQC9ibWuZXF2CmIPrY07SFjQQKoe3ngDuq/ZNN0hisqgyGDUpmNWu1sbumqq+wAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjqXgjvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3179C4CEC3;
	Thu,  5 Sep 2024 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725571770;
	bh=OmBgrEF/RkgsDad9jaNJHIgbQrpptrQqnbEiyIW5bb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjqXgjvMKsK8Vt0qCApGNVfGH5yR5D5Bwz07M7QDar/+K6hbxnf7XRTNnLyrm02i1
	 IqwsdcCOwsfLP8X1uuHtGR/GbhrKjaukpHyHGRGXypGSDJddj4z5cAIOiCLPKaWjVn
	 +cKf2t35H+L4skI/Aw4FzITFFMFYYUB22GKP73c4ugbbloMaEX1LF9TUO1dr01f/2B
	 /WR2v9bqVoDTs3VA1K/XBf1x3qD+WB3ww7I/OZdyWgnBlmDpAwvmVu5rsLkDbt2k5n
	 zFVG2dgwxJNuhzMN5AylAjBEOvM3wpP9XvULuyzPhSNAsQ9Ep8rEM6UnI3sKN7ZSll
	 IIQJ9VY9TYYbg==
Date: Thu, 5 Sep 2024 23:29:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] i2c: npcm: correct the read/write operation
 procedure
Message-ID: <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-3-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-3-kfting@nuvoton.com>

Hi Tyronne,

On Fri, Aug 30, 2024 at 11:46:35AM GMT, Tyrone Ting wrote:
> Originally the driver uses the XMIT bit in SMBnST register to decide
> the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> write operation. If it's 0, then a read operation will be executed.
> 
> After checking the datasheet, the XMIT bit is valid when the i2c module
> is acting in a slave role. Use the software status to control the i2c
> transaction flow instead when the i2c module is acting in a master role.
> 
> Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")

Fixes needs to be used if you are fixing a bug (crash,
device malfunction, etc.). If you want to use it, please describe
the bug you are fixing. Otherwise, please, remove it.

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index bbcb4d6668ce..2b76dbfba438 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
>  			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
>  	/* SDA interrupt, after start\restart */
>  	} else {
> -		if (NPCM_I2CST_XMIT & i2cst) {
> -			bus->operation = I2C_WRITE_OPER;
> +		if (bus->operation == I2C_WRITE_OPER)
>  			npcm_i2c_irq_master_handler_write(bus);
> -		} else {
> -			bus->operation = I2C_READ_OPER;
> +		else if (bus->operation == I2C_READ_OPER)
>  			npcm_i2c_irq_master_handler_read(bus);

mmmhhh... you are changing the logic here and you are not
describing the logic change in the commit log.

Without looking at the details, if this is a state machine you
are breaking it.

Can anyone from the ARM/NUVOTON NPCM supporters and reviewers
take a look at this patch?

Thanks,
Andi

> -		}
>  	}
>  }
>  
> -- 
> 2.34.1
> 

