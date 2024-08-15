Return-Path: <linux-i2c+bounces-5428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2559535B5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 16:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E6D9B23222
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBA11A4F0F;
	Thu, 15 Aug 2024 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFPVjlUL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F551AC893;
	Thu, 15 Aug 2024 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732849; cv=none; b=CUF9nN/oHhRRSOaSzcOTZNrWRyeCVajwNLjiZF/kU9hWAlt0jH+FOY//ucMK0rQsp4AvZ0ELOw72asIKGoswiW3WyIIg1NX6vmX+Fp3ovl0Z7LO/fyjh2OsaAuUiN/VdYorbgjHcbPULf4OZIOGouqsxEr3oHKsV6oxS3rEVWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732849; c=relaxed/simple;
	bh=83OluQ1HuchH0CLgrcdEo54mOMF4JCM7m6eJjpmO/ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvZudnud0Swttv7ncQRoVgZ4xywppV0PeNP4rhQDI5AeItL4FOU2aQ5gHbBa86Cnsjd2CtJmcx57VG5jibXPEq9lLtFZaMsM/m9KwWXIroOqYeFkmfuO8ONi2mrG2IorYnk6+9eScNa9TdpGpFtbtLzf06fAiKJ6N6B+OfukHMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFPVjlUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8D6C32786;
	Thu, 15 Aug 2024 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723732848;
	bh=83OluQ1HuchH0CLgrcdEo54mOMF4JCM7m6eJjpmO/ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFPVjlULponHkmCPgjrEr4lyKjYYU4MNmT7R93m1KIbEZ4Q0DeQ8lKFqFSQrNY9a+
	 6iKbmjhjan+4qpHtyp8GYdspywmGiqVwdBvJF4WrwhegDDCqVn8u+prqqaRLMZHduY
	 TgaF/myIec1HYAbz+4luVSewFCYcGxYrqZBLyv7Q2mhpIl5mRIDMe6RPpC8a+glIYL
	 KL4SM2FZ6qxCg6VGfwGtzKxwfVdr8MeZdKaPUXKs28n+plFlnXhu8+ztgwJcmKaO+j
	 x0S2Ov3JlY/A1aeZJuNJLKTGsfHhoCZQHP8XmbgtKzm+rNsiwJ2mbD/XggMQpOv0RJ
	 Rmu9y+h/hjZ5A==
Date: Thu, 15 Aug 2024 15:40:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-sprd: convert to YAML
Message-ID: <20240815-compactly-speed-648087120b92@spud>
References: <Zr3qdNep9BCb7Knc@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kqVvDyK5eBFHLrAC"
Content-Disposition: inline
In-Reply-To: <Zr3qdNep9BCb7Knc@standask-GA-A55M-S2HP>


--kqVvDyK5eBFHLrAC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 01:45:56PM +0200, Stanislav Jakubek wrote:
> Convert the Spreadtrum SC9860 I2C controller bindings to DT schema.
> Adjust filename to match compatible.
>=20
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--kqVvDyK5eBFHLrAC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZr4TbAAKCRB4tDGHoIJi
0gyDAP9cGal4Zbv5zGtgPqanxgw8dtmFHflxphCE/y7HhF9NJgEAmFLKG6STunmi
VtyuJbkIrbeNTG5q1fQfdEIl56KpnAs=
=uM48
-----END PGP SIGNATURE-----

--kqVvDyK5eBFHLrAC--

