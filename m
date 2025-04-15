Return-Path: <linux-i2c+bounces-10375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F84A8A8D1
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 22:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94F783A80FC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D1825291C;
	Tue, 15 Apr 2025 20:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NFlRSWdE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D12522A9
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744747582; cv=none; b=Z/5WYR6olBedIepxnUrkwknKw3o2/uopXcmgsRoN2IPGYV3LeIYWHPJm3eoDdiWG+foTzSmOo7oDWYMT2vWn2QxpvX0ZjUiSZ8w2Gtskotu/0TlXidCOOCGWJXypoH++Qla9jCa2mU70+lysLYqEahNu0/uliH3hOVfQdfoUWtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744747582; c=relaxed/simple;
	bh=DeDrcltpbQdrtm4FdzGHBLKrbrARjHG3sfxX8PWJV8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPdozSgQMn10ohnHv3lsgcLXYfI85t6nmjxuZFibHJ1ytEqTsQLf4Ba0Gf0GfrI6XuVlqrFBcjsw5zzcrpXsQaJe2DyWXSy7nRC28nxUErPfLFl2dvN+d69j/tnr5W/GiNB/5CoJSKy2qU6sUqE941+5vdjDaIlPWrZBXeePmvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NFlRSWdE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DeDr
	cltpbQdrtm4FdzGHBLKrbrARjHG3sfxX8PWJV8Q=; b=NFlRSWdEf3XpRDxFAgWD
	H61FRX71pmvgrK5wbYg4uoRxgZSqDgDuVaHJlmV7r6PMVyMFxkODahYPOA6NQuYm
	DDtUC3gauZfMT/ZMwZPtMdUNqR2f2c7jtQRwjvoeOCMSvTW6PIg+XKjUmGI2nIFM
	6XiSza/5a7ksXjvVWR1ONorx2isodPn1EKMtr1PUSOBtu5BpwgTS4zBlnlp09fqo
	kJpddYESNEBNwJVDLJJxcbL1klOPCO8sNd7c+ujVw+r0Zuw3eixCSGs7wEEonklG
	2OjmgaKeezk5nHtaCtTPXy8WVmJYlur+8RUOLgrOyxF5sBnhJyJ/BthCkixedZAD
	Tw==
Received: (qmail 429706 invoked from network); 15 Apr 2025 22:06:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Apr 2025 22:06:08 +0200
X-UD-Smtp-Session: l3s3148p1@1zkHs9YyEIAujnsq
Date: Tue, 15 Apr 2025 22:06:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 3/7] i2c: core: Switch to fwnode APIs to get IRQ
Message-ID: <Z_68LsxyaQ-Q0k5j@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ALtox1r3cqq093/m"
Content-Disposition: inline
In-Reply-To: <20250414100409.3910312-4-andriy.shevchenko@linux.intel.com>


--ALtox1r3cqq093/m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 14, 2025 at 01:01:53PM +0300, Andy Shevchenko wrote:
> Switch to fwnode APIs to get IRQ. In particular this enables
> a support of the separate wakeup IRQ. The rest is converted

You mean it enables the support of wakeup irqs for ACPI? Otherwise I
wouldn't know what you mean here...

> just for the sake of consistency and fwnode reuse.

--ALtox1r3cqq093/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf+vCoACgkQFA3kzBSg
KbbMoxAAm8vpH266VBjRXIyhWkvCG8G+FLWWD3ANJ/UiaV++sKRXg7dI9qNyKFSS
qU0q5wFDr04uAgosA40t76qONuyA5TyZe55jTIA82rarcYhAu4aUEat2qzy4IRPw
C+U0ywywQfrzcJYOgWQdUhka0DNqbb1ZBzVygLLQPpWfUt1c1H3+J1fpSc9eQfp5
KM2iEkoj915FvmkDL+kn3iuvwI4AxQJkEHZvwF0SI6DWPZ/kG4hXvnmDV8EhhFXU
w0ulqVp7BJbivLAxM3VwlXT3YZv347zlCeI5mrDkBxpFPLUMLBFH9svTp09sn4J3
ChRjml84xFCXv+a92kIWzb38Xu7HOcbKjb2jItyvslK0TpPIFYkZPoaR9O8ZMKTl
TNolA9brFKPwJVEjDNlXCWq2WmkDz5p8HiSlXUrclAEz1uJr/qNFzQqmijzlDbF1
1FhsI3rAMwvfMW8SFQc7Csg+e7WocoRXJAVzUj7HsJl6vjeWHK+B04JlGbdnNwyg
nO/Zhj+4gOa/4sB+oYSLXu2ER/qvaWNTB7wG/om3bmsfBmy8esLRZ7/iIzbtxB5j
26evBahw5rJZkI4RXG1x7FZtoS07D/g6PlQdN5eADVjxYWNtzX5w0lkp6Kf9mhJJ
80HuU5z94G4PLgxUd8PJYDqzC3a8dwya/2J+gFOJIwver2bhXso=
=XvN6
-----END PGP SIGNATURE-----

--ALtox1r3cqq093/m--

