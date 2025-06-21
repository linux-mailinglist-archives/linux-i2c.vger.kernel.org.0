Return-Path: <linux-i2c+bounces-11543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39463AE27FE
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 10:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65FEE3A8A78
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 08:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22AD1DE2C2;
	Sat, 21 Jun 2025 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Cibhg5Xx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11953195B1A
	for <linux-i2c@vger.kernel.org>; Sat, 21 Jun 2025 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750494285; cv=none; b=GG6U3t4rDEoMI4zvtaPUXhM/1QOpQNtOZmd2P5meGeu7uewmLdMsAW8M38sybBmG6P3XF4fiHayEmRA+8xUD+cxvmfZyGROWdqJiSE9ZgCUm4lohOuCoHyVP24SY9Vq2eTO/lj/kT+/BVaLGe0KLc+ZB6DbEjse9X4RP+6G0LR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750494285; c=relaxed/simple;
	bh=7n0RFAglSWOxR23I0nQyN0/6VhmDLC2SweABMfse6hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2XLgIVbHe8RICJ4fdSlS+qRjBVyH8tqf1Cvub3xlaEGTzlmJFoIk+s5QWRFg2ze15V2Rf2+AJqpgXK3Xtv8HNJo0HZCXUDKWBFvRFdnRagbSVf2OQknsqmp2qf/Ewzta4uTYS5lRiGzAsjqvCvymhFZDMnCG4j+E+NwmH+nYlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Cibhg5Xx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7n0R
	FAglSWOxR23I0nQyN0/6VhmDLC2SweABMfse6hs=; b=Cibhg5Xx5U5Eya0oInkl
	VnkG96RNG+1xn6d5poNegQmdCeMwknwxoHwKNAxx8fzmDhN6MVhvaKyEFqP6UCoz
	8nHwfh9dpyr+fUs7EA3BLFA/TW/b9P1//k5pUJdMnrWyl5huIQNFOr6elofe5jP0
	pcAlsPgQZ6cevFZq2ZFrqlgUpS/MBK/YeRsqCqFsKRQsfm0dKJKBen/ruNzGg91q
	+NJ7/NY61N0jtFUiT1ge8XvQhHR1SjmSiJXpF26d5gHuwaCgROhnNzAtUB31+Ulq
	kHiPecN/nQgBMrzZCuhhSRPP6rKOh9JazTVu8oHVTBK1crHPujAW76jlsEH9D0Qa
	Ow==
Received: (qmail 3046642 invoked from network); 21 Jun 2025 10:24:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2025 10:24:38 +0200
X-UD-Smtp-Session: l3s3148p1@Ss6ZtRA4cNOySS9C
Date: Sat, 21 Jun 2025 10:24:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Faisal Bukhari <faisalbukhari523@gmail.com>
Cc: jdelvare@suse.com, wsa@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Fix typo in
 Documentation/i2c/busses/i2c-parport.rst
Message-ID: <aFZsRY5p0ILZotXH@shikoro>
References: <20250621080244.158018-1-faisalbukhari523@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="maIgzWED4xBPFXVq"
Content-Disposition: inline
In-Reply-To: <20250621080244.158018-1-faisalbukhari523@gmail.com>


--maIgzWED4xBPFXVq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 01:32:44PM +0530, Faisal Bukhari wrote:
> Fixes a spelling mistake: "resitors" =E2=86=92 "resistors".

Please always check against linux-next before sending patches.


--maIgzWED4xBPFXVq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhWbEEACgkQFA3kzBSg
KbZStQ/9GoFT6KdvrafsrTaCchXn7rl0wMJ4Y7x40R2E0bslAbgIbFERG0jZr2H3
1NQe/R5GFhCqTZ3ELG1QcPRumxAblaeSjxywdZxMvuRyDlR04REnjzGcNtadIB4z
V+6qdupuCggMG6oe5RmlN95lXUWOsimUbzXXh5Ai478Sq3NXE0BVTJYE5UOSFhE8
n5Kn+xRMBs5XO9TgzaRXTUFPZxxAk409Iz53nZ7ESS8DCYY5JXIZg01k31HQSjUq
hdDth7jLIkYBacthqRQQjWPlvKDsVSPAsQtvqctBw/6+UaMDX5TMZkPBJHHoEhx0
lUPPs7owt6TJk7RxpuZH8OTaQIxgoiF2ldN4qJJDAmlj9XIZw6RfttI8nXdKfs1W
8jVTBmMGTKUvncKVyPuoEO7NlZ9gJbFnETzpy+1kvRegEvGlJn4dPNtMGsXr6Ciz
KPqPYNk8DtZxcGtuVYCnHLEKYMBkXvQ/nQmO8n93TPSENgymgV2uoOstI0WVzMtd
W6aPVUopVULAbh/jf7FrCb/+oxin0E2vIqi9lDtcFBmIhZg6asotGkvSGbu+/1kI
FYku3yTOmItsWZTYK1P8b/XFbRdzLX2NFVFqZ0xIxWvEnimtRpidLEILC2At5egn
5WHZXyut4EPD/8rmow36rbFMnDmgexQYnE1gorsuXlPFhyt19rg=
=lzIv
-----END PGP SIGNATURE-----

--maIgzWED4xBPFXVq--

