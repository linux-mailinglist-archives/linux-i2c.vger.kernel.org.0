Return-Path: <linux-i2c+bounces-9947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16136A6A676
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 13:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FF9A485D6E
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 12:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039B417BD3;
	Thu, 20 Mar 2025 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ISblEG1Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C453EC5
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742474999; cv=none; b=gzS9HHsHqUCACvuidf+5kTUNPlBlodNiH1rPxqq/2+/4GUeiyt85BNcI4iLRGAwcZOc88xFeVDT82bKQf7MFSJ+Ks4yLpXiRVNhqSZtbrpgSXixlt6HDc+keMDxOYtt6Bo9wBiL2Yzb5URPRVTiPytU73MPXUYa1/7e8I9UTIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742474999; c=relaxed/simple;
	bh=cMvE+JlI8RJDpCMGanqAmBzaChQf25piZf0jsfxHXp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVSibcOhcWfvlCUebw2RH/XbgbetnMoyvxNyypmkq1SUuuZKoQWVH9WtpVOP270vuURIVkZDUm7FicO0pZbYU7ziJ1mNBvccrg9PSCdeg2he0R3Qxmq2exQkslPzwTjlXHD1VpRXn/Q65thfcAYXwB1HJuSFJ/cploQyzSCoIU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ISblEG1Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=txvx
	9KCFrfF8aRLOeltDIvK2zbqOXhw2Zh4y2n5sWjs=; b=ISblEG1Q51XVDPnZGfh/
	TXcWYVR+LzOyFcaOf76zGr4D1Oo0i0rIKABaYDF7Naa0HcqEG/ZP5YcFKBFxNCtw
	tWOKXOWHlR8GnunYR0ma1192m9xjLZ1+e0LGpr2DTZqT19g1LadtO52tSw5MpsYe
	cK2axQvhFQYLXWr4CO4fPJGY3/RqaiLaVqrnMPP+BEzHvU57gfXUxVzYr5ppfNnZ
	MbUQTV1XMMRiesnIVCh5pB46J/6PqGjiByd4sNelnKHbef5efFbp/oeZVyjxxyFf
	VEAKc+S148NnPGLEVt5TfwLp13YhuYNy38sWVehiUmz5lu78KNgA4fHXevuzELCQ
	9A==
Received: (qmail 668798 invoked from network); 20 Mar 2025 13:49:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2025 13:49:53 +0100
X-UD-Smtp-Session: l3s3148p1@tM8Dk8UwDNwgAwDPXyTHAJp038nK7dx+
Date: Thu, 20 Mar 2025 13:49:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 0/3] i2c: Introduce i2c bus extensions
Message-ID: <Z9wO8SIy1CcfO0bZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bNRjihevQH0RPQGp"
Content-Disposition: inline
In-Reply-To: <20250205173918.600037-1-herve.codina@bootlin.com>


--bNRjihevQH0RPQGp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Herve,

> The related big picture has been already presented in
>   - the 'Add support for GE SUNH hot-pluggable connector' series [0]
>   - the 'Runtime hotplug on non-discoverable busses with device tree
>     overlays' talk at Linux Plumbers Conference 2024 [1].

Any outcome of the Plumbers meetup? Was this "double-link" solution
agreed on or so? I mean the code is the easy part here, but I would like
to have an agreed approach for handling all kinds of non-probable
busses. I really don't want an island solution for I2C. So, the key
question here is what do DT maintainers think?

You sent code without bindings, but I'd think the other way around would
be better for the discussion.

Makes sense?

Happy hacking,

   Wolfram


--bNRjihevQH0RPQGp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfcDvEACgkQFA3kzBSg
KbZX9RAAh393rYZAyzqeRBdmTJau9tqSbizH8NtFkhnv0PxG3HlPyd+fQwHlZrID
CTORu4/u9sx6NVj7e41DUhPBCIZZzqAVK6ZYGp7osj/qJB2AFumASzaNZaBaNIT8
qi2QaP65FqU4ZhLEJWpWU1oYDDZT0HdN1W2YyeQJWC7CUN8cDbumqB8D7sIWYvFq
9mHqjpKkS444f2aGYr2C8viXZwnUOaizc7SPbMdYlRu+BW6Qcn0/UCnjSrUiPVJ7
22UP6rc8hxsdycUIH7u2yQW5zDFRP2Hl6mfnR88oODTA9Uc5KwRRF3frJcrmig1U
V61vxcObarroCrfXY6W/c+b/0ui1K1lV/snpLh7VJWVMUUZy/f+AUTrNRoq6MjhQ
ejwevyCjA7PdmFScaniHw1iuniO0+2Ta/5+hI/fps57TaKSiuUb53UMKE5sqJHJk
iQBaVf+MajGg0ScYOgLm2ywvCywLqqXOqmv2lpvKY26uDmuUdEy6FFafUPvHZDMA
K+4Xo3cz8UpvA1RnI18V6zrqCevO0OdPpHwd5R3GlO84Es1MjNYGQGJvZCn45pJU
7WppwpMw1t7CphppoqTtRtUkn4rxpVLWsuc4orAqGJnNh/e1XF0svPc9PTSpYD28
SvB66ys3t0hAI+9rOLb/VIvrYctX7YMCj27h0dQcy5WsXyj1ZSA=
=I+6E
-----END PGP SIGNATURE-----

--bNRjihevQH0RPQGp--

