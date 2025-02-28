Return-Path: <linux-i2c+bounces-9657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C599A49ECA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 17:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26659174E6C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC77272920;
	Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S58iV5NW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E79271818
	for <linux-i2c@vger.kernel.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740760179; cv=none; b=AJRZ2QbqqNiZ529CYhh/oIPISPcAOjFUVXum6TqCtRt9QCC7D0EfRwyXTR0qw9CEnLsWYx4frekCYDVyI9X2wsTtKK/A0Uh9fu8IwHbpZNMI33X5fR2HX1m2bJ2rzthrNb/I7qZhF0Xy+ldqHgUsIEShN3gTdVcZc/eGCgwwwdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740760179; c=relaxed/simple;
	bh=1fyDN/zRhJehbXX26NZDLFq32q6kxhcXf+X5VBtCp6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkWQVUoVn1YyeTJEds1J0J9N1CyUsYdxY3dxAof/LWCsEmKgej/q8pjznouyCpNXg7Aqa8msalsBKMVvP1u9BSbLUAi55wqo4vMAXfH4oX+rCe2FZjQWRu51RLSSExPlrniCoelDPcvKKotfUv63fmm+evUx1tceL56AMkdJYus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S58iV5NW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4D0l
	pTjJil8W4dDF1wyVctPlS+Q+sLcbwZXWf4NgEx4=; b=S58iV5NWedtW7XlPVxtH
	1Npl8HKZtxPYlIYAdjzCvERQV1D22WGPse1FxML3xqatL3CPuhS/6m/cF1CXEwna
	bfd5dQS1mUVQA3leH8IGsPtekVNX22HvXxEi1vaXYmOP8oNE3hKytuvpI2Q0GhZ7
	6FkYszqQ83h5CU3ErbA3eh/zuAP4gNGOIWS/Mu03C8ch5FuRwkitB7UrvrgReVmz
	Scv1uaIeUorJI/FgV8TeOegG8UDtky/2+crr6gEh/o0b8xfC3kN0mu5R8vfy+34H
	KWx9MZ1vHRVATN6DZ+sz07g3Ma1ffRlixp6UnUCCbn34Jy9/AeN3y4AXjW1RMkGA
	8w==
Received: (qmail 1363046 invoked from network); 28 Feb 2025 17:29:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2025 17:29:25 +0100
X-UD-Smtp-Session: l3s3148p1@ntFQTzYvhoYujnui
Date: Fri, 28 Feb 2025 17:29:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.14-rc5
Message-ID: <Z8HkZVLrfEZcCRNh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <de3dc6brdsrje7p2lnahsgymlmivmzsgocfb3mt2wwvvml3tla@jyo4qtxkoi2n>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HCkNuvjZ6CGBxRz3"
Content-Disposition: inline
In-Reply-To: <de3dc6brdsrje7p2lnahsgymlmivmzsgocfb3mt2wwvvml3tla@jyo4qtxkoi2n>


--HCkNuvjZ6CGBxRz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 01:35:32PM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> three fixes for this week, all hardware-specific. I'm glad to
> have received support from reviewers and maintainers in ensuring
> the correctness of the hardware interaction.
>=20
> I wish you a great weekend,
> Andi
>=20
> The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101=
b6:
>=20
>   Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.14-rc5
>=20
> for you to fetch changes up to 9f3c507cb44498067c980674139bcad56e582ee6:
>=20
>   i2c: amd-asf: Fix EOI register write to enable successive interrupts (2=
025-02-26 23:28:41 +0100)

Thanks, pulled!


--HCkNuvjZ6CGBxRz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfB5GEACgkQFA3kzBSg
KbafqxAAtiaGRT2hIfoJqWY0E4o9O7ADMOT0tNgnPfYd/ntQSO+9x0ciONOJYY72
M3aZSaD09svSdmkXU+LK0h4x10nmHh9tUcIezPa44Y7nRPDmJseIzoNRxwUbMQ5p
TY9Ivl3lp2JQVW/UaLc6L7hTc+Si0Ar77SkLdgN/sNgoRAQ84avO7lM+rlyDJi5v
JwJf9WPUtzSqUL1OCy0lMb4IXOUaTC99vP7qja444svaQixNezNpmpy3zy78gisz
8bO3mZ0OZ6Woi2uBxkDohjXPdvnnU446FSfC6MEc7UGASE/V3aQaQrHyMaWfKrFx
Z7KTr1WzOdt9yLUYWpaISJ9OxsqpM6rtoh9bCgem0f5Cxb71x02xxHuhcnVhjWQO
DavytP5hxlncZIUR/7h48xkIKJ1iQwMuzfftWhstRxQiY13Zjn+ZYhHDcEgWE7vr
kFuSHjtSC4z9YWaDZD6z5kkXez0s/eqgInt+Te6zUf5nHRBtaE3B74mD8EQzinNg
V0NSIihAR1G1venLaYn1doOSaQL89kruuPQy/4FWPjTugWcjHeyUh0sgrMc4OHRg
5JG4K3kTVwa2pLBNTmlCA3mKEmOxCNQE23y11TYha7rCrvTGRTly0Czucb+6+TOQ
UHoq4o0CX8O7Zw2vMfsYf5cc7mNe8LV5heKAvRoKaRs03Tq1EmY=
=Jpoj
-----END PGP SIGNATURE-----

--HCkNuvjZ6CGBxRz3--

