Return-Path: <linux-i2c+bounces-9489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE6CA3AC4E
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 00:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 795427A1FAE
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 23:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BA91D61B1;
	Tue, 18 Feb 2025 23:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOykDF0p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0100174EE4;
	Tue, 18 Feb 2025 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739919731; cv=none; b=Rq9YLcX4cdAUvJpsnS+7my1uONOcwqVhH4cYiDx1VdA5NeHoGfmEZeRTM3XIMwL/5zsANrRGwpeaT8cQZo/xkMu+3wNUhrTbnD+N1brUTR6fPjj/q9GpphOYB2MEB5A/Rm+bAUJA1HwLa5MsEnwVIze1eMigFzw9fL6jin3RXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739919731; c=relaxed/simple;
	bh=wREP/UybYNX82nCrOoY5QJqG6u05ZPtEIKwl9FtFMv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MH/pbqInjr/Cij83OPHZ7KhadODd3a6fbgxjc+oW+jVncS5n2RLt46v5UxEgJivtdKyDnPMtpiH9XkQ8fCfeWkm59qTz7G1bsvNFQ1xZYZbam46bs6M483P2rp1ae+oKacLCwD7nfvu49/qZhgOE37UoqbY064DS4eaixVFb1to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOykDF0p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A84C4CEE2;
	Tue, 18 Feb 2025 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739919730;
	bh=wREP/UybYNX82nCrOoY5QJqG6u05ZPtEIKwl9FtFMv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOykDF0pEvMAwNax+G6KgM8CnKRM400/NQjt0qvKowfmD9RN5c+x42B3505Tb+vwK
	 Bvty+PYJ75mSg3pUvejIN89iUkoyZlgKHx7eUwGJv9nlL0rvVEjktzdz3k9tuUiqjd
	 cGaqM0L/CR32hm3y+p+LzXFcTLieGLAW7l0I8wCwhKCdwlt8e9xii7NuHoLtcXnS60
	 R8TyC4fFv8NKRnuwL9hSuE5F4ccHmzJVNZY7BTkEEIfQA5q8Z4EE99E+z4ZJxCABt4
	 SnblHfVYO4R0wItf1JCpvGQng1noNPyI6j+Y9FSTKetxQdBop99kAjn4FDMQIY4Eou
	 jXses+/tSIm+A==
Date: Wed, 19 Feb 2025 00:02:06 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
Message-ID: <5dr5ps4vb57xj2mfelgsxgoyrr3gg4ggwqggqchff6pda3ffsn@thxpg4h6kgel>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>

Hi Stephen,

sorry for the very late reply here. Just one question.

...

> downstream/vendor driver [1]. Due to lack of documentation about the
> interconnect setup/behavior I cannot say exactly if this is right.
> Unfortunately, this is not implemented very consistently downstream...

Can we have someone from Qualcomm or Linaro taking a peak here?

> [1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/commit/67174e2624ea64814231e7e1e4af83fd882302c6

...

> @@ -1745,6 +1775,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  			goto fail_dma;
>  		}
>  		qup->is_dma = true;
> +
> +		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
> +		if (IS_ERR(qup->icc_path))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
> +					     "failed to get interconnect path\n");

Can we live without it if it fails?

Thanks,
Andi

