Return-Path: <linux-i2c+bounces-1905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2698085EC0E
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 23:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8A9E283430
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 22:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB53580602;
	Wed, 21 Feb 2024 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R3dNp+Is"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361DA3BB32
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 22:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708556102; cv=none; b=hKXLESwEb1zZDDEMmtEx7+KhKWlkwmiC8Q4HZAj57LXspm+PLv8BB81gIHCTuPoi7y+y7+1y4lDGxIe263xkMvrmI39/UhHy8JnNOLWkdyF+kceC0lKv19oAsfx4gE0jvMUGji3gx+ry54DJz1Dm8GThyqk4etIjF7YptX4x77o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708556102; c=relaxed/simple;
	bh=pcbURWzdWl827aoKY3Vk/lQA+oXSGfG6yAhkFdHlVnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmnmsCPZho9QRv8cgFzXt4aa69DjWozxK4/xqh4skp3GefrHRCSASCP8kE5n15mttRU09L4HAsT+FVfHFa8Dlqdi0Dp3dvQwqR6a8LRDNis0GnUhcZ3wsu0YHhFp8cy1n+vGhLPh/n5CvLK4wdUB8AgqRp10qNYn4y3BbcTKKjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R3dNp+Is; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pcbU
	RWzdWl827aoKY3Vk/lQA+oXSGfG6yAhkFdHlVnI=; b=R3dNp+IsGrfldwpg8zov
	udigOEzC0v1rv/ZerDAc/1dZTZ2rs5R8rBb2Q3APsfzeY92yicYUpa9P43vB5h5v
	ez533lHhPkHH/hAk1qa3SF5ZKpX5qIHX4NdQVLo8uh6RAsf5UhSK6po0vEpFuznA
	VfEdO1iMsCOXGgwuXoNnp7cgEA4plhw5EMB2DWeX7us0yK8EfrDlGijAArkByNpd
	k+aNfiNtrp2+npnYm+189jpHmd1jXVyC0VbkrZ1/eWsZAw1gnCXVyfUwS7fRf6zM
	JHbEHx6nAJ6sv/4ydmvUuCKJ4ZVy/9f+NwVjYUQVLflTIInOMNFL4EH964gp1nMR
	oQ==
Received: (qmail 3765339 invoked from network); 21 Feb 2024 23:54:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Feb 2024 23:54:55 +0100
X-UD-Smtp-Session: l3s3148p1@/zQgN+wRRJcujnsZ
Date: Wed, 21 Feb 2024 23:54:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Corey Minyard <minyard@acm.org>,
	Andrew Manley <andrew.manley@sealingtech.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx: when being a target, mark the last read as
 processed
Message-ID: <ZdZ_PsNhQ9S1Eab-@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Corey Minyard <minyard@acm.org>,
	Andrew Manley <andrew.manley@sealingtech.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240221193013.14233-2-wsa+renesas@sang-engineering.com>
 <kgfagzj5vez56levwam6n6tzxl2lu7efnw5x3eadl3uophxism@ph2tghrvedg5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wMLlim1uQUSFzSBp"
Content-Disposition: inline
In-Reply-To: <kgfagzj5vez56levwam6n6tzxl2lu7efnw5x3eadl3uophxism@ph2tghrvedg5>


--wMLlim1uQUSFzSBp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 09:58:23PM +0100, Andi Shyti wrote:
> Hi Wolfram and Corey,
>=20
> On Wed, Feb 21, 2024 at 08:27:13PM +0100, Wolfram Sang wrote:
> > From: Corey Minyard <minyard@acm.org>
> >=20
> > When being a target, NAK from the controller means that all bytes have
> > been transferred. So, the last byte needs also to be marked as
> > 'processed'. Otherwise index registers of backends may not increase.
> >=20
> > Signed-off-by: Corey Minyard <minyard@acm.org>
> > Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> > Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
> > Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > [wsa: fixed comment and commit message to properly describe the case]
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> is this a fix?

In deed, it is:

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")


--wMLlim1uQUSFzSBp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXWfzoACgkQFA3kzBSg
KbagAxAAn45Po3ZAJlfnoswOKe4rzonqmkLsAxS1Y5qgSdTMQyanU9l5JjsmyaPT
xg/t4ZAzx2vwlGMUwQ9pC3Z3Il6LhHPmq598jn/3Vmj+A343ahRyLhWWHh5VP2qu
iArpIvb98BUeaMdHKKew6Qh319lXMxRgpL1aMDJvWWEMMKJantsrTFywcp3N6WYQ
R6QYENuvtChkG1MIAkiuDozlKbhxb3SzcXBsezMTuEHfOcCEsItnXdiwpo+FJ0pJ
xhMw4d6G2I4Qq1xNNPGtmB5a0Xab0QWUKZ8xe0geV3lhWGVqRi+LX/R9CfEy6ge4
rk4nWiP4t8RQG/+S0nGBo/40zeTx8Bz6KYddR8HLFORH0sRzM07LbXrJMiEWvjjJ
tx6a1MwWLJ8DE+Wa2UMRVQOrmJLXTr4rb/ONH4G3IKmSUeYD3qxZEnIp0MebIY4X
J4j6DyRFS7sum6O3IouXiayOL7NSSITX1lt0+zLeVw2dh6aAx+PvrnCY46SKIl+s
Ai/enUt4CZOt/8QWn5VyNhHBfo1hJIWLh91KQqhZ79k6/XEFj1g3TvnV91eGTqQU
PFdPipawhcNqBnoZOB+DGPlqzUuiXwJuLgCaWCUtsec1Prm0sIQZ0mqyT6r/7W1B
BsH8NWzA0G7I7wPCVmT3/QvWsBVeasc9Jn5X753nqQIh/Oq3p2U=
=w2Tg
-----END PGP SIGNATURE-----

--wMLlim1uQUSFzSBp--

