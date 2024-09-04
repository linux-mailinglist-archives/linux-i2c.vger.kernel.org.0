Return-Path: <linux-i2c+bounces-6107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A896B14E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5710280E6F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC8D139D0B;
	Wed,  4 Sep 2024 06:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C62vbuEc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C3A12D1EA;
	Wed,  4 Sep 2024 06:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725430353; cv=none; b=JFOCOQzrzV2NR0wBIbNnPCGaO3aS+p8rBlfWGQ1PjNeqS2gMSabNakbTDbSwqM9/aU+TiYcuyiiaExRssXRZ9h90LRDiwh1PNTng+Mf9Td15LjIwnLzFSgxGEBhx4u3dGurWyuth7Y00KIi5jHVoeLns5fvAKvwTJBdqmhOen3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725430353; c=relaxed/simple;
	bh=BjUuXaXQrW9Z7retMtgXMDYtcLbQCjr9INb18zuY0MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eyo2EZJCrbqQgSgxeEBTQ+v8eub7R4zsZ4y/gPgE5271A4z4XnC3ttJU1wY2zPFO8jX50vUWYhzBPrRu4m10oBeSN1IJhecRnhuo3sfrH2RvyLi+eltiyZu0/jjQGSvb/P3GileQCdfms1SR5s25drH4YGug4niw/75cXnZRVHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C62vbuEc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFDFC4CEC2;
	Wed,  4 Sep 2024 06:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725430352;
	bh=BjUuXaXQrW9Z7retMtgXMDYtcLbQCjr9INb18zuY0MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C62vbuEcpz1qXYrvSp0n/n+UPrEUgrBze7JiI7gc1BuSw1Y33yewmhERib7mskT+j
	 UXgO3qtubsPDUeEmNSwwSsi9x0VZ687x2k7hIJeHmxUoqc2W7kh9KFxV70fsgJeQ8/
	 WgdsUHfNafWLHONFjT7eqpAThrSXaKOAS0rCA84LhrAvLF9w3zl1sTW1qbD11e7Clk
	 ZMjAFo6Mf2Puem2Gu5zOPzhtlz0W3kyWb8AfJVyRMSW5TyKP0kZoNAtJCvM5F71gT4
	 Ro6zOZEJX1JyHV9AmI3xMDqIj7+96C92lncFqFniqe7yhrsWWPYIlKwXUHecby5zaW
	 5lshN2u7Ir8ew==
Date: Wed, 4 Sep 2024 08:12:28 +0200
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
Subject: Re: [PATCH v4 2/7] dt-bindings: i2c: qcom-cci: Document SDM670
 compatible
Message-ID: <vjbhybw3iso5cruwtczr74fh5tndbmpnod2tjq7tvrvcvd3qk4@r6rfsy3bko64>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-11-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240904020448.52035-11-mailingradian@gmail.com>

On Tue, Sep 03, 2024 at 10:04:51PM -0400, Richard Acayan wrote:
> The CCI on the Snapdragon 670 is the interface for controlling camera
> hardware over I2C. Add the compatible so it can be added to the SDM670
> device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

I am going to skip this one, because previous patch was not tested. Let
us know if this one was tested.

Best regards,
Krzysztof


