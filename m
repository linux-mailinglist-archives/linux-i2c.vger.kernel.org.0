Return-Path: <linux-i2c+bounces-1352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F1830829
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 15:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEDCE2873BB
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 14:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3DE20DC6;
	Wed, 17 Jan 2024 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gRzKd6rc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CAA20DC1
	for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705502059; cv=none; b=e+Qk2K7OgIm7xy43fKzTUtlv8TeGlz43cWvFTmQVMksZPlWQgQSL3RIb5hvQrX8APltAcxDdVg6d1gHDMqzUo2tUUlh27Xv+YaKeZEfkVv7lqItAsqAetlON0SalC1TCQQDZfwktfNG28pfZay41jRU4VJTv92IHbdaZjKVwBnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705502059; c=relaxed/simple;
	bh=iXIorhSRKYFl6yPszr/Q9J6QyFF46qLQ4H5CNhC5m8s=;
	h=DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:From:To:
	 Cc:Subject:Message-ID:Mail-Followup-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGVcW6dCE2dyf0q1w2ZqLBgUb5XcJv9ieHrFovFrY/Nri8QdBZzzOj986Kouavpopp2Finet0qtrfggPR5KOEcvdHIvKI48NRKea4mZAwL9AtrZJ++1gx9kkRc7dLTZcQIkQTmnNAh/AUZRsjp+T0wpPXZL7SZnr/6q5asSlcus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gRzKd6rc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qXGe
	GqjSieG7Fx55bT7gX7jzHoXKG7dkBusX2A5yooE=; b=gRzKd6rcqI0j4wsg1Yu4
	ZjulY8ohlrl2vkr5SIVRm+/e9vmJBwtF6uQIcaYHso39SC6A4+3djcOHX8bMLkey
	IeyM/2w7PZX/KjPu+yqU4pFNkBol73Df53pCR1QYHaplZlwzhAjUxklYUMjJbA3D
	7QnZ709zh4dsZrRpQiFQTj4vrpcCerYeDcSi20NPNZYotIyPS8oPtyecOFAk07P5
	zR52X/jJfNmqcbXRL2p4Skg05OOtmOJLERkBN4/n2Xqz3Q8n+ZQelJ6h10zGjTQW
	LwpaTJzIpIBxF9KOrkONVCgeFODUZ4O0KVgwE2NcHcsdhYk06Su0rs8bX6uGNpFo
	Tw==
Received: (qmail 2776129 invoked from network); 17 Jan 2024 15:34:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jan 2024 15:34:12 +0100
X-UD-Smtp-Session: l3s3148p1@Pqf3IyUPkrNehhtJ
Date: Wed, 17 Jan 2024 15:34:11 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH/RFC] i2c: sh_mobile: Switch R-Mobile A1/APE6 and
 SH-Mobile AG5 to new frequency calculation
Message-ID: <ZaflY6TN9Pl_L0Tk@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <f030f08f72dbcf83887013d000c1e2a1a9ffac81.1705324589.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NHMHFVJHs4i5pUp3"
Content-Disposition: inline
In-Reply-To: <f030f08f72dbcf83887013d000c1e2a1a9ffac81.1705324589.git.geert+renesas@glider.be>


--NHMHFVJHs4i5pUp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Jan 15, 2024 at 02:18:12PM +0100, Geert Uytterhoeven wrote:
> Switch the R-Mobile A1, R-Mobile APE6, and SH-Mobile AG5 SoCs to the new
> frequency calculation formula, to (a) avoid running the I2C bus too fast,
> and (b) bring the low/high ratio closer to the recommended ratio 5/4.
>=20
> Measurement results on R-Mobile APE6 and SH-Mobile AG5 (fck=3D104 MHz,
> clks_per_count=3D2):
>   100 kHz: 106 kHz LH=3D1.12 before, 99.6 kHz L/H=3D1.22 after
>   400 kHz: 384 kHz LH=3D1.67 before, 392 kHz L/H=3D1.27 after
>=20
> Measurement results on R-Mobile A1 (fck=3D49.5 MHz, clks_per_count=3D1):
>   100 kHz: 106 kHz L/H=3D1.09 before, 99.6 kHz L/H=3D1.20 after
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good to me, and it seems to comply with the datasheets? (I haven't
checked)

