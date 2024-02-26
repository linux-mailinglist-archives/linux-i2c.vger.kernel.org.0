Return-Path: <linux-i2c+bounces-1971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76594866E1F
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 10:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31B7F285F99
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 09:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6A91CFAD;
	Mon, 26 Feb 2024 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhxK74p5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA731CAB9;
	Mon, 26 Feb 2024 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708936921; cv=none; b=MtyhUdLqDDmfBTN6m/2fDWEj+5YLqVn4gxrERghmm7JvAbuuMmb3Z9qgAqyJWxfyUQE1GrdrLgWlNNRf8GmZE1JgGTckUf4FnBh5BKJHAsb00XPTjCdryg4l20K9EJTXUZrhf8RE4Helsnwm+lg7fjzXh3+vABPsoakeC5QJX2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708936921; c=relaxed/simple;
	bh=cEt/RUX0lThydTXPuAPjsQ4gTtxmbYh9mUY2ih/P5eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lgoa2lH1HtwcJVReGyz7arvvVQtz3Fv4IzVFLBWpqN7gv5OlKiSBNKPC9wjixj8tPK6Ux889p2gdzvY6irX8emImQRViMcJpkU+ng2rM8yBQLbHljRT0ZDio/ugBzucVplSX88AWOs8hlf0M6C7Fd87vXRNYLjoiHc/8A0JbLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhxK74p5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EADDC433C7;
	Mon, 26 Feb 2024 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708936921;
	bh=cEt/RUX0lThydTXPuAPjsQ4gTtxmbYh9mUY2ih/P5eY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bhxK74p5YtnC90wX4cA1Nmh6dihZgxJSx0HfRpclARKsRDJgwhBWWCv8326q1ug2N
	 2JFQ7+Iza+A2uMQ3SiZHUSNpWZwkBny21B3zNprSQiU0y8cngnSQHgRNevUoVWLm8m
	 HXLud7VnN5zexuXuXfCPoFlIA8GbHAdY0rw/rrze/0M6vXE5QxcXzTHb9LFngavUve
	 PLK32NGc72b339ZIYVDn0sK+xhBiqqtCAlpbIoMlmnaIF+Spxt5mmxxnGK9577VlVL
	 DkSLoXgQ50EpTYa78kPAzChTIqMPYycE4fgxmJgOZrjEVhISnpnti4/NljL+vqc5gr
	 4zCS55d1gAX3A==
Date: Mon, 26 Feb 2024 09:41:58 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
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
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
Message-ID: <ZdxO1l408x7kMwsB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
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
References: <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
 <20240216022704.GB850600-robh@kernel.org>
 <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
 <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
 <CZ94LGRSF9KN.15ZO1VRMIQVR8@bootlin.com>
 <CZAX02IL1N1J.2GQR9D73GLRZB@bootlin.com>
 <ZdY2WzKbElloXC4-@shikoro>
 <20240222171404.GA3334332-robh@kernel.org>
 <ZdegTjJpDJGEgdvo@shikoro>
 <CAL_JsqLk3UbrXAymTvLQeeS-ACY7makTVYxa9CetO-G-v3TuqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jGozXIullJVYR1fu"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLk3UbrXAymTvLQeeS-ACY7makTVYxa9CetO-G-v3TuqA@mail.gmail.com>


--jGozXIullJVYR1fu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

> I'll try to make sure you see any future i2c changes.

Thanks, if you mention @wsakernel I should get notified.

I looked into watching specific directories in Github and I found the
CODEOWNERS file. But code owners need to have write permissions and I
am not sure this is worth the hazzle.

Now on to checking that remaining binding...

   Wolfram


--jGozXIullJVYR1fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXcTtIACgkQFA3kzBSg
KbZ0Eg/9GIPjjbNJOCUz4gJoECPA7PtwjD0jB/4iW1OQQ32akslqKMkl0nIx8HCR
chtQDMDl8xFHw1eQCV1FWFVorUoVEslcDJDX2CCUUcJGfimb8h/W6AwcEHib7mMu
nnC/0OYBmDCQ+AU6A9YUYQRkF+j/zclDay5U5v9VNu69IDiE/lyZfem1zdDjJjD7
WszhKsNhxItWKdWGvURKLkGPpB3jVJqaeaidi9QMm6IHIBLSmHf+fUWGRlaavpG0
PHLZ2BDXY3+3tZm9oocAiK8CSJeAoo1DXSuz/tGNjamV2cgkDP9SqEaG+4wMoVKI
pb6FeoKZQrAPCeNkKstYceh8AZtZY5HpgOKib7LhwhMWvJ92nstFU8++7qzus1np
ibixz+VrQc0Pjm/HsO755vVeyleazBetuhCMHnq1yiYTAad7kkS1KQSFysSaWJVg
aTbdPC3khK22hZ3kdiVtUw2Gaq3b97xMbx0r0yM3cA8VW9vwUKMNBCVRLtTIF9so
KtTH1n6ZcPUaLaW6wzYXK8+VsvduSuBVLMFUWum+pZJUL2fxkvJv4z/Tj6zaViqa
moWgVDVciK+Mh5y6LsvedTXU2Fdtiyoi9VtQTxy+GtE6htoCPGu8DKphNuFHxNCK
crfhE+pwPhqrtHX9XDWgvzKEzVgSHG9XQ0mCn/rpShWu/KXQ4Gw=
=oPtZ
-----END PGP SIGNATURE-----

--jGozXIullJVYR1fu--

