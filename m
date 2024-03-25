Return-Path: <linux-i2c+bounces-2581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72288AF8E
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 20:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 264AC3066EB
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 19:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2412D134BD;
	Mon, 25 Mar 2024 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVYNrg3W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33B0EAF1;
	Mon, 25 Mar 2024 19:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711394044; cv=none; b=c3z0eR2zMGCnHtBfuGUXQ0mWoMakUuQzpmC5H15cKuu3PNmVMoAOqsLaiLyo+x//ghm8kuFypOEnra8tl/QZxLLZbcFocbygoCG7BgTLvrRKe9oT5J+9cDiR14vUfxJ5Kiad7W1ia5uv08qQ740/06VQsiongFr9bySKtgTHIbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711394044; c=relaxed/simple;
	bh=KaelNukxvsrPYK1N9laMx7thR69JrP770I56DlMagPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIHvx4n7+jk/QGHaEkjSXtvkyXZHmvgm+VXKn5EU1COstBQxq8F7sLECWbK2eEYpsl7pTzaFqutcBv1g0JYdSCE/fVAtfq0A6T/9GT19FLASW8XKGjI37HRzH7X4CjnprZYQa6W1r++lz4iwbFRIn9+kf3DoK9SQ3IOt+6pVnHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVYNrg3W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1480C433C7;
	Mon, 25 Mar 2024 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711394044;
	bh=KaelNukxvsrPYK1N9laMx7thR69JrP770I56DlMagPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVYNrg3WKdCpPNBxw3NW7oSfmLHnG2J867bDPvbVmaHTVBEG3natH3tRmPBqfk+/R
	 rpqe3W1RL7gIGz/pHRwPAmSqh4JLbeEtHbqRd7+A6G1JM/sEuYsvBEEqLGDb20EAJi
	 xaeLhSXkXwZHFa+4YeoVETqpgToYV7OftQwF7LQuVuPvOBEOHNODiiLk+yhwaoczVA
	 p1NDiSwMwOq6Jud0GyFTSSRXpXRBaEbj7qlDYG6vjlfnCG9oSzKvV4d62adr2vJjDu
	 YCOxPmDSg7l1IDAn7xdfKRtrpZiJV8TWYBKKQm9AAPRJklKa45yb9h9xDlQMp7tDFQ
	 qHYOnDRG9yxCg==
Date: Mon, 25 Mar 2024 19:14:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 34/64] i2c: microchip-corei2c: reword according to newest
 specification
Message-ID: <20240325-casually-hamster-cbf0f2430e07@spud>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-35-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TAGf2dJhgOpKDYF6"
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-35-wsa+renesas@sang-engineering.com>


--TAGf2dJhgOpKDYF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 02:25:27PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--TAGf2dJhgOpKDYF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgHM+AAKCRB4tDGHoIJi
0uLgAQCteeRRnZgvo9uGusSLdJIVBw7pXxV2EGKWnke4r22nDgD/TTDLIuSbaKfA
cOO7slZ3qZsgTl/Z/p+wwJ2HUIVrrQ4=
=jJNU
-----END PGP SIGNATURE-----

--TAGf2dJhgOpKDYF6--

