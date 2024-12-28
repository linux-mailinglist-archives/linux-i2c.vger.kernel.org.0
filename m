Return-Path: <linux-i2c+bounces-8783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF379FD9E5
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 11:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82FC71883F7E
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 10:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D6A1474A0;
	Sat, 28 Dec 2024 10:22:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D135BE6C;
	Sat, 28 Dec 2024 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735381339; cv=none; b=Zzn5YhkjaHvb8T01YUkfPhta885OkNygnCQrmJUmWsqwDhs55skSCUfMiksrNYbym+cQFBqANtysih5z7UtnDGvVkRGy4guK41VsgVieDfAJCzFn/qV7Qqcef4LyfV5QhKQsYs8CX2gbq6MVLDb00U6okTYcK6kSfWF9LwErtQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735381339; c=relaxed/simple;
	bh=zzLY2TJoR51jCckADQ6XlX4Yn3Za4Z2dLN8m42Y/to0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZK/6eBDZn6UeDYUMh1dE1mLXRiBqNFiGPCea/pDawo2JbtyCePUkjWJkOZyyi8/S7OylHJp1AJpjSxr/XzhkoxZT1S1PU6D56DTGfHQV+ZMTdG+P0IimFicArjtgPKViRCRUfkEO0edpNBzqdv/9gV4aotRwKVTFZrh8OOJ1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8E4C4CECD;
	Sat, 28 Dec 2024 10:22:15 +0000 (UTC)
Date: Sat, 28 Dec 2024 11:22:13 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: move qcom,x1e80100-camcc to
 its own file
Message-ID: <2b53jgap4h2t4rovryglokccpognaeoyxfxywk7k7rcnsuvi6u@6yynh6pjka62>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-2-06fdd5a7d5bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-2-06fdd5a7d5bb@linaro.org>

On Fri, Dec 27, 2024 at 01:11:35PM +0000, Bryan O'Donoghue wrote:
> Add an x1e80100 camcc binding. x1e80100 has two power-domain parents unlike
> other similar camcc controllers.
> 
> Differentiate the new structure into a unique camcc definition. Other
> similar camcc controller setups can then be easily added to this one.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |  2 -
>  .../bindings/clock/qcom,x1e80100-camcc.yaml        | 74 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


