Return-Path: <linux-i2c+bounces-12195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A7B1F87A
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 07:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52A4B4E02F6
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 05:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218251DA60F;
	Sun, 10 Aug 2025 05:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AubHkPDn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2692E36FF
	for <linux-i2c@vger.kernel.org>; Sun, 10 Aug 2025 05:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754805080; cv=none; b=s9jS6FUmo8yGS63JzVOQvRxQAGR8OKi84hlycnngisIUgWJNHMQ7dmD4+2wM/ylAauRUYFf3WZW+1/YYJPSM5fnlhhzmug+aDfpzkqgL4VEbpnDlxhZr10L74wiVIE69HGAH4nJO8A8FfKPxQI1djvmtLS3HU+7S/AxWKQPs+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754805080; c=relaxed/simple;
	bh=PsIhHcUGqCpR2twnjpTepbyzUafG9wt938cONenw7QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCUZQXZ9Pr3soAmMJm1WDx/qwZTqMiYm9P45SsXRciOiGNx+wiz3KUjbl5NI0FE02JamIfqePv6QKf/vbOOYQErNvTKZ8hawFpWVq7IACsjGZ/mPybnr0+SrIVPytWrzYzKQ6yWsKDQN9+gv7nuhl3mBYEwzl/mbf3e461rUU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AubHkPDn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PsIh
	HcUGqCpR2twnjpTepbyzUafG9wt938cONenw7QY=; b=AubHkPDnRl82RGHyKO0F
	7OlEi2gLoZToW6IzsTQ8DjZmaSgZqWQDYSHcRApXIZzY4/IMXMr7wlGsCeYOwHJ4
	q1q0GzrrLESeUK3isoyUeINvBboFkF2/KvnBYmdeweBRHAzZRdLdj2c+X9ftXHbM
	IYIaGs+ebZ62L957LVpNHtaav7+/oT1km3xwB2zamFDRrJT6ULOxZt7vhKxBzzeT
	6BWUCHCYrOY8HDk1TM6VTBFVfCbzBDlMHy1j3Vy1xGqFZpdVYJvw7SRpEvq7lpOa
	q3RNpO+YED3vmj4okvAiZHC2oe5igxRbbBt1BPwCH/9UT8xzfVqwzIx46XpecFyd
	yA==
Received: (qmail 2320593 invoked from network); 10 Aug 2025 07:51:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Aug 2025 07:51:13 +0200
X-UD-Smtp-Session: l3s3148p1@m0QIZfw7eq9tKDGm
Date: Sun, 10 Aug 2025 07:51:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>
Subject: Re: [PATCH v5 05/11] i2c: rtl9300: check if xfer length is valid
Message-ID: <aJgzUFOzxxdNDrQa@shikoro>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
 <20250809220713.1038947-6-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5PQiOrpP1mtSoLHQ"
Content-Disposition: inline
In-Reply-To: <20250809220713.1038947-6-jelonek.jonas@gmail.com>


--5PQiOrpP1mtSoLHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 09, 2025 at 10:07:06PM +0000, Jonas Jelonek wrote:
> Add an explicit check for the xfer length to 'rtl9300_i2c_config_xfer'
> to make sure a length < 1 or > 16 isn't accepted. While there shouldn't
> be a length > 16 because this is specified in the i2c_adapter_quirks, a
> length of 0 may be passed.

There is another quirk for this: I2C_AQ_NO_ZERO_LEN

With that, you shouldn't need the code here.

--5PQiOrpP1mtSoLHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiYM00ACgkQFA3kzBSg
KbZNOBAAjfKExe28v6S9oT90jl8uJ/C7in/49H/tVl+c7ElM5fo9WCQ0pskGqeGv
o/OHyYK1GoqtE7rDE7Ir7hUZNUOF2xgnbEmod2Fyy3n7qAbuj1APKNR5rJ0IBRho
NuRdUWlp4lraiEqiosrVFo0U++6NPGLPCPuQzePdqY110Hqp7s6AdIEyn8y5Vdak
xlLB8hpk/gCj58FoaHbpsyOf/eszsBUpxXGLx9tuua8h9Xh9h6esBdtHysdQ9pea
eARSNfWuGrSYyQraPcGBs7vekF0emM+SbCIAOb+l+16Z056xARvpY3qGFAxBuWDS
4/0F65vldBhkHtcH67jYmvz+tMlY1VGjVZp8S36Fc5FmjSyfFI1mokExYW5drTgZ
alW9Ndto6zMQwACbRuilArtWwsftdp+yjnuvyJLe7A8RBWVnElbGE5IjoNlpdf2C
ki08xszUhxPMupAOzgFeSUGH83Dawu2o35vQU1ZI0sm9pxBfcwzqiKD2YyHrVgt+
SqyFErzzFrFy4yIau7EncQChEtKCAOljmtp+iIEieKQ8+lf2/M9LzFeINRl11855
vsyEZZ1RyG8oiBOGYVrdlMHmc9V7RtOQ2vewwbCanydHTrILpL0cURnDOkBbLO1/
uVm7Z52M3Fjcs5mL5+VDB/4YwFJTOjbdClvg/pAi/dnQTUPf+GA=
=lymY
-----END PGP SIGNATURE-----

--5PQiOrpP1mtSoLHQ--

