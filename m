Return-Path: <linux-i2c+bounces-10785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB8AA9E56
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 23:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86D8617CB7B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 21:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E9C274FF8;
	Mon,  5 May 2025 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="kSUUApq2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737327467D;
	Mon,  5 May 2025 21:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481434; cv=none; b=AG8k5/558CTaeMhSHZeHZTifCFeMwFoIsp69ugrkBYsIixqTCuGBfCVfE8Ljn63n7hyNKLEynHvri259o7BWhHjFKFuDhSf8wYtkeO9A3AgZ2FZf3eoaWdtXJfUhP31AqM+ztdWZSsFFXLVoSQPsCc7gHFm1EkpRXTyDWEfEOzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481434; c=relaxed/simple;
	bh=KGoHMvJXNrLt/JsqqoIqwpdT9g6Nv2QdDE3wTmLc9bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SDoiLJ0Qmny3CjZMCwUASzssbZVgIsX2kMKmKuhkF79QaVDkdzMMmgaiw5emS8433tFy7oOHaYDpLPD5PwiPULiL99N1/Ww4yUEWkJh3W86+WDVYRnPsOTw2pPlSZj3yVEiOc6nnQ+qL+HSJDLJojLvRo1KpkrLYkT6LRLLCjtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=kSUUApq2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KGoHMvJXNrLt/JsqqoIqwpdT9g6Nv2QdDE3wTmLc9bE=; b=kSUUApq2S4eNRL51I1LuJ6Pe8t
	eNc4wgeEMwVSJCCJEyO3cH0gVI4kAR6O8AK0gbnQgS8L2CF2rstRWLwBpClZ7Aa17YQAwgqkOhje7
	Ort+DuY3t/6gjVNpfu6XWjqI1EycDlm5bqqiTc08w2AMJgffh+ywAjDKPEMALs7eE1D9YJuJykWsS
	EGeZWgKsYLugvRv3jHGNkbEiWZMSATsz9fCKyahntq0eKPQVtx+m1ld1Z7VRkHO6sAzN4RSFBv2DO
	wz1ZxpHGm/94FZsS8BaDRfeiTOFriNE5JBz37Uveoko2KzOWySP4kuPirh+ZxxSvDLT2W2fpQQsUD
	OPCGLDWw==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uC3bE-0000B0-Ug; Mon, 05 May 2025 23:43:44 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject:
 Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for
 RK3528
Date: Mon, 05 May 2025 23:43:43 +0200
Message-ID: <2918896.Y6S9NjorxK@diego>
In-Reply-To: <h4hpaadpeu2pnsbcfbg4iye7w5sn26wflth4uztdghafuegqi5@2xbtygdwe2hu>
References:
 <20250417120118.17610-3-ziyao@disroot.org> <4864135.rnE6jSC6OK@diego>
 <h4hpaadpeu2pnsbcfbg4iye7w5sn26wflth4uztdghafuegqi5@2xbtygdwe2hu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Andi,

Am Montag, 5. Mai 2025, 22:47:04 Mitteleurop=C3=A4ische Sommerzeit schrieb =
Andi Shyti:
> Hi Heiko,
>=20
> On Mon, May 05, 2025 at 09:49:36AM +0200, Heiko St=C3=BCbner wrote:
> > Am Donnerstag, 17. April 2025, 14:01:17 Mitteleurop=C3=A4ische Sommerze=
it schrieb Yao Zi:
> > > Document I2C controllers integrated in RK3528, which are compatible w=
ith
> > > the RK3399 variant.
> > >=20
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> >=20
> > do you expect to apply this patch to the i2c tree individually,
> > or have it go together with the devicetree patch?
>=20
> with these patches, I normally wait a bit to see how the others
> in the same series go before merging.
>=20
> I now merged this patch into i2c/i2c-host.
>=20
> If there is any particular need to merge everything together in
> the devicetree, then I can take it out.

on the contrary ... I was hoping for exactly this :-) .

I.e. there is no need to merge everything together and the common pattern
is "binding goes through the driver-tree", dts goes through some soc-tree
(mine it this case).

But I can only merge the dts patches, _after_ the binding was merged,
so that was more of an elborate "ping" and _sometimes_ maintainers
might expect the binding just going with the dts patches.


So, thanks for merging the binding and I'll merge the dts patches now.


Thanks a lot
Heiko



