Return-Path: <linux-i2c+bounces-7909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0AB9C2FCE
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2024 23:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA60F1C20D35
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2024 22:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420331A00E2;
	Sat,  9 Nov 2024 22:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LxnzV6dq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E871143725
	for <linux-i2c@vger.kernel.org>; Sat,  9 Nov 2024 22:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731192561; cv=none; b=PZETQwJaN02VuRur9UG+40HgmwLwEUCG013+eZgYV5rr1uBY/R4t9EFwfV3y6caHlIry6RzW55+PtPumTTnPqgvPxbmuxrKmGnaf2r9QASEbGIoA89trV8tBI/Bve4M2NAsB/oGxPHhlY3EvAP0N5gK62QIHr3cYdDpjp+N/+s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731192561; c=relaxed/simple;
	bh=73e+vrdvdhoGKqX9VHO0bUjBMdE3jxeAuPODAv+9yT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4cbtQUuMP9CVlh4us3Q9Hv7/g0ykDkJX1WH3qnnOD38Ed17D2osvLoHCMZikNBj8lZFZdqIgt3yCbhkJUjvjYKgEytghHkM/un3KdnoJgVugTSRR+lQjy8erTWt32xb1A89ZzrLDkdLPH4N3LUF88hgyXOsiGypZz+d5upUOUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LxnzV6dq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7PF/
	HP9U+Kb+DnYc/Pwv/OxdMkxInK/kmU3tuvOcPLw=; b=LxnzV6dqQ3VRZp1/bbU+
	cMXj9nlXx2tqzethKSVgWAaClB0tXXXjCGnBzc98u/TosOZYyw4xx2IAqKgaXTeA
	mFqMZCC2k8RW/mk4DSYv1dMPyXsTw7+vPB+RfZd7BDdMYaZJAXQsGcKuTdIhL4Hv
	kbxlsKEstL/TUxPYaIsS4tgbtbNPUGjzr8uznCpo93OqcP6UeQaU0yYNwNHSema8
	cT/yBTa77T7KmxeFfbrEH15yBrbi17wMws3k/iJHopKlXP1n5VMdx/CY37jSsUIf
	i7QHOeRbcjFK7JA07YQVKXpD0TJQcKhNhdC1CJnmn34mTg8b8SD9/U3USFEsCWIr
	oA==
Received: (qmail 1680425 invoked from network); 9 Nov 2024 23:49:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2024 23:49:06 +0100
X-UD-Smtp-Session: l3s3148p1@j6jBrIImdMdehhrW
Date: Sat, 9 Nov 2024 23:49:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.12-rc7
Message-ID: <Zy_m4enf2HrK0X0t@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <mulwdseybgm5uo4ml5zsurp4wno6afjwbi4miz4dm5zc4whtav@fqlocb6allqv>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5YfHOeUtfGDsvDt"
Content-Disposition: inline
In-Reply-To: <mulwdseybgm5uo4ml5zsurp4wno6afjwbi4miz4dm5zc4whtav@fqlocb6allqv>


--y5YfHOeUtfGDsvDt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2024 at 07:23:12PM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> Two fixes this week: one is the fix from last week that you had
> doubts about.
>=20
> Thanks and have a great weekend,
> Andi
>=20
> The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf2=
30:
>=20
>   Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.12-rc7
>=20
> for you to fetch changes up to 8de3e97f3d3d62cd9f3067f073e8ac93261597db:
>=20
>   i2c: designware: do not hold SCL low when I2C_DYNAMIC_TAR_UPDATE is not=
 set (2024-11-08 19:13:06 +0100)

Thanks, pulled!


--y5YfHOeUtfGDsvDt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcv5t4ACgkQFA3kzBSg
KbZEHw/8Do+RxWJK4Cgs0hp3BqneyFl6IL7tlNVFfBYl57m/k9nGxbVhOwszTUl1
g2j9GYMgs8a/uDeUSZWzSUAe7MrGY4WTubxE36+SwRinDK0oo9BJAgEdYojTnTSz
TQsxDH8041jDJt4vPrRp9CPjKfufZtxCxgdroupMKNAOA7hoyVm3ALJdgPfUE+rj
DM6uCNd9d6FKfaiAaG9ZD7HkxAO5JUi2aFhFHg94NpPaEyrDLdXQ/tvPYP4DdzAp
JBMxTcfnlzNiEhcgcKEf8v/BZjlJBO1AO9rYOnJy76klqJLbH+4cj1BUYldatbYR
uX2+u4N78iEpQNpW+fLZM38NVoSTWRVvuFFKdD/SNaUK9D7x7OrCW2RAgSL920sN
u1HaO/AZZ+0zOl2aH7KU5XempDOV9sDWKgpcOtjdXJ7fMruYNGcpPRaAlIhrDl7p
zr2FICCHdeCtP+ZpuQKzFx8/RtXV+dPl4GWHW/zdNtIWbgBCG9JDh70WudrcnBb7
sQVR7cnzb3LBfqVA5AjxzU6zjyeWrCNp/ZCbAiFi/KFVMmYgLGtF4m6jtKfMEIXZ
6k9PrwsR1Xz7i1JtbJO3oJRaFee8T+igpsROlB30yLTah2IbIoVRJAdet6lEQrDH
uclYSXchaDlT37O2n8g7uHKKSHaEvZlxUVeuQqweelv4gehjr1M=
=Nmaa
-----END PGP SIGNATURE-----

--y5YfHOeUtfGDsvDt--

