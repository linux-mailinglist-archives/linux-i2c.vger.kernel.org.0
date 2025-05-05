Return-Path: <linux-i2c+bounces-10761-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A3AA8D54
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 09:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51B96172745
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 07:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAA41DDC1B;
	Mon,  5 May 2025 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="z+11W6G6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D78D1C3BE2;
	Mon,  5 May 2025 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431391; cv=none; b=Yi2PLi8WiObjPLKHvPsIUEdyFnnr8lpeD8CSr78e2XdXuy5+6qkRqy029zYEs7lUiLhxNglyvQCH51zniGWPF77o/4/FNsnkLQgcUpR20qe9tmST3teyUH8oqFQumnnL58MKnntuKAysJNsN7hSfg7xV4JXKlF4MmnGSC9OXGvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431391; c=relaxed/simple;
	bh=V3I2N452zoAxRjRuyGOUZILKBEKeiRMPPSSgMieldXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkK9NXG+Cj1hiz/SpKCj0kTl2L1DAyLYD5qNxNING8b1z0O06d1NwPoBrYM03ndG5WTP/cSIYVj5YmajbyZAWVt0mYv94+MAGtR+O6VEksNzGiCgLBkeWZhCqtzfgexSTU9LnD0j/x1/MNvi32pDZ1fMJbdzJs4U5uddZWu+6LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=z+11W6G6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=g6E3Fmt7cfqXOAXJWZj3GI0CXUJV8EUTYEDTm9gMTDg=; b=z+11W6G6rm+LkV+kCDHjVKwpO+
	tKOxP1CyIwwUl0Qse5Upck55bH9iZOyMOxFQvw8LXXyXbFgCqbWcWFo+KfmeXdURYL5i+mlDlDCwk
	zKDEErGrPdWb3dQb6qp+PvKDgipiboBueGPJUEGM0xVmN99v7LlepjRC5SngXtKh93x58SvcLORLS
	XL5FKwYxRkybBQdVcGszmKFiKnKL3PZibkEXs4PloDGXyg5blkXW0/l1Zw/66Odasjj3aQ1L4BRLG
	ENqn1dvE69j3Q5mL1sqJqQYaSouY76WFBF+AtXae4eTEtRYLvfzKuo6CH4P+0rutUZk3hHzGWYWOy
	WgEGsypQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBqa1-0000dB-Ff; Mon, 05 May 2025 09:49:37 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject:
 Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for
 RK3528
Date: Mon, 05 May 2025 09:49:36 +0200
Message-ID: <4864135.rnE6jSC6OK@diego>
In-Reply-To: <20250417120118.17610-4-ziyao@disroot.org>
References:
 <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-4-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Andi,

Am Donnerstag, 17. April 2025, 14:01:17 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Yao Zi:
> Document I2C controllers integrated in RK3528, which are compatible with
> the RK3399 variant.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

do you expect to apply this patch to the i2c tree individually,
or have it go together with the devicetree patch?


Thanks a lot
Heiko

> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Docume=
ntation/devicetree/bindings/i2c/i2c-rk3x.yaml
> index 8101afa6f146..2f1e97969c3f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> @@ -37,6 +37,7 @@ properties:
>                - rockchip,px30-i2c
>                - rockchip,rk3308-i2c
>                - rockchip,rk3328-i2c
> +              - rockchip,rk3528-i2c
>                - rockchip,rk3562-i2c
>                - rockchip,rk3568-i2c
>                - rockchip,rk3576-i2c
>=20





