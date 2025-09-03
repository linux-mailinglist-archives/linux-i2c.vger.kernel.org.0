Return-Path: <linux-i2c+bounces-12579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E898B41BE9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 12:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C0411642A1
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 10:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC86F2DECC5;
	Wed,  3 Sep 2025 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGHA0fp3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF322A80D;
	Wed,  3 Sep 2025 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895541; cv=none; b=Ot5FJyyW42PaJMo3oa6W+fmqlI0oOV7pmpnIug4xlTnbSkqpkWpx+2bhUbJAggOh67nnr/FarkPmhWzMjLZiY0IdAwMUmLOUHt4fSa+lzgxxgy6jUrBNu9Me0y/D8gFMaAYHgK8gVQsmR6jeW0cOYlvOG/zCJKeyd7IMKXSyAb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895541; c=relaxed/simple;
	bh=OfzrlZXS+tBMSuJAzsFH4VWHQa6joDmypBhEW3I93v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBqup9vtp7hppBKuMIuTqRIcIEJ4WDLsfHYFmsCNavXPOMKz6s/JFbD0EgLwpFXjYc9H/xZUzEe4Bc5ryGo7sN8l6ix36aF/+B6zmNRdi85wI1CZ+3r2VIAXDer3FWtNvZ5Olynv74ZuxglRWOOina82hnZNFqJanU50ZlPUuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGHA0fp3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF577C4CEF0;
	Wed,  3 Sep 2025 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756895541;
	bh=OfzrlZXS+tBMSuJAzsFH4VWHQa6joDmypBhEW3I93v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGHA0fp3Hf1VEqeMMAZrlym6PXabO9rrhcd1lvPa2WIXppoeyaZpTlX33Ha+Oxa4l
	 CowlJYe7rWfTlggy9zoRE6n4HkKJPbs7FxxCWT3ojJZZ9Fg7JCOvkRsrjrbfe0hDxl
	 m4i2Lgq3XFWrVqu1J5ngy7bJp66xcgRIoy4mhoY/yZXh7Cc3AXwSpfkVhE3tqG3XhB
	 UETEhyweujRGFIBXIJONOP4GF++pjORZ6tsw1noHizONGEEhDS4IM07q1tHTcEBiBm
	 F1TT+Ls0atcjKvScPCIpFITyZ/z17NjYKj6FCLcum/ohMXUdbjcUkk/WuUhAa/cavw
	 NkdPePleYX4JA==
Date: Wed, 3 Sep 2025 12:32:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: s3c2410: Drop S3C2410 OF support
Message-ID: <gqcst3ceesm6zt3es332wbr3wqabayuvax4do6mg3y6725aufv@iarjuy462xcz>
References: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

On Sat, Aug 30, 2025 at 12:36:02PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.
> 
> However, there is still a user of "s3c2410-i2c" platform device ID,
> S3C64xx platform, so that part needs to stay.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

As an ex-Samsung active developer (and always hoping to be back
someday):

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