> Notes:
>   - fast_clock_dt_config is now unused, so I guess we should drop it,
>     and rename v2_freq_calc_dt_config to fast_clock_dt_config?

Yes, we can (and should do that).

>   - The formulas in the documentation for R-Mobile A1 do not include the
>     "-1" and "-5", presumably this is for rounding?

Sounds reasonable. The formulas evolved over time :)

>   - The formulas in the documentation for SH-Mobile AG5 include
>     the "-1" and "-5" in the example for 400 kHz, but not in the example
>     for 100 kHz.

*shrug*

>   - The SH-Mobile AG5 documentation suggests to use an L/H ratio of 5/3
>     instead of 5/4 for 400 kHz, which means the old formula is better
>     for 400 kHz?

Both ratios are within the I2C specifications for minimum SCL lo/hi
time. 5/3 is a little further away from the minimum requirements, so
maybe a tad more robust. But both should work(tm).

>   - Remaining users of the old formula are sh7343, sh7366, and sh772[234].
>     At least for sh772[234], the "Transfer Rate" formula in the
>     documentation is the same as for R-Mobile A1.  Hence probably we
>     should switch the default_dt_config and the default fallback to the
>     "v2" formula, too?

I think we could. But touching old systems without testing and a need is
more risky than leaving them alone.

>   - I am still a bit puzzled, as the "v2" formula introduced in commit
>     4ecfb9d3b229fff5 ("i2c: sh_mobile: add new frequency calculation for
>     later SoC") is basically what the driver did before commit
>     23a612916a51cc37 ("i2c: i2c-sh_mobile: optimize ICCH/ICCL values
>     according to I2C bus speed")?

Interesting. I can't recall that I analyzed the back then existing
formula when I implemented v2. I recall that I used R-Car Gen2
datasheets as the reference. I probably thought those are the "new"
algorithms. I likely didn't have the old datasheets back then. Still,
my memory is not clear about this.

Obvious to say, this I2C core is not used anymore in newer R-Car SoCs.
So, I won't dive too deep into it...

Happy hacking,

   Wolfram


--NHMHFVJHs4i5pUp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWn5WMACgkQFA3kzBSg
KbbzOA/6AgHaxhcwwKmjC5WL7rDn8DOZ+VB+Yr3xvblueaItHpnEuSkD+9g7Bje+
J/eAxk/4VyN3nAFSFha7IKqEbCQR8uNiey2V6xsfEv5wYKP9RTpe9KwV3tgLNnBY
k628nW5ljBrh210wDV1aW9ZSVh94NWN8yTtxnSsbgHP9aWup28CG7cN52DrwqDLt
pKgSrMFO+VkPEbAKh9IEZCNazvJFuHefNfi1bsDXS+SYWiB6iZurZrdxin9dyRxF
wP+au6EG9/CoXEPOh6uLyLi/pp2Bhhs0q5PD4uXGdNh1ck3rWQkps7mZoInvKqZj
skJcc9+tojlaaIhb1oPOf7ajmcFEZF1sWbKaioxmegiJLJAy1n5zhml1jFIKipsR
Dyu3dZ/rHnu26n2IX0zFZPAJFOz37S84xkGAxYZRi11vfz3rU+ZUpPYMHOMVPP5A
wFzFP3WOQyAZZQmPEHX9hQsztQ2xPTl/U02THIrcY3wL8oAifllWy86YJijLnuEx
MjiLrrEQuWnAo27huC4a+hpt0KOGJjMM5Scxl9wlL2k2qLulv502TsV2cz96Nh/6
zZ7IadsCDZn9uLKTs5iKmxg4w6VicrgrMaYO2BdBH7Dqh394jr7ARpA/ryVqsoXe
2wE2d76bhaT5ErrXaaZDQfRe46nKGbNu6Oue3Cxv3hA59PR7nGg=
=JKWR
-----END PGP SIGNATURE-----

--NHMHFVJHs4i5pUp3--

