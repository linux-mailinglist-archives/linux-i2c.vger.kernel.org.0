Return-Path: <linux-i2c+bounces-3205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9148B3318
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 10:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7BD51F2182E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0A241C65;
	Fri, 26 Apr 2024 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FQEkpl4V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C3B7EF
	for <linux-i2c@vger.kernel.org>; Fri, 26 Apr 2024 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714120771; cv=none; b=gTQRlb6JQLIARiwXrcNQny1Iu7YCuMtdVLCpmBlkv+xX0wjtNBoBfLzxhwx02lvlO45Bh+EmIGy2lHk5+fFjdVLFtiIN66RSuwTixl0/ughQIxGFLFDMV5mXxWBTqPf2ChkrwKP517CHTtXg1Uht5qTxEl1Z/xJOG+UMoWU85og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714120771; c=relaxed/simple;
	bh=rWecvkZ9/zt+KtrKeDRwrHO9gDCfO16CTVC2GKggIH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIQpOnseUJmBJmFa3evn6bM0ZY12Kw5WsgGoUFR47QK6fJ8yYKS2wY62md0+9gz0J7WZ69A84Ba9S9q5NgJMwfDQ1prDsWPn3I9+X6Lupibc89flYBKqchuGnt71l+6mvfZ1BrX8zhBY+sba+MEj2vWGroJsUxDSVLnTSZWYVLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FQEkpl4V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IPvi
	QZGnK2XGRAgrK0XMHMbciA/V3OI9bhZU/FzH/p4=; b=FQEkpl4VkMDl3IRnwqrV
	1Y6qOXjQR4ZI/pZeY09J8zhKu7xIYyEZD4MhYikM4KH/7MY+b0/HdqglCQSmNo2z
	JqDjtgqFDIw4sTvUwJKDFAnhznic9kEM+GjOVQ8lu++2VOD4Ih5ij3Sf51S63jyi
	GTtJVql+1TVPXn8Ynj1IVDySrXJidPOI71VlEPKG3aKMrNHWBQb8cmhKMghJTQ7e
	4pQb5GW8+l6SqYnclYrBo/3TNlMVmc4PRlmX1I3Kn5c3duQI/hwLJEM773HikNXv
	fanI2QR+6D5Xnlx+Esx7UDs8/Z/8A3Pji3ctBcu+7arfzAClaxQ7CZIcU9cgatz0
	ig==
Received: (qmail 1244286 invoked from network); 26 Apr 2024 10:39:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Apr 2024 10:39:24 +0200
X-UD-Smtp-Session: l3s3148p1@b8RC1/sWfuYujnvp
Date: Fri, 26 Apr 2024 10:39:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
Message-ID: <20240426083924.m4zmy54vnqm23edt@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
 <e46f56f4-f28f-4fb6-4249-554059f9fc2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bthm7jazybv2gi4w"
Content-Disposition: inline
In-Reply-To: <e46f56f4-f28f-4fb6-4249-554059f9fc2f@gmail.com>


--bthm7jazybv2gi4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 10:28:40AM +0300, Sergei Shtylyov wrote:
> On 4/26/24 9:44 AM, Wolfram Sang wrote:
>=20
> > Brauch reported an OOPS when using the designware controller as target
>=20
>    He's Baruch... :-)

Oh, I am very sorry Baruch!


--bthm7jazybv2gi4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYraDgACgkQFA3kzBSg
Kba58w/+LXO7uPPuqfePPROJ8YIbYuQP7vRqso/WQ9fZOOaZBOouYJ87wLUj+ESV
w+m3PzVGi6bVg2VNYn3HACK47CDKCD0+q1r7vqdqVo1b8zL4glqdiCTonyJnGYx5
Uyz9xpegrz9A+12yKSOHx/7wjXgUm2qbFw9zNzplwhk7O2PtgfClXQtSKnatYNRw
qe+ivrVfxskHlOHNAT/ST3AVBC73tE7Li2ZDErR7x42fpkC0/0FjbDSuUKdlpEk5
apl1OeKDe8p1Qedd3gfGPF/8b1BzjEOYl+0/yf5pCNyFAE+ZTCuPKdvgOCRK+MMZ
xWGaSFgoVVLM5CGQncAu6KbxweTD8MqzxJqK6VCi8k1IP3ShmDnWZsR3ZLRE2o2p
XpOZTk8SULFfeBPVowRoTAkxawxqGR6w5sOrNEiSdkkPLuv+2PPU5+suCamD3FTw
iTGUqpphrRDGajoXKwNr4xrClNWB4i51O4+au/b51fTPvPklxKahqGTbfHi7n7DA
WIKNs/VgcucQMt+yTFsbEk6/NignMjwDdHGTk7/+eyDUWi/zQ9mWyTuKF0/4pixd
5InmosZIFIUWKVnHPWmoyTlaCNM3O2PW9B0tf/JUb7b42lct0dYtTgzIKcoBcndb
Le0N4K2wi1J/bX5pcHK3e+SmBRjmIicaxpkcMhGjg8VIhPZvJi8=
=v/0R
-----END PGP SIGNATURE-----

--bthm7jazybv2gi4w--

