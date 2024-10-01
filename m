Return-Path: <linux-i2c+bounces-7122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A498B4E1
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BA1C284A1F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 06:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8347B1BBBCA;
	Tue,  1 Oct 2024 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJ9pAEYj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD463D;
	Tue,  1 Oct 2024 06:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727765391; cv=none; b=eH7pD2l2WyTLcNP3cexABV837QFlX7E/B2INSqwlZm4jPZC4i283IBaFnUMewSahXTv+LH636FfYOmOfhkqdcjkIQypvy93jQ1HMfdmpEuKp03FhOFA4PTxGDBnUqnyg1vAN3DqW0mnu868vmGA21mqmY5S31n93XueTVYoYa84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727765391; c=relaxed/simple;
	bh=hJxsQeBzlT9J1ZZCXMzqlk5+K/OSKCOgXR5Pq8enzCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/cV+49c5PbuVTPPs3o9FsHDH2Wyjyxm+Uloo37fcYmTxw5mn1QJN7nEnfDbb/w4GEyYXI7NFBApbNDyv4U6aEd1kruVX831zZTWocRQ5lXxVYVb4FhAe/gVwAD5GbyIjUzsaot41oeqyj8djxCaZSw8N/y4Xg1O+YCdDE8x4V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJ9pAEYj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8778C4CEC6;
	Tue,  1 Oct 2024 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727765390;
	bh=hJxsQeBzlT9J1ZZCXMzqlk5+K/OSKCOgXR5Pq8enzCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJ9pAEYjP0yeL2duGkicfDDaKcSiOWLFRo0kQeCCZsBfDpO5QYNOqN1XPKF3KCe7H
	 Ld28uY/KrLHRkmjsn+pOv3DynhWZVO3yTg2d5SC1p1K7YGs3zgQs7eOfVCaBY+WuOb
	 qx+jRlfugMVTTsKBBp84qci5KcKjCaXzkCJbpCypvCrQwpqTrh+4DHHsYXfSuO8IUv
	 63nHlgIJfYMZHVOxJ0GMmQaJ0niBcTAV7t0t9MFD/fM541tC1jmgqG1W+LXBT7sCFD
	 v8f8mtbIfkStuMK9q8GSpEk/+h3Dj35h0zlMKhh8ru5VB4ILzyL9d+cMpyP4Y0P32F
	 YJm3uH2xO9GqQ==
Date: Tue, 1 Oct 2024 08:49:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: i2c: qcom-cci: Document SDM670
 compatible
Message-ID: <esxsmaqmfeu7z32xl3x4fhhtafci7tltlr77nsfdgdnwdvgfrk@3espe3tfwqoq>
References: <20241001023520.547271-9-mailingradian@gmail.com>
 <20241001023520.547271-11-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001023520.547271-11-mailingradian@gmail.com>

On Mon, Sep 30, 2024 at 10:35:23PM -0400, Richard Acayan wrote:
> The CCI on the Snapdragon 670 is the interface for controlling camera
> hardware over I2C. Add the compatible so it can be added to the SDM670
> device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


