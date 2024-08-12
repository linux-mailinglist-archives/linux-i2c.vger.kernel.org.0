Return-Path: <linux-i2c+bounces-5304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9A094ECC9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 14:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 578CE282E96
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 12:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF04B17A58F;
	Mon, 12 Aug 2024 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZgADc3nq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7EA170A36
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465325; cv=none; b=fk5+V44xVmKN0jcRBga1NlOmtUU9lN8DPt0WRS7T0RXji6KWzZS87qZ4DjfADpzYb7oAI6b1g9XrAby7MZRixPzgOcKz4aKeYFKKUZyP3Pvbt92FCj0uKJqyhxqcA3DVW89tdWE4+m88Faei+sFPj69ND8N8O7u+Osynpmwcjas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465325; c=relaxed/simple;
	bh=nGcftqlwgnxl/vT3ar0EQUng1CmB3IEYmpbTbYcyWwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WD0YtUnSRK8878S73sJuUdeRJv5Xf4RZbeB/JDR9vScJrICbkvCpRPGhhuT6fpFo7FB+651RDiPzsj+KVndlUOM2s7WXdFWr7iaqCSjZvT2EMpMgUslrjHEcseqUz4G+fQoX348FmMN6b8nV5psjkz14qTx4V8HTVxTNg/ytTcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZgADc3nq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nGcf
	tqlwgnxl/vT3ar0EQUng1CmB3IEYmpbTbYcyWwc=; b=ZgADc3nqBIciyV1GO5I6
	ZhmsNjhmf2hrNE2+JpbTTbfSy5MymqkHr8Jf3XOmc7GqfQ/NWaCitdBuUDC9U1wa
	WYVlk0fYqxDQTPFNgysR/m67hs4K9VIqqUU/77z7GIMCz9ZvsCi2/Wj9wzW9ENja
	6AlE69UlQqKeHa6KRd+wEqPD30UjGuQu3vG7O0K8E4gVQ9j5G0RRYauF2e7MbUI8
	BauhSzvA8yDD3dSxsS3bkQkOiA5ti5ZBgCsa7YqB6SwcgvQ7rSeTxhUVYN73Zpf7
	7TWh30iVfGxjRJZ9z7DgoohLGJ6G2jAgDOG0hzbcUNwRCnybJTw9lVKb/bfXT0Ik
	kA==
Received: (qmail 1361653 invoked from network); 12 Aug 2024 14:21:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Aug 2024 14:21:59 +0200
X-UD-Smtp-Session: l3s3148p1@9r8finsfkpgujnvj
Date: Mon, 12 Aug 2024 14:21:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Message-ID: <Zrn-ZkgYKVquarDX@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-2-f9f6d7b60fb2@cherry.de>
 <728a8e06-81f1-4771-8031-ea043b9baf20@cherry.de>
 <3a36e89b-b4e2-4eb8-9197-a7a1d04a7fb6@kernel.org>
 <ZrnekeUKciV4eAKC@shikoro>
 <f6dfc6cc-365d-4f0a-9a4c-dc34cf4c5b7d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sm4JRBD3k+rtmVkV"
Content-Disposition: inline
In-Reply-To: <f6dfc6cc-365d-4f0a-9a4c-dc34cf4c5b7d@kernel.org>


--Sm4JRBD3k+rtmVkV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yep, but to be fair the patchset did not say anything about
> dependencies. There is absolutely nothing in cover letter, nothing in
> the patches, so I do not wonder that this mishap happened.

Still, one shouldn't take DT patches (which are even the last ones in
this series) until all other patches are at least in -next, or? Yes,
mistakes happen, so no big deal, but i2c is not to blame IMHO.

> Depends whether you rely on being CC-ed here. Existing entries do not

I don't rely on CC. I rely on patches being on the i2c list.

> include you, thus you are not cc-ed on maintainers. Peter Rosin is, but
> it seems Peter does not apply patches. It could be intentional, but then
> I understand that all pings should go to Peter?

Once Peter acks, I apply. He is the maintainer. Yet, he is very busy, so
I also apply when someone else I trust does a review. He is fine with
that and might chime in later, if needed. This patch here did not get
any review, sadly. As I said, resource problem. That being said, these
patches are somewhere on my todo list if nobody else steps up (what I
would prefer). But please, don't put pressure on me (or any other
potential reviewer) just because DT patches ended up upstream too early.


--Sm4JRBD3k+rtmVkV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma5/mIACgkQFA3kzBSg
KbZH+xAAsT9Fv0MOTHlN4rWnmaEydjOU/Ati2WyGH+EwuX5r/Uh467W0Fxea3Vfr
SHLsDri1HFk/IjrYjx1aPoIzrm97JOD6K52gegxuPm8M/ckee0H2Q/0bR70Uk0Kb
Bac2uI+6WHrTMgPp8r0VN0rrnt6dve6DSjFAQI8InGkiv7C8jcL63X0ZujsPCA8R
QMgMYs8aC8dPo7uTxVx9FLS7eFZiATQ0TIYV039kQElDRunSiCqfRLaYbhO47lv8
JRZI3AvufWAv6SWF66/Qs0yyzPzIla36tHSS1ZqpyU15OFIg0H8nw5Yy9XA4xQ03
XJiFg/AfCWrX/1K3+L7qVRZxCCiWRs4VFRj34OmyZnP+ND1HUlnYhWfmXBpQmRVe
D/+mHc5mt9trzL5hd3ASkRIBwpLrHfLV7wexwQOt+ULdfhKRYZ7E4b/PWS/AbL8l
Ni/rb6uE+G6/S/9B1dZ0NV1LUeMKz7Ffk/7O1Fs9b1BXRLVIDfkJF5vC28UgHcwL
j79SSIlC7bqknudsbcQm80NCi3oBHth3PYdbMafBysBL3kGRJX7OoT+/un6kzIOa
uHDgFOc30O93QWw5S0ZBib/SpAPBaZNGuo08zqfXk9Xx9Pii6kk+oHRoy7F7mYVz
kbdq6tFWwz8Z7TyVpY0OsQ2S+uTqGuG+JFXHYxo9D7YATCQ7wvg=
=5FhI
-----END PGP SIGNATURE-----

--Sm4JRBD3k+rtmVkV--

