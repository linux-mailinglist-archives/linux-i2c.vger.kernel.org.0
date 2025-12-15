Return-Path: <linux-i2c+bounces-14544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A269FCBE294
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 14:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F6853016DA1
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 13:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4BC314D0E;
	Mon, 15 Dec 2025 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WljKW0f8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A553C30EF90
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807119; cv=none; b=D2dToR2Ig56vLFY3J7CUczZgbxA7xt1z8jvarUltpgkTP17yxy0rx8qYaePlsz8014Dr4W5vzoaSuBl2LSUr/AAdBSpdtpo89zGlv4yo3WwhADXE+xpEaQYUHDH8T8OzjPF6HaiRyuVR04496gG6ZuCCD6GvHhP6GI/sA44kWZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807119; c=relaxed/simple;
	bh=w173Uz9qyjrVYY+rIuNp+zbMR038/E38kIU7/LFGGmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOZor6k+X2+rnfXsppJeulk/K3KrPgiyQwr15cct5XNX9OkuQU+TaJS7H4Ke92FWwI1FQZxuAl+5DKd2JXjjWIe/kSMNxLxqdzST0KgyuFbwt1ZMqcAeSjVXozK1Zsoyl9hWHzRG7coATNHiIxq7ieEY7CmPUz5ig8ZJswFB0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WljKW0f8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=w173
	Uz9qyjrVYY+rIuNp+zbMR038/E38kIU7/LFGGmw=; b=WljKW0f82oqC/sWv/CLO
	BmcaJOR1aReOO554chnZCFu5VlXhwjIXHURfEhBuWPgGNk9OUrFv1NGWHP+tEQrI
	/AAn8wQfCMyJhBxqOTuogrkjn/ygo2gbYCYQBgroav6iQwVq+UAzrUgwtBmji/OU
	PDsnvzGennfadWlgDiQaG/kfjp2DuONtTeDyBazqTIPPTw5HTafASJ6BFABUWml+
	5xVvFjOiSzP9drVCxXaWeH01DKvp0XZbvuqxvCeqzeCdYw8BYfvBd1kSGCLj/x2i
	HX9m+/OrnT+zWVHwfxcLtP2W0XzZXDnxGBm0hcusvsHFuzXTsX52PFwgz4L6o4Kv
	9Q==
Received: (qmail 1011264 invoked from network); 15 Dec 2025 14:58:33 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 14:58:33 +0100
X-UD-Smtp-Session: l3s3148p1@x6tSAf5Fp9nN3IHv
Date: Mon, 15 Dec 2025 22:58:24 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [RFC][i2c-tools] Accept device-node path as alternative to bus
 number
Message-ID: <aUAUAG3KwQHHqgKq@shikoro>
References: <DE53PTBTBBBY.24N093ZM03IKQ@sevenlab.de>
 <aRIPsOOgs5jtxv9D@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lMY3jOICcUGJL74R"
Content-Disposition: inline
In-Reply-To: <aRIPsOOgs5jtxv9D@shikoro>


--lMY3jOICcUGJL74R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I'm working with multiple hotpluggable I2C adapters and have the
> > following proposal:
>=20
> From my side, this all sounds reasonable. But we need Jean's opinion
> here, too.

Seems Jean is busy. So, from my side, let's go. I can apply it if all is
well...


--lMY3jOICcUGJL74R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlAE/wACgkQFA3kzBSg
KbaDBA//ZBNz0RQqM7uGtRnmst9gwzSLhQRpR7914UZjua1ir8Xo/pLQ3kjECVZu
5agTas0uxw/JrZhyWOBlvWP3Rl7sy4Wns1AwjByHdY47kZokPD8No+gns1GTiboX
d0Mvjnd62wYF/C3BFEKGpI4Ok2O2J8mPArIpaRXX8abkZ+Y9A37xgPqrgE2tmFDI
mvM9YZKuFqF9FoBBAKLIUb1ye5lSYiFypcL4vjcmqiD6IlJGX/avWtmf4GlYktOB
Xve/EYnjKUzRdbk0X5c+nV8IBz8ByXRnDLY1I4aGe7ey5JtEO9ecrmTVcHgJnaMz
Qrywc8RnmwFh+KZpASmeYk6OBwtDMgSQiVnIAlcD1uDtyG9TZQPr9//IBg0s/95t
/eCJyfSFcI80cZ6Xst+nv/xiS7CHTSjwND86tvnJZsj1OyEO9hQJYlgW4O4ubZAz
1SduAMLUaGbTAU4A1NHbTsSUV04LAjCsPXUZOImbvl+pVlleNb5eOTnwFNb09D11
4xa72ubct2URHnjcRpPCzdyPK4xlnqRFuc7iz9i8c4zJzxNoLNjAatPg/gOkScUg
OsyHIwjOrDvL42BehOfCKePGaz3OuJW9l3C7M9aKQnsLLo2U+3kjqPDqu1VP+iD2
P+9p+3STAhPJUwgZxLgxQf7Yh1T4WUC5ddGwWIj8908rkdvJd/M=
=AHaD
-----END PGP SIGNATURE-----

--lMY3jOICcUGJL74R--

