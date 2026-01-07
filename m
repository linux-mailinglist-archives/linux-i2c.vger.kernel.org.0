Return-Path: <linux-i2c+bounces-14952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EC6CFC7D1
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 09:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45D2B30155DC
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 08:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D231275B05;
	Wed,  7 Jan 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLqj6X0Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10AB1A3029;
	Wed,  7 Jan 2026 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767772861; cv=none; b=PDCViaRS/NMQxS/pWNL5UGzvu1JOpAvCJZepgbp1ImG9y8YBhgAGFTnd799PpeZoC4xiivPjwCZiHOhRPAu5TnoRwVa8ecEyDw91Vw6sZC2uDhzEihChiOib8I55IAx7hdgHNttPyhTwRuvei2WEc+TtJXPjBcbZmZTKNrKrC7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767772861; c=relaxed/simple;
	bh=JdD4c4T2srDBYLOi+Es7pjj+Hpe4b+hitx76io/8fqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGNW6a8PovZZ/KMzj/mU+dh9Yt1m2aHyMIEWIyiAGmZ4r2cNwZtQ1P7vpNBOFocGMfei/t76ySymFgZetpKhWPefsSI2h1D9su2UZOO2NgE870gSEpF43CNY4kv/9pGbF63VxbKYBWQGQwBp1D95Yk3i6jez49XE2KYcYs2J1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLqj6X0Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF98C4CEF7;
	Wed,  7 Jan 2026 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767772861;
	bh=JdD4c4T2srDBYLOi+Es7pjj+Hpe4b+hitx76io/8fqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLqj6X0ZYOIcN5Ezb+DS4jFQdq3WltMibXNTsu+qzyuRHlkpK/swc0MaR5NshZbzh
	 WVcFSTkgTKx13x39jleWATws6oEV7Gyc7D5T8ul8ZT+XRUz9pAbu47Kfy4zGKQhFi/
	 8O8+y1CwBW2XBWEj1ilmNWstrCQPbEUd9Jav9ycG7Y2Jsr50PVRGfqZKbvC24IoFrY
	 fd92+K327RvajulFgoXbFu4kQJ/XP9vD8zwFeM3pchvjKN3JBtkENuZRfB9gH/K8PX
	 FOaNfHGkHWXdQT5l6UtRJS7Oc7o0nTYvaXqTHG4/AJGom+GZQSXdKMnV0oliD0IbTe
	 SwcsMQRnm0hLA==
Date: Wed, 7 Jan 2026 09:00:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Message-ID: <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 05:39:53PM +0800, Wenmeng Liu wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm6150-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: soc_ahb

Same question as before. I did not see any resolution of this in
changelog or commit msg.

> +            - const: cpas_ahb
> +            - const: cci
> +

Best regards,
Krzysztof


