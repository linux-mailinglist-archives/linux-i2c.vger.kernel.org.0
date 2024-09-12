Return-Path: <linux-i2c+bounces-6612-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB097663B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 12:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDF5A28527C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 10:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6C119E963;
	Thu, 12 Sep 2024 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pkao1/pM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74BB136328;
	Thu, 12 Sep 2024 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726135328; cv=none; b=qSy1dM8FAw0VLsJB/P2YOzgEiEgqd8ANuk7fsNMPO4nCR6H8/cG2zJELnbI16BDEx0lMcqn8MoZMuMQY1hNblnHHPHTRMhGuCoR1k6dXVdnP/Mi+P/bt0NdFuP3iNB92tIWS0NHsIuNubUtbCHTcwBBWT8whr8apOJT1BnNMIC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726135328; c=relaxed/simple;
	bh=2AmhqDEMZCRF60IhqOsscYYo0UoqtMMlj7QiuCR9y+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrbsO4QS5aF0XxYGfz+xpbyvhueP0dz98t0T4i2nXktCu6Pe9f20dSCTpsGgAKBvECo0kjVNIWi+TvSt/eLFuXXS4bQ42bPg94IjG/BgDSqhar/LhfkswqZDy9DGFzv1B7j+wb0bSxxoVkDzLesmOJQ6cmmUkMNiy3w8lZK5iWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pkao1/pM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC72DC4CEC3;
	Thu, 12 Sep 2024 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726135328;
	bh=2AmhqDEMZCRF60IhqOsscYYo0UoqtMMlj7QiuCR9y+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pkao1/pMhI+cqDVQQ43SIJrL0fGIbZkOI66ioVqWMrUgIMZdRCFm38+nLDyZ94okW
	 ktKlKH7jofybXjzDujzXY2Ru0Xm9eokqTtv4rdRkkgL7+fqOmdByligHh4GcZkERjm
	 L21gD7xEoGUhLZyNd/F/V8p5UVTNn0BFA3WRYGGB/GeLkpx+fDpYEKyUznUG7sbyWE
	 CXvcVf5jZsNzpZohOKzodGvILZg/uvInQOEyJbMHYimdXuevys1Y2SORnYKlsBJJhV
	 yKfX1fCQ8xPqlg2W6EUXYz+wVM5B1oYqlXucPGJhfZg+IWj1wvaOIVUlRrfqh7+GhH
	 hGvqoaR0r2U/A==
Date: Thu, 12 Sep 2024 12:02:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	quic_vdadhani@quicinc.com, vkoul@kernel.org
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
Message-ID: <uib7it3noxnkekza4p4ngf5w677fizrb7j5ov7ekos2vinge5x@sh24m63gmkrr>
References: <20240402102741.128424-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402102741.128424-1-quic_msavaliy@quicinc.com>

Hi Mukesh,

Is this patch still needed? Can anyone active in the Qualcomm
drivers take a look?

On Tue, Apr 02, 2024 at 03:57:41PM GMT, Mukesh Kumar Savaliya wrote:
> pm_runtime_get_sync() function fails during PM early resume and returning
> -EACCES because runtime PM for the device is disabled at the early stage
> causing i2c transfer to fail. Make changes to serve transfer with force
> resume.
> 
> 1. Register interrupt with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags
>    to avoid timeout of transfer when IRQ is not enabled during early stage.
> 2. Do force resume if pm_runtime_get_sync() is failing after system
>    suspend when runtime PM is not enabled.
> 3. Increment power usage count after forced resume to balance
>    it against regular runtime suspend.
> 
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

Should this be considered a fix?

Thanks,
Andi

