Return-Path: <linux-i2c+bounces-6286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0C696E53E
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 23:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39DFA284167
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3681AD27E;
	Thu,  5 Sep 2024 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RK8Rgy8L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189831AB6D9;
	Thu,  5 Sep 2024 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725572615; cv=none; b=C1RfCRq/Nc8lZ6drt7bAlSkPS4KRBXFuT62HKezYvLfC2fNvKv9q44X7XrONWpdwddcKppQVzOeVqyMm1vYHcvYyhmJE88K/19F82bQhtO+H1JBFK1GuW6EHqvYhnJxkTg0HGL/qK6UU1RIqbltwQqMpCg9abSqaBxWlxMnnrcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725572615; c=relaxed/simple;
	bh=7lGyC41JD4CgqMu6iaebpgliZkHn/0RJMVcb4xV6/LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hif5LQiaWTL0iqocnqcLaDwXwvY7Q6p6ddj6XqTA27GPTMSoCgDRd7HJY52CcUQ4NsF6nazog06NxHLA1eLJpEAMr/2Z+KPAWx0w7KyiBP3w5fa6FysK7UKX2cfLImmH7SA+HPoWyIue3ABxjsTEhY/jTP9amUYKS7M8c9FK6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RK8Rgy8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B879C4CEC3;
	Thu,  5 Sep 2024 21:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725572614;
	bh=7lGyC41JD4CgqMu6iaebpgliZkHn/0RJMVcb4xV6/LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RK8Rgy8L4M8VPqnHXtCNjNZzJYUQMHhFNgadI4HCB2qnjCfakIt1VHLnK7OeAwyAy
	 0MUR0y8nNf4Q7OuTt5W77DjJc47m+LqhHiIkRIghJ0TpCpZY2L4VhW/P60cOujiwHD
	 dctaJPuu4FPy5Boxka8YvsYEDVIq6vpokjLbWQCoqenxyRfmJI3Vd4LS967SSQBHnQ
	 Gr1XZQQE99eCsEeYirkfLepcqxIxtuBymzOOVO8NIhmeEoQx71JYiIBb0dU+X4aeto
	 4lAgK0yrbx9C7iQo3oFPN7aXkHS4cSnL2UA6tiFWWEVfw/Y+MX+tOFhrcmHiVFdgti
	 YDR6ixRvRkghw==
Date: Thu, 5 Sep 2024 23:43:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-7-kfting@nuvoton.com>

Hi,

On Fri, Aug 30, 2024 at 11:46:39AM GMT, Tyrone Ting wrote:
> Modify i2c frequency from table parameters
> for NPCM i2c modules.
> 
> Supported frequencies are:
> 
> 1. 100KHz
> 2. 400KHz
> 3. 1MHz

I agree with Andy, please add a good explanation for this change.

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++------------
>  1 file changed, 144 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 67d156ed29b9..cac4ea0b69b8 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
>  #define I2C_FREQ_MIN_HZ			10000
>  #define I2C_FREQ_MAX_HZ			I2C_MAX_FAST_MODE_PLUS_FREQ
>  
> +struct SMB_TIMING_T {

Please run checkpatch.pl before sending the patches.

Thanks,
Andi

