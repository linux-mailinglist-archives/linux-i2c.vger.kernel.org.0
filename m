Return-Path: <linux-i2c+bounces-11349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E442AD3D96
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 17:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E03753A66DC
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D69238D51;
	Tue, 10 Jun 2025 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0Hco7bm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED5022A4CC;
	Tue, 10 Jun 2025 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569578; cv=none; b=bs+T/Ik/HPBaLycgoBss15VfL0d5+5xX/BKdEMMQ9QhpbrLnCr4n3Ke9Lvi1j/9y+qejRAsnF5JNdSuMAeu4pFQh3CeMUxYx69IGI4Q7HQKOc8PWlojfMPs5BgxXZVywzjX7oUJieML9pm9l1XkywX/Bee0/kSNNbVfe8GAynOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569578; c=relaxed/simple;
	bh=q6RS+C7zhMB25iOBQZc/9f89PNf4OlYGhPMsZzpqjfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaWDL4RHOKOQEF3x1Nrt+IaonbM9sZvGQg7rmK2oxFIlgvn+a+an3HDgZijp6FtTj7TMudFoSFLuNZ1Ib8RvpkLSXqoIeSCYpxpahxZKuWxPl6S1uQZ2sUNZEi/1bs55SRxi375522JaXNKfb7tgB9DF1rv5gznGpIRC1brdxh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0Hco7bm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F51DC4CEED;
	Tue, 10 Jun 2025 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569578;
	bh=q6RS+C7zhMB25iOBQZc/9f89PNf4OlYGhPMsZzpqjfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0Hco7bmWY8LdPkZ4LFbstckfrj0sRITV0hyXuN5O7BQY4TLrMq+JMw2Kuj2oBXgp
	 iPlfxpnVgHKKz6fqdO7lOBBMjkLR8XIB5nyrT2mscI2c7iQpMwS8qVByuB5RgR0Qpn
	 fq3qY4T//LWNkv11StE8oq2CZWrtXVbvD9s+XCTkmhzZQiIoi7FophCSbF2nwsNbaD
	 rGpIfk2DlQ4+HS31zvpqB1JuvY09EdQl4qnp+tp6tZvyHbsh5PF4HF5C0cg0IpDasc
	 vjhngrsOw6vIsVBGc2yEbScLHPVHlI6bZhEXhapJsFHgBVqWCuuV9NIhqRiG1Sdxwi
	 6eLaP2uDlKV8A==
Date: Tue, 10 Jun 2025 16:32:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple
 A7-A11, T2 compatibles
Message-ID: <20250610-connector-agility-f2d75a8ab825@spud>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
 <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x4dHHzQr44MfMq5x"
Content-Disposition: inline
In-Reply-To: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>


--x4dHHzQr44MfMq5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 09:45:20PM +0800, Nick Chan wrote:
> The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
> the existing driver so add their per-SoC compatibles.
>=20
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--x4dHHzQr44MfMq5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhQJQAKCRB4tDGHoIJi
0iShAP0aNRWibVunJQxPKvAgQLEjADb3xVu5IbW7ACnrlSyizwD/SBjcrfNCx6LI
j/CfImGYmkxvjKvzuDmkDe88dmljGQU=
=fLjK
-----END PGP SIGNATURE-----

--x4dHHzQr44MfMq5x--

