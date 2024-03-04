Return-Path: <linux-i2c+bounces-2139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D52BE86FE01
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8697CB23369
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEB9224D6;
	Mon,  4 Mar 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTQ/wKRr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D309224CF
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545761; cv=none; b=NpPmESTtnZtthsHsC/UDRXft/QJPgTTR/WRaf9z2t8C0tqO2ltxKdVLSbWivzkySVNaoBD7XmwkY1E0sIARF0OfdreVWfiaOaUK1s2g/5Of0dyJgJQySylbs9KPwjXbQJDJo0NiFM4lGtDdQncB1tn5SRcUo94lBd+a2bsVJaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545761; c=relaxed/simple;
	bh=GyxKPP4y2fFwO5hWkHwDVZnD2WNqmV38uKVZV8g5V0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bElEc/M3w/v22PRR8TIfbqqi2Q+bwjVrsrAuPFbbwy6FsUC3QV4eSki0v7JG3obp76KJSkELZ4/W+3mK85IhPlUKYU9fLm8dzpdU14PbYjC+/jA+zGhJXvKbaNsxKpcGtgt3Q8SHaa1o0JfkXckyZERZcGUSuufzgpgZoQ73tmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTQ/wKRr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4EFC433F1;
	Mon,  4 Mar 2024 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709545761;
	bh=GyxKPP4y2fFwO5hWkHwDVZnD2WNqmV38uKVZV8g5V0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTQ/wKRrMua82qhMntGVaWT5tJTcDDIEM8viXup5dlinjUOUa8gsWBo2xwy68s56W
	 esQVF0WbwAf40yoLmMkkpf6s5lZbgkNlqYkpuWJFr7m6Qu114PtostiMOaS6TQvsYb
	 ExIdzLVAXp/sQYDk3a40fERk+3dUPr2PddeBIj0XUKbC+d2WOiqh5kkDeJbYejapf/
	 TKRw7QeNraW5WYygcstL2dGZopiK2CaJn5OXl71MX77Ij7jZGQTjM0drauSAw8OMWI
	 i842NSv4Ae93sGZoPonOrmfXRDwOCemBYqJtcfKIcsyzJ8Hxkl8W98IAZeiKwoW0kr
	 1kA8fqf470DRw==
Date: Mon, 4 Mar 2024 10:49:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
	hanshu@zhaoxin.com
Subject: Re: [PATCH v8 6/6] i2c: add zhaoxin i2c controller driver
Message-ID: <ZeWZHSt-qm5wH3wn@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com, hanshu@zhaoxin.com
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <4e9c2c3a3940a00da67564c6e19f4771ab6dc67f.1709014237.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b9HCCisY2Oo0FvOA"
Content-Disposition: inline
In-Reply-To: <4e9c2c3a3940a00da67564c6e19f4771ab6dc67f.1709014237.git.hanshu-oc@zhaoxin.com>


--b9HCCisY2Oo0FvOA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 02:36:33PM +0800, Hans Hu wrote:
> Add Zhaoxin I2C controller driver. It provides the access to the i2c
> busses, which connects to the touchpad, eeprom, I2S, etc.
>=20
> Zhaoxin I2C controller has two separate busses, so may accommodate up
> to two I2C adapters. Those adapters are listed in the ACPI namespace
> with the "IIC1D17" HID, and probed by a platform driver.
>=20
> The driver works with IRQ mode, and supports basic I2C features. Flags
> I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
> the unsupported access.
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Can't really say anything about the ACPI handling. Looks mostly good
for my eyes.

> +		/*
> +		 * if BIOS setting value far from golden value,
> +		 * use golden value and warn user
> +		 */
> +		dev_warn(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
> +				params[0], fstp, params[2]);

Well, if you want to warn the user, the string should be more
descriptive. Maybe "FW settings might cause wrong timings" or whatever
these values mean. I don't know.

The issues I mentioned could be resolved incrementally from my point of
view. Or with a new series. I don't mind. So, in general:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--b9HCCisY2Oo0FvOA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlmR0ACgkQFA3kzBSg
KbbNow//TCzWcxh2lUS1dAjOf0U+Em+HV5HEVtGnS6E9SaGfAzHM9KKs42LlpjgM
LLG778SX4UZectUBeH8aEhMSieAPgZKvGUauiq1Cvv+/4ljEtaCUgX63yQaFs7vS
0cz+eVzBMnBW9gnefTZDE0i8cGCmtYagUvE51hJDAXvK3zw8Fs8AIcav2wXI1QrC
XXGLVewT+uBd3qa0vPf71ZkoCDPyjR5srAwY1d94LMzJ2oPAmMhIJXvGVRgGALaO
VdIHjnhV3XhzG79GUExYPl50poxl9wOrCC06p3ePj5iCnFjUBqpMiwfy1Jne1Nq3
XtnBa45o709dToY0RDvI+ceID1GIF5+gdbrARK/oSqc/5fHBQs2Zb7UICDKr4fjj
MdizbwcwZ0psiBJCKavjArGRKJf2ALb+xs7rVMIpOD2kALq55flnbRMmIepBWDfk
6IHuvB1luaYARRrzdOPcCTYU/sJ1QopYv6HAwX3J6wwlICJNxSamsat5qASeek4c
GLDKRnkGoDjNBvZ0RF/VUPfaZWmSy4dHawOCxDjxbng6F9zu3tJsRqI6B/4kCNrf
6+UIrM083UgOKru8r9lsStG2G/rgNfpxO4pMgAmGil4l8/3uQeFWqACYMUNuskOO
NDDmsF06DCttn6hYZH4hxz+z7cZiwnwWL5xmUBzmP5q48NCtKgY=
=HGRQ
-----END PGP SIGNATURE-----

--b9HCCisY2Oo0FvOA--

