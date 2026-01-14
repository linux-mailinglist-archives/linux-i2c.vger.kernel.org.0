Return-Path: <linux-i2c+bounces-15162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0946D1F9F8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 16:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01CD9302D93E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 15:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B151730E0D9;
	Wed, 14 Jan 2026 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIktclfU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229A2D661C;
	Wed, 14 Jan 2026 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403158; cv=none; b=KseEMEYbOxXQf4lm2lSAKsJ7HcyyS7kLK5SdA3HP6rGDp4jQOhCuYXu+iEqcnZZ6aASry5IDQ0Zjz1DIGMk92B4+ZTjr7GiZCbYq/W+kRP16l1N5yhi7/3M1UOeS/vTYWWyXm0Orc9kNJRE/0hT+z7KHFb5VLWT3tNAMg+lno0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403158; c=relaxed/simple;
	bh=eLxZBrlzViqA3hk+WyHQ10DzOHjIaa9CraG4ejvLTqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azoKxB2yOqghzMXA2+epIGeA76XOI4601H2HfIOMku2UcrWOQdt7VcORPlio19YQiRa4yHp5RPeGF3A9su4+ylpYardWYqnf28nfPgEm+H5NFOqbweFfIu1Oj8phggoZm1TJNO0EujK3fgN3fee4SIFu4DJPnsiD3QUoAOXQPMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIktclfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8D1C4CEF7;
	Wed, 14 Jan 2026 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768403158;
	bh=eLxZBrlzViqA3hk+WyHQ10DzOHjIaa9CraG4ejvLTqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIktclfUh1sKVUAOgfy2Sqs6YzzCFfmDRT9QgwSwGEdOUFsfYPjXbs6C8oufpGkEh
	 NpRhgDOrBvzMW/lni3FxkJZozhk/HVsauAAxZ3g2PKW4aoH4+f/bVgJRCqmX8v5ZjM
	 +hwbWwNa8vR/q2twYpP9t/lsKchsGs6q82WqtCZazMpeIdooqk6Tv1YymZowaTvFOv
	 P0l8q4QLTGy3l6twzqEz6zgw4tHz5wkfUtLna7Ba1LRMWA01hlVdGF5GRE9BKO/yLn
	 6ghRg76ctlK1IUAvrnTPcSxqs4H1bAVgkQpphoTV3XZBlKAJrWiD1B7Rk1XE9UFkzG
	 1BgzyFNyk6qtg==
Date: Wed, 14 Jan 2026 16:05:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	bjorn.andersson@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com, 
	aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH v3 00/12] Enable I2C on SA8255p Qualcomm platforms
Message-ID: <aWewgtTx1MCKmxpv@zenone.zhora.eu>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>

Hi Mukesh,

> Praveen Talari (12):
>   soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
>     path optional
>   soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
>   soc: qcom: geni-se: Introduce helper API for resource initialization
>   soc: qcom: geni-se: Add resources activation/deactivation helpers
>   soc: qcom: geni-se: Introduce helper API for attaching power domains
>   soc: qcom: geni-se: Introduce helper APIs for performance control
>   dt-bindings: i2c: Describe SA8255p
>   i2c: qcom-geni: Isolate serial engine setup
>   i2c: qcom-geni: Move resource initialization to separate function
>   i2c: qcom-geni: Use resources helper APIs in runtime PM functions
>   i2c: qcom-geni: Store of_device_id data in driver private struct
>   i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

Anyone from Qualcomm willing to take a look here, please? Mukesh?
Viken?

Thanks,
Andi

