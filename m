Return-Path: <linux-i2c+bounces-14890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E59CEFE3A
	for <lists+linux-i2c@lfdr.de>; Sat, 03 Jan 2026 11:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 740313021757
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Jan 2026 10:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C34D306B31;
	Sat,  3 Jan 2026 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tc79plr9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2612C306482;
	Sat,  3 Jan 2026 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767436800; cv=none; b=aM/QXoU4QSkjvvsEuk8wRwlDiI+oMj1zT+Vv8voFEBIwt0715FKp+dNbS4Dq2yCsjO+/HjDRvhJBzA70aYR6ETqADCI6prjfRmk5SiHh3VjH3BYQwI22Zs4pVjfKW5bOqYy4WiO6Vu7d4SfdFc+DNAxMNJXHvhPt6YQoDA1Ay1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767436800; c=relaxed/simple;
	bh=5m7p8m10yK7qHox0wi3lALDmcBikD2hsMgWE5RZDzho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uepb3i7Oodw3s4txakievkRphSduRqNXqY+BmMjS0FU/GLHixvMOOXVG+leEIcotAp39CiO9U/aer+TrH+Rt5MzUB1PsGTj08z/gAnesi5vBkad7RRUQv8TmrCC64JnuRWUl5JlsIDrFueYw4mjaB42J/KAR7ZCcCMuE07TEINs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tc79plr9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5m7p8m10yK7qHox0wi3lALDmcBikD2hsMgWE5RZDzho=; b=tc79plr9scNNEtncd9A2ixqMX/
	jXl6eBLypvOGWsjRmEwxsbJ5fXUy5bad+uAOY4BjIsXDrva7RY1Ow90wRkyoKtBdvtRBQ6scqAIwA
	LfwyZkOgSvofW3uHnEj//5nLGxDKvfUx5WzzaIzWeLoz00dM12Nv5FCc7Go2BVz140SLJQJs4vSYH
	fOWJAVDDziIlQXat8DP6GJeRC8SLAN/4uYB8IqNwb7hSKSVPodlPC+9aTYbj3rsTQxu2FmUyeubxu
	vfp5iVox3Zx+V25LUzHgAIrEeHUgXQrWg4ECO4gjeoWnT+wP+jOKqUWMLt/VY4vN6XCi3JiWOfkPd
	IdWdlt+g==;
Received: from i53875bab.versanet.de ([83.135.91.171] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vbz2q-000vtH-Rg; Sat, 03 Jan 2026 11:39:41 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: Anand Moon <linux.amoon@gmail.com>, David Wu <david.wu@rock-chips.com>
Subject: Re: [PATCH v1] i2c: rk3x: Add support for SCL output enable debounce
Date: Sat, 03 Jan 2026 11:39:40 +0100
Message-ID: <1802774.yIU609i1g2@diego>
In-Reply-To: <20260103052506.6743-1-linux.amoon@gmail.com>
References: <20260103052506.6743-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 3. Januar 2026, 06:25:04 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Anand Moon:
> From: David Wu <david.wu@rock-chips.com>
>=20
> As per the RK3399 and RK3588 datasheets Rockchip I2C controllers feature
> a SCL_OE_DB register (0x24). This register is used to configure the
> debounce time for the SCL output enable signal, which helps prevent
> glitches and ensures timing compliance during bus handover or slave clock
> stretching.
>=20
> Introduce a 'has_scl_oe_debounce' flag to rk3x_i2c_soc_data to
> distinguish between hardware versions. For supported SoCs, calculate
> the debounce counter dynamically based on the current clock rate
> and program it during divider adaptation.
>=20
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: David Wu <david.wu@rock-chips.com>

Signed-off-by lines are in the wrong order.

Original author first, then yours as you're the one handling
the patch last.


Also, does this fix a problem for you, or is this more a case of
"this looks useful"?

Thanks
Heiko




