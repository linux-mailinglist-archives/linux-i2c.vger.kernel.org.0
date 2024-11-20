Return-Path: <linux-i2c+bounces-8082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E3D9D35EB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 09:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3F36B26425
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 08:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D8E17DFFA;
	Wed, 20 Nov 2024 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUUyZy3/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F0219ED;
	Wed, 20 Nov 2024 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732092710; cv=none; b=OjvFogVt8aGDk6H4jezCsO7X+v55H5bWcMpbOGmtR7ufM5V0KcnIWjria64CILitCdYbVC/9OSZwsUzZrZl2y24Pa2l1EORTLnD3DYTfhH1IrRgeXwYIjKI+zVq2HJwttGSy6juu1O19yu3Ju7ATWUjfCCH51/KoitwW46Ac3RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732092710; c=relaxed/simple;
	bh=BxO/BxdTGerTXcUJdvsnxuM8k9xAKLCZFwgnIIVFapU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOc+qhRA+vVPkAZAnoWnxIx/57ct5z02FtiJXzPdseLy5ICgQ6+3FOctLv2MnCSJseZHHW5H9NBMbrMt9nBSihHIgzBgcxIQ5RIU7Ia/4t4jfs/DJB82KxmGMkO5Qvk3r9Dx8Rzpjxq3NWsBqL6P7zVVhA90VI+tB85eR7Sa2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUUyZy3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308FBC4CECD;
	Wed, 20 Nov 2024 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732092710;
	bh=BxO/BxdTGerTXcUJdvsnxuM8k9xAKLCZFwgnIIVFapU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUUyZy3/Ta92koL1T0Sde9O6Zwzb/zg0sG721Rf4lYCdNpl2+Br8yP5e1EqrasMYV
	 SXnYCyq3VYTkFTz0dOwvXeGhULOHc8vszy/Yt1UyBTpu+qYQwf8hA6cAXisqRhioMf
	 qNKnSz1edHu52H5jAZwYskX10IwRtVm5idtFy9uI9nYaFn11ungwgYY6ZRNXX+lXh1
	 sQFsoLGqAMUgo7h5gina0Wu1pyEFZ5aPsBuIyF4wf/7I3oe7ZwoZsA3rFmNUFBAhCM
	 F/y5+zGcm+ThU8BsTtRoTMXuUG0tyHkVNAsw0Mv6isTILmmaGx/3kGN9mkzr9wG8Gc
	 nlf/V1poJ7ZYg==
Date: Wed, 20 Nov 2024 09:51:46 +0100
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
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: Add second power-domain to
 CAMCC
Message-ID: <t4zfzdzcidywo6c4f5t2sle7vsybuxqtw76ghhar5klivfliei@krbgqfe6po4g>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-3-54075d75f654@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-3-54075d75f654@linaro.org>

On Tue, Nov 19, 2024 at 01:10:32PM +0000, Bryan O'Donoghue wrote:
> The x1e80100 has two power-domains for the CAMCC not one.
> 
> Capture this as:
> minItems:1
> maxItems:2
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 0766f66c7dc4f6b81afa01f156c490f4f742fcee..afb7e37118b691658fc5cc71e97b110dcee7f22a 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -39,9 +39,10 @@ properties:
>        - description: Sleep clock source
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>      description:
> -      A phandle and PM domain specifier for the MMCX power domain.
> +      A phandle and PM domain specifier for the MMCX or MCX power domains.
>  

Instead list the items with description and minItems
minItems: 1
items:
  - description:
  - description:

also add in allOf section if:then: constraining it for all variants
(maxItems: 1 and minItems: 2).

Optionally X1E could be moved to a new binding. I think this would be
better, but I do not insist.

Best regards,
Krzysztof


