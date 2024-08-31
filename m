Return-Path: <linux-i2c+bounces-5971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7D967265
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2024 17:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D4D1C219F4
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2024 15:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FFE23775;
	Sat, 31 Aug 2024 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UdCpnIch"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469453CF4F
	for <linux-i2c@vger.kernel.org>; Sat, 31 Aug 2024 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725118302; cv=none; b=SR1upfH8mY6j/wn54dWp+0ps1KGmYeYFePdIhslFV9vkcNHJywKA4lytGIf/bjo4mMRzG1BsAaBARMPL9+xwrCKCq5BgbKl9WCBth35/I6gY7VZFxn0s+7gRCmybayi5i+FoRouUq0PBMJjfRbdiC4wBLJCHimekmXWqVshMkQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725118302; c=relaxed/simple;
	bh=DYZUjdNNimKGZoyJCELSptbQ3XZTKhzJH8kg6cdiYs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJ6HhW8BcHnjsuS+kXabbkHBIhOs8W1b1685wm8K2LQrNBDaD0FWr55btQjwee6vn93PoR35VItz1ZD7jHzeLUWDsCnAz5agjcIBXd+rmvjCmg8mT81urNdZYQGYRNLY8AfPdMiYzpj+17Z3YKJfPEjjyBjToG9fLGqpxCugY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UdCpnIch; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bPIU
	QgoAX+ZCwRz2joXdmT6IKhlmXSEgTdTYNX/r8Ok=; b=UdCpnIchaOKUq1DkMJPg
	Lr6tmEkk//ctS+HH4nKUzxhQoC24tNgjYteeiW+fPnd3Hi1I/LQ18+CTEk2rimtI
	tAJ9OaM/EFl/a0LTKLhumsrH7hU5H3w5nHwT+ORzFRnfX1/4oBJpi6LKRodo38GP
	JmBzBU3Zd3tRIbFq//nOz76Y5mgqs+fgYvN6nBYu/8G2tLQD61G5n4pYsb9bGiy+
	DxuQ+IWUo8UDGDzy4n20dtX3uvHyaHrb+2j5w0AttgagVeG0aAB4+++IfUuTOZcp
	9DbW6cBzVNtwC3skpFoLd5XeOlLvemIUSnAIBKwAt/kh4lGLd/ihc3Bl3kLx7w9v
	DA==
Received: (qmail 3580804 invoked from network); 31 Aug 2024 17:31:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Aug 2024 17:31:30 +0200
X-UD-Smtp-Session: l3s3148p1@6ZXYZvwgpUBtKnNj
Date: Sat, 31 Aug 2024 17:31:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: document
 SMBusAlert usage
Message-ID: <ZtM3Ufj1akqZckuu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
 <20240826150840.25497-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdXiOLPm11-nBnFPC4pRa0WP1VviwCwYVVPHAeHLgXLe0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2XyhbaEh6F/M9F/x"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiOLPm11-nBnFPC4pRa0WP1VviwCwYVVPHAeHLgXLe0g@mail.gmail.com>


--2XyhbaEh6F/M9F/x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> IIUIC, this is not a property of the hardware, but a side-channel
> independent from the actual I2C controller hardware? Then a generic
> "smbus-alert-gpios" property sounds more appropriate to me.

It is not generic. While it is true that most I2C controllers do need
GPIOs as a side channel, there are controllers having...

> BTW, are you aware of any I2C controller having a dedicated input pin
> for this?

... this. Check 'i2c-stm32f7.c' or 'i2c-xlp9xx.c'.

Thank you for your comments!

   Wolfram


--2XyhbaEh6F/M9F/x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbTN00ACgkQFA3kzBSg
KbbcSw//Y4WgmjqBjMOuIktpE/VH08udl4GEalNkhyfd4rCNIfg1OLt4YXXcO/bN
mmSkQ3vl38Pp/Z7U+9Kg2eHIQVfON5QQtjVXhor+b9ZVEgLSF+Miihyhh3KjbUbM
FupkhZhq9kJV6OumBIqWkVzYuAJMTPtdn9YIrDHbtDiEZTyYLQmHeJdSoNvXA/n4
vpMkzmwyH5cQr2SRzHrguR/zvIddBtIFEfSDr9jFj0LzZ0ovPaSrdYUHNz3n3lFS
toTH2lgicwkPivVp0sqquxVjxtALEno2oNMjRVN2pMe+LhFjdmD6A4vm+uYT9PAY
iUBCMS1wlopPZsdgnZTAyyuAJ0U1iVGrCtfNypRqy5gL6NYnZpNa6uPm+80ZjW3q
UM+P5cBftbMXxu3s3Sf5dhE8tUi5voKlJmd/6OutWIR2qrWmyYxPFyBd+6g7kixt
rS2/jFqS92YZ3N9tr3q2rRCVlFGTATPGml3OQ/WrbMt17WXtYgr3JRnPTG7TaYOI
brmlNQoCHUSoNuZDKHAiHpmYmHkK3yus4VBkEGatpJEHMmjizaw8AwEMixDo80+W
m/qp8L3gatDh/ZlmD0HfrhRxwCkKlBswXvlD+eTwcIcOxXibuyGse6awEyBfbYmV
E2x1PLu3xNiIxImUyPU1+o80ch5eEkOyd8BExKkzaOepJ7Yku6k=
=dyYg
-----END PGP SIGNATURE-----

--2XyhbaEh6F/M9F/x--

