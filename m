Return-Path: <linux-i2c+bounces-2826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA389BB35
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 11:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4A81F21808
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 09:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BE84645B;
	Mon,  8 Apr 2024 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k58Mc4ES"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8174595C
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567244; cv=none; b=eXJheLgQtTVN8Ycek3eHFNOZJHmqssvXdO8GR9cVcKBv/D775LBBcik7NNa6b3HJpwVzldWpITJTd4Td3bpSpREvHxyT4Q37xtV22H9AZ+oNY9KTPzSTVAJ/IuMQ4gIjcc0H9hc4CDuzWa3IHPUH/Yx+PFsufp+R1y1fIjbN4+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567244; c=relaxed/simple;
	bh=GjWa/RjkkGafcaWjEusibbphCAEig66tgMiPpSQdNps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9CZaNhMn7JopstSt7IOXE0te9cHXZouzuYTDAm0sCre+n6jTsxjA3wC0MqwuiXJvudmAjR4vs0Hr668xBcOUpZpFEPiyfGBF7DAt6Yz6x+0/mT/NRb5hje/iBUIG6wXV4wi0qMdYne2tDNwaMETbUVWKwL3o8qwut2pA6GqEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k58Mc4ES; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GjWa
	/RjkkGafcaWjEusibbphCAEig66tgMiPpSQdNps=; b=k58Mc4ESW9MYcPvf8eX8
	27Ln7o20ylZXGKvSxE//2f5SIVEH1hYzvuOIE8fCTS9vZPJZ8Lr3ERKHdpfR/YOm
	NXmgZUi0szsgdjUnMrB7XdX2uQj6Lnnx/Ps4kE6cWbaFHDSkFYdXjWRt2SBKFm4g
	VQfB13EvseL6f8jI/BGSuQwOAiLgRTXXNpVH0BSXTsTw5NjQ+L4KRcV2wCHO1drB
	q/OIW0wIIMD1CQr8WiRQpnj8kmB+74Cpnj5BtR9gnvt0NXk2kwB+Cig/h4/20JEH
	gV5Gtwc0sYUuzdbrsmHWGAd+lOvit1JHuWYX6h1DNMoPRf2Qve7ksaNh58VLfqGr
	aA==
Received: (qmail 714219 invoked from network); 8 Apr 2024 11:07:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 11:07:20 +0200
X-UD-Smtp-Session: l3s3148p1@4V0DIpIVSqIgAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 11:07:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/64] i2c: highlander: reword according to newest
 specification
Message-ID: <w5jl3r2ta5qebzt76jkkszqkxlycp4d4sriyz7kxyotpza7q45@sq4kkk723uzz>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-23-wsa+renesas@sang-engineering.com>
 <u4dtq2ii3kjvwj5hhxogcqje27adpoxxlr7y6bkqo2suqcumxb@p5vsjp3m2rop>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2h2j7mvrz3bhlw7z"
Content-Disposition: inline
In-Reply-To: <u4dtq2ii3kjvwj5hhxogcqje27adpoxxlr7y6bkqo2suqcumxb@p5vsjp3m2rop>


--2h2j7mvrz3bhlw7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm just noticing... what do you mean with client/target? Can you
> please be a bit more specific?

I described it somewhere (and Easwar mentioned it in another thread by
now), but, yes, it needs to be better described. This will be also in my
updates to the I2C docs.


--2h2j7mvrz3bhlw7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTs8gACgkQFA3kzBSg
KbaxQg/+JMkEn9CKK37sz/CQ/cn33B9pHhSv2bHRmjt23CixmbSPlheW3IHWL3Uz
WFMOYhdCvJ+Vfp2y303gbjch798trmxJsJ7dKxQNh6WXA4Hz6yV5ULYBgZxLoyBJ
ArhtOj08+Bl5Tjb1cjJj8G/1kx0YO1V4ejdVtXQuIgMGaXUvl9koV41gbW4NGd/x
TNExmkBJ4sJd2EtUqCyBv4CyfQu3fybM+nmTcWoYW6JgkRSk9s6zlbsSvrCQcUuW
jc0tC+I7DBj7F5fKXqLY5RJH1AJw3H7Oe2iP6X5YKrT9nlNIaMN5zkSiEhiBcuNy
BBNYrrZ1Usq+FZLGyyXyzCHxwshgyXrYgea0esqyEeOXTezsxkfdjs2D6JkFlThA
Q99PDv5RySpRdMJ8YAlUAmWr1rpIytfcGbUVABTSmLfzX+N5hUMiHK0yFR6IZ4nZ
DnRcus0PHc+YAXdp9MnREERqUMSYDf8Cv6edJO1ACJ4U8gKuUxk4cKCBXCIWUb2F
j+rr2xUsIq8L2yKyrWnEgxjkMl9LDOZRvzRVL/0QVMBfrpGyj8bthxwPpIRqqjdi
m0HC5kZ0srQltSHEd1zdn0YLVKCDJUBq/5Y9y2e99/3UOKSJ5CdAQeBB+EGt9l7A
d1P+ubfO3uSCM0R1p/NFuZF5+QqwxcswzO/jC99dGytnZ+QN4Xk=
=LvVQ
-----END PGP SIGNATURE-----

--2h2j7mvrz3bhlw7z--

