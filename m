Return-Path: <linux-i2c+bounces-14472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AEBCAD024
	for <lists+linux-i2c@lfdr.de>; Mon, 08 Dec 2025 12:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D410230469B7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Dec 2025 11:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF673126C1;
	Mon,  8 Dec 2025 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EnShWl57"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EAD2F6909
	for <linux-i2c@vger.kernel.org>; Mon,  8 Dec 2025 11:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765193700; cv=none; b=JgTxYUoHgN7dOut6lkLxqrx9JImqjXPulwR8Pg9wHzdt9mvvdM7yALBkP8g6ugZnZplQY9Px48dFJJ1yANweJchePxq0IFvDBRhqTLxPlXUHrvUKDvU2BYoLUFQrBvaofpLizrud2gJa7TuEAUoQzeKKO3LEbdKD5PtrfwSE4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765193700; c=relaxed/simple;
	bh=bNW25in4pRD8YOdAgJuUdg+9roU5D76em+oRLz4Nkb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn3C+qTiZ1GL7HoEh07NXQbvk3AkElbrgMdCQ8PfksWnbhN4xs7wh1oIGFRSCt4/ZNTDCaN8MqZZoW8LcNe4GFJ7AW8OwIkdiwwqWsEqlfdVBk7JsRy7OcskM58rUuseloZIWSxjnAeA4nmUbsBJwfthO+xG3DGf/omgNrGKfZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EnShWl57; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bNW2
	5in4pRD8YOdAgJuUdg+9roU5D76em+oRLz4Nkb8=; b=EnShWl57/y90y+Uvrpev
	AqLDBc24raurAucozBcqu/7JnoC/dzUahbItMb5hkVRfLQRl0YPvNnEGnuVljtLg
	L04upYVYPH3w+V7+dCOlO3sDGz5p0NEH2fLxEAgPUpny5lEHlWI8MwGtN3DXjD2P
	E+HMSIbsTjhs/VpigsmXJTEg+6TPm8DCa+2gpuBLmt9JcqhmBtC9i2mpOoNnF7G8
	ZDkFDau5TTmZtJ9LZV8FXpKkGiX/rn1hlsrtXAdmO1MBO6M2eqykEtVUwYlatAkr
	OMdREITl3PBlCmMPfvSjv5rSqzuoxi62O2gTJVkJ5mgu0R/G9pHGU2IR1pBEwKx7
	4g==
Received: (qmail 2513978 invoked from network); 8 Dec 2025 12:34:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Dec 2025 12:34:55 +0100
X-UD-Smtp-Session: l3s3148p1@T9YGL29FVtzdcafS
Date: Mon, 8 Dec 2025 20:34:51 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] i2c: qcom-cci: Add msm8953 compatible
Message-ID: <aTa3291WXdt5OVQN@shikoro>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
 <EB0BBDE9-0B5D-49B2-866D-112B131C8C44@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jjAItr+qvh2LQu/w"
Content-Disposition: inline
In-Reply-To: <EB0BBDE9-0B5D-49B2-866D-112B131C8C44@lucaweiss.eu>


--jjAItr+qvh2LQu/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ping for someone to pick up this patch please!

It was accidently set to "Handled elsewhere" so it slipped through the
cracks. I am sorry about that.

Applied to for-next, thanks!


--jjAItr+qvh2LQu/w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmk2t9YACgkQFA3kzBSg
KbbtPA//VytW6zUEhnDr9BalohpTqu6YA0qPYvgy9ApreeVmlWkuP7PxL5bmPTt6
eIA35gKf2hQ/5DWwu/o34vo1+Qih9mehEHVB9pvvyNr196ZN0i+l948mP09BiiS4
Z7FsO2VPAvtcsUvYGs0kMiBDT/8SgFB0CUwKEszGiBuBEoLu+l6/pQdOhQVc/zWr
EBfSUp6x7hRrXcJ1Gx+XBb3wOOsnzWG+6QpedeyCTD3+z2hUfHNtbmuAZ4vQPIv7
pXmbH9L5Yd04kWbkahk1F/THUCCf2GjkSDm6StZZYTpM7kISrGrZwG07YtJKQdIX
eAx0Zl3JnsMw195Y7H+dRar3GXEoRhJCFPPGVo6skzSUJZQK1pYeCcHPOT4+HVGt
DZrsn7pc7C0G03mV27t858s5zvJYcodllre5ENJif0QRvxW+1lks4pBiAfweqzlh
JQVKpfuOoLm9WVDRBvsjV7vwrlaeLVnZUtn8nHEfQCm9gTkb7uOI3ih9k+A3pFO1
x+woJcWl5W2MjsuT62WD/LczQ/l5Y8g/D3L11MmSDVryx2311N5iNu1uutHt+U5e
apoO2d2btdL8ziySOyX2KuHuncRFj7u5j7MyCm5D5eD1bzOX6/VexgSSMhUIOc7N
fcJzAfV0zhQowpB/1xKE89NluZMZvCokQZwEmVGxuqIphFKE3CM=
=7Rer
-----END PGP SIGNATURE-----

--jjAItr+qvh2LQu/w--

