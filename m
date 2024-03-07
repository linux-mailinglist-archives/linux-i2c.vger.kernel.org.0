Return-Path: <linux-i2c+bounces-2245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4388749D3
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 09:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90629B221D0
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 08:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43D782C96;
	Thu,  7 Mar 2024 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WRudDpPS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF26B63110
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709800650; cv=none; b=fwV4JGlRxjd8U4vba08XgQJsNjCvzec+qoLe2PDhpKfxVSAJUVG7PlbtSXdwG9Oim4cHf0qfxLP42UyZQx3cXU4dxYNHGYu2lSaYeuOx2yxWdFCe8+lR7zlGGTIq93eM7LgdxNgc/KCgunK46AWi1ITf28mCqLiQk1a1sSw6Dv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709800650; c=relaxed/simple;
	bh=C6YOL+H36w2gYFNpOncMKker3/8rALYdU8W2MfFeUeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vgpe215V7BUjPSTMBMpC2siZbENhXidZDHuiXNHPMwprVyvZAyMcNztTjN5VFbj65o/10p5kf2xpOnKrogmEiXqOD+H9FMoEy2QWNZrq5T3WVmGiluxmYRJnPqKsenRI4arw4jXnqrQ3yjWNlDhDCE8/6V/tdOUYdmvIh7Q46CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WRudDpPS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=C6YO
	L+H36w2gYFNpOncMKker3/8rALYdU8W2MfFeUeY=; b=WRudDpPS89drV17hRDFS
	K2BaM+2an+I0ArFIIssB0StmfFoIPnLY+lvq5QOQn1zwUqaV7lHERhWR6SPU8jB4
	jekkbgeOOQv/JwgNst8qIAT08nnSdAycYlabKUcXfU2igtCpDyYs6kPzKLjOdl8o
	XBXynY4WSnICbiGNvHcz0srby3sxwI78gt+esgWMvno/PM3CGdYicowOEWrh7/5V
	nCN3xvV6EJXGJGLAPf24pGlPigqApfFERH1OnYBEPy7b/IXJXkwsQqK0RiV7+WLG
	JB+W9Wl+cl/wBPHx1ff02pS5r4C1IvfxMtlMuLL3mpKzHb0S7Nm3jf5gXIWArdlw
	Lw==
Received: (qmail 285103 invoked from network); 7 Mar 2024 09:37:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Mar 2024 09:37:25 +0100
X-UD-Smtp-Session: l3s3148p1@2b8a/A0TVt4gAwDPXwugANQqZcJxr0oT
Date: Thu, 7 Mar 2024 09:37:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Hsin-Yu.Chen" <harry021633@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: remove redundant condition
Message-ID: <Zel8xbERYjSRznfu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Hsin-Yu.Chen" <harry021633@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240306041900.22885-1-harry021633@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TE6MAaH4nDko0Ree"
Content-Disposition: inline
In-Reply-To: <20240306041900.22885-1-harry021633@gmail.com>


--TE6MAaH4nDko0Ree
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 12:19:00PM +0800, Hsin-Yu.Chen wrote:
> I2C_M_RD is defined as 1 and `flag & I2C_M_RD` is one or zero
> no need for an additional condition to obtain the value
>=20
> Signed-off-by: Hsin-Yu.Chen <harry021633@gmail.com>

Applied to for-next, thanks!


--TE6MAaH4nDko0Ree
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXpfMUACgkQFA3kzBSg
KbaBsxAAsxiyqPeqCQLgNVwbU4iXEL5SScdns2qnn+p+f61JwT4LQxEyYqTXQcFa
kn9Vfmw5ItynxDrmz27Ey6T58cMFQ7gDhneVWBB4oTLtWmT9pt+uqwDbYK5F0SR6
1RnKD6+XzjeFoLovi34/Uzp4umN+X5XqP+zVLTO0S8OfgwCDjOpFNXZOiHhMJoR5
Oa4FMjmcbKGem3U0iBusazzWSptSig4LbNoUnWGxc4WswMMIN16rmDUeFZT05hIQ
yHMmKNXwZ+TDSXyLE+QqYQaaWrBMgJ70MQOxVvrujwQHmNfGOUDi99DKt379ZBgO
OD0POyXv9Hoz0TjKZFJD8iTN5vMI8fsc34qb9ej5zvTv+9nccqQ6mnJGFC6DHIPe
dOsky2v65pZLyDy80pNSPcc2OclDJFgCBxGmeGo44jnPrrz8+n2gGKCNeZS/N0sR
hBBIRxm/YbTICBo1MXkGcuQX94ZtZ0Yd9Nlp3FgJl0F4wzFn8/HA5SIGFGvW3AFf
p2sp4D3EO2OI2ncu83BkGg2t3K+jbCUz1jy/C+0wjz3O57+5MNHqVmJjwjA2ZQBh
TIPa0ygSctN0Vq7bL83k9Y3IZN2evV42BI8pe6yqMJKgBvDfdBlzTKK487NE4TgX
dMfyte1EBRZ8kHi5r1jgH2LgTXRrQyku++QKylqCXFGJ5G0vOhg=
=GgO4
-----END PGP SIGNATURE-----

--TE6MAaH4nDko0Ree--

