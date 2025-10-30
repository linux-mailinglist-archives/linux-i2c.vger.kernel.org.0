Return-Path: <linux-i2c+bounces-13895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D081BC1EB36
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 08:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EAA21889C32
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 07:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E7B3358A8;
	Thu, 30 Oct 2025 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFaWNMqi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40643328E5;
	Thu, 30 Oct 2025 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808347; cv=none; b=Ss38rm18i2iYy3FEROyOYtuy9ZWmQKw9Sx6qfhJrA7s8fnR2BV+LUszbHIWOlEsvbLfahC2oF0maqiz6gOPkdRNTvwoIGxZ64nekLCTZ+/ow5cGf1xcmvFcEvtki02pULg2DgVBsP2Y1AXSCEc5lDcw2ecxPDqVOsB+sItS6Tvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808347; c=relaxed/simple;
	bh=1hY8bOD1IiZ/4yqtsa1oXjj3u5rqpHnBjbS4wEQe1tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9UQA8Tb5vxNVX5/BG6U5EjkdoJptsp7xb+XA/K9ZPl9kNOXqrJuXfYGd2/M4sa53R98qJIyjuF4C1ul5PuSjN66u58XthYkvSeIOafoyN07kz88PQBzWr7Ab5HVvb6Xi7APhpcFLvTT9SNvEmtA7P98LEaYyQRXFSSj50xQ28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFaWNMqi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F67C4CEF1;
	Thu, 30 Oct 2025 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761808347;
	bh=1hY8bOD1IiZ/4yqtsa1oXjj3u5rqpHnBjbS4wEQe1tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFaWNMqiVtEwj3KcXWBJDwBiOcL+ZgLMsi3V3JArK16kHhRts9gNHwLfrVuBEDWTh
	 UPBG8bFKX9WPOxdFwbCZNmQybLMYABdikxd8HvdrMiiTrZ6VqVY3bn9W4Pne7Hv8ra
	 xyJQuEobSCVd3yHX/HfQwIc6PV8LcBSUchPZqhNCDvo9H5SNqMhRaMS4FncHBxgvE9
	 TJ0oSXOmdNhUKmbN9pmBArBEfW8/bS8h06eT+bn/vP2QHIEcdlrPw2UOF2aF/CguRe
	 3f3cBq0T+zYxjLiVA55BXqTn44Qcg5ZpmWFg7Rs1iEYLKr6sOOEZ4huDp/ip8jPDuL
	 k2I2A+OPsBDnw==
Date: Thu, 30 Oct 2025 08:12:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Message-ID: <20251030-masterful-daring-lorikeet-ae45b0@kuoka>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
 <20251028-add-support-for-camss-on-kaanapali-v4-1-7eb484c89585@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-add-support-for-camss-on-kaanapali-v4-1-7eb484c89585@oss.qualcomm.com>

On Tue, Oct 28, 2025 at 10:44:10PM -0700, Hangxiang Ma wrote:
> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
> 

You are using b4 so I don't understand why you still ignore our review.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


