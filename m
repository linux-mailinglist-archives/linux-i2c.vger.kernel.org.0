Return-Path: <linux-i2c+bounces-8083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BBC9D35F7
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 09:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39783B267AB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 08:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F9C18D63E;
	Wed, 20 Nov 2024 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nS3fVpfi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BD0189F54;
	Wed, 20 Nov 2024 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732092781; cv=none; b=SEYewIF+hyy7Rgy9WPLDwq5RkKEzrm8cLprmL9NEk3E9GLPtk9WqZ2Hzulh5q3PG6zlUaxX858WvofUcz7ZdKDvKjO/Los0R4NsEW7gmSLUoS4Wk01Lc5t7A0U2QFr0rTB8h00rauN60/rG1jlojzmfeDtvIHDZgi+dczVJ1DO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732092781; c=relaxed/simple;
	bh=Hn6npxFVYkALgkljMWG2aKs+3PZdGymydRwuopKUxxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxG9f/c95TH6xgSLFLsdrUF//OWVo7mjfgU4amB75D/f18dNzH+ktd4GxRVw6pQTiuE9eoyWKdUGbVNeYrdEXcZgEvQHSwWzXmNYFy4YE2F98OmKlMAZt3Pu4l2Z0ejFgowJXlLESniBcwj3/SzyuX2ydi0hX9eRHh+bKVi1zG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nS3fVpfi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30E4C4CED7;
	Wed, 20 Nov 2024 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732092781;
	bh=Hn6npxFVYkALgkljMWG2aKs+3PZdGymydRwuopKUxxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nS3fVpfipJGRTqGyEO4Kk0eskgpQElJA19ceS29wy5S9oOT3oxrP6GtYJZg05f9Qy
	 aZ9hs+vBrc1bjJ994xpW6Kr77lD2lC36HghIVWt4GFZeoXck35lOb3Pbq9WjWxZtnq
	 cFlEvwuUVYoyyK7nuvvEzkLvNixMKo3bthEh9EnVSke0Nof3WMsmFQDxyZeME2B4+N
	 F1+f0o8oa6IA3Z6xJx5wFGu4c0ximz8m1FKlE+CSvsuInGq7tagASAi7vwuUzFWH9Y
	 vlG4DZROcfCPBiTCHlmqwOvplsVhJyVGtjBySpZqLgGS4aV1KcpLyIV+oHbdFwE8ga
	 gcMONahdMPHqA==
Date: Wed, 20 Nov 2024 09:52:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Message-ID: <vh6fvvminsq7eeovz6su336awgq56kc2r54mldmihgqxo2wkgt@wxciyxacp2ov>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>

On Tue, Nov 19, 2024 at 01:10:35PM +0000, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 180 +++++++++++++++++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c19754fdc7e0fa4f674ce19f813db77fe2615cf3..f23352493cb270c0fdc3c42add032286601db1e9 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4730,6 +4730,186 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		camss: camss@ac62000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,

It does not look like you tested the DTS against bindings. Please run
'make dtbs_check W=1' (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof


