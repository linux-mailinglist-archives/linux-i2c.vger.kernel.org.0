Return-Path: <linux-i2c+bounces-5136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF74946F53
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Aug 2024 16:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6305F2819C0
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Aug 2024 14:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8E83BBF1;
	Sun,  4 Aug 2024 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b69pP5fh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B68200AE
	for <linux-i2c@vger.kernel.org>; Sun,  4 Aug 2024 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722782113; cv=none; b=MfDQsdRHRwDZtr3Rigiql32kaQwn4nQsaw/0+CZJXq+UTLXVEFPsyYL+D55gvWBsLEZ57MG0tSqtTUB3hWqrvn4jDizFgMpQDYZcT3m0RfktdOx0vkzU4fWKTjrILd/yPCRy8T33liWE6IGCnqK6oKmj5+t7vhOwJJcJzMIgL1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722782113; c=relaxed/simple;
	bh=hlvMZsWV17kzBWXwb2c9hd4i8thidyFkCEQJhYO2E/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTANvqMI4TuMPzdvI28Va85ecdIEH6rwYVETgozB0NCOeELbPkjc6ZGpnSwnGe8rSs/Ve+aS5gI0vGaK0r7hlJLG/e1H8pZqzibI7/PP8EgVAWw830S/FjT1P7Wjg0nKWpeVINoQ8Z48SmoOf2PfJdZ/GiNrEoYqe72OCTb1DkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b69pP5fh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6SNJ
	SJvr7NqL7MpFM+fpnwgb/mSlFGoOetrtdmHHnlw=; b=b69pP5fh8TkqctCG1P2j
	MyX/n4DKSKrYmz9gdyV+RNjWEde3Tg4FJVrgDXb2jGVtdDbcwDsz1kjrM/H8UVmu
	wmb3+u73protKSoWn42F0ObWRRD2Ng0gzBSYTTZBCnpdELXZ1dgy+1Xn6JH3wxIj
	PQ/hY2DUHe/GfFQy8pzZv3BmKy2qj2eCwhGGDKunJKfpGcaxNsRP1L4jfuScKvJf
	Ihq1UQLnMzpaQnjH56jZ8aakWsQS7KrjxOOgDK3tdOXAj1n3+J8FyPcNfLtR2bVx
	xHmgMJ8l3Tpz3IMZpQ3YxtmDau91285nCmA+kmq2y6UNqXl5jREZ+8TK1m+tMGy0
	Yg==
Received: (qmail 1703051 invoked from network); 4 Aug 2024 16:28:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Aug 2024 16:28:27 +0200
X-UD-Smtp-Session: l3s3148p1@Ige2X9weds1ehhtX
Date: Sun, 4 Aug 2024 16:28:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: smbus: Send alert notifications to all devices
 if source not found
Message-ID: <Zq-QCvhEhk_Bd3xG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240730141941.2402435-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1esLGUbMCDPdwLQF"
Content-Disposition: inline
In-Reply-To: <20240730141941.2402435-1-linux@roeck-us.net>


--1esLGUbMCDPdwLQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 07:19:41AM -0700, Guenter Roeck wrote:
> If a SMBUs alert is received and the originating device is not found,

Fixed this capital 'U' while applying.

> the reason may be that the address reported on the SMBus alert address
> is corrupted, for example because multiple devices asserted alert and
> do not correctly implement SMBus arbitration.
>=20
> If this happens, call alert handlers on all devices connected to the
> given I2C bus, in the hope that this cleans up the situation.
>=20
> This change reliably fixed the problem on a system with multiple devices
> on a single bus. Example log where the device on address 0x18 (ADM1021)
> and on address 0x4c (ADT7461A) both had the alert line asserted:
>=20
> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
> smbus_alert 3-000c: no driver alert()!
> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
> smbus_alert 3-000c: no driver alert()!
> lm90 3-0018: temp1 out of range, please check!
> lm90 3-0018: Disabling ALERT#
> lm90 3-0029: Everything OK
> lm90 3-002a: Everything OK
> lm90 3-004c: temp1 out of range, please check!
> lm90 3-004c: temp2 out of range, please check!
> lm90 3-004c: Disabling ALERT#
>=20
> Fixes: b5527a7766f0 ("i2c: Add SMBus alert support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied to for-current, thanks!

> -		 * the loop because it will never terminate.
> -		 * Bail out in this case.
> +		 * the loop because it will never terminate. Try again, this
> +		 * time calling the alert handlers of all devices connected to
> +		 * the bus, and abort the loop afterwards. If this helps, we
> +		 * are all set. If it doesn't, there is nothing else we can do,
> +		 * so we might as well abort the loop.

I really like this updated comment. Kudos!


--1esLGUbMCDPdwLQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmavkAYACgkQFA3kzBSg
KbYoEA/+J8mqBaoaeJPSi6cnvuWdt1mMc1qbmfakfdj8hVE3Vv3+CnfGyp9hqSjX
M5X5gFEdC9ABXfY4tf0YHqnsXHiBQI/UnNeSERiwd6HC3s81zl4tri9HpfxDJr1U
gwqCI2IQH69TCyJYWiIbW+8hKZQmOq+7i5CjXfJJtDnWmEISNuqpDQnTbWgTATgo
o18WfoNxuomtNKT6FcbMl/FefqvY9k+22td7karzQqAplU3dFAaxilap77zX1/0O
L+4td9uExU59Dc+YOqbtQHI+2An0Asv1c8trCuoKZ+EG81umX6GV7RGMF5xDzI8T
vr7RpMRjE+7ANUysfAnCwEcaa39KNGzvKdPZls1LESIlIeye2L5M4+xFhx2xoOWy
KTf6knZ+n/x7tYh3aTck01xZfW1ADuUJ+P1b/EP/QcVqalUCcfWJb7HKrTpyXOQ1
Npf+IcmrWbUvsZklWXSXdPgH39f64B8b5+uEpDseC08LJ1ZrpS+vaMyDDZqrk4By
clqgC0OTFysqDdbJjW823pC8lRfDo0YkLwKZE22A6ok6m2qCg9WffU24bpzhz/8n
p5kgnYrqO6j6M1mekyQHysYXvUrcQMcNs8snh/O1/5Dal3C13qMNwLlTB2A9Mkcp
r4Nz3iu1pfQWW3xh4jeE+C/tEPGhmtfkd3IDo35BmqssXpzq/xg=
=uwFQ
-----END PGP SIGNATURE-----

--1esLGUbMCDPdwLQF--

