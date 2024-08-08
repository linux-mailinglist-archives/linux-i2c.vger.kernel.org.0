Return-Path: <linux-i2c+bounces-5206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D094B635
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 07:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE180B23C47
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 05:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBE113D501;
	Thu,  8 Aug 2024 05:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OL8UK3Ut"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F8B13C814
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 05:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723094484; cv=none; b=ELph9o3Nvl7w2DkDp/K5uKO9K/3xDDQUm3ddVTWBeLMWl5xO1G5bYMa7srbWkP4Xy62dBI7T56MR0EMJSKBOGeeOKRGv2wLzkQPwF/UVs73c5pk0JHsHs4spNlHbfIy7qY8nFHu94aRYgZDH1sse4EbzlUo7iDMYvB613XqzN1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723094484; c=relaxed/simple;
	bh=L0Wr7X06Q5tRRJLVZqvIeGcHV+LdSUnAfSU0EtGVpwo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6nPogd1Uj8SuhGK+mjHmllVPAr+2XqYSlvmIUjLeD6iAK9I541BSSlP0IuDqUOR827nvUwtr4Oyb/KfB5+GzlQriZnnGo3zILEXhqbOAHKepdJUBSlxrMzW0i6q+t3doEYTiXbCEM238ZFax3rpjpFLxe3ClSV36FTLHKhWiww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OL8UK3Ut; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=L0Wr
	7X06Q5tRRJLVZqvIeGcHV+LdSUnAfSU0EtGVpwo=; b=OL8UK3UtK5YUizJSN0Ue
	Kaz60syLgJiX8Zr2Quo5b6tGgXiG7yXTGgKrpjUotDjjx1xjFy2yw0vva3fYn48v
	QR2/28H4bemVFKGrjwcplHq6koJCanA5ikNYNGy6sV2iHborN+UJSvK6t47/JOy3
	ooblDiGC+1IUF/8kfOe0pPb2R0GR/k85gvDHoqQUsIn+9+KgksZ4T/vllRg167kD
	h9IMoDB2B2QSUNCIXiSK9dB24HgGW58VY9XcY3p5dyQYCzqtq1WyZl6WDjhk0Vu4
	ihGfmlLS2sOja+h8S3mFqOFPOMLbNmqFnntg/oKwuQTMIAM+OhJwlNSUPHGl0gqj
	QQ==
Received: (qmail 201591 invoked from network); 8 Aug 2024 07:21:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 07:21:11 +0200
X-UD-Smtp-Session: l3s3148p1@J0fkMSUflI8gAwDPXxLGAIH3oZkcU6AS
Date: Thu, 8 Aug 2024 07:21:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: testunit: match HostNotify test name with docs
Message-ID: <ZrRVx2XmCduCP2Iq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
References: <20240806113532.32679-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t9R+pdq9gYGiDuFT"
Content-Disposition: inline
In-Reply-To: <20240806113532.32679-2-wsa+renesas@sang-engineering.com>


--t9R+pdq9gYGiDuFT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 01:35:33PM +0200, Wolfram Sang wrote:
> Ensure the test has the same name in the code as it has in the docs.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--t9R+pdq9gYGiDuFT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma0VcIACgkQFA3kzBSg
KbZ7rw/+OP79I/xGZk23NiX+CP4yaxgbTkJMnAEYPnVvhKrzre/yyR2+gjgjTF7W
PJjj3NDgpJPPInOmB1puqorTfC+Q5bngzF0GGorDPSnwiLjDEikWKN9V/ZBclKdQ
zQHXnQ6IkmmMNjc6EWVKyEr1Y3x4IBMF4F7R1psNog+BY50DUmfNRTUvzqCfSizH
OVpDhjeBPYIrFdNXDQX7Xnv6pEMz2e/zsIVjyw3+dyNJPu9aHNyQeFD8eSMbpqTQ
prb+loF3W+NaMelcvBYFM8dn9vj4P/vxwZ6VBxCUAaUj/57hyOJ/8CLtlGnfvGbh
voKjZ+mIEX5E2LUILFQo8pCSDxeqFejG6gwPWdu7Aq3tYgpB1X8XK3LGWp03ugec
KkOmg+qT8XjX6tVThv3QT+tXeOQLAxdYclA/5LbUHIHoEpNdxOBwAZKK3KuqzWuT
KUpN0yuJWnkQFWqlazvrHrmch/EHvSgkT27NYq2k4dVLJQXCU8HCCUT+MQu0uNb8
DvQWkcLcmga0LXV5tec0frjlqUZykAq8TbTGSfnxp2x5QdQAXiT2n20qAbiKGu6Z
BLGDTdPPfGlBNidAh/8vwR0D9NlU3phtSEZBqYYGsKBPcIekQw57BQkLLUrcda/n
Uv7w4J/1isQxxlibsRjBOlEpwwLMX8ObiQk05d4Cy7T80uJzEP4=
=PS7e
-----END PGP SIGNATURE-----

--t9R+pdq9gYGiDuFT--

