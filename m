Return-Path: <linux-i2c+bounces-2028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B086899F
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 08:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3CD01F276F2
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 07:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7F553E36;
	Tue, 27 Feb 2024 07:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4lMkKQn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495953E02;
	Tue, 27 Feb 2024 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709017939; cv=none; b=H+dEXSsORHuYz+udsQo8cTC2i6OlHc+w1JccDlSBdxVGgImB/zq3jZB88uRkvTtNV00WX+27gPS9H6MYEljbMGRLdVkUFVeSdf6ehDntnr5Ud+rD/HO00AKkgNcCCBdxD399CX+QrIpGVtIywFHCbGumUQ4ZYCl6JS8Pp47x+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709017939; c=relaxed/simple;
	bh=/ZlS3JVss0ofKLJzt6zCP6bT652Dlj49VoFRn7/lXnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbUpVsQeEI6dPixfy2Bc5iMKTyqszaI4VydqYP09e8olYreJX6fcGylQfFpAXxAkqj8RYglBhnZPBQDBPJ49a7W6XkpYOMJVZUHFZP47mmBDGgUhhGi7d8QpgYpgEIzivjMg2hUVZAfGEloMcY/pHkP2Tb9L8fdZ0M2fxcDMSZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4lMkKQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73704C433F1;
	Tue, 27 Feb 2024 07:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709017938;
	bh=/ZlS3JVss0ofKLJzt6zCP6bT652Dlj49VoFRn7/lXnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4lMkKQnJoH3dc2QJdgSIcV8tRagsw9X3GtjKarMRVzh0NfAbiHhAXIx95CwjAQbu
	 Xo9fTbI7XkMMP7U0GpkJ9D18u0NzQTOmLHVE6h/TJX9gzjAdyn62TB2jTZOElu/10A
	 d3jHvt8X9/oMhmGyL7jKzwYG4nPEYpwom66yLihfDB5XJ15oz/jqE7cLH082aToFKb
	 Y8VQnxNhq1j3zlor4KQH8YQPQ4kDKe+gktWH2FrUzl/gVeocEWjxcFEjTJGGNIpFYE
	 LKBqRws57JSaIFkY5KaFZ/SSFLx5/HaTKzo21i9AFwG2CIq7Cj7aZZUHF1teZsoN1o
	 P1r08YcKMGE0A==
Date: Tue, 27 Feb 2024 08:12:15 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: dtschema: i2c: messy situation about timeouts
Message-ID: <Zd2LT-OM4KkUXCXn@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <ZdxjGwvGXlDGkYs0@shikoro>
 <c6yyhxzqfavqjphumemgjn7ick4ddjzhlxfjb6wtgsfvdetdqt@radooxy4o4mx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KbqwGrd1llsCvBnc"
Content-Disposition: inline
In-Reply-To: <c6yyhxzqfavqjphumemgjn7ick4ddjzhlxfjb6wtgsfvdetdqt@radooxy4o4mx>


--KbqwGrd1llsCvBnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

> > - "i2c-scl-has-clk-low-timeout"
> >=20
> > AFAIU this binding tells that the controller can do clock stretching.
> > But what for?
>=20
> One of the controllers that was sent a while back required some
> hardware description because, in some versions, clock stretching
> was supported in the hardware.

I see. Still, I think this can (and should be handled) with
I2C_AQ_NO_CLK_STRETCH.

> The naming is a bit fancy, but it depends on the specification
> used as a reference; SMBus, I2C, or specific drivers often refer
> to it differently.

Yes. I'd give I2C specs most importance, controller documentation least.
And probably a salt of personal preference :)

> > - "i2c-scl-clk-low-timeout-us"
> >=20
> > The description says "Number of microseconds the clock line needs to be
> > pulled down in order to force a waiting state." What does "forcing a
> > waiting state" mean here? I don't understand this description.
>=20
> It comes from the specification. The clock stretching is given as
> an interval that can be tweaked depending on the hardware.

You mean the maximum clock stretching is tweakable? That, in deed, could
be a binding in the future, in theory. Yet, it would need support in the
client drivers. Like a touchscreen driver which assumes a reset after a
certain time of inactivity.

> So far I haven't seen anyone using it, though.

The MPC driver used it, just for a different purpose.  It was used for a
timeout of the total transfer. That's a different thing. So, I suggested
the conversion.

Happy hacking,

   Wolfram


--KbqwGrd1llsCvBnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXdi0wACgkQFA3kzBSg
KbZOehAAl2QMPUg3dviQislT/+HYpnK5WKVFXRt5/KzfdI/nKY5U/c+mcjLxtEcV
3i9jctgQ6v0Ww/8eOj419UDjcUe/FEd9EknmiAngT5vEMMMvRiJI9DlkA3NxtMaz
2tcpYlpZWmnrR2eyvkiHPKascOEM/igjiZl3ThP84TjxeWC+XmxiY5GhrM4DoN9R
/B7nhmJT3P330Zrdet770nRv7IbwfzFxKORjRMJKsCYbT0fE/0YS9kSOsUmJSEUQ
BAZrJ73mllsj+sSKQHey1Xf8bpofSinnsPKnDZ6QLZfG36Goie1kuGsTZZYRQ9HS
vSStpb4nZhCouEQlrmWMGB+FLmLfdS/wkMdw90qaHPR9Nh6IphDB8xxGS6GmZwAk
6oiMgAo6ApVx7t0NaetIVlOphdDV+71vmx/ahmC1irtM/9RKBQ42c88L3qAEFnA/
RHQsLtxiE79HfjOCoLA/5NMAdxkWjGWSniYQkOFlgZDDvvsmNdkdKOdXJjm8Iaua
jID81NOOnv9nnb5hJxkqiH0lUTwgClD2D6uOIufVXR0VlmNMUJOMZ63l5LjsJS39
St8b3qvs7b6bSTL2VJ6XNISAV4B6dMZbY0o8SA/D4luUVnC0tiyMjG5ttiIkn/O+
jb4sPpZgodGU9Kwu+KdrYAhoQrmDyScKL1tsXgfjcE62xxaD81Q=
=OLtv
-----END PGP SIGNATURE-----

--KbqwGrd1llsCvBnc--

