Return-Path: <linux-i2c+bounces-11032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72733ABC1C2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 17:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2004C165B05
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC512853E0;
	Mon, 19 May 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Cb35S6o5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C356284B45
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667456; cv=none; b=gMmNAn9g/vPrCzRp0Z1CIcanrcMQtrSxGKdz7I6snwmj/LMTiRKTZfHXY8oXcwqYENjo1AETGgYerikDeXHf4cMxn3OyE0iq+FztaTv2X96CTE92RiqQMgjKTe58nk+YqPMXKFJl8eVmWmNZN4gvR/+pcBxJe4yrON7uKNKmA2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667456; c=relaxed/simple;
	bh=EfpEBuNJzIRp53V+zQiIC147eCn5a8qcge5EgSQo3L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIVdDLrfqstA0McvrE6XpmGnjMKmw/O9TVpzSFI549bj9Gb8fNpld21JQ4G87CyWnzAzyipWJQsI8bASd+lVvm/iiNcDYCE03KK4jGQ4ez7aiK3VHBqkicK8Z1PEC/Htp6qgnYORU9PYqLO8MrQWQu294AqP2YNKt68JdRnXT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Cb35S6o5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EfpE
	BuNJzIRp53V+zQiIC147eCn5a8qcge5EgSQo3L0=; b=Cb35S6o5vp34zOlnBBgM
	0jGxMjGpcpF/50LmvH2IvBtOxc3xta6k1hUHxREDfoJCvlaIQvSxhh+28fxFjGEl
	5KFEtWaxVJuQj4jxXaA2+1+SX4oKyd5mFun61lRv1iQz9JtRGN92/unYyHg0TXqT
	Wg+r7INbeu5FjCOE6cZ3BDJZPO4NtPkilgjueftmfREuB6ibX4x0ZEX+7S3tfIC2
	B93jtyY7aT0B7+w2ayUPRcB7zcZEoQ5oFhFhYshle+HrVtlN2Y1kfb0PFMuFM7Hj
	3BsRFIaTO9jW9w0n1FCQUPxbr9LRbfJPLI6YfK7XfoDBjKlbu3b6AJPfrkOGJifM
	CQ==
Received: (qmail 2535207 invoked from network); 19 May 2025 17:10:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 17:10:50 +0200
X-UD-Smtp-Session: l3s3148p1@8OyMiX41mqJZz6uL
Date: Mon, 19 May 2025 17:10:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vikram Sharma <quic_vikramsa@quicinc.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: media: Add sa8775p cci dt binding
Message-ID: <aCtJ-Vj7oebFcqBX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wenmeng Liu <quic_wenmliu@quicinc.com>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vikram Sharma <quic_vikramsa@quicinc.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/qqJFcc3uppywh4A"
Content-Disposition: inline
In-Reply-To: <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>


--/qqJFcc3uppywh4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


$subject is wrong mentioning "media" instead of "i2c"


--/qqJFcc3uppywh4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrSfkACgkQFA3kzBSg
Kbbung//U6jDHPsnAuSWJgZKTKEzq0UJXA73DtnjBLtXCZ2aADELhg4R9nx4PNLU
FHuk6N5xI8XAiFZpUescMuTmMSvM1gMhb9wGfDGt3fJQsgJH37r2TKNUOYIyWMGu
+14UuGmL6cZQIHH02jLrU+w219ZzazKGJxGRZFUoqRfufA/vb/bxO2k2uUB7THQm
6alkPPD4j0Mhs8pRE8975TsTQnBkJwogFJBdX8lqOhnylCrdrczNckWSTY40FaD5
sO1rv6vgHrSpEGLntcl1D/6FIZ9VJEKodQ2/B9eB3T2hXgByqH2/Zlqn7EpJ6GEy
MeN+uq7sxJ1/4ShtaHlqlSUE6m66RAoRtLWFPE7JBoy95GkoBHueBEbZMPTIiGjF
uCGLP6NrCjv1syp7VmMVJ+NcUt23m4IihCkdJTF3AnX3mOcjC2rySr/kC5Pepuiz
eHSBz82Yrs8VyEj2FBOe74ArIfqn77Ktnxi7M4rLRi2NAEvEYsi+uXkkqXX6PrnG
Tfz5aa/b/vajjczKFOFPWSFeqR1gETaYWAGRQ0Zqte338C25n0LQ+OltKIoziOKf
hOcBXc5+PVwIWV3g9hBkdpaNK9jLKVVI1PoHKgnT/uHapicXLnSALs9sKr3XvBgB
IJrXuBUP1s0QHmoHvCm2592wR7peRPbKtHVIapxN20QoZ+V1hIg=
=v2yA
-----END PGP SIGNATURE-----

--/qqJFcc3uppywh4A--

