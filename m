Return-Path: <linux-i2c+bounces-1524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A0E84176C
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 01:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5CCC2829FA
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B69FD266;
	Tue, 30 Jan 2024 00:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxVTG651"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1110FD
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 00:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706574202; cv=none; b=TXuFYRhla4Ixy5uP4TcHsZnYoc2M0h+d6oSOqZ/UttBzPpoX2h8rwT7RVsgBfogRhRHFSYjVhfel+EV+uy8M9hQPOZ124YzADFrEpa3sKvjErvI98DdjJQ4njuqZnQd3N/Y5W5C/+5/HHEVG2ctP26wFnAc7/VnAG0fL3P0yD34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706574202; c=relaxed/simple;
	bh=CLw86v7Jh5CoMzJo9APtMdpAA5EUbfC7IJOAUB73Brg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndNFHye06tsRFkC32nTIvKnuS87mAIpKciG5JqoCq1EL9csqRFaFWL76UogNyCEsF1bQh/h4Mke2BRs5tayTna2UMAi5V296PllwpYY0sD6nIT9lu/Bd+nFfM25crASs32RMaJy3HDTZ7PN50MbZOsaWPOgf70RAmWJOO46Y8oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxVTG651; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A1AC433F1;
	Tue, 30 Jan 2024 00:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706574201;
	bh=CLw86v7Jh5CoMzJo9APtMdpAA5EUbfC7IJOAUB73Brg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxVTG651Qb1y+CYPO932J7O0nNhQsuWLE05QU5bUXGAHsj4mi5xGtFQQoM/5nomqS
	 H98XPvoZjWENQc6CtwTRm9qb6P2xe1FEQoBGQuM10aLWhT6HRW0mk7SBFjRn9vXvrP
	 98Akc+tSvro3o+rS2ko3k0SO30fvI0raHXxZSiC5PMMqyilyQ02rqASZEiMlh4ER17
	 /491sE/zz3GHRtrWej5pUKWniLk0Y9yLg9n4SLFtB1k5KseUyxgEyD6lWrZIMuW5gg
	 MXzuCXhBdSeWOVPZYQDQx4k/42FOAmjhCVG9s8CrS8db4AyDgu/6ueEmth35ewbFxf
	 s4XqAwRrExbhA==
Date: Tue, 30 Jan 2024 01:23:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 7/8] i2c: i801: Add SMBUS_LEN_SENTINEL
Message-ID: <n5oirtvl4g4orngv2u3dc477lhq7wtrgepjkueeu62uuljrz5f@6rycpg5hgezx>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <07acdfa5-0ab6-4885-a588-d169a31793c4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07acdfa5-0ab6-4885-a588-d169a31793c4@gmail.com>

On Fri, Sep 22, 2023 at 09:40:25PM +0200, Heiner Kallweit wrote:
> Add a sentinel length value that is used to check whether we should
> read and use the length value provided by the slave device.
> This simplifies the currently used checks.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a9d3dfd9e..30a2f9268 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -204,6 +204,8 @@
>  #define STATUS_FLAGS		(SMBHSTSTS_BYTE_DONE | SMBHSTSTS_INTR | \
>  				 STATUS_ERROR_FLAGS)
>  
> +#define SMBUS_LEN_SENTINEL (I2C_SMBUS_BLOCK_MAX + 1)
> +
>  /* Older devices have their ID defined in <linux/pci_ids.h> */
>  #define PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS		0x02a3
>  #define PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS		0x06a3
> @@ -541,8 +543,7 @@ static void i801_isr_byte_done(struct i801_priv *priv)
>  {
>  	if (priv->is_read) {
>  		/* For SMBus block reads, length is received with first byte */
> -		if (((priv->cmd & 0x1c) == I801_BLOCK_DATA) &&
> -		    (priv->count == 0)) {
> +		if (priv->len == SMBUS_LEN_SENTINEL) {
>  			priv->len = inb_p(SMBHSTDAT0(priv));
>  			if (priv->len < 1 || priv->len > I2C_SMBUS_BLOCK_MAX) {
>  				dev_err(&priv->pci_dev->dev,
> @@ -697,8 +698,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  		if (status)
>  			return status;
>  
> -		if (i == 1 && read_write == I2C_SMBUS_READ
> -		 && command != I2C_SMBUS_I2C_BLOCK_DATA) {
> +		if (len == SMBUS_LEN_SENTINEL) {
>  			len = inb_p(SMBHSTDAT0(priv));
>  			if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
>  				dev_err(&priv->pci_dev->dev,
> @@ -805,7 +805,7 @@ static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_
>  					u8 addr, u8 hstcmd, char read_write, int command)
>  {
>  	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
> -		data->block[0] = I2C_SMBUS_BLOCK_MAX;
> +		data->block[0] = SMBUS_LEN_SENTINEL;

This patch is good, but a few comments for each change to tell
where the sentinel will be used and where the sentinel was set
would help to better understand the use of the sentinel.

Thanks,
Andi

>  	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
>  		return -EPROTO;
>  
> -- 
> 2.42.0
> 
> 

