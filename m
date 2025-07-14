Return-Path: <linux-i2c+bounces-11932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B84BB0381B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 09:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40CB73B9E2C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 07:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A519F23505E;
	Mon, 14 Jul 2025 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YJjIaf8e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115C233710
	for <linux-i2c@vger.kernel.org>; Mon, 14 Jul 2025 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752478657; cv=none; b=IdSHnpWPVFe/KPM9l02I533Nm9zyK4mbUrMW3LF5eQUWnNZU2vLa6VhjlOM6eKFfMWRHvIZk64wkmceN2PjgaaBDSVdv5ZQ1Ni/dzqCeOMyrmzzibEu4TgVGGCkbmr8OCewV+fkB0bdRmbYLXs5HIAC0YOQrtwEZSIJ/Br5sizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752478657; c=relaxed/simple;
	bh=3hFbJlqW8cbG988BMDFJ2adocaVdbFf7Ph5WXToeAAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxNpf4DsxSNSm8NvsyFVjoaDwz3PCqVaMfFsedamyJpBeFMa61WsIUPlIIwneUi07/m73x2rxRoK/5KVQmosY0Y9pT1YtOJrB8tLzP8J8fqzr4i0jQDosRQOffxiarbPYu1APHm3f2vdOt8F+rRyWKtyQhOvlYBKrV5VHF54fsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YJjIaf8e; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yy7j
	unz34iyIyATJXxlEYv9buWS6GzjYVGKjzQjYSQE=; b=YJjIaf8e77CJ+2z2Qguy
	gZk2oafCVm5xJ7jgQvBWaCA5lVI1fyQat4Me+xivfgdsxA6BoPf4zCInQrECvwDt
	4nWcpOC6qxOdhkmnreERxxQI2LjTnmA6kXzNUaAuP7eSWdXpYq7cdI7fCVBItzcs
	U7j/K7xb1eFbBWVG9c5FVCh3pgJm6X1PLL6WzPAWY6k8R4z73kxHUu4pFaAFEh06
	aDmRdAi0bMAFOxjFAmaXFm7U3AC0oA5l+2OCh+BipEtcgzo3u5IEQcauGHWKiBqE
	L/o/JbiVFP7FpNvJ9+TYbEab2STkae15wl844IWxjCIvcZlRTuHAXIymxClVaNtY
	SQ==
Received: (qmail 2369254 invoked from network); 14 Jul 2025 09:37:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2025 09:37:33 +0200
X-UD-Smtp-Session: l3s3148p1@WW6Tu945AuIgAwDPXxNjAMIr4MhSGEU6
Date: Mon, 14 Jul 2025 09:37:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: a0282524688@gmail.com
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v13 3/7] i2c: Add Nuvoton NCT6694 I2C support
Message-ID: <aHSzvBYwYUpQTAQr@shikoro>
References: <20250627102730.71222-1-a0282524688@gmail.com>
 <20250627102730.71222-4-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LKuB8htEp3EqNPw/"
Content-Disposition: inline
In-Reply-To: <20250627102730.71222-4-a0282524688@gmail.com>


--LKuB8htEp3EqNPw/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		if (msg_temp->len > 64)
> +			return -EPROTO;

Please populate and use 'struct i2c_adapter_quirks' so the I2C core can
handle the checks for you. At least max_read_len and max_write_len. But
please also do check the other flags. Usually, USB adapters have way
more limitations than the buffer size.


--LKuB8htEp3EqNPw/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh0s7gACgkQFA3kzBSg
KbYL/Q//cSewXdBWuo/manXc2oHKH9hQ3DDPQc3spFbfrEbppJuDbMFBquG+aGME
2VZlV1UjVY4osYpqOY1KkMxysZHuhUcXlHio7eGrq2ROwiwIZc6paaekwv/X83Jz
cu43ELVOaN+qBFJHqSFFJwD78scsApEXVr2UlMQkVsxfmG+tf7J2RgiP5CNkzZc5
dp9K8l1qyrpZckzRrWizXlC6R5AatyeJTpJOVCqjYdxXNVH+/wYoBZqm7NF/5WdY
4LEnr65WhOdcopUiZy89/njHRHtnrcmkddEaiPUiLiDhbPVVC+nU0OtenC41uTx6
LTLz/pNLHtXFBQOo3Cs/YkVR+dLAbywSeTlgLhaY6/WW17Hkr61m3c3dukh84+Av
3SIuC/d33D3rVtP5wdEQvGbeJXuAvdVOxsVdiWj8a8TU8+hXQU+v3B2+wRSkFKxS
JLj8oAcQd2yXcq8FWxmHzQmuVxRyXXTgemm7/WCpoMVVZKWWtaqkb2znCWvJdIaG
Yi/5EHXgYDjDEwd/ToxFK6vd6sDiPB7jEmFkIOhYADJw4Jak+m4tniHQe2A0zMDE
zqN9Iw+qhBecQ0GTjDQ/x9l/AwtZlIy+IkfGYlmpw8qcqnoUPGjzri7OXw6DZjra
QSx2vgqOWESv1vv39NqtIXv2BawdPjuAGqIb0gV4MCacNQTSpK0=
=vtvN
-----END PGP SIGNATURE-----

--LKuB8htEp3EqNPw/--

