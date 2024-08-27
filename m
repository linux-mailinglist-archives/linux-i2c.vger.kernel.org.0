Return-Path: <linux-i2c+bounces-5825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C3A960214
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 08:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E02781F21A67
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 06:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1338F13D53F;
	Tue, 27 Aug 2024 06:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npv1AQcX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F93A1C4;
	Tue, 27 Aug 2024 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724740909; cv=none; b=SQuZODKdKkvXWZKTffbZTKAVXN+CNf4FJPnxFvimjOmtgPYi0QJCyuAa42lKhmUWCcQDE5UeCu7JUkKWDjklEHdQtSDNPp12wLZF/LUND3hHWqwFx2AUMiIE3+MvM/uxkrDlqelJ6QK/LJEvdkWnUS7F6Aob/894+MUCmJmrpew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724740909; c=relaxed/simple;
	bh=ui3VLQCEUL/rPGRqsX+CA2DwY1epfB51S31pwoWE1q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDp9Eh0sOy4pNY/WAOMNoeWT+5gj/rBmrJT1ou7Yl7HXQSfAe9F6S6TtoDS2Sd2042PgnPHKZtYkoeO0XJN3MhQqIQkyTxQwYpx6wJXpTwxLFqSKbkz4MK1cCDrR3KsndGXDSbv+2lnkwDRZV6YftaPll9Y5T16qBv7rhhPsS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npv1AQcX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6D1C8B7CE;
	Tue, 27 Aug 2024 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724740909;
	bh=ui3VLQCEUL/rPGRqsX+CA2DwY1epfB51S31pwoWE1q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npv1AQcXb1YaLvcl6io9Dy/x3pfnhTq6xFY8Sj7i0jqFOZ5Ekjf0ZZXDMXC35hCnA
	 4q8DwmE4JMKMd2yjHVH/n5F0Iw08+Q2J2nMhLr8wpdVQFLC5QjJW0gJZQnMHQwej3L
	 SxwA5IGh4XJECyxJ7Xvp5pSOpCh93XUscX8fJPFTiyoV2A1qfYitPzCE9JIY7uEpn/
	 uP+g589e3CQzUN2iAR0ryVaUrr6mqgBgnjTEsuEi/1tY0SNYg39/B21L/w/hfY8sSK
	 PEpEhL8qSc4XGmm7DsR3JPXAmES8pwOdIq5gfsNlv4cHx2x1bI/8AmHYP3U6Kbf2Sc
	 wu2uwQh8Ah7uQ==
Date: Tue, 27 Aug 2024 08:41:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: document
 SMBusAlert usage
Message-ID: <uftaujyuofyvgnr64xg4ezvmk7etoga6ekfgirxdhtbsoqaoq3@eruhqbwjyjkd>
References: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
 <20240826150840.25497-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240826150840.25497-5-wsa+renesas@sang-engineering.com>

On Mon, Aug 26, 2024 at 05:08:42PM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Question: Should I remove 'smbus_alert' from the enum of
> 'interrupt-names'? It is already documented here:
> 
> https://github.com/devicetree-org/dt-schema/commit/c51125d571cac9596048e888a856d70650e400e0

No, because dtschema is not specific there and allows any combination,
while device bindings should make it constrained.

> 
> 
>  .../bindings/i2c/renesas,rcar-i2c.yaml         | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> index 6cc60c3f61cd..2eed3ae7c57d 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> @@ -60,7 +60,20 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Without interrupt-names, the first interrupt listed must be the one
> +      of the IP core, the second optional interrupt listed must handle
> +      SMBALERT#, likely a GPIO.

With interrupt-names the same... unless you want to allow anything? No
clue what is being fixed here, no commit msg. Which interrupts are
flexible? Why main can be skipped suddenly (or was it always)?

> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:
> +        - main
> +        - smbus_alert

Best regards,
Krzysztof


