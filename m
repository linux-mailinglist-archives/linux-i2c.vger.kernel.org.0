Return-Path: <linux-i2c+bounces-10436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 406EDA90D9B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 23:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 969B63BC560
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 21:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F6223026C;
	Wed, 16 Apr 2025 21:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ4qVg9q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C42248B3
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 21:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837979; cv=none; b=pXflU+Wnmt7UPbgzbrkcZc4WNMm/MjQrV4iLDSoqv3TRZLe7RBsD7JOktpM/PTEPM4ruNk4Y49S/GRtv8g3LAxVNq2PrQGRYUi99gKbNdzt4BGsSLCqSFiL2Zf2UBMwk9OrhTAitTaiF7hffZvCJ9hl/6Tn2lRGeQH7DgbrGJok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837979; c=relaxed/simple;
	bh=aOpO9pMYL9bCQUp7VAClRbNJ8VEOvltY5UA5vZ2XO0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9SjFUoE4sQUueWP4A6XIlYSpUPUzFLRkaPVWyd8wnnWYqBh3ueqW62NuMn14NEgl8VaLFScoJJ6BsqRWJAyZSvQoPJC965sLUAPFqsZnHVegxUxHGHCoHt8XQ9qrsjGg1ibW9BIPAGK+MVk7i8HHHPb7PCSLR+/Wa+sUm/YPFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ4qVg9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEF1C4CEE2;
	Wed, 16 Apr 2025 21:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744837979;
	bh=aOpO9pMYL9bCQUp7VAClRbNJ8VEOvltY5UA5vZ2XO0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJ4qVg9qpY9EyFsiIAIB+fUCzANrkEh6DI/gdXqR3Ta8kcqXs8jqk1JlaoSDbT19F
	 hIXWAYLhN+PXgZ9tIy+kASVHboKrXJImT5BxcAC3kmhHPdKSJdwaSuCBDPgyF5zmSN
	 jwsmjKa+LKRhhK1SsjJKImvqdNo3CPBFyTQdP8rEb6CpRQbSpZwRwjjJBLYno4GzWu
	 S60weYoVfa35hBLAx3AgLIFVE1lIMKj+oFT32uqqyyTtihrX53z1ag1XY9Tdi+QoSw
	 FPEJ9XYVGfJ0eVZ9eaLfS8iiMfiDCRZFNRQ32qdV8RKq0qIzmjTUHCIWEJN3kIf7MF
	 ThLuav2TUMl7w==
Date: Wed, 16 Apr 2025 23:12:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Enrico Zanda <e.zanda1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/10] i2c: viapro: Replace dev_err() with
 dev_err_probe() in probe function
Message-ID: <rk4yy3wn3qsfakwzgxhpep5xgfurjm45i6so7e3q4bfaf74a4w@srq6z3b3seam>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
 <20250415183447.396277-6-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415183447.396277-6-e.zanda1@gmail.com>

Hi Enrico,

> -			dev_err(&pdev->dev, "Cannot configure "
> -				"SMBus I/O Base address\n");
> -			return -ENODEV;
> +			return dev_err_probe(&pdev->dev, -ENODEV,
> +					     "Cannot configure "
> +					     "SMBus I/O Base address\n");

these string splittings are a bit ugly, but let's leave them as
they are. Just a thought, no action requested.

Thanks,
Andi

