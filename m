Return-Path: <linux-i2c+bounces-8917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE63A0121B
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 04:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97B2F3A46AA
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 03:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2031485260;
	Sat,  4 Jan 2025 03:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwDcR4R7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2812F5E;
	Sat,  4 Jan 2025 03:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735962420; cv=none; b=okC4qzqPUvsrTs9bIGgm+ZOs6EJ3mRdTlPixyKC416Jx52VcjHvBTQVleVJbqIopyOkZKpWD1XXouahrFNrl23HACZ/+t+i/UaNg3hJH8S9y/DqtXESqugzB666xceNzMp4aJf41TwO2xTTOaeL6222AW6E6xn6ZTij+wDtdPJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735962420; c=relaxed/simple;
	bh=B9NxmRH4CHa28DsYjclAN2fCf5mVg5km6Ix/2YOOYYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bj2zU/WyPzi3P29MCXDb0AAixj8c+7ZNtMx+BNbmo7TXF0LhiNpf5MQ/uKEvtNSEnRGEEPhh5wl69J2W1PtvK4K7VltqsY/gdh1eUSDLRdgaXOIa9tpTMnQdm3/uOBrXkD3ZFngfKaSBuQpj6K/kGWJUPFuATespNPEL+7GEL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwDcR4R7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B8CC4CED1;
	Sat,  4 Jan 2025 03:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735962420;
	bh=B9NxmRH4CHa28DsYjclAN2fCf5mVg5km6Ix/2YOOYYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwDcR4R7KPS5Pfj+0C7Slby3ycHPahpjoUSjIX+hO8VWJVw2zNBv2pTf5+NQoy4Nf
	 xLhJx98VCFnKPEfXykW0jZENXUdabdOcu1cCt72iYCimmEzrRAHqGtYfi9mgxYT9sR
	 ddTATeQ9zqMf5+rxVGqjwhs0Pd6Yg5JXONhFs/qpj1QsbD/MYyrpor+MW4sFGVQCF9
	 vSYHykP/Qi8NmRe7bOykUYUqHb5Gs3QsYthLFEpNR++cyVq4yLVhHxCjZLKFDdM/NE
	 eimUPhbVr35zOcfVjTaj1Zls2nM1etrfemwM3+b67Vc7TkZ55ORw7WxAQIGmni0V/N
	 bG4pocshHlFAQ==
Date: Sat, 4 Jan 2025 04:46:55 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <35hlmjlgq4xqnydipaprtcrb2ubwdcvo7qx3tfxtoqlwlamowz@lhrw7dnhme6d>
References: <20250101103422.30523-1-evepolonium@gmail.com>
 <5nxqlvyiy5t4ib6hwlo5h5hwlozw5ie7nzkq2vgwxbf6aqtod5@tbowjxmex26v>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5nxqlvyiy5t4ib6hwlo5h5hwlozw5ie7nzkq2vgwxbf6aqtod5@tbowjxmex26v>

On Sat, Jan 04, 2025 at 12:32:39AM +0100, Andi Shyti wrote:
> Hi again,
> 
> > @@ -211,7 +212,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
> >  		       SMB_HOST_ADDRESS);
> >  		outb_p(command, SMB_HOST_COMMAND);
> >  		if (read_write == I2C_SMBUS_WRITE)
> > -			outw_p(data->word, SMB_HOST_DATA);	/* TODO: endian???? */
> > +			outw_p(cpu_to_le16((u16)data->word), SMB_HOST_DATA);
> >  		size = AMD756_WORD_DATA;
> >  		break;
> >  	case I2C_SMBUS_BLOCK_DATA:
> > @@ -256,7 +257,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
> >  		data->byte = inw_p(SMB_HOST_DATA);
> >  		break;
> >  	case AMD756_WORD_DATA:
> > -		data->word = inw_p(SMB_HOST_DATA);	/* TODO: endian???? */
> > +		data->word = (u16)le16_to_cpu(inw_p(SMB_HOST_DATA));
> 
> sorry, please do send a new version, the cast should not be
> needed here.
> 
> If you have any questions, feel free to ask, after having read
> Documentation/process/coding-style.rst.

Sorry, I managed to make myself misunderstood in my previous  
emails. Please don't send anything, I've already pushed the
version with the fix reported by LKP.

Andi

