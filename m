Return-Path: <linux-i2c+bounces-4623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB2B927376
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 11:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A93AB22B80
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 09:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5913B1AB8EF;
	Thu,  4 Jul 2024 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FXiYq9Nn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1AE1AB526
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720087080; cv=none; b=nDNP686LQoEEIYXGy3H+QzT/8zo6CHJ7SViWnd/tEvD9Z/7cMAPROVzZDYxE1vAu9prB+Fup3ny1OjQrenYdZzWbg7Lh8UPxvimFmhhIgfLyAMgIFIo68Q4vIlTZPZPcnpO42Nj0N7SE8CqWlctF8P930wuOELHRrYsqXxNN1hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720087080; c=relaxed/simple;
	bh=YmOK4m5U6cknSGVhyDKOumu5MtRiP66NRo0AL7Q58Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxwbBfAcVBHAyTtExaaGUpGDdGLdwnlAbwTaVqavNeH00eCnTp/ePQACMr/V8JwyFphkuDgDtww9z4ACjWUrFRTs5R6OaZLnVDiifIOQs2UDHYXR4H7PtoJgcBSjiOl6+xHCFryhv4PGtFp4n2RPQODLl1SKCW7Kv1UZ/pxHtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FXiYq9Nn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YmOK
	4m5U6cknSGVhyDKOumu5MtRiP66NRo0AL7Q58Rc=; b=FXiYq9NnYgeLYeH48jgZ
	29xI2S96eODs/TZidl+XUBpi00eVU1OCBBDFn1zSO75nlzwyRkCVPQk9tQE+svrf
	L00M41Q6umF2vxRpkUgXLkrbYhqOXwYjpDN5S/dykHmbmInqL0OmnC8fAYQaScYG
	JfMW44BP1/Q+br+y40Ly81oGb42WWbXFiA4Msf7B6x3ZlwYqOPxfgDA1wZZzvOcH
	vOHVSzkkQwBPI4O9aFyX7umKP40Gs0OaUKiYJUtc+f2Q9J/3CV9SZJaUY/RWE3fT
	W4omk3/qnj6qOceuBrWFIO5UCl6o9ZiLLSfa3i4RZkZfi2qI/Tn14Q92lKE8Biso
	vg==
Received: (qmail 3114843 invoked from network); 4 Jul 2024 11:57:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2024 11:57:48 +0200
X-UD-Smtp-Session: l3s3148p1@M7mn+mgcwZJtKPBS
Date: Thu, 4 Jul 2024 11:57:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: rcar: bring hardware to known state when probing
Message-ID: <ZoZyGzMquiIMwAni@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240703071625.5389-1-wsa+renesas@sang-engineering.com>
 <g6mthbu3bbg2vl3aobci2gx7lbfy4qbiy7cy43v7wwgjldauc3@qv4yrctu2bmf>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q0VeMWD0tWzjOhbn"
Content-Disposition: inline
In-Reply-To: <g6mthbu3bbg2vl3aobci2gx7lbfy4qbiy7cy43v7wwgjldauc3@qv4yrctu2bmf>


--Q0VeMWD0tWzjOhbn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Do we need the Fixes tag here?

We can add the initial commit for this driver. That means the commit
message is wrong because refactorization is not the culprit. So, I will
resend with Fixes-tag and updated commit message.

> Looks reasonable. If testing is fine I can queue this up for this
> week's pull request.

First testing looks good. I will do some more.


--Q0VeMWD0tWzjOhbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaGchcACgkQFA3kzBSg
KbZEaw/+KSzAAXpVn6oMqen9AX/HHUDoFwzhp+2JzAnLG8MS9FA7mznH4INlKByj
fb23DkO5qm7JOt/eoAhjV69kSrQYusFNbz/UbjVZV6R717+rzhEDmi6InOlgF0cA
W3WBQ6sTUPAv8ts0X5crBKVr4YQ3sK+mB+RPXJfUn9FjW/RzTHJkWOuVAP7RFIEv
nR1yu946og0uhpuieSfF55cp+hjFby9NLOMROmSgUcslrr6tjiQSFvS1h678tFYZ
eBogpPwDo2vrBkMM+5o90C6dNLieFTSCS5PLrXkMQOtJoRD8GCkTsBM1sRHwH2/0
JVl938Pdd1S862z2Q03rFQEkEU7H9Z3xI189CBpTYNHMiudZfhgBbKGH1pAEPsZG
AqxWGW1WAi25aERNnb7l/OHQ8kRItnaNofyR+MTGKuHcDXcOi442pxECi2hrYlSz
d8MKsUXZ2TI6xWw+MpZ2wAXClwaKAAD2PLBVDntLyrJlXpPO9cSNfeuRL9CpF8p5
RBEf0ftFcKsGoumr+1VWT4g/EcLJTZ1co5yhcLdP40cOUzn9s4fJIPzsUHdK2JcY
45/R/xHYlsoN0rM32JryqUt8X9LzhWj8avVygAO8p+i+l7bBgKgY/0lv3Mt9HWJS
KuaUtKeoZ81MqIur4upYkC8pW3grgph/ELObrZ+3Vj/aVVy394w=
=Yhm0
-----END PGP SIGNATURE-----

--Q0VeMWD0tWzjOhbn--

