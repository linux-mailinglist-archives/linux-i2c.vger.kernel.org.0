Return-Path: <linux-i2c+bounces-4664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29420928A7D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 16:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABB3B1F24CCF
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 14:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D42C16C689;
	Fri,  5 Jul 2024 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WLN/JoOu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560216B3B9
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jul 2024 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189046; cv=none; b=R/GCWZEK+43jkN/ecJkHmqtIfZJEdGsmq4vE2iswRaYpofyYF953Vexo+ZJX2fFlaFp5Infha1GBIFSzUriKtmvEe+lVQh/anReLQeawoPitDVPiJYuiXG+h5awILgCBvCivUhZXVirS/kWLk9wLibAC6IzyTRT+GakaTKsgPh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189046; c=relaxed/simple;
	bh=PLTacBsABDx18/B0CJmijpNycTNE0X9NuN/mgvkRdTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJZ7Obu4q0zIqCWBjwbqzRNjULSmnF1w8mIIfGXPJNaARMit1VqVILxeLJj77eWoSTnBoqgTzMcbRrwydS6aV/hXiz7KnGC84QlReonmrX9U/RAm00ZstXoRVPRaDi0t8MgRRuKJeKtJ9QZ01WW+ET27XJY07TJPq7MaqFWoJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WLN/JoOu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7227
	DF+1lpqCtRtZGuyjnIwZoT+lBkQuRsIH2JWIgu8=; b=WLN/JoOuzI8iXc3vlGYO
	YqA7K95CiN4KeLvUzyD3467BUwf+KjK7D6MyfaG9hYlVqZetjclQpG7JKYzHGVHR
	ZXJ5m3DJkzpkqYqbHdlC710F0Hrd3MNlGHNiyOMecSPo7Ns6KTPHVFmdmOEGQ2DK
	EivPTmLdAtB/HT/ZjBE/ZW3ggKlpJ8zQWpYDzt4aHbeCT4wjQzLR+kE7g2/L0wNL
	TYwPYeA4wo8M/xI/IPUTzvOBsnTcZPZ4r8a9bSD06oBMLsFc/ykd0GjP4nTORm3d
	Y/vd4RSeiAdOxbB3PDasJEbc1NYIQuhoie7tjXaRspIKzKEa8jBbwzo5JWdWzjIT
	hg==
Received: (qmail 3561634 invoked from network); 5 Jul 2024 16:10:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2024 16:10:37 +0200
X-UD-Smtp-Session: l3s3148p1@bvSyoIAcdoBQT+F6
Date: Fri, 5 Jul 2024 16:10:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.10-rc7
Message-ID: <Zof-3WEvkBfZeL_w@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
References: <snxb7qd23vzrhls4duer3bt46m3lwzil5fzx75s7jl4okhexak@2e23wyd6qe76>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eQMShuG1BI7VQ/0g"
Content-Disposition: inline
In-Reply-To: <snxb7qd23vzrhls4duer3bt46m3lwzil5fzx75s7jl4okhexak@2e23wyd6qe76>


--eQMShuG1BI7VQ/0g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2024 at 03:06:24PM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> Jist a nice fix from Piotr coming in this week.
>=20
> Have a good weekend,
> Andi
>=20
> The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e838=
26:
>=20
>   Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.10-rc7
>=20
> for you to fetch changes up to f63b94be6942ba82c55343e196bd09b53227618e:
>=20
>   i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in =
isr (2024-07-04 00:17:47 +0200)
>=20
> ----------------------------------------------------------------
> This tag includes a nice fix in the PNX driver that has been
> pending for a long time. Piotr has replaced a potential lock in
> the interrupt context with a more efficient and straightforward
> handling of the timeout signaling.
>=20
> ----------------------------------------------------------------

Thanks, pulled!


--eQMShuG1BI7VQ/0g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaH/t0ACgkQFA3kzBSg
KbaPVA/+PPnSuVe4FkBmTTAZaSHO9PjPIXVG2n7rwdIcq7awCN5pD2NtuoVAeXpD
gXtGORuS6B1Q8uihyX3CJU5TcbaDYDUfzhVQNBhk1mQqRJ5pDz5jPVxTUbaoxPyA
u+oeFYbhpvFwaExdfAqG8dR+oKNnm7IAoexega+k48YHNhy+AfUK8iY1Bs7yu8HC
ojPKpiFdebzz0dub8otWxc1gNNhPzqCV5i7JiRl1I679WjGdqsLHJrpoRDGXhMe0
YT8BaL93b3XxCN1EO3Uma5tP5uN+NmJHkjd6d8+dglg+1zM5jQX65lOeVVWSrwHK
Ap1mGM+PV9USJRRJt4E8egB4kZ62xC4AK+AbaAFSO0JmDR0mXzFXeB2ue7/nZfap
pT7TuG2Z1y8zhqvlNUNl5zsiIHgGPefYEd4SFG2rzFDhYh1cxRdIyHsiVUWID9gB
HeFUZShZe5+PRB8YZNoVzRP9JRQrB0uumkFeLYFAH43h8fsm4OKBfW4uQY3AVVU/
YNPzgV1kN0fHRovvDYAXl0LsVKvqXtb5zkE9U5F2n1Py8NWCtZbkm8nh4bo+F7ZC
juf6jSP4/Sw6Fx+IwhIR/C+OzllFqw2MVPX5N0aXylXhglemx//zmqPEF819WbYb
sS1UrMXWrxBGggGqeedw7j8QoCq9sEvsOm2lgXuGVWMSDXz9DrA=
=luTg
-----END PGP SIGNATURE-----

--eQMShuG1BI7VQ/0g--

