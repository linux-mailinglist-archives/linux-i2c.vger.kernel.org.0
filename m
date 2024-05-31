Return-Path: <linux-i2c+bounces-3727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FB8D5E64
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 11:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17D4A1C212BA
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 09:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B91135A63;
	Fri, 31 May 2024 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P9zrcy9y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311408287F
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148043; cv=none; b=cf0Neeb0tf+BmXM0vtX333hGRmzKe9PQl+WzJSkLZ+aJOahZzwJq3AgQqKUCHebn7eM7szN3oDykTlUH8K+R7rkRAB957jkQiEYxlcP76gTnrIwAqSR9C49UnXC0GNd/0zbrukL8MgqaJT0/YMzsWXHDjBDNAEHFQW1kEf3tyFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148043; c=relaxed/simple;
	bh=JQN8vGN5NbPIpNkHmec8YNy753gW6NcwFN8W1JPa84g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/2EVUVqNUXsJifTQNqxqcRndMQawUXNj3WBhMlxBurBMQed0tdEB6jHUAEH1ONnaAqXUQr5khlhZ1Y0E4lrzWflbiy4lNVDHio6ErbXUzzmaxUgXOh+pfHLNWyU5zZ1JEP7p7Fgkbybk1RO+ljkJHrXOcc7KpblN8InPP5VdTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P9zrcy9y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WNcS
	K1rCqsvZKY5MRfZb1bjfU9kWa6S05ssjkBShWps=; b=P9zrcy9yGSDQ/kpQ+fGG
	Shh0vbhHQooBwJ0HfM/WqPYpwncD6oLsDX760QBC1uo7M/G52T0hcCskBiiDUQQx
	hnkeuhW3Q4QoEFzX6MJcrGjG/ARg3JkZAS31TL51UK2ZntBG3k7BeiLzgs5QHyV1
	mxfsUzDxPpv1xtmIO4W3Nc/VyBZl3Qp0Did37Si4ZiLf+eRRjXS5dzSFrIL/3LXi
	qIDWguAJnJAo4m2Z4wZkCK4YYXc25gKtFE4wEFgf0MD3UJl/+Zhm3LIVn5QeCddi
	DdSKtU6c2Cqy0giosJJDdK6Tp0MRwdnMilSnk1Dgkse63fRfjCz3Z8T9nzgT2jqd
	fA==
Received: (qmail 1124759 invoked from network); 31 May 2024 11:33:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 May 2024 11:33:58 +0200
X-UD-Smtp-Session: l3s3148p1@qYbRrrwZKsBehhtB
Date: Fri, 31 May 2024 11:33:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: piix4: Register SPDs
Message-ID: <20240531093357.buoiyo64dp63vffk@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240530-piix4-spd-v1-1-9cbf1abebf41@weissschuh.net>
 <c9de8d07-90dc-496a-9d7f-e7f0c00a934e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pgusl2dmdzkvehrx"
Content-Disposition: inline
In-Reply-To: <c9de8d07-90dc-496a-9d7f-e7f0c00a934e@roeck-us.net>


--pgusl2dmdzkvehrx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Perfect. With this patch in place, I see:
>=20
> [    6.679772] i2c i2c-0: Successfully instantiated SPD at 0x50
> [    6.680341] i2c i2c-0: Successfully instantiated SPD at 0x51
> [    6.680905] i2c i2c-0: Successfully instantiated SPD at 0x52
> [    6.681466] i2c i2c-0: Successfully instantiated SPD at 0x53
>=20
> on multiple AMD based systems with DDR4.
>=20
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Yes, for DDR4 this should work out of the box.


--pgusl2dmdzkvehrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZZmYUACgkQFA3kzBSg
KbbtYg//XZMV0vr7VQtbUFbXN5Iys9lCkvI6BW+W3G8NViUb9TxJj6VtgrjuVe41
dhoEXlTR7B1eWZsut9VDcDLC+lkeR8NbveETx+GNtj3grSYpIB7M0MVlplvs1vlK
4BNQpatGFoMC4qmLjF23OE86Vq9EzN6Swk3REkR0oGXGDHIRgic9oLjBqLv5106d
PGrxOe3vow0//kmLXe1tEzMruRSjGaTg+kRUpH/4u517VfeTDWgzHxr4YdkmkFV0
B29s+Y0VMrR0/QDdWAd+FPBBDGG44lj+9vqT7MJfbp77vv2+rvP2ocCwCzoC2FiV
exb9vmglFv5X/k5OV9uq3FcPe44Y5jXMO2TDUiaWfExa/M5I7ZAVfz1NmX3K7GJv
A3GMTBL0Pfcrq8I+ie5TCzA16s+mpDahYhsY0y8RI7pJB6KdJ3YEGuySgxFUfhkL
U8Vbp6VaBB9pOrx7OYaYFxDfXyJ6us5t/laPdxL5kU47oJkZdOSutLMjPJpFrpOk
xgs4EIeBXwyZoWxx+eNYrVm8/g7A0UkOleEfBvQtAxh3Fqm+xe7NJLj9y6X5qzPr
ugtr+LWScJyD+pB2CtcS8FPMIgNAwoQbz9LScyo/GzGqLyfrAa56zqaFvvJzDvng
W9P00MK/934n+Jt3G8OWzblsOVjzkFzaq7kJkPsqH1tj6EZgAi4=
=E+kY
-----END PGP SIGNATURE-----

--pgusl2dmdzkvehrx--

