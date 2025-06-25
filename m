Return-Path: <linux-i2c+bounces-11574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5EBAE73B2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 02:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FF89189D98F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 00:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF4F28DB3;
	Wed, 25 Jun 2025 00:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="rn4DCnj1";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="rn4DCnj1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15988F58;
	Wed, 25 Jun 2025 00:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750810707; cv=none; b=DwamSkvbtQXRMXqAupjYHmflfCQyFJz3p3Uqe7527aJGsVreY6YgZ0N/Up18bfVGi9wo7JOavcOlHsuSnd7qoJY9MuXwRD2m9b+QudBsoGQIHsZHoZlmCNzIo+Xvm/1QQllHqRBJt6NHr23PDZMnascOhdTZ4oqFVp2V2vx5sBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750810707; c=relaxed/simple;
	bh=LAjJwA9Sc1kFGB8BpiYKf53CHRgKJ/pQhv7ov4Y98uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2iu/RqS0NeMQTGfSdJFiLN2r0k5SoEqfCK9bLpL8ER2UrRLjVadCNr2SWHv4hb2MsEcLbYH+9xnjxzttdDHn8TTFNxrOQLstKoc+uZEcB5IJ//O5oyJ8AafhTPMckYoeBFZfBIGKsF8aLxGo6DVfqgzClPK9D5Y7al6T1CIyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=rn4DCnj1; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=rn4DCnj1; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750810703; bh=LAjJwA9Sc1kFGB8BpiYKf53CHRgKJ/pQhv7ov4Y98uo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rn4DCnj1JS3KfjuUeuC2Drz6AAfK7CF6rVdhKIad2hJaQ6DYS+MLkuk5pxWMVbmMI
	 JrH71jDuVJNoAx3+/CmrEc0BNa5255sx4AqMmfw8tCvq3fyojF21f8OPLdAl7Xq4BN
	 nURJFd/VUps4V13pHWmVeSNXT5e731PfvygDhfhyTRdT5obLUyYgkDxkIri2WFEqlt
	 eUYAZMHl8w1sb5XKuVlm7ia4QdinwKYRGE5NpZTKLmk8jp8L458erFFJHK36S7K/HP
	 D8ZLBItZYaNaoFdIGEBnL/8E6wRA4Eu+N5yf4LszAKduhycIYIjfe4S8W1a6fJ4VQY
	 mZYG+sSKx0v5A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 3C6253C43A8;
	Wed, 25 Jun 2025 00:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750810703; bh=LAjJwA9Sc1kFGB8BpiYKf53CHRgKJ/pQhv7ov4Y98uo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rn4DCnj1JS3KfjuUeuC2Drz6AAfK7CF6rVdhKIad2hJaQ6DYS+MLkuk5pxWMVbmMI
	 JrH71jDuVJNoAx3+/CmrEc0BNa5255sx4AqMmfw8tCvq3fyojF21f8OPLdAl7Xq4BN
	 nURJFd/VUps4V13pHWmVeSNXT5e731PfvygDhfhyTRdT5obLUyYgkDxkIri2WFEqlt
	 eUYAZMHl8w1sb5XKuVlm7ia4QdinwKYRGE5NpZTKLmk8jp8L458erFFJHK36S7K/HP
	 D8ZLBItZYaNaoFdIGEBnL/8E6wRA4Eu+N5yf4LszAKduhycIYIjfe4S8W1a6fJ4VQY
	 mZYG+sSKx0v5A==
Message-ID: <6c5ae787-edbf-43fa-8c9d-542ff2c411fe@mleia.com>
Date: Wed, 25 Jun 2025 03:18:19 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: i2c: nxp,pnx-i2c: allow clocks property
To: Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250624200444.2514331-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250624200444.2514331-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250625_001823_274741_4A78B44C 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message. 

On 6/24/25 23:04, Frank Li wrote:
> Allow clocks property to fix below CHECK_DTB warnings:
>    arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: i2c@300 (nxp,pnx-i2c): Unevaluated properties are not allowed ('clocks' was unexpected)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
> index 798a6939b8948..e645784b77d3a 100644
> --- a/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
> @@ -22,6 +22,9 @@ properties:
>     interrupts:
>       maxItems: 1
>   
> +  clocks:
> +    maxItems: 1
> +
>     clock-frequency:
>       default: 100000
>   

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

