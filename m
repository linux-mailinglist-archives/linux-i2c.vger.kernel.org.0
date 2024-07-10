Return-Path: <linux-i2c+bounces-4864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B9C92DBAD
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 00:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 812442816A1
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 22:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EA3147C60;
	Wed, 10 Jul 2024 22:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFbGJ+Dk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7D145FE9;
	Wed, 10 Jul 2024 22:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720649480; cv=none; b=CCGryccZcFDhFdhDCp/4AUrR5ZCejxw26hxHOijBw2PHWQzbobSiJ9JrgM3q/h06zXF/eyWMytQjukA9i8MJn776wuh2roLSKdEPBsRzcRpZfeQxjZOmzCx/ZkCQ0oAGZbL5dklzJYpfSSeTbnAdKaPsvFe/IZsfQ4xPMFm+B9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720649480; c=relaxed/simple;
	bh=d6B92F2tYKYJnTS0wgiNBGVoxnrUXN8+RFUm3oqSyH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9WlGjutKPoWl8O2IY8/i/3EX/FB/SedEhFDGCZPrnefVsxBZQoTNZEU5KRc5/c00vSkTZTQgzGwVU655BMexp3D2ZhscLWK671FXOSCZI5j2sIGoGAV/csAATffAZv5fg4p6H8xIU1qmaMmtED5m/t0NetYw4FtWiEr6NjGRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFbGJ+Dk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76303C32781;
	Wed, 10 Jul 2024 22:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720649480;
	bh=d6B92F2tYKYJnTS0wgiNBGVoxnrUXN8+RFUm3oqSyH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFbGJ+Dkc4M2dHDjdjpepsHp/ZXCkdfeIXkyCbbCvBHP5n/t2tBEMqJDPRKFwwhCX
	 h2baJAMwH96ypy9icX7JUo0/AzVUn6ClobIRtb/xhhXt6Zc3SwmYJQr0gahOx8xbxU
	 VUeuGl1m9MZuK+YXHWxawz5Je34vGktjc/nqAnrzc62pIaU/8Sos6xn8wcIWWMYbnJ
	 yQQsGk9VT6LYoNHjgYzL2pCyrT7lODkjNu7+mVgSH83tjEvrs7b0meiX6cL7p/kVVE
	 uot/yJ+SHJmaC9GiQpbHJ/L/b/PL2vIGwf1LOUHlu4uTpSSXwzTHKp9IiDMza8VkxG
	 rfHSAwsO86E2g==
Date: Thu, 11 Jul 2024 00:11:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 32/60] i2c: mv64xxx: reword according to newest
 specification
Message-ID: <7szxutsq35uaydvbo6bzrpsvnx765de7ps3kpvzs3b4ubczq6x@weaxji5u2p7c>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-33-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-33-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:32PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-mv64xxx.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index dc160cbc3155..29f94efedf60 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -89,8 +89,8 @@ enum {
>  	MV64XXX_I2C_STATE_WAITING_FOR_RESTART,
>  	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_1_ACK,
>  	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK,
> -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK,
> -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA,
> +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_ACK,
> +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_DATA,

I searched online for the datasheet but couldn't find it. It
would be helpful to know if the SLAVE naming comes from the
datasheet or if it is arbitrary.

If it originates from the hardware specifications, I suggest
keeping the term "SLAVE."

If anyone can share the datasheet, I would be happy to review it
myself.

Jean and Gregory, could you please check and provide your ack
here?

Thanks,
Andi

