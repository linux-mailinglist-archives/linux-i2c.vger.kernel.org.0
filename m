Return-Path: <linux-i2c+bounces-4966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1992FABE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 14:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABA1FB232BA
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 12:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FC217166C;
	Fri, 12 Jul 2024 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EC/Ml+f7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540C171085
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720788840; cv=none; b=lcIWmC6O7VHCHfnLGbJXUpCuDXMQaSmyH6jj83VEaKQT8ypRa+EdTExavnHDuzUW6GuN8oAUYh4ysuN7aDMB2IBc5sZwtshnCgodXEFxfVf7BKTE13Mr8gDnZAt0p6h4HoHGnRONOXZIYytphGqToZdPn6ihphXXplGjmL1+xO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720788840; c=relaxed/simple;
	bh=lkOJSeMDPmHfxOmZ/3yKhxJTW2hX5GpNfY8zByBRLTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdMgzPYToNRl5PVfeEg5aF3E3Vtx6MxkJvuxh3VU9qiryeFyp5lyCRGprsOB5D1l1BRfkLF8YmB3z4CJ5WDX+d9v/j59E8NPihOTW+LLTBhhtEB3yUVv3YYnLtuYeM/whJ4BAnkbn++HmMlU7MM1kzMkMLQFk9ssQr3IziPxSGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EC/Ml+f7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lkOJ
	SeMDPmHfxOmZ/3yKhxJTW2hX5GpNfY8zByBRLTY=; b=EC/Ml+f7jVBnuHkHw6fB
	jnQZgCRjHgTnpsrnX5yqDCvEl4lnQa89wotHmvpLQr1LpN4PxzQHN7RuG90xaFWm
	9qbfkPMgBVR5GU1B+aZ8KLt42EsrqVskUXZlK7paUqVZii9TcFuSZotlIgmceAu2
	lvxdsE7s8einOcXUDexDBoBcqilBn7QTMg3NbxYZY1Fg1vLTzEnsI+zlu/4uKqAv
	1EmSYkvyMJ1DNFXvDo/xMqI1QD8aDRSTyj1ZYt0z7oNsdQTVpFTJFbHlrQJTCl8K
	hv2+e9F0H/07UGFr8ampE7OuKYiHkoJCdZj2xhsvY7mB3eFY21uhHJ+lOvWIPBni
	Cw==
Received: (qmail 1160635 invoked from network); 12 Jul 2024 14:53:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 14:53:50 +0200
X-UD-Smtp-Session: l3s3148p1@StfvXgwd9JVehhtW
Date: Fri, 12 Jul 2024 14:53:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: piix4: Register SPDs
Message-ID: <ZpEnXaRYnPIr1vG3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Heiner Kallweit <hkallweit1@gmail.com>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
 <20240709-piix4-spd-v3-2-9d1daa204983@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w1J4ypOOYEfzSIbv"
Content-Disposition: inline
In-Reply-To: <20240709-piix4-spd-v3-2-9d1daa204983@weissschuh.net>


--w1J4ypOOYEfzSIbv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Only the first 8 slots are supported. If the system has more,
> then these will not be visible.
>=20
> The AUX bus can not be probed as on some platforms it reports all
> devices present and all reads return "0".
> This would allow the ee1004 to be probed incorrectly.

I think this information would also be helpful as a comment above the
code. But to allow this series to be applied now, I think an incremental
patch will do. With Heiner's ack, I think this can go in now.


--w1J4ypOOYEfzSIbv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaRJ10ACgkQFA3kzBSg
KbYZ1hAAqYTJXeZzVFzCYQS5NSpfIxEYYZMzuo6rcEbAP3Kubzko3HOLB2RdsXyG
GcgaBONEP2WIDwKtgvQ6E5nN03nilHxkLUJNpOWjUrNZ8YgwifWRpwY4qkW/krsy
sFLLNjyOccCI1vu1VAFEiKh6s7+gBTW5/K2zQ1yxvCoJWwdcfIv8Ba84WiqWFHVM
MZMydTIwVbH80pX/ypdkIOcSpKN4cQI+e7fiFK48AxdUS6IbLOP3FlHHIAvcVtkN
SFB84HGG/7oDIUmsySjLON/ueyHehIfePVqjQyZj8k6/BdeVkkXohACqojHP0Lee
aOxm9MpndwMkuoKDSUW7EY+cfCgqGqkqa+8k/HZTgBsWVP9oVNNiwDs0PBUSMm3s
RuYNtR92xD1cWMDy/sLkvQ+DBbN6xwrloAfOsx1r85FPd4QsZeX0TaCGTs4xMQUq
qdnyRFo1N3n5Ngo80DWdn9/a6IUj6pqGCBTrWHwAV+jZjsVmbBl/tSaOijgg0MqQ
BGq7yPfKDSyz0/UoQt1U1dhtF9JEIUlw7vKHscOjWMFtk0PniyxtdsRNYRlrb0G0
PYLpMnX/mP8PAP+qGxK9jV8DYejATsWfHvROjock+vLbP/ddVxZEmIr1Q4YJcL4d
WEmTcgG8LwMb01zwkURJtDljJUHTlBCVim7gnLSHJzcQZ6EgEAU=
=I3ee
-----END PGP SIGNATURE-----

--w1J4ypOOYEfzSIbv--

