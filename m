Return-Path: <linux-i2c+bounces-10437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F600A90DBA
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 23:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118C5445024
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 21:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285D1221DA5;
	Wed, 16 Apr 2025 21:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrLXxxFN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EDA14B950
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 21:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838367; cv=none; b=e2F7hJi6sQA4j6vOiHnfmriQY0VTlNSncRbfzhipmV1kXzDx/Gq/tUIycg4ybvDUxJrcaDvMFH16f69KW5VJXLx8MkBMH5Nm1kShBDOiXio8s3DkSXav+MIwXDP5I/zNa7azk+AUTPb+1gvRJEUXCZcciE2xQT9UeWnh40FZ1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838367; c=relaxed/simple;
	bh=7cl8hylKfNbFnYi8oaMGR+2XnxtWGpWOmspLzELh5cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMgXDu5xZQvyuaJ1og7IYFbGRu/Q5+JCoUAkeSiyMWKupnhxeD5UcHYdRjqPfOjP6WhGtSpuxSQkgz2TOJWsxJuVsCUcV7ON3VYa368GuTvGYe84sENkiAj+SXglnMoD0E7dnhZRDWNVNdnPb9Ia1/NizaLaiS9yjpg/OKJdh0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrLXxxFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4E2C4CEE4;
	Wed, 16 Apr 2025 21:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744838367;
	bh=7cl8hylKfNbFnYi8oaMGR+2XnxtWGpWOmspLzELh5cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrLXxxFNd0H0lubREaGQxs3L1Ktfg+hVPxrRrWKYCBecMR59oHlxmtNinEtid87n6
	 hX4/I8IXZDgiiAUhrUGvB2uUPOvGlnFR798mMtCCcnSo5MPNKobi+P6QvlK1LdiaLA
	 Sp8wxFGrLygLxXK3d+e2B9cEVazUHBIzm1RtjcDFOqlyEfNvQ99Uij1y9jqLZtfAFK
	 1S6hI9n1u1Mkd6Q8xgrzsKnx17KO/kuAgOeiFMgH0qi/FFkndbnF866lIlIN/B3qQ0
	 Vpol2OigGGXCHesPTdV1oNEH1IsUm/+uZ4zoDeD62qSpH7qQnxGvWkuN8KQbXn6FoP
	 ABxV7ol9tX/+A==
Date: Wed, 16 Apr 2025 23:19:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Enrico Zanda <e.zanda1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 08/10] i2c: xgene-slimpro: Replace dev_err() with
 dev_err_probe() in probe function
Message-ID: <irmthictkubsmmz3cln65hz7pj227m7neqhuws5ecnzgvgdac3@tznat4u3jlic>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
 <20250415183447.396277-9-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415183447.396277-9-e.zanda1@gmail.com>

Hi Enrico,

...

> @@ -511,15 +509,14 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
>  							pcc_chan->shmem_size,
>  							MEMREMAP_WB);
>  		} else {
> -			dev_err(&pdev->dev, "Failed to get PCC comm region\n");
> -			rc = -ENOENT;
> +			rc = dev_err_probe(&pdev->dev, -ENOENT,
> +					   "Failed to get PCC comm region\n");
>  			goto mbox_err;
>  		}
>  
>  		if (!ctx->pcc_comm_addr) {
> -			dev_err(&pdev->dev,
> -				"Failed to ioremap PCC comm region\n");
> -			rc = -ENOMEM;
> +			rc = dev_err_probe(&pdev->dev, -ENOMEM,
> +				      "Failed to ioremap PCC comm region\n");

these lines were removed by 1dde04276b4d ("i2c: xgene-slimpro:
Simplify PCC shared memory region handling").

Can you please rebase your work on top of my branch:

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

branch i2c/i2c-host.

Thanks,
Andi

>  			goto mbox_err;
>  		}
>  	}
> -- 
> 2.43.0
> 

