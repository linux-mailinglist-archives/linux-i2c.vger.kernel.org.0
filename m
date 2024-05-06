Return-Path: <linux-i2c+bounces-3422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2688BCA2F
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 11:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8BD1B22788
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 09:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E301422A4;
	Mon,  6 May 2024 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxU8csTG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B470C140374;
	Mon,  6 May 2024 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714986270; cv=none; b=TsEXvJjei+HLavfzDApyNrAPmVGIJC+q3jEzb59JXJZoWg37V/MiWeDqI1PyNAi6LrttZaJp3JrAPU/f+HuXmz8Ck8tZDQ/LWg2osZkMTltw55x9f6MVEzdzwbU9vt3VcCwpLIhDwrLhfxVm65SngHht3UyMKk3IfBYvPFkTpYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714986270; c=relaxed/simple;
	bh=kDDkegC5hInltK0Om1MVpXHOfXe/bq/iX5AtVb/jYHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3t3XUvvVD6o5IRuUnPzTPtNOTSDz6y1yI6PalW02MES3f2Rm2brhv91hx/PCg9vQ5RM8dpZ45m2lqfO/X1MKxAajjwWnLAryQNQwW0CfEFnK6aTWGIg2KYGslcaiSxD7+i5bANF5qdzAlalJ2nufnz63BgMh4J2Qg3PsIGh1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxU8csTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6CCC116B1;
	Mon,  6 May 2024 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714986270;
	bh=kDDkegC5hInltK0Om1MVpXHOfXe/bq/iX5AtVb/jYHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxU8csTGH8Fx4x9ncFFXgFseyF+fq6NMAiGreRHVCdmA7X7zge9Cxs2f2NiRbqZGV
	 uXtbXBbtNAiBnd8rcFWxFJdJCT6P2NCZzyouvEC7bqUyFjRtaJ7zrhRAnjk29kikEl
	 AS2CUjyMDMi9r0aJLtqw6qUOfDG22mnKJAU7Ya4zQwCNw3RUb0syDPzir3u755H4WW
	 P2DPTqecS8DqoOtRco76Mis5kCJSXqqmYuBi0Iz13ARs4U7BY3SiQsH/yP/a7Bg77n
	 pI5wzVZScTJkQcwlDVBpA9G0rP/jN5Q7UH66H0xLPYiNJdiEz67Am1ZYr2KYBc3gLC
	 kUJWgSbGZg4Tw==
Date: Mon, 6 May 2024 11:04:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: synquacer: Remove a clk reference from struct
 synquacer_i2c
Message-ID: <55yrt7w7t2zjep3ruferhgivuttk5d7j4xhsulqc24egfaxciu@gbloxzjewla3>
References: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
 <01e5b93d75eaeb071c6864f8b43355a7c24e0c91.1704545258.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01e5b93d75eaeb071c6864f8b43355a7c24e0c91.1704545258.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Sat, Jan 06, 2024 at 01:48:25PM +0100, Christophe JAILLET wrote:
> 'pclk' is only used locally in the probe. Remove it from the
> 'synquacer_i2c' structure.
> 
> Also remove a useless debug message.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to i2c/i2c-host-next.

Thanks,
Andi

