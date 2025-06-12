Return-Path: <linux-i2c+bounces-11384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A8AD7862
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 18:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 352B01885B43
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 16:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EAD298CB5;
	Thu, 12 Jun 2025 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IIcrjN4n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06A279D2;
	Thu, 12 Jun 2025 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749746305; cv=none; b=jRLLlqtMVJEjUVtdfkt6m6yC305Nfeut9nTyC8nHgJW9o8p0nFIDoUIi+Y2nKGV1KnrmMJyw8gz5VWhqjJK5toAsQAFYt2QHexhi9Nqa/dSaBKUrNfVSkKIvYNXxbpDMh9y1gVKKYg7wBt+Ad0hzQsD3y0CC67Au20ZlT0h85k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749746305; c=relaxed/simple;
	bh=KYVFWLl+65htoJPS0/qLvXuh6nSvRnMY9ovcb5uW6m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjtInvEvou5SJ2lyngVtVscB4WvS1OID6DTgRYshq+UHjVi5jMqMVbUMe355+Fwrbn2pK+Z77pmd4bdwzTReDUPVbWpGBu3TO4WfmCXHkDuQnZ9LGHV3IrhqjBFXHZhd+HT6m05gNFiQWX6KqhcA7yvsA0+MXc6OlpEgFGXfrUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IIcrjN4n; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=aGDZFMgTvME7pRVCtWm3yOWZ2QscL3IKAWvsAAk139M=;
	b=IIcrjN4nkiCHVp2PRnt30XAPgsQtIfdzPuaFiTlM+fEWNX18F7SO0buiTEe90y
	ivoFZ7exTXyzah/BFVF+brf1qiW+cROvXXh4+vhwtF3rG0jJp0IRdD76dy7+i1l3
	DE3mIbX+SqZcid284RprFFczakKEqtFMERhVeQWmWEX60=
Received: from [192.168.71.94] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDHLdFmAktoRwcuHw--.37158S2;
	Fri, 13 Jun 2025 00:37:58 +0800 (CST)
Message-ID: <e218509e-50f4-4c30-b52a-a53263ebe394@163.com>
Date: Fri, 13 Jun 2025 00:37:57 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: tegra: Add missing kernel-doc for dma_dev member
To: ldewangan@nvidia.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: digetx@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, hans.zhang@cixtech.com
References: <20250522163814.399630-1-18255117159@163.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250522163814.399630-1-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDHLdFmAktoRwcuHw--.37158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7XFy7KF4xWFWkuFWDGw13XFb_yoW8Jr17pa
	yxCFW0yw1Utayj93W7Xr4UurW5Jw4rXayUGwnIywnYvanxt34kJF12gFyruFs5Gr9Fvw4x
	t3yUt3WfC3WjvFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRA9N3UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiQwhqo2hK-6FNOgAAsJ

Hi all,

Gentle ping.

Best regards,
Hans

On 2025/5/23 00:38, Hans Zhang wrote:
> Fix the kernel-doc warning by describing the 'dma_dev' member in
> the tegra_i2c_dev struct.  This resolves the compilation warning:
> 
> drivers/i2c/busses/i2c-tegra.c:297: warning: Function parameter or struct member 'dma_dev' not described in 'tegra_i2c_dev'
> 
> Fixes: cdbf26251d3b ("i2c: tegra: Allocate DMA memory for DMA engine")
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 87976e99e6d0..07bb1e7e84cc 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -253,6 +253,7 @@ struct tegra_i2c_hw_feature {
>    * @dma_phys: handle to DMA resources
>    * @dma_buf: pointer to allocated DMA buffer
>    * @dma_buf_size: DMA buffer size
> + * @dma_dev: DMA device used for transfers
>    * @dma_mode: indicates active DMA transfer
>    * @dma_complete: DMA completion notifier
>    * @atomic_mode: indicates active atomic transfer
> 
> base-commit: fee3e843b309444f48157e2188efa6818bae85cf


