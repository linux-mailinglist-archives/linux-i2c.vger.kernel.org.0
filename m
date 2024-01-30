Return-Path: <linux-i2c+bounces-1543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA60842F5E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 23:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB6B1C22323
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 22:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C994C7D416;
	Tue, 30 Jan 2024 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csINU53l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635A7D41C
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652452; cv=none; b=RKTIKO5EUJaigrjhrnEkUtp8mZUmp+nAKS51LVY/Mr3MuJAt/dHeNcdtsmymdnyvR1Sjz55ma9q/jCjOrB+xyk5tHjESP84w7RK6kZPMt6odtekjJtRjUUM36yDT42/P4R9TJiOl95kk+wDzhtbp1iJ7gpFuP7v2/CUsLYC6kuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652452; c=relaxed/simple;
	bh=zC+D8g4nwZwMlxmUHqbL86IY6v1tQX4YbnWLkCHR/6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrt/p3fKoQf3khV+EUUsSuiRahqqmQtM96wYtsseTvFnBRxijmIIRbi2fffW+bIOhqgZnN7DbNZKUcjq6pV45zk6O070gxUrGtVSbl/Mj2+5pPhFvrVk8NeYxlS8k4P/V0nBjL9N46fEKXjWpir8iXNNgNUaqdsy3ZVfvZK4wXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csINU53l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D351FC433C7;
	Tue, 30 Jan 2024 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706652452;
	bh=zC+D8g4nwZwMlxmUHqbL86IY6v1tQX4YbnWLkCHR/6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csINU53lTH7hIh3WjL3LEeITiTdzA9vxzvimK0vu6xcjXIYzAa2lCYE3WiSy3G7/m
	 okK41ypVGs+t+4Hpocj2ZBVxNYDhdSr6wjeePqaHpWxIyRxvsXaEC4RicBe2fsIbi4
	 7iHbOKmKOS1Gumzb3TF3CnLWKfhxPr/yRhgI9MyNUR9BjI/LU0ebPYFjXoeH7F4sLH
	 kox5zYapXBJYpfEoNwCskBO+lVegTS0qf7avL0ZGkusOwGbYfcKymQWDwrDKq4cobK
	 7wCgYjVHIgXEDOkVyafw9gAHbIqShYu5H+okmIFFlC+J0nrlnwutQMMpJzR4U65dL2
	 ESrcnqLZXVa1A==
Date: Tue, 30 Jan 2024 23:07:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 6/8] i2c: i801: Split i801_block_transaction
Message-ID: <bjxphy2qlvvv4zp3dnucehkoeh7rayany3v5lc5gx747zptr6h@fmg4tikg2jpy>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <a5920bf7-91ef-4cf3-b6c5-0979e9325d7a@gmail.com>
 <pnzgygb7zlm5x2xkn6i7etzrmcf5rrfyaxh2s5zvbmuoqmqh63@m5wravpyp32r>
 <ed800c55-fffe-4080-9e0c-ae13bcc76353@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed800c55-fffe-4080-9e0c-ae13bcc76353@gmail.com>

Hi Heiner,

On Tue, Jan 30, 2024 at 12:20:26PM +0100, Heiner Kallweit wrote:
> On 30.01.2024 01:09, Andi Shyti wrote:
> >> +static int i801_i2c_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
> >> +				      u8 addr, u8 hstcmd, char read_write, int command)
> >> +{
> >> +	int result;
> >> +	u8 hostc;
> >> +
> >> +	if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
> >> +		return -EPROTO;
> >> +	/*
> >> +	 * NB: page 240 of ICH5 datasheet shows that the R/#W bit should be cleared here,
> >> +	 * even when reading. However if SPD Write Disable is set (Lynx Point and later),
> >> +	 * the read will fail if we don't set the R/#W bit.
> >> +	 */
> >> +	i801_set_hstadd(priv, addr,
> >> +			priv->original_hstcfg & SMBHSTCFG_SPD_WD ? read_write : I2C_SMBUS_WRITE);
> >> +
> >> +	/* NB: page 240 of ICH5 datasheet shows that DATA1 is the cmd field when reading */
> >> +	if (read_write == I2C_SMBUS_READ)
> >> +		outb_p(hstcmd, SMBHSTDAT1(priv));
> >> +	else
> >>  		outb_p(hstcmd, SMBHSTCMD(priv));
> >> -		break;
> >> +
> >> +	if (read_write == I2C_SMBUS_WRITE) {
> >> +		/* set I2C_EN bit in configuration register */
> >> +		pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
> >> +		pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hostc | SMBHSTCFG_I2C_EN);
> >> +	} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
> >> +		pci_err(priv->pci_dev, "I2C block read is unsupported!\n");
> >> +		return -EOPNOTSUPP;
> >>  	}
> > 
> > These two if...else blocks can be merged.
> > 
> Yes, but I didn't do it because they cover different functionality.
> IMO it's better readable this way.

it's OK, this is a matter of taste.

> > But here the case of "command == I2C_SMBUS_BLOCK_DATA" is doing
> > something different from the original code. E.g. if command =
> > I2C_SMBUS_BLOCK_DATA and read_write = READ, then there is a
> > functional change. Or am I getting confused?
> > 
> 
> At least there's no intentional functional change.
> Can you describe the functional change you see?
> Then it's easier to comment.

I wrote it :-)

when command is I2C_SMBUS_BLOCK_DATA, before it was simply doing:

	i801_set_hstadd(priv, addr, read_write);
	outb_p(hstcmd, SMBHSTCMD(priv));

while now it does:

	i801_set_hstadd(priv, addr,
			priv->original_hstcfg & SMBHSTCFG_SPD_WD ? read_write : I2C_SMBUS_WRITE);
	if (read_write == I2C_SMBUS_READ)
		outb_p(hstcmd, SMBHSTDAT1(priv));
	else
		outb_p(hstcmd, SMBHSTCMD(priv));

> And yes: All the strange and misleading function argument naming
> makes it quite confusing. This starts in I2C core:

you could try to play around with different diff algorithms when
generating the patch. Some of them perform better when renaming
functions.

Andi

PS. I'm not sure, though, this patch is improving readability,
    but I will check it again.


> smbus_xfer() has an argument "command", which is typically
> a data value. See i2c_smbus_write_byte()
> Argument "size" however is actually the command.
> 
> > Thanks,
> > Andi
> 
> Heiner

