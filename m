Return-Path: <linux-i2c+bounces-8908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AAAA0110B
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 701247A0387
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 23:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDAB18E028;
	Fri,  3 Jan 2025 23:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APAgzi1K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87894CA6F;
	Fri,  3 Jan 2025 23:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735947163; cv=none; b=ddEPcZo40GLU9mxqChTShNt12pLZ7vqUr9pTcAsQHjpCx6yETSARgpMKunk04FvWP+1uvBCZsNd0C2Jzb/SxBFx0MaKwjhi8vo1ps2ex4sLvjBNlP4VgmIZ1wyexWrHn8cNERrnLsEWae3BhS8XMkVHhZ1lEuuHwl06CenKrhDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735947163; c=relaxed/simple;
	bh=p3IBNfGFYEc0fnm/aT3DD3BuQYZY1wxfEctIZiICEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m83tLGcdZvTiLhz2rotlQKHpprH4CDYqjvFDPUkEf4wpoe9dqxWeqCdPobPG/WiwgnKcP3r/3PVGsdoUIB+Jutp4Kxpswl72x/nigkx0A1jkxD0rU8qZK6+f2rV2PsYjG+Ys86xvIQJoYHCs0/U97broxK5QehmXi8+YWp7ao68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APAgzi1K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679E6C4CEDE;
	Fri,  3 Jan 2025 23:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735947163;
	bh=p3IBNfGFYEc0fnm/aT3DD3BuQYZY1wxfEctIZiICEcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APAgzi1KOmo9Ltgmv7pFcx+atEZWLiS2xOL1hG7j/j+yxafEWcEafE3t5btsy4agT
	 VoS4BhfTej35B660MDquh0HzMUeQY4AlJa6qQvld6H3KTLuSIGzB+pTEfORbjUWKMb
	 Pog2GKsi4cEH9dD/c0u4Sxc/D80LNK3QWSdJKBvZWhSU0e08NgMVENr98QZWMTtzzI
	 P6JGFQcbktpXvjjlnlq/jeiAiOyGOhsQ292rvcxnp9BVdyIrjunN4dlzHUy8Bi5mLr
	 /BawsI1jmr0ghfp9gAAMaANP9/CMXbCOzZnZWX4OvHISGjCWSNr0YQyveJdddgZcig
	 7zb2QTBUrDYXA==
Date: Sat, 4 Jan 2025 00:32:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <5nxqlvyiy5t4ib6hwlo5h5hwlozw5ie7nzkq2vgwxbf6aqtod5@tbowjxmex26v>
References: <20250101103422.30523-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250101103422.30523-1-evepolonium@gmail.com>

Hi again,

> @@ -211,7 +212,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
>  		       SMB_HOST_ADDRESS);
>  		outb_p(command, SMB_HOST_COMMAND);
>  		if (read_write == I2C_SMBUS_WRITE)
> -			outw_p(data->word, SMB_HOST_DATA);	/* TODO: endian???? */
> +			outw_p(cpu_to_le16((u16)data->word), SMB_HOST_DATA);
>  		size = AMD756_WORD_DATA;
>  		break;
>  	case I2C_SMBUS_BLOCK_DATA:
> @@ -256,7 +257,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
>  		data->byte = inw_p(SMB_HOST_DATA);
>  		break;
>  	case AMD756_WORD_DATA:
> -		data->word = inw_p(SMB_HOST_DATA);	/* TODO: endian???? */
> +		data->word = (u16)le16_to_cpu(inw_p(SMB_HOST_DATA));

sorry, please do send a new version, the cast should not be
needed here.

If you have any questions, feel free to ask, after having read
Documentation/process/coding-style.rst.

Thanks,
Andi

>  		break;
>  	case AMD756_BLOCK_DATA:
>  		data->block[0] = inw_p(SMB_HOST_DATA) & 0x3f;
> -- 
> 2.39.5
> 

