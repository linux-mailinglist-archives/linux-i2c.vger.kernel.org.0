Return-Path: <linux-i2c+bounces-3419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD68BC830
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 09:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4B271C212C9
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 07:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563DD6BFD4;
	Mon,  6 May 2024 07:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="faNzfGrJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111E59155
	for <linux-i2c@vger.kernel.org>; Mon,  6 May 2024 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714979825; cv=none; b=uj6OjxiowLyqsx4d5EIPOuCpUg/YJx+Axa28EYCDb/jiyOmq/018JV+CCMqv8Yhr0+C9XRaH5rFVVRuBTClkAu9U5mWAAmCxaAT6WVMPoA26XEGno1a1fqKzqRG06czcwL9pFlM1eBJWx+789vbeehg3mEvPOP2S6lemeBw2xOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714979825; c=relaxed/simple;
	bh=PstHRSKOKcqxkShNbxwk8FnDsybyAX0RVodevHpQZOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jj+eB9p7o/AVqZoQBkz5VxxWAzlqqmAi5/zUwRltUwTanx8kWUkP4rBUHr2IsRXUnMlqvv3Iqpr6rjsZCfedWGMHnFyWo0Ma5qJiDrBl9M/eOFlnsfwn5Op32XRcIud3lJs/2p2cP3Qis6tLdVFJvoZR86yklIHmAN637MXJmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=faNzfGrJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PstH
	RSKOKcqxkShNbxwk8FnDsybyAX0RVodevHpQZOg=; b=faNzfGrJryK08DJqDT0+
	sza/CDfFUB3VaQFa5UtvfuVem6PrGtFtyDr+bk619/O/rAwLZDub04wOeq6SQre3
	6FtmpbGhATDU7Kgw4UeZncC/rwnRi8AV0c4mJNSuDyQexYM3yCjzUrFjHdHIi5la
	c7TT9SI5Q6v4RB/KuFx4vQZC+fosRIAn+0bofYkU262LYNs5kkhEOZl6zJY4F1HD
	l8ydvqKcqEuRX24vPCwkZJ1vdKcXF+46qNuvdqitPPQWdU6WU/0sK2p9+elgr8Me
	Fvz3bauXPRX/D4CJucNMa5XN2TE6+IXv0udCDGl1AhhW/kcxT1JyJnm8xSkITxsw
	Ug==
Received: (qmail 93991 invoked from network); 6 May 2024 09:17:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 09:17:01 +0200
X-UD-Smtp-Session: l3s3148p1@zlUF28MXFssgAwDPXzrfAO1ieDVkyUqz
Date: Mon, 6 May 2024 09:17:00 +0200
From: 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
To: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v4] i2c: acpi: Unbind mux adapters before delete
Message-ID: <coknwfk34gwerazcxjuzcitxdijua42qrowtclo3nlp4m5q7jo@z6onvi7k6fgf>
Mail-Followup-To: 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>, 
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
References: <20240312221632.859695-1-hamish.martin@alliedtelesis.co.nz>
 <89b741977d593fc951fef662eeb798c5d0022610.camel@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dasidqqd3am2q5b2"
Content-Disposition: inline
In-Reply-To: <89b741977d593fc951fef662eeb798c5d0022610.camel@alliedtelesis.co.nz>


--dasidqqd3am2q5b2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I wonder if this patch has slipped through the net due to a process
> error on my part.

No error on your side.

> I submitted this corrected v4 version on March 13th. Perhaps I should
> have not submitted a v4 and that has screwed something up, or perhaps
> folks are just busy ;-).

The latter. It fell through the cracks, sorry about that!


--dasidqqd3am2q5b2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmY4g+gACgkQFA3kzBSg
KbbVTxAAmU4LveOl/7cdDzwoc4ss+ZPkXzHqqcMzzjVnH+QwTSTIlSEJrjEil4wp
Bb1O9aUUSIBWVfcqIKaM9con7RwZ9M0Kiff2xkLiCD7mROmAlSzD08fwEy6L4ckI
3p0bm50qQEM8tC1JX8y8f0us+mnr38q0fHIa6+z/YB78ph9ALfLssLQqDBq5S0lm
8Si1vJZoPq80LvAZnOT0zXv1DH5k5wjiDDthrQvnZTEKsP1hRFrkIvxkxg/K/sh0
7pAjR7JFBXTqvsnHinQz9oWkYz9/Kneq8uaMaF8Lh6lB77RC9EOgXwiO0OIC0S2o
DTodK2xW7MnzRiWJXvxGjluii0GeNa2dEqNfIzdMCtIsFsZWgxm/+SQLzA0H09XS
FwZKKupimX2xvvTwW5LJm466bMZqHznanJKwiLR43EtiiWMJsiXeQaQ7UeONcaiJ
v00yBFkoJts9UcwZkmC9k42ElRGl/1UMCXMF/rn2DhVC7iejGVT84yCxE6Js/PUu
SLc6IRYrygJ0YUezNvNdouDKVCjsmMWHVIhPuw+sDPf/Vqv6RJIlvdcjXDCKHtF/
dctZGeUjxLckpIfEwhnO+ntN1dWRtrTuYmkakLG4dStaPjIpVqAWoceUa8WXtS3r
GCfrLYvuFHh8FcWXGbZlzMSdUBaKky2c3XP9fwh/p6o1T2F8yE0=
=ur/5
-----END PGP SIGNATURE-----

--dasidqqd3am2q5b2--

