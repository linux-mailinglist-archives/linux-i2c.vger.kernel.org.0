Return-Path: <linux-i2c+bounces-13689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 520DCBF348B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 21:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01CD618A0BD5
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 19:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71AF331A5C;
	Mon, 20 Oct 2025 19:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LWq4NjLW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A80D1EA7F4
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 19:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989927; cv=none; b=j7u2ERLLs/bpZO+gj0IYijSGAlrJJzwcFgf9n5DsgLeQBXQMM2yiq3w/I23EXHMlbrBsaNVHGX+KycQ1br6vBtORFQ+dPka7MozHgOSAMhm22sOzKv09K0Zhy7Rxl9CD2coBoYg2yU8iyHtHa+twtqYNvl12yXCBn2A1M0/J8H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989927; c=relaxed/simple;
	bh=rSUzgNu/ztv30EgovuJ1TbRvwx4EyTnxMhpVIzsGTB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GspPfJ9GIfYyGYilwvWRQ/MR7fSMNuSt7Ni/60ENIMjh+PcFXWM2ImI3u630Rc6950doiUVaJ+2kP0aUEzp8qQk/6bpw7APE4DsulQGjYR0mIFnanR2mDCcVO80HqDO09p1m2UKDUBIlM13jKuzBh48vvApiItULT5p8I6X7kzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LWq4NjLW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rSUz
	gNu/ztv30EgovuJ1TbRvwx4EyTnxMhpVIzsGTB8=; b=LWq4NjLWAHnrYfQRFsj/
	PQTWSgfxibqmmaq8g7vwAIdCh5Wa3r/u7KBMpHq0D6b+gYBaV+G46+t16+/EG4Ui
	m9z7whLZ1Dx5Irmwmt+eMLCaUqWC0exFp0R9/vQOa0cQuzRN+aYL2i1RTEAFG/j4
	Alr8Ym8FN4IMCtsHK4SrSKiaIEpKPWAungX6+Q67TTcelffputhc3e0qWWJ6FMfd
	qYCEnw+dkO1ap2NFkoYX2oPgfF5gLA5S8TfNtwweIOAdvojcGXRbRsTamk2YKMKE
	UO1Hic/n4jve2b00o8S3L2YiQ5+vCzNP0b9I0LbIUUn4TQwszjIIYxYeNzLEPFU/
	eQ==
Received: (qmail 1174416 invoked from network); 20 Oct 2025 21:52:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Oct 2025 21:52:02 +0200
X-UD-Smtp-Session: l3s3148p1@bG29apxBsQRtKPGK
Date: Mon, 20 Oct 2025 21:52:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 2/3] i2c: designware: Enable transfer with different
 target addresses
Message-ID: <aPaS4c-AX0P66T30@shikoro>
References: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
 <20251017-i2c-dw-v1-2-7b85b71c7a87@bootlin.com>
 <f5e7bb0d-205b-4c10-8c31-bf60e1e42b73@kernel.org>
 <22296119.4csPzL39Zc@benoit.monin>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61lx6JatYQ+xQfai"
Content-Disposition: inline
In-Reply-To: <22296119.4csPzL39Zc@benoit.monin>


--61lx6JatYQ+xQfai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> For your particular case, that will not help reaching the other segments as
> we wait for a STOP before changing the target address. So, it should not
> fail but do a write to segment 0 in your eeprom.

So, this patch replaces a repeated start with a stop + start
combination? Please don't do this. It will give users a false impression
that proper repeated start is supported. Honestly reporting that the HW
does not support is the better option, so the user can decide what to do
then.


--61lx6JatYQ+xQfai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj2kuEACgkQFA3kzBSg
Kba2XRAAltW5cl9DIqqfVqg7W52uhgDZy8ZhiO2iYY0IkFZcLAv6uwFrSfqr4bHm
yuVhx3kNrbCpQGN/GLnmEtqrKhAhNxzmHBfsuwJtMQXugvVk9YrOrgxdxjHvDe62
XhbwulUudvrjLK5QKg2X2wjXVR/MCiFqURG13KFftdtL2em0CMhkJRceP/Yr5s6Y
KUKSOQR0bGRyTU7wZlZJi2hQVDfLuETRecR2PrDLFH0Jjy5PHpoQZaxQ2DDEPcXB
1BqSCw121E1gvX06VLJoLEJI+uTB1F/rJuIZColbMPaph5JDY4pMOPQ9d9fIzktp
Q2rF/fGNtyQRova2C/Hmpd7AUWZ0Pwo8tStwS3cAgG6IMLR89KdDXAocMQx+EKRJ
1jTOwzb/ZRVfzA8knyEgJZ7yXQKnSQlQqjDCmqbqnbLs1B/AAvZHxEicmFYMVM0S
KkDdTfLAX6Tg22iPXf+6uIfa1/XMTZW83MVLp58omQbvcQTYe2JZFxEBjPSdBbSb
E+KijtqmF3WvbztpKWuXGRLjWnGz1Z/7CMsLZamFBCBI+xWUbbZnoe7gcgtKcWgU
TfyNiropIHWp7iEep2QaCj3cpdtflrxDAai7eio6/eLdn6ROVqOAW7AEFKWE4RdN
XOh4ViS2OZ1HupdK53yz17IAPk0nkK/K/VjwNjDYfsjgdYrOsX4=
=AmE9
-----END PGP SIGNATURE-----

--61lx6JatYQ+xQfai--

