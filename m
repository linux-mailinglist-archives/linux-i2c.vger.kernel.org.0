Return-Path: <linux-i2c+bounces-10469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D586DA92B83
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 21:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33B533B2978
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 19:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27551E7C3B;
	Thu, 17 Apr 2025 19:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="eE9j55Am"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C8814B092;
	Thu, 17 Apr 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744917037; cv=none; b=A+FJf7wgXA8yZ5alvIllk9PkokkqmP4UG7iMrNknrLo9D3AOtWIuqUVURuDM9fs5EpZ6M8TmbOy1+cHVDJcsL/U/mxv7qpTxas4b4fhYllom2UsfrwsW/Vk3SUb9Kvv3Yz8c1SDaQ1vSjaRGoTaHUpEI5sDxjlv9LHQAdXCoBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744917037; c=relaxed/simple;
	bh=bf/89/VY8sX+682N5Xvan/8KvNpWwcjeRGj5ngCaVZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0iJSeVemW43LIMABVbrLHWkJMy/2BKm5pzsWyqoC1MTlIMn99F8dtQrxG5WL7yOeBstwrNhcoETODvTdkYUy+i4jwwsaqT/FNNJPGAY0LXgkr9GinW6mpezz+1znh4mxzcpHyd386Dcwv6EjGSBmJFjJqI3XsAg5+pldiWKShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=eE9j55Am; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Bcw9WhJwy8zPhG5QYKyzowO/nlWGUJAb4ocjNVPbD+M=; b=eE9j55AmbmSEjJ79eSUkt8Ug8/
	ods2pey/Q/s9D0W0kHfocu8rE8/Z9z/WMtxqGXtVWe9L+s8G+jCBc3d/ptkxieHfnT9DCjwAxqxgp
	AmLgzcFgBoIseY1aOwh16oP9ENkDx8pVzXNDRUKSQHTVgrbxZcuHSbXoMuQ90zZVZAGnCTe+DflZn
	ZLkhDS+F/nlIF2KbkC6Y7hDziCCThaREaT7MnPFYL4VIn/bPYh3uNlo3RaXbYfi9p2iBBoBQoJwuA
	qd5FPWkxxK1+EAGm6GNNVDEi7dXv9CytuqL2X2WwKuTstCcUsEYa3S+7LVZgEkoY/LDsJjcqk/WB9
	RGdZL8og==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u5Ucj-0001E8-Bd; Thu, 17 Apr 2025 21:10:09 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Date: Thu, 17 Apr 2025 21:10:08 +0200
Message-ID: <13753899.uLZWGnKmhe@diego>
In-Reply-To: <aAEUS7QQbXSvrcEs@pie.lan>
References:
 <20250417120118.17610-3-ziyao@disroot.org>
 <c6d3e343-7005-48a9-a133-bf39cb6790ee@kernel.org> <aAEUS7QQbXSvrcEs@pie.lan>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Krzysztof,

Am Donnerstag, 17. April 2025, 16:46:35 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Yao Zi:
> On Thu, Apr 17, 2025 at 04:36:57PM +0200, Krzysztof Kozlowski wrote:
> > On 17/04/2025 16:36, Krzysztof Kozlowski wrote:
> > > On 17/04/2025 14:01, Yao Zi wrote:
> > >> Describe I2C controllers shipped by RK3528 in devicetree. For I2C-2,
> > >> I2C-4 and I2C-7 which come with only a set of possible pins, a defau=
lt
> > >> pin configuration is included.
> > >>
> > >> Signed-off-by: Yao Zi <ziyao@disroot.org>
> > >> ---
> > >>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 110 ++++++++++++++++++++=
+++
> > >>  1 file changed, 110 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3528.dtsi
> > >> index 826f9be0be19..2c9780069af9 100644
> > >> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> @@ -24,6 +24,14 @@ aliases {
> > >>  		gpio2 =3D &gpio2;
> > >>  		gpio3 =3D &gpio3;
> > >>  		gpio4 =3D &gpio4;
> > >> +		i2c0 =3D &i2c0;
> > >> +		i2c1 =3D &i2c1;
> > >> +		i2c2 =3D &i2c2;
> > >> +		i2c3 =3D &i2c3;
> > >> +		i2c4 =3D &i2c4;
> > >> +		i2c5 =3D &i2c5;
> > >> +		i2c6 =3D &i2c6;
> > >> +		i2c7 =3D &i2c7;
> > > Aliases are not properties of the SoC but boards.
> >=20
> > Of course this should be: Bus/interface aliases are not...
>=20
> Thanks for the explanation. Will move them to the board DT.

I think we're having that discussion for every soc :-) .

Uarts. gpios, i2c and spi are always labeled foo[0-...] in all pieces
of Rockchip documentation.

The i2c0 controller has pins i2c0-scl, i2c0_sda; i2c0-labeled iomem;
i2c0-labeled irq, clk_i2c0, resetn_i2c0.


I completely _agree_ that {sdhci, sdmmc, emmc, sdio} -> mmcX is fully
board specific, but i2c0 should always get the i2c0 label and no other
controller should occupy that soc-specific i2c0-space, because that would
cause confusion without end.


And with the above it makes no real sense repeating the same list for
every individual board.

If you _insist_ on this, then fine, but I really don't see the point.


Heiko



