Return-Path: <linux-i2c+bounces-11819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48774AF7F9C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 20:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAB5E173553
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 18:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BB92F19A3;
	Thu,  3 Jul 2025 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4QhAFfJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F278B1E9B3D;
	Thu,  3 Jul 2025 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566312; cv=none; b=FCOsvzjv57eQHXr56io1bnHJzfEUmCezCo9DxuCdqZht1xW697ueRAkZQS/fl4JqkhdryvetQ1ECH5tcH8jfqWW48Vr7NpOWXt2e7TvhOz4W8sM2Uk49n8XHJQmuz+QcHIIBo2s5wstD3h6M7ngg3rksyAA9KHc3hGK+JmlgdkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566312; c=relaxed/simple;
	bh=VkIlwgd4byBd91qWdEkLK/tbWjhRo/xQa76/hK2+qYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoQTQAF4ukrjaeY2dLTb1bh9fnLHBHCRIiBlVg4jjNZ5RatxtNAD1dfUsw4DE2zbX1qBzsmjeEy21znsL/JKCuPPgIBQtUlyhbEhIPlYW3/aWmhfcrAfa+6oT4bW7N3P30gHydbM2SQLjM95WHYS+kxcTy2zCTqIN4gYrR5M1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4QhAFfJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54A4C4CEE3;
	Thu,  3 Jul 2025 18:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751566311;
	bh=VkIlwgd4byBd91qWdEkLK/tbWjhRo/xQa76/hK2+qYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4QhAFfJxzBP6eDj7S/rqEadSTALJZGw8lbX49bsX+XyJ5tZs+g0wDKNXZNi8h6Ax
	 lKroWL/fWjKzVUuGGD1FoAMC72kq9L9CLsLTxYDrYhsqoAuXraNfbrQOkdKfOyo96/
	 BznzvmGLAGk32hT81BFM/w0roHsSuF34Ub0nB6VYWdXQTYQobAQCvk/ZaumvGuIS9w
	 Fa9VS+oSv1Ki59sQzZcGVuDIpYvyybFhpDcDMp6ZTx2uYsl5M8kz5ZP2xOV81/M2kP
	 mK3owdxKY5SccqjGbens4jXLUeVaiKRoAbHXCxN61paL/ZcnZmNmxR9JqVifUpmpnR
	 aZlXd0ssexXDg==
Date: Thu, 3 Jul 2025 20:11:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Subject: Re: [PATCH] i2c: busses: Use min() to improve code
Message-ID: <gheuqazqnfbnxhdjcubhdvnfw6vsjspanllkwblbf63ifll7d3@lchelksxegdw>
References: <20250619142609.323082-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619142609.323082-1-rongqianfeng@vivo.com>

Hi Qianfeng,

> @@ -422,10 +423,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = c->count;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);

I think it's safe enough not to need a min_t(int,...

merged to i2c/i2c-host.

Thanks,
Andi

