Return-Path: <linux-i2c+bounces-10460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D039A91D59
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 15:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96AF919E1B39
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 13:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B5A242928;
	Thu, 17 Apr 2025 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQVhPpVg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5045D1F463D;
	Thu, 17 Apr 2025 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895444; cv=none; b=NfvMjk2kbRiG8A7NOm3wS4tb3tVVTn0YbNbQ5Ekl4LVPXyyEZ5MtKRgrbuoBDrfkEKAVhtIYPTChefdYyPEUfQdGZusD7Gbd/oG76EXON+KYzicc3r4fCbFG/bTmUsGFsnQERkm12CSXHVfsIUbXr32Mj1BdUAC0cel0C0qHT9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895444; c=relaxed/simple;
	bh=UX5aCpiFPWHDn5y5lBqZg3C21rUMdQGu9cwtYACqRIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a17SE697z+BPvhsqSGYfkzxwGLrX9MJWxDSJh+r5/o+Ri37OJIhTdIgg2H5opeydR4sQ3UH0D6KHER+XIWLP5RxFgAToBuorclWqShyh5qE+qFcZ5/sb9JyMzZqDGUArdDg/XvPSxY/8oEIlWHUKsedTnyZk+WYyvUCVZ5urKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQVhPpVg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16539C4CEE4;
	Thu, 17 Apr 2025 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744895441;
	bh=UX5aCpiFPWHDn5y5lBqZg3C21rUMdQGu9cwtYACqRIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQVhPpVgwjufYHxGJpES7G6EpaKPVUoh06ZvwZmLlTYAC+vceHN+5dH1EA5pdas5d
	 47tCETUmeOH9XJMp1YCNKlYdN6LZpIkEngGIzw99nIjo0KAwxLZ59LGxlJcihXoNcR
	 AafOC2sU9MAE0Dhsf41hhdjLI3D5xrmORZyfVZTmybLfZ8TUUiLybwJ3Yw71W/MP22
	 tMHTB3P1vubgOdPMt3PgvOzq+ia+xfWJQ3gIBGP2svj0kP+iq7FeCTjxXnJ+viR5fT
	 JT7/n5/p0gCbfMOQQ+NtM5m9n3rxdnwPODhXv/zB6LL9lkUwFKycInnA8q5pivCllq
	 tYdpSPxfWrioQ==
Date: Thu, 17 Apr 2025 15:10:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] i2c: pasemi: Log bus reset causes
Message-ID: <yxzzpnf2eprgaoaghuptj2izxyuu3rzdldm6emsob7asrsxbrk@kzrlellx3qim>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-6-c543bf53151a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-6-c543bf53151a@svenpeter.dev>

Hi Sven,

...

>  static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>  {
> -	unsigned int status;
> +	unsigned int status, xfstatus;

Let's declare the variables in the innermost scope where they are
used.

Andi

>  	int ret;
>  
>  	/* First wait for the bus to go idle */
> @@ -98,7 +99,9 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>  				 USEC_PER_MSEC, USEC_PER_MSEC * TRANSFER_TIMEOUT_MS);
>  
>  	if (ret < 0) {
> -		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
> +		xfstatus = reg_read(smbus, REG_XFSTA);
> +		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
> +			 status, xfstatus);
>  		return -EIO;
>  	}
>  
> 
> -- 
> 2.34.1
> 

