Return-Path: <linux-i2c+bounces-9961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7091A6AFFB
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 22:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EAE1468244
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 21:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADEA22173C;
	Thu, 20 Mar 2025 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bk68MoCa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2375215162
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 21:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742506681; cv=none; b=GGtcKZh0HVi9dE2L+nTcerPhadKnqSCjeebFyMqlNGrZBcETWH4wqlzr1nrqnHjy0BKt7ojZq1EatcYqNc9/8lrME1swKOj5e7Vg7VROTKpbv0lAQTDRny6xRP2OdfuITmvuM2rxl9Q1yoFbSj7v+gmW2cDmgGJ3m/i5+pR3D2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742506681; c=relaxed/simple;
	bh=lq0seSl838vsfvLLdwYgAkkukuUzoHZcWTN3JqN3KCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mowQhLl3EyUZdX5PXM8O33k4q7EQF9Z39PPsfPmxL/0O1YXEXwxaPj8qwFGRHhMr/0soawmQFPWCh4ILAeWpBw2dP36paFBw++7ABF3KTrnL/T5I6EOIFDRP2s93TCQhvFeHXDtIcmNp5AoHRR7O5Q7VDoTRk1rwHkqzIbbEO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bk68MoCa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lq0s
	eSl838vsfvLLdwYgAkkukuUzoHZcWTN3JqN3KCM=; b=bk68MoCaES45upC3oop2
	Kn6s9GIVarGt8ZYCBcAi9u97pratXAXIEjkW+Z6ytiXFp9lLXvaB4OUoDi7gP+II
	9ehRZDPAp15AFby/TssjgcnP8nmkQ/Q3MUJ4hQs+UOqBi9wEIy3cY49aNDXhoRY9
	giZm8SToC2+7W79zKmyK9ugqLdi/4tB798ImBoeZFE7ve96fkBNvX/KZjcZc4vF/
	cvdXL1huHO9oqusD6/EOTbu4s18isYsJjwXLSYGYCr6BxdVS+8MP6eNA6N2nwUuD
	poRvKr8cyXUoyDHSM9vTu/wDlQq4ZZ6aDR7a+RPHiDOwpMW/KGzbo5SIRg8wA0vI
	7A==
Received: (qmail 890200 invoked from network); 20 Mar 2025 22:37:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2025 22:37:54 +0100
X-UD-Smtp-Session: l3s3148p1@MVRb88wwnOMujnsn
Date: Thu, 20 Mar 2025 22:37:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 0/3] i2c: Introduce i2c bus extensions
Message-ID: <Z9yKsc3m3TGxan8Y@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
 <Z9wO8SIy1CcfO0bZ@shikoro>
 <20250320173150.2c823635@booty>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3WVTtqz3snV/MF4K"
Content-Disposition: inline
In-Reply-To: <20250320173150.2c823635@booty>


--3WVTtqz3snV/MF4K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The i2c-parent was proposed by Rob [0]. The need for the double link
> is what you, Herv=C3=A9 and I had agreed during our discussion after LPC,
> based on having realized that the forward link is insufficient for some
> cases (see "Second case" in the cover letter).

Ah, we talked *after* LPC. Sorry, I remembered it wrong and thought we
talked before it. Will check the patches.


--3WVTtqz3snV/MF4K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfciq0ACgkQFA3kzBSg
KbZd8hAAoaLzOvv52m8y7eLlswiNwv28Qvdbkfcp23+eobue8OafMpTXWIjzxw8X
T5U/S2bm31CWIaeyjc5GQXtGC4kCzzdZtQjbtQEv5nuNXI5NRNuXv0/i36L2u9Hd
H5Q3bXBk/uFTi8/f39wFBSW+NMaoFsO6/bKKQ6fF3lnyzt2iCXmU4ocMiu0/Djm2
QHOXXsjNa8Q7kPtkC/QPnMj4wRXJ4xBnkoCwGpO6ITQauTMo4XFDJmgK7ZTAQyfL
bb2vSJfSJ6mxKd2V2bpxUVuBD2qOCPi+l5LM7GXrd58GySGUbRYvtKEpPL+CKmD8
m6xA02RzYt4pGrTWOlrkya9Q47lFcVuwj8kBz1aOhpH9L2CyuwVHy8FtYOzXEj2X
7qnuBoCpTtyl7GODOoCrLCJDTicJ8qJpVUQ0X70I8gAkkeuDHFelJ4noX7i1Qahh
pP8UGkU9FCgSSjKIsJiOS77BWKLyQAkBVunJ11oO9u75AmK54CHUD2Ul9kL4qzO2
znHQxcK6/0oRtmtOHxNqkZfpOoDxD0RzqS1pRJEGrP8CngcKdNTYxJTifXyfjTwa
jGuFsekiejRtwqz7MVARZ4tp8liiB3+CqdWKMJsfHP6Mk1jjeMyiqBNVlkr9fOLf
pGTgE8LXIqzuxjK9yy9lMJKXtmHuIuMaXwjR/mvDejO4ZBUO/Hg=
=F3ay
-----END PGP SIGNATURE-----

--3WVTtqz3snV/MF4K--

