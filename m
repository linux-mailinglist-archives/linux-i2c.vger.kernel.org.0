Return-Path: <linux-i2c+bounces-7030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BFF9873CE
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 14:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F0E1F235E3
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 12:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16B91C2BD;
	Thu, 26 Sep 2024 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPKRwj45"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6215C46B8;
	Thu, 26 Sep 2024 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727354927; cv=none; b=LwrqwF0tqNrdZM3NOMMXz3TrVFWEtyqlfBRYgFwXj9M2A3mHtiY3UAAT4NvfHHdlut046EvKbh/HKhJtGd3vA2nuaJVlXN0NPF+fCQ5cbYULEddQmKEFLU1wqPO9G5xV45gwo1jINZOtibgE7ZDIs6Q83k3jHLL7x2ZFKlvcUUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727354927; c=relaxed/simple;
	bh=ZGl/GnekOemMHBT10unkHnv+q5Jf0EJR/YJCLQr5SXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZFEWP800LjWBArr1teZ1IgtaeI4HUJ5zVBpTExTQkpxq2U4jOJ0y0UpyyGhy+ESLeqNATybncxP9DkRNxKjXdflwUvaBoe0WZKY2AxSlxLG4eR/KnyOk9vHDdx7pjaKyQEdy00+K/K3DK0sfUu699EuMvEcnPsWfDtBToUkiSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPKRwj45; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50ACEC4CEC5;
	Thu, 26 Sep 2024 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727354927;
	bh=ZGl/GnekOemMHBT10unkHnv+q5Jf0EJR/YJCLQr5SXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPKRwj45T19EP+hjSb/YSd+nyM0IjZ97aToitIrL2ks8Hl+SJ05l446olSo+aEq7S
	 Wk0HCN+kxKWK+9vOGugIVzBSpqP3EszMOwmT97wG/NB5WFilKFzYcDdpIyJTjp/UFM
	 1Cl/0HCkSDOziOoQiKsr7TVk84IqYv9p2myC4fngICgmmNnhhXDW98KFXR0zOJ0DA5
	 o03+9MHhRWINpQ8ykQ/Fdr5MO8tgmoyYWNLfwY1NIP7dro58jyloTzwcSKjwN1p5NJ
	 sDJnH3pji2LtBLsvPy8YlDoSPrFxXf7sJFB/g4Vv7Jiwc/7TYCoLM+hO12IcNnCjOZ
	 8cEhWTyrM5OCg==
Date: Thu, 26 Sep 2024 14:48:44 +0200
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
Message-ID: <wfm2xgyf67erkl57d4ztnj7t7cezkeohne2bcz42crtjwmjp5j@wfakrtwjizkq>
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
 <def1c338-8e41-4622-83d5-7a377d780d76@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <def1c338-8e41-4622-83d5-7a377d780d76@linaro.org>

On Thu, Sep 26, 2024 at 01:28:37PM GMT, Vladimir Zapolskiy wrote:
> On 9/26/24 06:43, Manikanta Mylavarapu wrote:
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
[..]
> > +
> >   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
> >   {
> >   	int i;
> > -	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
> > +	const struct geni_i2c_clk_fld *itr;
> > +
> > +	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
> > +		itr = geni_i2c_clk_map_32mhz;
> > +	else
> > +		itr = geni_i2c_clk_map_19p2mhz;
> > -	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
> > +	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map_19p2mhz); i++, itr++) {
> 
> Struct/data organization here is so weak, that here it's implicitly assumed
> that sizes of two arrays are equal. It could be kept as is of course, just
> pointing to it.
> 

Thanks for pointing this out, Vladimir.

I'd prefer we fix it by adding a sentinel value to the arrays - because
this was only spotted due to the rename, the next guy will not be so
lucky.

Regards,
Bjorn

> >   		if (itr->clk_freq_out == gi2c->clk_freq_out) {
> >   			gi2c->clk_fld = itr;
> >   			return 0;
> 
> --
> Best wishes,
> Vladimir
> 

