Return-Path: <linux-i2c+bounces-5624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC4E959F5C
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 16:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA829284E2A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 14:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9445B1B1D40;
	Wed, 21 Aug 2024 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbRsAgdT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539051AF4FA
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249468; cv=none; b=Qn3TTVtjmwMvG6OtEvXOOeyV+AybCGinD7vJvll2VBTnn0DsmUE2MVoaIO4UlAbuutZr/X1/LPgBFmI70v/zfsTyIRdHshc6LhbikLpeInKjlgHTFLbtjehliMpBrG6akvy6540wTTWyvd+d6bgvDNtRMfYcYREdFNdDlzR2ZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249468; c=relaxed/simple;
	bh=ox9SMDf2wcCKV2bbnZ0Dju/4rBPAsne9HHpp32k1IHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9JcqnQf5DRXeZ8xLjlLkeSyoFylz/NuOJ8o4gfsi2khClOEXYtWxpqHIPedsT4/Vor2gapCPmWBO8KjCHyCwXCfDOIsVowBhRpDOdPdTiY9DayEhaVgcsG5V3wxYilvyucLvhEYh0rJaQC0dM8b6nJGz45sJvauIb/MzElNtx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbRsAgdT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB18C4AF0C;
	Wed, 21 Aug 2024 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724249467;
	bh=ox9SMDf2wcCKV2bbnZ0Dju/4rBPAsne9HHpp32k1IHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WbRsAgdTYyjNesiheFRZJz9wjNnRogGek6c+b+UA58kNNQXiUKBSkbNcjc4PBqcUL
	 da9+zEQyXp+lY2/2JsZ+ywHUcvbMuztRbkBaAv9ypb14nNRaT78at5HOJG/HOoRMqg
	 aAW4YQ/6Ht/5E+dEcnXcUu1dwtOwbYJL507X1SGqEepEml8+bbeFPxr0u+uc6i5/XJ
	 lKn2bvB9AiyHkpIzdRYpYqkcloCpg+m6PDAZB3sTe2nGl0fO/Zzz7JI9TbOL1G3hwA
	 NxvK5wD+im3UmoeZm76t7Ie7LmFE6kj7KRuMI81w1so9i+ABaeSLm7si+mUQ7/qOpp
	 dzOejrUyFgljw==
Date: Wed, 21 Aug 2024 16:11:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Gaosheng Cui <cuigaosheng1@huawei.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Use goto for clearer exit path
Message-ID: <44dqx5bmf6hu7tkdl56eqf3faeqirbr54skb5gywrhocq3jiqy@is5ruuglee2f>
References: <20240812194029.2222697-1-andi.shyti@kernel.org>
 <20240812194029.2222697-3-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812194029.2222697-3-andi.shyti@kernel.org>

On Mon, Aug 12, 2024 at 09:40:29PM GMT, Andi Shyti wrote:
> Refactor the code by using goto statements to reduce duplication
> and make the exit path clearer.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

merged to i2c/i2c-host.

Andi

