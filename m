Return-Path: <linux-i2c+bounces-12330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8FB2ACF0
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 17:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1315118A6098
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 15:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FB1271449;
	Mon, 18 Aug 2025 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/jeC3FS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A825725FA13;
	Mon, 18 Aug 2025 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531427; cv=none; b=rC2S/c3K52YOom0SOZKKm5vaqQZlKXqPMst0P4jLSG58FOAOHqnZiwxzFX0oY4bMPJcBgZBlUdLSjBPSKRRHlpHKNa32w/6n4qtuqgHvrMv2aEFtO4In/a6URlf62nzFJO0j/sdMWEwGeTlTJ1ziR41vSRxL/pw1pwTqIffgsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531427; c=relaxed/simple;
	bh=h2jMzXsrdLhcRVYsIHxcAZjoHTNjv1iL4iICT9J8AbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUrH0tLiOb28NXDCRXCcoa/3dtQ40CyiQr/GlxLQUpcQoKSC/WTd3JRoWz2OQ25hIcMscKaghnNUF9yLeooFJrj+07UpwONfjbIJa55obcs9q2HWv+ePXEIPixGRyhQ7tYT/uJ5D4SHrwmFDM1G+iZW2ZjxYUPQ2h5RBDl+2X1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/jeC3FS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2B7C4CEF1;
	Mon, 18 Aug 2025 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755531427;
	bh=h2jMzXsrdLhcRVYsIHxcAZjoHTNjv1iL4iICT9J8AbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/jeC3FSqUYoEbLprmY8nBJBik/VMnt8fS4ljlO/zMI9wds2uCVADNTy+mvgKA48W
	 MeG12AgqiQVyQsQ0EJ2Ksk8sE5o/J3+apMckImO6t3eNyikHoYsTYxWJUn2EytOr0B
	 MPmHLiLYmNp7zipF12yRDEWmfLp9uDFgKrK+7yASi2MAb3aRfRUV/XsE9e2bJklikL
	 +70IRtD2rnyHhg07fmu70SMoEhZ4kuqfo33p4uOFa8fUCtkenANREsGyN0oTG5Jr6R
	 Pc+DaRtxVAMlGZrS9DMS/XKxSa9lZqsAdc8ouqYfaqhoFTavBaU3grOCtay1P4abIM
	 RV7NaICgEgGAg==
Date: Mon, 18 Aug 2025 10:37:06 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
Message-ID: <20250818153706.GA1238481-robh@kernel.org>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-1-e83f104cabfc@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-msm8953-cci-v1-1-e83f104cabfc@lucaweiss.eu>

On Sun, Aug 10, 2025 at 05:37:52PM +0200, Luca Weiss wrote:
> Add the msm8953 CCI device string compatible.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..be6cebc4ee054d3100e5c4c676f1a0c4fd8d2e1e 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -15,6 +15,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,msm8226-cci
> +          - qcom,msm8953-cci
>            - qcom,msm8974-cci
>            - qcom,msm8996-cci
>  
> @@ -128,6 +129,7 @@ allOf:
>                  enum:
>                    - qcom,msm8916-cci
>  
> +            - const: qcom,msm8953-cci

This should be added to the enum above.

>              - const: qcom,msm8996-cci
>      then:
>        properties:
> 
> -- 
> 2.50.1
> 

