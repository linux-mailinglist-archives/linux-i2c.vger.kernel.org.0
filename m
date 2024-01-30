Return-Path: <linux-i2c+bounces-1523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F27A2841753
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 01:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92D411F23A63
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9934A10FD;
	Tue, 30 Jan 2024 00:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joqfMxHY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEC7D2FA
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 00:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706573379; cv=none; b=C1DHUy4OsUY0v4MwlI5IaYBZqbmOOzfTO9nPB+nvjYl3Q8GqpiUZXkipq5povzokf9ABRuEcx3SnXpehZKufS/DWEKQp8gMQQA4wvvasL6HD9lLfaaGwKnQfS/Thi/PvgmdpgbHhyZHsTC46DHAN3FyPu9puIPMcwfCcChvtkfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706573379; c=relaxed/simple;
	bh=sHkpolCHgSoYZJEi5sEOtrU118lUVhVvG1KWEeksOUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPxYnNYgRV+fYIS39O/ohCVFSoul3XNRxxrr11fV1oAsEXvBmdYxyIHI/bLz5ImFynUsRXX8IgOyv8QB5bEkPcZFG/8+1xyqUlUJx2ZcDYWDuqYwb95g68ZgAbcgS7zcgcUuQB5gr85IkXA8HVXPH8vCLB8oz2jJElLJxZTLjuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joqfMxHY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E07C433F1;
	Tue, 30 Jan 2024 00:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706573378;
	bh=sHkpolCHgSoYZJEi5sEOtrU118lUVhVvG1KWEeksOUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joqfMxHY7grHi2d/EfyQM7VKTDjUGPH04uwBI4+PVUSSBt3/8j02h6V3iducz/JMb
	 1vzu6kQjP6deYYRknC8UQdHvxT1aY3zKjQHRZrdzsnz0hlgz1k4RmuPR34tzCteRzd
	 xgJ1RMKjPYTGowPyZbkFhD0cVuvXGKeIjH29Eykiv3LyqOnti4wz7m5Z1ddQi9e0cQ
	 ElyH9qFFfsZHzD+JQ3dX4KKM7RaGVHC9eGMadvaaUBiI/I5Z0CO3kTtMUA7nc3paJi
	 TAZgCQ5y427l/lGjO9O+7F9AKLmxFnYNN9KY/jz20U+5MiD84gjljLbxIV2rRXeoGz
	 uROYae/p/SBQQ==
Date: Tue, 30 Jan 2024 01:09:30 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 6/8] i2c: i801: Split i801_block_transaction
Message-ID: <pnzgygb7zlm5x2xkn6i7etzrmcf5rrfyaxh2s5zvbmuoqmqh63@m5wravpyp32r>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <a5920bf7-91ef-4cf3-b6c5-0979e9325d7a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5920bf7-91ef-4cf3-b6c5-0979e9325d7a@gmail.com>

Hi Heiner,

...

> +static int i801_i2c_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
> +				      u8 addr, u8 hstcmd, char read_write, int command)
> +{
> +	int result;
> +	u8 hostc;
> +
> +	if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
> +		return -EPROTO;
> +	/*
> +	 * NB: page 240 of ICH5 datasheet shows that the R/#W bit should be cleared here,
> +	 * even when reading. However if SPD Write Disable is set (Lynx Point and later),
> +	 * the read will fail if we don't set the R/#W bit.
> +	 */
> +	i801_set_hstadd(priv, addr,
> +			priv->original_hstcfg & SMBHSTCFG_SPD_WD ? read_write : I2C_SMBUS_WRITE);
> +
> +	/* NB: page 240 of ICH5 datasheet shows that DATA1 is the cmd field when reading */
> +	if (read_write == I2C_SMBUS_READ)
> +		outb_p(hstcmd, SMBHSTDAT1(priv));
> +	else
>  		outb_p(hstcmd, SMBHSTCMD(priv));
> -		break;
> +
> +	if (read_write == I2C_SMBUS_WRITE) {
> +		/* set I2C_EN bit in configuration register */
> +		pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
> +		pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hostc | SMBHSTCFG_I2C_EN);
> +	} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
> +		pci_err(priv->pci_dev, "I2C block read is unsupported!\n");
> +		return -EOPNOTSUPP;
>  	}

These two if...else blocks can be merged.

But here the case of "command == I2C_SMBUS_BLOCK_DATA" is doing
something different from the original code. E.g. if command =
I2C_SMBUS_BLOCK_DATA and read_write = READ, then there is a
functional change. Or am I getting confused?

Thanks,
Andi

