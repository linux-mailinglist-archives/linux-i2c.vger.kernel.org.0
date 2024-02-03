Return-Path: <linux-i2c+bounces-1625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 157398488D9
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 21:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1F71F23694
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 20:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF7712E42;
	Sat,  3 Feb 2024 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YO6faOUj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DF6125C4
	for <linux-i2c@vger.kernel.org>; Sat,  3 Feb 2024 20:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706993424; cv=none; b=ZV2jtPAFwiurvxP/FQfkqx9K5E8Uh3dXKGtaoIboZo1JIeteNL4oJ4omDQ99awvzZadoo41SdVhmpTcJhsT0LdJBgbzITVOvaKX/cLMXYIMdaBYUmZWse7ZoRQ561P5jvElVk/GJrAn8b+Tqt4k+F04pVPS3sTTKr7hNLlxpVT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706993424; c=relaxed/simple;
	bh=xePqWYngfc/yq2/sD9HDN02is+mgDkkCQZQLeMjGM94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUD70buuN+MQ1n00Nj4LLSXnGEUqirN92+/x9UAW78zURxURVFgUmTkRy6X6V3qvG8HgSItJZhrFCYsFzp+EXEPKMyeSPNreHF4T6OODlCiU8n4gvMN+mwTmNlQ0cwpdyQ4SkKL6hrexpKTBc3b/C6UR8UUlc/zT3+4sIi2VEXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YO6faOUj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xePq
	WYngfc/yq2/sD9HDN02is+mgDkkCQZQLeMjGM94=; b=YO6faOUjr2fAFrfc/lmC
	7le2/pgajST3jZp4/lR8DsJoGgOEnKrjJ6mo7NY+rSzv9N9bPULWsnjGHJhCCYgn
	EYwiFG5+3U6j/GBvYC07PMi7mCTfk0ueQen3dVCyeTkvbdYF500HBw7aNLX3VDJE
	VIYAcZ7fppsl1xs+QqJun+t046n0Qe35Jhmarv/nyvVzmcMXpDos1QPLHjgwPQQv
	EdxVgHTJGij7l7GhdhQ2xXsGINXNTGnrB4PEm4gHWoToJm14/sp/25dnX9ZMC+oL
	nK/zgzVzAGWp5MNJ1EMGTkl50ijouibN/eyWqk7EWNIPl8I7goMVz3cRJ9cA4FPF
	rg==
Received: (qmail 318205 invoked from network); 3 Feb 2024 21:50:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Feb 2024 21:50:20 +0100
X-UD-Smtp-Session: l3s3148p1@e9lsYIAQyt0gAQnoAGo3AKaQ4acoehG5
Date: Sat, 3 Feb 2024 21:50:18 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: mux: i2c-demux-pinctrl: Define
 "i2c-parent" constraints
Message-ID: <Zb6nCklaW4kcS0vV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240124190552.1551929-1-robh@kernel.org>
 <20240124190552.1551929-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N69jQiHWPrUeL42U"
Content-Disposition: inline
In-Reply-To: <20240124190552.1551929-2-robh@kernel.org>


--N69jQiHWPrUeL42U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 01:05:51PM -0600, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. "i2c-parent" is
> the former and needs to constrain each entry to a single phandle value.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--N69jQiHWPrUeL42U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pwoACgkQFA3kzBSg
KbZD8RAAglNnl3V8ZX12AaL9/Iz7lVTZ1OFtl/H4kt6/6/wIDjF2DMd+G7JfvnDL
RHGgqRzq3K11WmJQDwX0KZIlGQ9of+WOXiQ1YQSAQyZKgC5UatK286cYvYhb/0PS
HhwD5GdO+oN0jlDJcuAaghwYwWgWw7rj2RX0ixwS+/wl+Dn785U45EqYphp1s20U
z8i6+Gkfv+rnqRTHVihe9zrGe1rf2OAmufdS2mC1iq4gLKI4jlzsP8gevi9Idx5J
3U2wr+2zXq9jrYthaif72Qsz1PxYlQsL9+05R/gL0BHM8GYSUrBpN+MTADqnEDxa
cfU9rVKBuyjarrEtPh0xsyhZaEdPGsaNq9Q+cr+RxxOlABJfQz4RpVCEUQu9oegK
Cyx2USjngAiFgXnj6YjrJZ2gKSA+bdbTQyLITzLakZY5A/fGaAUHRg9oJSQzVXwB
0AkLPgUXgkYQ1OtPBM23Tbi8Z2IbtPjHojt7ZmwXLAAuoWXUGlgof3A4XTTYFSR2
HZkna/ji5/Rq+oXcqZXXJyQA8H6ZCfpLS3A+RgPjXjSqEdzQxD865cBFhlQJAmRW
91oHN8lvu2NlfzszkfPZlSa/9CMjOeSNozxYZmdQuyws9xUWXV/ICXh1J7B4R1IY
amr4Cyhrw33J7OUaGOcVWhngRBd9DllLEKW431R+pCyhuiHE7yc=
=5RWX
-----END PGP SIGNATURE-----

--N69jQiHWPrUeL42U--

