Return-Path: <linux-i2c+bounces-3245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A22508B454B
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 11:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E323281EB2
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 09:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035F74642B;
	Sat, 27 Apr 2024 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZbfoGwnO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C5040875
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714209261; cv=none; b=L/tOF8PfyqRpmZYe2lNgzeS/qQYUXua1z8CQl+lWmaAp5QMsDQBAO8zT1xV8K6E4c3+K1EN+BD/z/8lSjwi32SziloInBEMWVkU0aShziefjyYPGBPI96Zv2TWhgWdsiz6xXnM/06ZJjv503AhcbKgXSbzdBdUuN8Vd7r5GwLWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714209261; c=relaxed/simple;
	bh=vufNbsFjuvsWZANwyY5we69EkOhoysOpuy+LloNbTeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BifR1+RxPkO5Flikj1CbKlzkn/VylpQlB+xoUVyg+oa+0BXFGdCkfSGZzAx1EzIK2q9meLhFadGPRKvIE5gyQhC+/oQPTyccqPRcj1p7ZspqU/4rS6siyKObYCD2eVF/RQRCIn05AO37Nc7icivzbhXojEY5mXE4gn7Dm2YH3VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZbfoGwnO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cWs8
	k+GVFplCjgl9DUc3V0PD20kXbgvT+vO+6jr+fbM=; b=ZbfoGwnOekjjKTHtWJhD
	nMYp5gvnmij1/BXqjcciz2Bvf1BlIh+QxLyT8JLqjKs/Spcgj5NvmQOTFRN5EGzK
	Qirli1BSTjM0pZxc/CAihNLDWfh9ZIH9tn6wkJ18oE3tKl2FiK1B/z4xU5MmZwRa
	yl9O1dt6Cgw8JN9NqJqcwymk17KNAH8mjtqDxxNvQiR+7VNk1mYKN+ejd3Yr/NST
	Kgi613VBw0BvHTWOcs7W0pLwWWFQfgKSfrerJ7k58vF7D/xJCT1QY3uHgUd+W+Kv
	9dDJKp2O4y90dcnYm6gNyWSD1cNwO6TZMw8HPSxcg1f9vKqg3+opRzOBMex5DfiQ
	fQ==
Received: (qmail 1636660 invoked from network); 27 Apr 2024 11:14:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 11:14:09 +0200
X-UD-Smtp-Session: l3s3148p1@WL5ZcRAXENVehh9l
Date: Sat, 27 Apr 2024 11:14:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: smbus: Add (LP)DDR5 types to `i2c_register_spd()`
Message-ID: <20240427091408.3gbzxe2rlu2m5wyt@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240426220748.28184-2-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kausmgpaq4p3oq3s"
Content-Disposition: inline
In-Reply-To: <20240426220748.28184-2-pmenzel@molgen.mpg.de>


--kausmgpaq4p3oq3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

> 1.  I have no idea if the name ee1004 is correct.

I am afraid this won't work. It was tried already in 2023:

https://www.spinics.net/lists/linux-i2c/msg62267.html

Especially note Jean's answer here:

https://www.spinics.net/lists/linux-i2c/msg62420.html

So, DDR5 probably needs a new driver.

But thanks for trying!

   Wolfram


--kausmgpaq4p3oq3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYswdwACgkQFA3kzBSg
KbaZrw/44I+MPeOz+tBatSvCkhLS0/rOskhqdsnq0YRMzRIJe/xPSKulvS722t7j
lCIe1Q+RkzcwE64kFfgbM0nEb+1894uA7jH+Db7DbXe6xyAKJxZ1vgtIjfd87oNn
ekc7VLX59q6Duv195tZTuBfrhf51/4NVWoStkGw7Zuqpi4gc5cYQRs8nnXio5g54
TDVvsFwMB9whn7II5NFjEG6A9LYr08VmecJN2g8D1LM05MHE791rRI3zBwjxYzpH
h8HRjoUn0YM7ZBhvCOSDN+4zF0lY2AqmSGYci4NHmQYtG3i9yrESB9ztt2BeCMnm
/NyFadF1bFjc+unpCK9KQCfiNL0sktvzj+Ey7mGE5cbE82AxPnCBAXsNPsQegiMP
ekC1fQmUktNiINwMhe7ho/N8Iba7FQV0Z/jhul26wLdylTGFWspbVbayO5dE13p1
uxI43FNaJ+CU+MdxQHx3DvBA+knCuKOIUEcxwbzRuxDvAIJwPRumxVLnbbbdUObw
m7vZlDPg8brI5EYtKGCthzSNkGcDCvYY56c2EVmGgyeOfYfbrZnhlp09JBJ9H0E0
bKvaBbxghpSkeG1MRsVpMMUzWqRwJzbphEANrpNtL2+obH/9XhGF3WYlml8QCIa7
n8y93PNhFkFG3WQx+60qjnq4Ivj9X5niIalJV+vUHNzH8ivvyA==
=ywlY
-----END PGP SIGNATURE-----

--kausmgpaq4p3oq3s--

