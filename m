Return-Path: <linux-i2c+bounces-2012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF908682CF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 22:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD0DCB23356
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 21:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A074A131733;
	Mon, 26 Feb 2024 21:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cy2sjjbm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B72131724;
	Mon, 26 Feb 2024 21:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708982222; cv=none; b=QAr8jZuEOR8Y7MLev9SakDU1iOo+mL7eYmzsP3JyFuRW8llLvPH6pnTxpArAKlnJ+K1iFBRBk2FdgBnT9F/sh+IR6gHIPz0KVKf4GNVyEAzb/bdQSiM8tzWsTW3ldRMWiyM5JkKLvQyz+2H3cexMrvJZET4PFZ1V79fCl3mkbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708982222; c=relaxed/simple;
	bh=TlFHGRpMN2lIP1KCLVIFbZ2Q8+BZdD4XBsfshvJl9X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkkQdqMLAp8DGh0VqZWJ2TDbqjjBMdY7v2BMAQOOARAkNhzv3NA5LlLoPCEcpTnWS/QzjwEbkoz645B3rdSNbjN4QndEIEEMmmS9ZfQIYh1pg2MLyjJcJJa2mRsDw14c/Prw6t7T4RMNQZdU66SidEQTxjfmykaErUQNKOO/Okc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cy2sjjbm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494D4C433C7;
	Mon, 26 Feb 2024 21:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708982221;
	bh=TlFHGRpMN2lIP1KCLVIFbZ2Q8+BZdD4XBsfshvJl9X8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cy2sjjbmB4vmJ+q7kprnwsTqvJ1VEDx2StVugBIg0rkyjnnuc09tKzvBPOwA9x7rY
	 coE4434XW4y562yBEzQEgSr+lU0MkepivxTve+usRU2Mp5iKNtWnc0aC2HFXTR/50s
	 cO9hkybOxSPN+jnYXfImkT1jiL7S1JhhyGCt6OF6MMDOIbdUjL8v/B5EHWYbbSr8rV
	 3GQ8NfrbZQgBfr6GSpkXDm47P8iUoM9BB1Fktxf90SB4mPeQoOFdM0/EzSPftJNpYG
	 +txCLGXsgT08BlzPoGN/zvg71D0fv+kpQFPdzX+2Gs6PpVOQ6+DVNtxAZp+edw8ct/
	 ThBEurpda2s8A==
Date: Mon, 26 Feb 2024 22:16:58 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: dtschema: i2c: messy situation about timeouts
Message-ID: <Zdz_ytwYd7A2sGsP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <ZdxjGwvGXlDGkYs0@shikoro>
 <CAL_JsqKPofALm60XpexAVXj-cYZXyqo-eY0Z+Sx5q4QV0193hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/g35/2zYLCYErRN/"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKPofALm60XpexAVXj-cYZXyqo-eY0Z+Sx5q4QV0193hw@mail.gmail.com>


--/g35/2zYLCYErRN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> > - "i2c-scl-clk-low-timeout-us"
> >
> > The description says "Number of microseconds the clock line needs to be
> > pulled down in order to force a waiting state." What does "forcing a
> > waiting state" mean here? I don't understand this description.
>=20
> Does the commit msg or PR help?:
> https://github.com/devicetree-org/dt-schema/pull/103

I checked it beforehand. Sadly, it didn't help me.

> > It is used in the i2c-mpc driver. The use case is simply to put it into
> > the 'struct i2c_adapter.timeout' member. That timeout is used to
> > determine if a transfer failed. So, to me, "i2c-transfer-timeout-us"
> > makes a lot more sense to use here.
> >
> > Suggestion: let's remove this binding and conver i2c-mpc to
> > "i2c-transfer-timeout-us". Yes, not nice to have two deprecated
> > bindings, but things happened.
>=20
> Maybe the core code should read it instead?

That's an interesting idea. I'll try to implement this tomorrow.

> I think we should mark as deprecated rather than remove unless we can
> just remove the properties from the kernel. The reason being that

You are right. I should have said "depreacte" instead of remove here.

All the best,

   Wolfram


--/g35/2zYLCYErRN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXc/8YACgkQFA3kzBSg
KbaRWRAAsBO28jn8Qm65w+u9xT/M/D+M8hiSbM30Y1+MSLuGyLW7P/F5YZ95KKiH
kTwoa51LoL2v0uN9hdUz3Uf7NOfdOhbJuP3mjdv/XrcmRjRH/kdNqGY5DpARpLO8
QDdtnvqfqzS7YD5kK8CajXS89T2MirmBwMevWJkW1rAIJYT4V35QiJpajspLsmbb
+x0jRHODJwKeD5+9rko4zP3TmtfdWVBRuxs5SR8PfsBA0of6XrIqQ5Cy0kqiK03R
MUAKKjrfY29L6/VaaEyMNi8AuAReDTOnfZz2PsA0y2gKSCXls8W8vnewgbvnZ5M+
PhxhrcnQtZhwEZTJfM3Mt7D6AgaQQhVNzKtHX33MOozu2xmrld6LWrENAQYfERCK
se1cx9AnlyR1aJrQo0Vk7XHnYR850cuU9jeVh0hNO3pwCwHgIta2oi0hsV2Mc7EU
dSyyujwsESDYPiezaiyAal6e8MjzkdnePygGZKdFCsiIdu8TjayJTn5Uo3Vmg5Ti
JRbjgY+uOxcpgPMxTuNsDHuXduBWKpHTJC3aB2j3Ho5h3QnHNgWYqqbnEbswHN/I
dlXx0nubxxn5AvpGOFhHs2Z5sB0Ry+7ZQPDQZVAUZlClWi+2V+LV2yFreQHV1l/1
Z5QakbwAcN0yLl+pNqABhiRMlvzIv2/oD1q3HD/OHdp//2b3Nfo=
=amoX
-----END PGP SIGNATURE-----

--/g35/2zYLCYErRN/--

