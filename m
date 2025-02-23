Return-Path: <linux-i2c+bounces-9536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9FA40E02
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2025 11:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 834CD3AEF02
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2025 10:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6B0204688;
	Sun, 23 Feb 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbqP2PGk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9947335BA;
	Sun, 23 Feb 2025 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740305962; cv=none; b=J4zFTLVnNOKg/e/N0ukv0B15MncWar0Eh4olzY+jeFEYEvof2tMn1XDOGNWFh1Kflqew15XIuiunqW5VBgP9rH1mC3B+sd+Z58K4iwsZ9TtLje5XNiqU0rRPONywmtx20UMwjk5v+7vjSMvmHAh9qPwgN6rC7hyabbw5NM6Gmtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740305962; c=relaxed/simple;
	bh=6a6RvYODvsCvev2GgRgrCtu9df64yuXStOe4JoBEGhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AlbPqmYBGELGUlAx7JV1XUBD6bhKrZeKShA3dymCnk0qHGLAPU8ZYR6DTayu2kflkV0UewBqSniAC9dVQZKqfe8vRYzWHjwAFSW4gCrj6dmkCMq7pgykZfLmURQiGjFTA85b2czSDCBeiq1jMxIn6nkpT7SDHlZYsVBp16b1jtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbqP2PGk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBD6C4CEDD;
	Sun, 23 Feb 2025 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740305962;
	bh=6a6RvYODvsCvev2GgRgrCtu9df64yuXStOe4JoBEGhY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gbqP2PGkkwu5UtpATWbbW9uIV9GH1pYNemMW7TlkCSQqwQjgPVOoJhPldecTVzeGs
	 Zz/IPAxrQvT0w2saAupyzRyDotw0DP++9Ek0w5NRMuoGQDinXQczMjciUJbThPqKno
	 kJ1m3Ukc/kBSnAlxmdZm6Q2tGGrn9Erlw1eVokqso9QDqtSF/HfnsGXVuo6aYYZhi/
	 rGSl3m9DleD5MtjxAYR4MxJle3dLqrktkisV7jsunbS+6Jz/owfPwkI2UJ4abmdC1r
	 lX9Yc0YUzocf/3wyeqqABtsRDhpiHYvf/tRuZY0F0cSK7BsZJJFGjwVY7zStw7KCcJ
	 ynFFKpd/CXM7g==
Message-ID: <e190d51a-b585-4544-8154-b9a287f907be@kernel.org>
Date: Sun, 23 Feb 2025 11:19:16 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: samsung,exynos990-clock: add
 PERIC0/1 clock management unit
To: Denzeel Oliva <wachiturroxd150@gmail.com>, s.nawrocki@samsung.com,
 cw00.choi@samsung.com, alim.akhtar@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, igor.belwon@mentallysanemainliners.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
 <20250212004824.1011-2-wachiturroxd150@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250212004824.1011-2-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 01:48, Denzeel Oliva wrote:
> Add dt-schema documentation for the Connectivity Peripheral 0 / 1
> (PERIC0/1) clock management unit.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  .../clock/samsung,exynos990-clock.yaml        |  24 +++
>  include/dt-bindings/clock/samsung,exynos990.h | 176 ++++++++++++++++++
>  2 files changed, 200 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
> index c15cc1752..dd301deda 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
> @@ -30,6 +30,8 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - samsung,exynos990-cmu-peric0
> +      - samsung,exynos990-cmu-peric1

Mismatched order.

>        - samsung,exynos990-cmu-hsi0
>        - samsung,exynos990-cmu-peris
>        - samsung,exynos990-cmu-top
> @@ -56,6 +58,28 @@ required:
>    - reg
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos990-cmu-peric1
> +              - samsung,exynos990-cmu-peric0

These also reverse.  Keep things ordered alphabetically. Also this
if:then: block should go to appropriate place.


Best regards,
Krzysztof

