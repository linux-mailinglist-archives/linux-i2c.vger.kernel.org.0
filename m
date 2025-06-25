Return-Path: <linux-i2c+bounces-11600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C174DAE90EB
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 00:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A1691898EA1
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 22:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639952F2C74;
	Wed, 25 Jun 2025 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOuy1yeF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22D35280;
	Wed, 25 Jun 2025 22:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750889871; cv=none; b=HzEbZ5DAjSdL+w31rcvgl/pDydf+FmpCfBfiNv4hUhd41x2N9SDp8QGcG7X+Qlfrrn+IsJsrIZHW8xO8NvEMJZAez1VHKq/X30JfgiMI3pJnVllJ6NWNEJr0UOmVfrnWgkHgz7EHW1IGcfJyqCNNNYTO6fhbNc+md3+P1uBpGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750889871; c=relaxed/simple;
	bh=SOlW945FsEuU+z2VqRVH+3m+gzeJachd1rv/kOLBoD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+bdxne/zO31mn/K9RdFooqARswpns41bvcm/RTxBNrkb+6EDuFsc7rS8WmBgVfhArB5WqAA8oJqnO6WOXdn1X6l5yXF8ntJY/1Mjv9N9CWzxfyyJvfzxHihkuKom6FMv1xWAFgX0EBapIZbqbul0TdAauQlBiccnJiqWuR03pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOuy1yeF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C12C4CEEA;
	Wed, 25 Jun 2025 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750889870;
	bh=SOlW945FsEuU+z2VqRVH+3m+gzeJachd1rv/kOLBoD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOuy1yeF9Ackritm8p/aX1omm/wZpCvVFwrZ3wESNTTLB9VHdquUbC99Mdt2qBsdZ
	 N8/t9i6dnBeOa+dPtJFo6OOH31RuyxUJBKxpWR+xPF9hZnykWDiO+nUWow2SRBa5RN
	 E7ctyqtCrksbpBdo3tCyfbMmLP12EdJY/OHMXSzpQghhpUQpIOlD5SXN5PQd2kh8OS
	 bszr0EgASrf3/dqjEk4MSjbEjcvE/YRh9IIcB5J7N8QrejF5uIVXurarv63NJA3+/R
	 gt3UcLcTEferpmtCxfAu7CjHV4xgXoZCoIn55s0VOhfb9RpXfwsykwUjC/NpK1XCYW
	 MkLbLM82qkpiw==
Date: Thu, 26 Jun 2025 00:17:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/3] Fix STM32 I2C dma operations
Message-ID: <cmxzc2slync7toacgqpng6u5nbxhp73foaacwqdkm3z7k7hesu@zc3mpbdrpiaz>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>

Pierre-Yves, Alain,

On Mon, Jun 16, 2025 at 10:53:53AM +0200, Clément Le Goffic wrote:
> This patch series aims to fix some issues inside the driver's DMA
> handling.
> It also uses newer I2C DMA API.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
> Clément Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer
>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

any chance you can take a look at this series?

Thanks,
Andi

> 
>  drivers/i2c/busses/i2c-stm32.c   |  2 +-
>  drivers/i2c/busses/i2c-stm32f7.c | 40 +++++++++++++++++++++++++++++-----------
>  2 files changed, 30 insertions(+), 12 deletions(-)
> ---
> base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
> change-id: 20250527-i2c-upstream-e5b69501359a
> 
> Best regards,
> -- 
> Clément Le Goffic <clement.legoffic@foss.st.com>
> 

