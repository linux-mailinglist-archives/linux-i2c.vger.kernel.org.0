Return-Path: <linux-i2c+bounces-11065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75794ABD34D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 11:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27634164D57
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 09:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9191C2641EA;
	Tue, 20 May 2025 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AYsNlxL9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A49217716
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733148; cv=none; b=q0OT/g8smHbhVqfkfi0Sh30MDshqUGMa0E9xzOsE7hDJaP0IeNDapuL9EFVKm3ToxdjgBFDBMeH/zjQWzl6AWrg38ghiPc9fK4obWkgVOZC3/1IfbAHEYskxUGLrq7jlkGhnE4KCGEbViW9x6WWrrv6oDU+B2/8xhr4bXTOyEBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733148; c=relaxed/simple;
	bh=G4s1yt4rueiqa4KnlR6vHIGO2WAmfM0yXXujai9rjEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXG+RyLEuM5Yrxe/8oukMb5IVt+ZDvVUGCmrXlcQtTq5Wdo4dQzdW/ltZsbyjiWoSpzn1iyM3zYUwhV7SF5iAoWKlKbr+ZBoAOq+S3ltbb790FiJQ2P4oXlWkjnNPqxayl5U4WwTW8xQQyLdel6fozgbwmuTNNDkmEzTXcv9dOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AYsNlxL9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ke89
	+ZtDfWTu2gUk7UtkjnlivvIhJG8Euyk9EYSL2gs=; b=AYsNlxL9NxAfrsZTQdql
	R0H5KPEoZeF0MeS681qQtmTEFci0htiHnAxa+QzAu72jwELadgjq0BYWbWTfAdbw
	cXFXFRi9TxdBSLC3YG7ramAhFRA80TDh23WbTQTafhfWAcbpHNh64/VgiHJU/EIm
	4H3JqC2FjqWaFuZlrQjuQ8WZuczJqjjqjVSnqv0/kiabKsXpeqrGycK4fZweXRCI
	3Ct3B8YjPPIrQGLw4+T4LfvubszWOyTB4k1f9GRnvr200cMw47yNjqgopfiIYfZ+
	zdWxwbzGm+QhYLcPLbemQzDwwYrfyE5CLhj67NJ603U0E4oEBlDPuPagxi/2I2ag
	bQ==
Received: (qmail 2816332 invoked from network); 20 May 2025 11:25:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2025 11:25:43 +0200
X-UD-Smtp-Session: l3s3148p1@nUoo1Y01cgltK7Ea
Date: Tue, 20 May 2025 11:25:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH dt-schema] schemas: i2c: Allow '-' in 'i2c-.*' node names
Message-ID: <aCxKlniEUCJq-aqu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <20250519184530.21845-1-wsa+renesas@sang-engineering.com>
 <CAL_Jsq+UCU8RdAGVPbsFDo6aaAyoAKtjDd4yYfs47YOt__VhgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0amW0njTwOc5NV9k"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+UCU8RdAGVPbsFDo6aaAyoAKtjDd4yYfs47YOt__VhgQ@mail.gmail.com>


--0amW0njTwOc5NV9k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 08:18:53PM -0500, Rob Herring wrote:
> On Mon, May 19, 2025 at 1:45=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > When allowing extended i2c node names, the '-' character was not added
> > to the character class. Fixes the following error:
> >
> > .../Kernel/linux/arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 =
(i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?=
$'
> >         from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yam=
l#
>=20
> IMO, we should change the node name to "i2c-0". While I'm on the fence
> whether it's worth changing these, I do think it is worth not getting
> new ones.

It is hard changing the existing ones. They are numbered based on the
numbers of GPIO based I2C busses only. If we drop "gpio-", they need to
be mixed with other non-GPIO busses. That numbering is usually unique
per board and can't be automated.


--0amW0njTwOc5NV9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgsSpMACgkQFA3kzBSg
KbbbQg//YCUwR7PvXD1fudS6fya0OjVIz3OyR2yPnvUGyMJss6iDrRN1LH+Jzmyc
Afmsfrx6yku2X4ljZKxkscXxhxxkpaBcH5whwNCO+cJymXsHh1hW6UytQopk9wx4
KUCrmLTYpsetpuqnI3v2VPHCne8DxYKiZ+DNXe0H8UKAl7AGESPhxlv8kpGtNuDs
BqETwHKJEiHggBgjwGQpGVzneF38yOioLOaMHCntBhqlde7jf6Iw3qcaM6V2ZfDK
ft7HayPPwRvmDvvrz7GTcns7IAmRf+5k9oV8kr89dw7kgGcAZllJgXqw3ZTGFeO5
1TATWvR+G8h5Agyu2i0no5LGKIeII26CNCYOXtJBi0Avo6opurTMBdIwhq9PJ6Rh
vxwUIN7upSnXMSQ8CojDraSHJ0xkkIPTsiJXuR0Xu5IHvW4UQueZzCSjnXDuFHvf
vjqiy9F68MBGU1wH4/cpH8NT/CrC9vHPAm/FuOmXIbBETnmks8B0Fx3o0qpsjFB2
2QeOp7+O1/OgmjsPrVMfW3SLTjFzRMwWfCYNqW+uDe5Q7GImmFbHQGut2aUWO/qs
L1ItRtkvpHaCoQ5Kbt7NPOOjXp1zsSVZYHlsDxZMqt5ASjplGmDB6/S20J0kvpnE
4YfzJXzJ2OUQah9kZ78UFlM35Yo72YV7f5kTmyOzsmtYHOW7+D0=
=tCN8
-----END PGP SIGNATURE-----

--0amW0njTwOc5NV9k--

