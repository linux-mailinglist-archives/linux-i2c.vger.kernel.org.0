Return-Path: <linux-i2c+bounces-8710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5199FC6F8
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 01:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EF8F7A134D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 00:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E354A3E;
	Thu, 26 Dec 2024 00:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="B9+KZqp4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA72B2F36;
	Thu, 26 Dec 2024 00:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735173394; cv=none; b=kQWKWhWBsSMc5RAiQkgfBuebNwp1YGu9MKkKHEfjZVuuVXewaiDrombM4HHjXoPDqrYFaIT06IolNDY3hP1vtvuiC3L1bGVOAiwk8RdsEBb4pUVYOsOjq03KcXxCiVSsW0snmYXMtV5vKvccwd2xS42Ct5M9J5S0G1vs4dFBxh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735173394; c=relaxed/simple;
	bh=rSkA054/zbvQjZOlxyONvPKCXodeEN8LPL/botAMFwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPcXfL0odz4W0u26yrjjLX0/5XU3PyMiEzR8X9joL6CVmgBjPE9BJc+N9UvfYxAsjy0wGFvGhgr3CZELfSRAkd1w66hl4m+6cCUoakFoYeD8yyU2lnpIJYy+r4/l0UUvhfPrEp0v9+GlgpjYBBUmSKNIYZqXVa0tpxS0eE/y7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=B9+KZqp4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uti47nxIlujfO/RLB6rLQKovjAamYSW9jMRrqa7O1Dw=; b=B9+KZqp4Z2WMWTE6mL9ngpeskF
	a46Im25nzzZkNfnZplEZHQCfmLTBXMJg9phtBuMETPuwvdvD75N2j0KAHVljp8xJA+nFzxMNb5Pr7
	kMPMnq21vGCjunZMcuqvIT7dLcSK21mBBHAD8Ac2cFERi4w3NZJm9ggGNpJmfnDXsQunxsbFyS5U8
	Z+8OeF0etDH3QSCGuxqbtlux42q4HG6o8/G1kBkL0J0H40SLyLBhZ/uTQL9VkDKfWZK6DxgE+BWNk
	4lclilv6JiDbfvoenKcXOBzhQRK+6ZpgE3M58tTPhQw78mJZRbTCZn6BcMNuQBuVzdwhQYDc5KGgo
	U0BUP2uA==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tQbrb-0004Hq-27; Thu, 26 Dec 2024 01:36:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andi Shyti <andi.shyti@kernel.org>
Subject:
 Re: [PATCH v2 05/17] dt-bindings: i2c: i2c-rk3x: Add rk3562 compatible
Date: Thu, 26 Dec 2024 01:36:30 +0100
Message-ID: <2545931.ElGaqSPkdT@phil>
In-Reply-To: <20241224094920.3821861-6-kever.yang@rock-chips.com>
References:
 <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-6-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 24. Dezember 2024, 10:49:08 CET schrieb Kever Yang:
> rk3562 i2c compatible to the existing rk3399 binding.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> index a9dae5b52f28..8101afa6f146 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> @@ -37,6 +37,7 @@ properties:
>                - rockchip,px30-i2c
>                - rockchip,rk3308-i2c
>                - rockchip,rk3328-i2c
> +              - rockchip,rk3562-i2c
>                - rockchip,rk3568-i2c
>                - rockchip,rk3576-i2c
>                - rockchip,rk3588-i2c
> 





