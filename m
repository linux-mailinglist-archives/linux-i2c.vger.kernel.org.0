Return-Path: <linux-i2c+bounces-10012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C1A6F449
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 12:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53DF63ABFF2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 11:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A5C2561D6;
	Tue, 25 Mar 2025 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b6X89kp4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D52255E58
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902536; cv=none; b=mc5Rt66lp4ZTh7KK+Zfu6/qQiI82o6rADs18GjDQF6X7Ls/pEeQy5ztCLb6SI0YkF5CbuI7aHXxdxO3MPX3nEl4vsek3GFWP9FCPAzGgcuQ4XhPvm6fCCkJHGwmeHJgwieMdxdi8p7U3kXNr+5iAEI8ICUKnf93WGKTYqRu7Mjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902536; c=relaxed/simple;
	bh=9rrtKMN1m2WAJmx1cQRuCKHe9miH2lVC7ZL9btWYztE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnnMpUk/ZIRe8SjK3uAFnyxdOsWrRsQ521rxLVyVEa1t1haXMCFfXLEJFduI4thwsVR7MaWOQrEHatqWYOD+0evcFuTHgrhigKVoJE059T5H7JuIkBNeOt29Snr2rWzwqIXBTO8SvoB8R9qcJTdlANLRkcf00nAfVfXlWLVE7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b6X89kp4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9rrt
	KMN1m2WAJmx1cQRuCKHe9miH2lVC7ZL9btWYztE=; b=b6X89kp46t+xWw4zP4Jg
	XQtrqW1MFy+snhzXse3IbNX3QBElauelE8x1wcrCYNfkMeb7pAe2USHsqhUQ5v7E
	EtQpZHoyKo8zP41N0g/9BLDtN/ipV/d9b4TCvvHR6jLdMSRwRpz7TRbhIV2fmI24
	HH6kmk9Gvd3cgyELtF4XlAMd9ZxaX4rLtHRC0jZ4mv/MeNb9VlRoWmnSE9+tJsqP
	zwnsHa7OBKIsC4Qzdv+EzcrZZrigwQcHDktQ5WPls4C33fq2rYkT3uFvMpxUPEhc
	mDcBm+SEDvviWnQr7phmqGYd06fd1wDssBwPq+0dgLwfcbyLDWy+00OD3DCDcD30
	0g==
Received: (qmail 3030393 invoked from network); 25 Mar 2025 12:35:31 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 12:35:31 +0100
X-UD-Smtp-Session: l3s3148p1@zZ1CHikxorkgAwDPXyTHAJp038nK7dx+
Date: Tue, 25 Mar 2025 12:35:31 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 45/57] irqdomain: i2c: Switch to irq_find_mapping()
Message-ID: <Z-KVA5syQmeKLOZP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, tglx@linutronix.de,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-46-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zdd5loAjehf+YwVA"
Content-Disposition: inline
In-Reply-To: <20250319092951.37667-46-jirislaby@kernel.org>


--zdd5loAjehf+YwVA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:29:38AM +0100, Jiri Slaby (SUSE) wrote:
> irq_linear_revmap() is deprecated, so remove all its uses and supersede
> them by an identical call to irq_find_mapping().
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: linux-i2c@vger.kernel.org

Applied to for-next, thanks!


--zdd5loAjehf+YwVA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfilQMACgkQFA3kzBSg
KbY5SA//RrdkIAxtC59Q3H+4pkRSlUzNE6qxFtcP5P9TFfy/Xilb8XEns9/c+ZTJ
ZEUM/CcV46/MbwDLkWN5Ic5CMn8eDp64h/mgc69rDyhiEZvlljZSbWb83HwwQ5vD
vbf856co3AJE9EG/0yh2mzM/Cg8zbb2+8aRvGdb6TRArD5Ie1rsugll0v3Fp6x0K
q36C8Tlt2B6EUOJaT1ELEX4LGc8RDcRZe0j+rhnVGEEis+9NJLNcTo9SijwbED56
jg6GlFnp6TK0G5ruDagvv5bWYW0NahsbBQyLMM5Wb2JUP1UKNkZKOeYjjr9RpfOh
YRQefAOosVfj3TAFA+S2QTa0r1M00RCuufezTDgaSnqrsV0I4/NrFXyYrhTfS298
gckpokhv1obEL5yxIueviW85jrTqzJY8bc3VpNDFgScMnZXV6NEiIEfKG+YOt3gS
I+6j5M2gtuD8KzWs6bymsaCK/tKs04Cm+3mdWLlbxYRiSpyWjv0YvLMrb5Db7nS3
QfepJzGG6bjrOPsXNAquhyv9krwIBryLNhzeAn6rlWy5bbKdkoO1WQyikkoZjwcj
GMYsNfZP+2pDt+YBkOoTNbPAS+5j0jG+91JGQhCDaBjmv8oV1Rv1e8jiUbPcvLne
aX3TNkZ7x3HlPLWBREG7DpXLfxopSBttd9q/do/Tlaelt3J/Mag=
=a09R
-----END PGP SIGNATURE-----

--zdd5loAjehf+YwVA--

