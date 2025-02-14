Return-Path: <linux-i2c+bounces-9457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 060EDA359E7
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 10:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E9B51891CCA
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 09:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D571253F03;
	Fri, 14 Feb 2025 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iSXw1XUy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140922E3E1
	for <linux-i2c@vger.kernel.org>; Fri, 14 Feb 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524262; cv=none; b=gwMTaYVt7rcDoejqQhRLPQBaThGBwgazP6CdyfhMij54ISfbjR4pGKyMFxFfxDbh4FINtbPR/fXJFWXj+NFFgN8oLulXgwQ59nnQFyD4VR8RLDHo/VHA+qfTc8ozRtlNdnDMrHn6UnyQowdYWdeLbG0Dc/JOR+i3I2lmxgMv05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524262; c=relaxed/simple;
	bh=QbAgw2oxQrPtFZuPQJfFBd+vyxeOXgQ1zieT2e/UvAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBs5pZz9xEnhiXtJoL3+jXJIFhDxNDXZkGUulHqnUzuOd64sQwrsoKdT9lvQW79r3zFclCGTEeV/47uvueWmI4AcQU1d7C0tnBhPwV4lmP2CqZeC2KK91ih67e+LjBDcm14KQHScxKXKwF+CchQHs0soS5PoKzp4T91pl85loHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iSXw1XUy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QbAg
	w2oxQrPtFZuPQJfFBd+vyxeOXgQ1zieT2e/UvAM=; b=iSXw1XUyYi5GVyaB2sbY
	6gj1lPYcidgJOcVDHWrVmQWKnXyuec554LLlSrZw0guDT/quraSByIrenCrpv2hU
	3dAHARfwP9OtFvH2nwLCAHfWyCXJzOHi1rIxpc2zRGCARKDBHwHEsF2tR9fiUvdt
	qLrOSGgxDKnfc0HakPxwLwdc1wl51W5mD65nzaYrRkyDm9n7AoidhSx3h0ZkEeQg
	lq0vbiPFNZ7qcKze26TsISryGoCkpTYTAU81PaRyiQE0sxVdoh6hCvGaUEhDMT+Y
	Q/FS4q3eb5opf0PcbZchdmeCgBXhz/t6dFacCU/bn2MQUgGs2ySutAnZPHUcRmEJ
	Dw==
Received: (qmail 2318586 invoked from network); 14 Feb 2025 10:10:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Feb 2025 10:10:57 +0100
X-UD-Smtp-Session: l3s3148p1@D89ojRYu+Npehh9k
Date: Fri, 14 Feb 2025 10:10:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz" <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>,
	"Markus.Elfring@web.de" <Markus.Elfring@web.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 0/2] i2c: octeon: Add block-mode r/w
Message-ID: <Z68IoPJ_jNvbn47l@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	"20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz" <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>,
	"Markus.Elfring@web.de" <Markus.Elfring@web.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>
 <77e95bcdbb1cb986686487d777f8966dca0cf435.camel@alliedtelesis.co.nz>
 <Z653Nn_UO47pgRj8@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7JuUoV8CobHnt4oh"
Content-Disposition: inline
In-Reply-To: <Z653Nn_UO47pgRj8@surfacebook.localdomain>


--7JuUoV8CobHnt4oh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 12:50:30AM +0200, Andy Shevchenko wrote:
> Mon, Nov 11, 2024 at 01:36:22AM +0000, Aryan Srivastava kirjoitti:
> > Hi Andi, did you have anymore comments for this patch series?
>=20
> I have comments. Can you address them, please?

There is already v11 but AFAICS your comments still apply.


--7JuUoV8CobHnt4oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmevCKAACgkQFA3kzBSg
KbaCRA/+PRpCHf/XlOsvmHlc78vaiWhupLz707jQ/y5EK2+sEuUNtDCmHAukewQ5
PV1z8YgZWdV7UjPNXqprRSamU6arB9tq2hfxyQmY5CVze87b4A552smi5EF6FQZ1
fN5P6ZWDqIpfK7veS0REtpOCG5WTcg2EONTMXOIUA/ivlVgPfXA4wd7YIhZ936XS
paUP48SamIQ8ttOpZtBubBO5L3mC9SfSsmqSDxEu3CgykX5qhA4rmyRh4lR+1Kfx
FG4J/7ergmBWaoyJgvfclJpMZTGbqdtZWjYR+VjEa6X7vDZLtQtpmC6K/3v3zWQh
Oz1x14yRMtwwD468vrZYob2HeDZ48c3jX2W8XgIn8NmPdDEnGnhUg8THQ/s8DyEz
PEZXJSRlWJyHRXcTSN4XFReyfkmVTIp82mL2LXkaKzyuAkdtHev4NYCZuDQVjJ6l
Cb2vEuq3SMPwgGrAKilcqQIUQ1CuVpVE3aQ83odXD+LOKbwBs1E9W/jMSSSuvlBi
vttvBar7VU8faMYTVbLw6MEp8gl+IopjnbodP49DMWJLi0ZiEvw0f0ymJl0Ovkjv
cvgdXWiG7N9JbODJHoapmvjSsC+4i8g+BAqkiAPVqFjXttJx8JwGZZf5EvvZgLqJ
W0rpGo07z/HmYQTjh/o83PcLrpAj2CoJHx6SaH28khjrODWhJmI=
=8SU1
-----END PGP SIGNATURE-----

--7JuUoV8CobHnt4oh--

