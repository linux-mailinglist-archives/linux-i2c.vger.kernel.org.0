Return-Path: <linux-i2c+bounces-7854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BA9BF3B6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4540C1C23452
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F0420650C;
	Wed,  6 Nov 2024 16:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsFhK8yD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D692064EF;
	Wed,  6 Nov 2024 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730912063; cv=none; b=bJHUhRd5w+87WyOrggEXOdI4zpxpxKujgVDbYd2hnKoR/CiyJOcDElhd9fvsENl++m14zvi4PFUlV1B3DevvwTY54HhqppQiigogQ+/8L3VlsTK7AXZvNPLUirU0psXm1PHnFcRpdTCIP6TfOlLITuosqWs81PUxW1gEbLLsOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730912063; c=relaxed/simple;
	bh=xtIQuWH9C+ZoLXngdr14mybtrU80ohTFdeuli/KE5/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNDsOloKZWCZ90jDBXLWMR4uSiZh8/dMPonliJjuBQH34b6spGSKktYi+zjus0hQM6AEZrqWR11cpJzWZHaun4Ju4+Hx5gOYhUIIf7eUqQ4U4nFsaXi4JaNiWg7WlNqRRyfmkbY/VWrB8BO8EwGGf5Yv72wDGqeNl/SdHXixgVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsFhK8yD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9039EC4CEC6;
	Wed,  6 Nov 2024 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730912062;
	bh=xtIQuWH9C+ZoLXngdr14mybtrU80ohTFdeuli/KE5/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsFhK8yDrxZ+QyrA2mZ6zyNeQz+Qu1wLOu1cHHyhz2Qk9shIkDtV5kXDgisCMj/cr
	 +WF0WPuW56g6IDZ7qpE+qS1xG3SlIiXhK0IGlM4PNh5Z1qfHFp+4ZgCzAY6VCBDDHC
	 CNjZ1ne1QYayTNKCiUzxkrXJrohkS6zwWhABlSqNAwIWbNQoif/5oCLBq0QDO5RewQ
	 mO7sPmfJ9sLI14UJVHSKEkAP2K2j/VghdFKFUcXZSmdxGa6dA94AIzub+7YPk/bzYC
	 1ELK3U5MdvKUuMt/T/qNoSU0dLrddn0VALanhl/HlraM+AyQoGYKNiD1U/ciSWg5jb
	 CgVinIQyWnn0w==
Date: Wed, 6 Nov 2024 16:54:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add ltp8800
Message-ID: <20241106-splurge-slaw-b4f1d33e4b09@spud>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
 <20241106-gatherer-glancing-495dbf9d86c7@spud>
 <20241106-overcast-yummy-9c6462ff2640@spud>
 <2b731ba8-1b6b-41eb-bae9-3403555506ef@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TbnDRuNWZw+OcBa9"
Content-Disposition: inline
In-Reply-To: <2b731ba8-1b6b-41eb-bae9-3403555506ef@roeck-us.net>


--TbnDRuNWZw+OcBa9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 08:43:54AM -0800, Guenter Roeck wrote:
> On 11/6/24 08:11, Conor Dooley wrote:
> > On Wed, Nov 06, 2024 at 04:06:02PM +0000, Conor Dooley wrote:
> > > On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
> > > > On 11/5/24 19:09, Cedric Encarnacion wrote:
> > > > > Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC =
=CE=BCModule
> > > > > regulator.
> > >=20
> > > A single compatible for 3 devices is highly suspect. What is
> > > different between these devices?
> >=20
> > Additionally, looking at one of the datasheets, this has several inputs
> > that could be controlled by a GPIO, a clock input and several supply
> > inputs. It also has a regulator output. I don't think it is suitable for
> > trivial-devices.yaml.
> >=20
>=20
> All PMBus devices are by definition regulators with input and output volt=
ages.
> After all, PMBus stands for "Power Management Bus". Some of them are list=
ed
> in trivial devices, some are not. Is that a general guidance, or in other
> words should I (we) automatically reject patches adding PMBus devices
> to the trivial devices file ?

Personally I like what Jonathan does for iio devices, where he requires
input supplies to be documented, which in turns means they can't go into
trivial-devices.yaml. I wanted to add an input supply option to
trivial-devices.yaml but ?Rob? was not a fan.
In this case it would need a dedicated binding to document the regulator
child node and permit things like regulator-always-on or for any
consumers of the regulator to exist. I suppose that probably applies to
all pmbus bindings?
In this case, there seems to be an input "sync" clock that may need to
be enabled, which is another nail in the coffin for
trivial-devices.yaml.

--TbnDRuNWZw+OcBa9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyufOQAKCRB4tDGHoIJi
0ngPAP9bHw4K9auG12gOeknHWMNkjLIYFJ5jJjg/vv1Wo/ieiQD7B1Ei1oGxpsY/
ymkEheLhj3x5JfgVpPhrS9rdabx68QY=
=2pzv
-----END PGP SIGNATURE-----

--TbnDRuNWZw+OcBa9--

