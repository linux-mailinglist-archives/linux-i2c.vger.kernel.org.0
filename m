Return-Path: <linux-i2c+bounces-8445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9105A9EC87E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 10:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9507188C9A0
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 09:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4562210C4;
	Wed, 11 Dec 2024 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLEGtGBN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE12210C8;
	Wed, 11 Dec 2024 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908194; cv=none; b=F5TQlVspDUpoKhqwOUCB3vIuJg5qRjjYP60nksdz01/exMxeop2BIpeVZ3+Kg+mmmwreU1Hptz3XvHVfOQB8FI8jyfGAtSTuSFqXxxxe14QhK+UCnoc0wVRYy0PH87ye00N6Ge+lCe0SmnPcNprhbpKVLlNteskwqZqU+1qI+DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908194; c=relaxed/simple;
	bh=h+8aaSOBI+JazmkzwbvTM7ZZHXnx6Jbu/u8T1VdZp14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrRLtWbpTwWSauov2OuXdWsQ5CpE3m9PMjGtY22Txz4MboqsV/j3/FSH5SIgQp1t/Imnph1kUXAZeBvh6y5xDBY52mIlT2OTIzSkPt0kPG/72AmD8CHXko1yzys3K4qppXBz0ZOc5NVn5h5DFrz1xtOllsXSu1xo0IT/qLSfaVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLEGtGBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AD6C4CED2;
	Wed, 11 Dec 2024 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733908193;
	bh=h+8aaSOBI+JazmkzwbvTM7ZZHXnx6Jbu/u8T1VdZp14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLEGtGBNxqHRAeOc2iFXJCDMeI7bwVSvbaZmhnbUlTocwzxun2pMQ9LikdtuTIhlj
	 9Y/GSsUSl2hrAKvwSpyjhCBkONyn/F5HBVsCziCeQ6dzW9qo6TCLWxy+aLERQ/5UKG
	 QSljT0fX5b2E6YsSz4W0/bBzOy7Ymju3PLcW/FjrZRUjj2TXCJ6MuOgXtSXs12EczB
	 YqFPZVgxxXhiTaxSwjH1Y0p0z+rnpNTfmx7hOot0LpBMuIs+GRU6tIxBp2d0rdgbpI
	 0KbKIEvFxkLHTFBtTAApu8QLKIAe+acVV0RCdz8o4gwa9i4QHoKVCr8za1a2C4CJZ+
	 /IDarPxFhbI0w==
Date: Wed, 11 Dec 2024 10:09:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
Message-ID: <2scddivynhayur6szoe7nvfnk3y5jocsqauixkbkrmnuef6nes@7cywqpm5cjm6>
References: <20241210231054.2844202-1-andi.shyti@kernel.org>
 <20241210231054.2844202-3-andi.shyti@kernel.org>
 <50ebc5f1-967a-4aa7-a4c3-3304961d1f8b@quicinc.com>
 <gwl6occrun32l4rmcdrjnzymadhlwixba5eyeznnx462gp7gym@rsvsdjr2zgmp>
 <765f2a3e-a930-407f-83bf-ad3e6b928443@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <765f2a3e-a930-407f-83bf-ad3e6b928443@quicinc.com>

> > > > @@ -944,8 +938,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
> > > >    	return 0;
> > > return ret here ? yes, we need to initialize ret = 0.
> > 
> > here? It's returning '0', as it was before. I'm failing to see
> > where 'ret' is used uninitialized. What am I missing?
> > 
> My point is - Except this place, rest of the places we are returning ret OR
> standard error code. If we return as ret with initializing 0 at the start of
> probe function, it would look good. As such No strict requirement.

Ah, I see. Sure, I can do a "return ret" in my v2.

Thanks,
Andi

