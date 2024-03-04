Return-Path: <linux-i2c+bounces-2144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84C87007F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 12:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B7B128450C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 11:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885503A1A6;
	Mon,  4 Mar 2024 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hskPch44"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D49E249F3;
	Mon,  4 Mar 2024 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709552277; cv=none; b=nkd05dgVZiS2MPvhbz+ZTLXZFLwC1MPqtrA7Xj2coLsPhQ6InBp4OyRBUVmfv3QrNah9UrBGAAGPx6WYFbyHvU/ntKb3acFAjFZ8HVMg134A18d3/YcRHuAPjHyFgtizrSGFNwps3aCCe+ADyG6CYvnRJ0pjHIAon+hLCDUtzLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709552277; c=relaxed/simple;
	bh=5TZPumrHu7nOZMaUyKuATS4UdYvQenVHwGCAR2gaiC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBZvc/cJNyIDT3OcwnqFruaGcFmamsTc/6ddjVxgnugQ5YOmhjXkD/EW+oR2S7rQ/qP/Vx1FnFo6OQstlLkg3I04TiHO4sftdQxjeWp8PRNe6sG9/Y0uYT+c4JteZOwo0ANuYEkqrT7MIejRMsa4K23Z1N2JgBhF/gchBSE5l08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hskPch44; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8EEC433C7;
	Mon,  4 Mar 2024 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709552276;
	bh=5TZPumrHu7nOZMaUyKuATS4UdYvQenVHwGCAR2gaiC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hskPch44nM09zbxpIg687TMJ6Q/lTPRAkyILKLkBCstGwd5agQW0C3sRjmLOZbVE7
	 1VT/lRMMmCrTBr9HWlZSVnoLvQmu4HbAG/JVGProBIIl12Rgr0f7j24yUe3thGsAyB
	 ymelxx9kV9eT5NK0l/cohW1K1E/JGmuRDHQG5r/1oMinaRc2zIRJF9HR+CVJbNdpf0
	 XDs/zl8NABdL08nR+z7EIp+6K9m3Gq3ZvoMbBpOzrrgWJY2TFnuFp5D/oZBZNVh+iC
	 zQ3mXvCCG26HrpJb76DV+sJfhckEfPlx8dtp3sH3pXHwtOAbqaZYK5cr2sGFWJeOvg
	 bFKk3S1gZMfvg==
Date: Mon, 4 Mar 2024 12:37:53 +0100
From: Wolfram Sang <wsa@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 06/11] i2c: nomadik: support short xfer timeouts using
 waitqueue & hrtimer
Message-ID: <ZeWykXrurq37dtKu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>
 <ZeWRyuN8v-VnraQA@ninjato>
 <CZKVXSULAGXC.1C5PDQJ6KCHN@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5oCfEIbf9yhEOXcl"
Content-Disposition: inline
In-Reply-To: <CZKVXSULAGXC.1C5PDQJ6KCHN@bootlin.com>


--5oCfEIbf9yhEOXcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > -	int				timeout;
> > > +	int				timeout_usecs;
> >
> > I think 'unsigned' makes a lot of sense here. Maybe u32 even?
>=20
> Yes unsigned would make sense. unsigned int or u32, I wouldn't know
> which to pick.

It gets (later) fed by of_property_read_u32(), so I tend to suggest u32.
Sounds like least conversions then but please double check.


--5oCfEIbf9yhEOXcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlso0ACgkQFA3kzBSg
Kba7aRAAp8MwXqIV0LPiw5/f0gf9Ya9eqn734mD8kNjabJrB7OQ/XDq0cBrG0bZr
QTGhzV0kmEPcA7Eg3ezMaIuFiooPqnhWkIJNMXQA062XXMjrNrjjk44zZz+zHcIY
JAUW/1fNcPgeTN5DbFtfRr/4wxPd78niGclcbFtIltQewyib9ecyXS6SMhFldi9S
OlEm2p6ahwF8Cq4DKD3GgtjrEjDr1QGPh4ct5rsJ75dLvNlLvTDPxUiIA09RqQMh
jOhfUL9OpNdcNRsz7pSBSmgM4f03Eb+jocKB3Q54G3wQHBBAMeSPwDWj/fGYpf+L
83eJkRl/6Zlp1XupCq5gK64qiJOeOhnMSNuvY2cKypET9wacdUKvXvJw6/Dd04xA
+MgwTTpilIJUZZKMT1r3mjTGUbcod+9odmVXOO0KvgJBxErGBPzNunSZcePC/sy1
CYnCdC65q8P/XAgJnftDHFGFWRR+0zbUU5aJTPLfJMD2j4B/95EjR5aSJmErlaY5
bI5m0FZLKif/w9hTVKLqaPdHWMzDZUUW3cadqRr1sINDQuVh4decxrVss/9bZXh3
NXc10UNRPI+SYA7vMYuWFXtvMS6D49HcIH7iJSyEdFXqB8Wl+3ScGCx3UXrYUyFZ
doh/MmTSP6huxKuyQyspeuVJsCoAZJRWqEr4+tg5YmnmIIH7kK8=
=aOD+
-----END PGP SIGNATURE-----

--5oCfEIbf9yhEOXcl--

