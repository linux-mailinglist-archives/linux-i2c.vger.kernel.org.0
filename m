Return-Path: <linux-i2c+bounces-12594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5507B42D20
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 00:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 954C43B3AB1
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 22:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59AE2EFDBA;
	Wed,  3 Sep 2025 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BySSq+sV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F25B1D88A4;
	Wed,  3 Sep 2025 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756940365; cv=none; b=hkewLEJajMeYQzuO1sSsxcUq8+mnJb03yNrY0o3aPlhqSXATsKxJ1tf2Fs0AoAgnMSQgfkJlTEKPa/gbSHZtpgjlp/mBzZ76gkayWYEXVYu9smvTt6lO7qJ3xsZ9OKnkG17zDqbAmGn5j7EgkgDYY0nu3LSGylJwllSetNWpfMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756940365; c=relaxed/simple;
	bh=zAZE2E5bn9s5utD0mvDXNU3x1IycGc7eg/BFJEIzRDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6B2uzt3ZZrLeW/Zw6r3xRUlyU0wNV33+ZZEHuSbPY/gVmvvIqltUzy8JEKmy72qlyT7b9tt3eofQVfqV8Zfp/YIwRpGjJK7tFI9UBWqwQQF+K7/W1p3gaGh0z7dp26RwaeEAWBuY8MLrwoHzPi+pPNWyZ8iRWbidWh/jxfc1fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BySSq+sV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E91AC4CEE7;
	Wed,  3 Sep 2025 22:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756940365;
	bh=zAZE2E5bn9s5utD0mvDXNU3x1IycGc7eg/BFJEIzRDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BySSq+sVdzxn2IOx35RmUn963piXTAT31hvCzQBe2t2zJlhSCVsNlFk/iHKl4vHPH
	 Gp5DCyewN7pcTZCAtj9tdxlG8iWTbj5HlGviIqeG9J1ZJM4IivgEoMhUQxTn+O0CVS
	 KNBkeIZ5SsAwPRfDCVXPYosOBcwuoPel48TvlvtCwkq5tI72bYBvyiPbImOnLZPwed
	 WeE/55OVS5qwZiyfz2v0tZ7lET/7r/pMFwwe21Qbe3BIL4WcfGBHziakuc6W8rC2v/
	 fvVgMT3mIjQCVHdx9Dbkwk4ZB32NVaoEuDAs08a0cBqMBywUEHiF2r+4949ROVdEo0
	 Gt2aRlBDZZV5A==
Date: Thu, 4 Sep 2025 00:59:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Markus Stockhausen <markus.stockhausen@gmx.de>, 
	Sven Eckelmann <sven@narfation.org>, Harshal Gohel <hg@simonwunderlich.de>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, stable@vger.kernel.org
Subject: Re: [PATCH v7 03/12] i2c: rtl9300: remove broken SMBus Quick
 operation support
Message-ID: <cfdleondrrpfyfts423cwdcsb5mmqovej5hwke7ndghzlnwci7@d6i7ltgoxbee>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
 <20250831100457.3114-4-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831100457.3114-4-jelonek.jonas@gmail.com>

Hi Jonas,

On Sun, Aug 31, 2025 at 10:04:48AM +0000, Jonas Jelonek wrote:
> Remove the SMBus Quick operation from this driver because it is not
> natively supported by the hardware and is wrongly implemented in the
> driver.
> 
> The I2C controllers in Realtek RTL9300 and RTL9310 are SMBus-compliant
> but there doesn't seem to be native support for the SMBus Quick
> operation. It is not explicitly mentioned in the documentation but
> looking at the registers which configure an SMBus transaction, one can
> see that the data length cannot be set to 0. This suggests that the
> hardware doesn't allow any SMBus message without data bytes (except for
> those it does on it's own, see SMBus Block Read).
> 
> The current implementation of SMBus Quick operation passes a length of
> 0 (which is actually invalid). Before the fix of a bug in a previous
> commit, this led to a read operation of 16 bytes from any register (the
> one of a former transaction or any other value.
> 
> This caused issues like soft-bricked SFP modules after a simple probe
> with i2cdetect which uses Quick by default. Running this with SFP
> modules whose EEPROM isn't write-protected, some of the initial bytes
> are overwritten because a 16-byte write operation is executed instead of
> a Quick Write. (This temporarily soft-bricked one of my DAC cables.)
> 
> Because SMBus Quick operation is obviously not supported on these
> controllers (because a length of 0 cannot be set, even when no register
> address is set), remove that instead of claiming there is support. There
> also shouldn't be any kind of emulated 'Quick' which just does another
> kind of operation in the background. Otherwise, specific issues occur
> in case of a 'Quick' Write which actually writes unknown data to an
> unknown register.
> 
> Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
> Cc: <stable@vger.kernel.org> # v6.13+
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> Tested-by: Sven Eckelmann <sven@narfation.org>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
> Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Applied from 1-3 to i2c/i2c-host-fixes.

But...

> ---
>  drivers/i2c/busses/i2c-rtl9300.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
> index ebd4a85e1bde..9e6232075137 100644
> --- a/drivers/i2c/busses/i2c-rtl9300.c
> +++ b/drivers/i2c/busses/i2c-rtl9300.c
> @@ -235,15 +235,6 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
>  	}
>  
>  	switch (size) {
> -	case I2C_SMBUS_QUICK:
> -		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 0);
> -		if (ret)
> -			goto out_unlock;
> -		ret = rtl9300_i2c_reg_addr_set(i2c, 0, 0);
> -		if (ret)
> -			goto out_unlock;
> -		break;
> -
>  	case I2C_SMBUS_BYTE:
>  		if (read_write == I2C_SMBUS_WRITE) {
>  			ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 0);
> @@ -344,9 +335,9 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
>  
>  static u32 rtl9300_i2c_func(struct i2c_adapter *a)
>  {
> -	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
> -	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
> -	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_I2C_BLOCK;
> +	return I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA |
> +	       I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_BLOCK_DATA |
> +	       I2C_FUNC_SMBUS_I2C_BLOCK;

this was creating a conflict with:

5090e2b3808e ("i2c: rtl9300: Implement I2C block read and write")

In the sense that I don't have this change in the fixes path, but
I have it in the non-fixes. For now, until Wolfram pulls the
fixes, I removed the patch and I will add it back next week to
avoid conflicts in the -next branch.

Next week I will apply the rest of the patches in the series, as
well.

Thanks,
Andi

>  }
>  
>  static const struct i2c_algorithm rtl9300_i2c_algo = {
> -- 
> 2.48.1
> 

