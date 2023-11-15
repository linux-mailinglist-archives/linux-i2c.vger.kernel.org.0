Return-Path: <linux-i2c+bounces-182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6697ECACA
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 19:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 444772814E7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 18:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB8633CE3;
	Wed, 15 Nov 2023 18:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0IoT8G3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B95731752
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 18:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD624C433C7;
	Wed, 15 Nov 2023 18:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700074352;
	bh=PVunFeVcVDida4tla11uaunipd8jgTS5w0unfbyZGBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0IoT8G3qlqXqap/1LCYqdIDnkIsmjxptk5gWyEizK3ZorHx4/Pha/ILoQvh4Urgv
	 x50OymOZREo7FiEC0/mkkYuiDliZ2iNLPHlnrLBCsPU5PxUiqWfNfJ8fakyhc/RPRJ
	 npG+AqZhomKkCnQzEuqFO8lkbHEqhpWRr58G019Xlnv8mFA0BS+jE2zy+VUbhenScn
	 hmxkX630FrGdPT8Jp8qmoR/eVwum22ZlHVxu3SJRBtq95nwGYqjeharb7Txyuiud/H
	 FiYlRizjsKwu/TY/wXSC+hRtGXXsOkZxDLCP8MZhsLhjFcm4PmG8kNxGp73tgf/ujS
	 YATufXa3B+0Og==
Date: Wed, 15 Nov 2023 13:52:28 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Jan Bottorff <janb@os.amperecomputing.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZVUTbJfQXbXi9V2c@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jan Bottorff <janb@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
 <yuperxjytpcwz25fofjut2edzjc4i6jgymcraxp4q6mfe27taf@b33ym5iuubji>
 <ZVHxhN+dxJSUkEOg@shikoro>
 <tupjmogut45oh2t2cth7o5wpqc6u6qkwfwddqrfnozlpplavlz@vram3ul3t4zj>
 <16668165-adcd-4cd6-8c50-83b992f8e880@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hAYC832Rq+wQi06x"
Content-Disposition: inline
In-Reply-To: <16668165-adcd-4cd6-8c50-83b992f8e880@os.amperecomputing.com>


--hAYC832Rq+wQi06x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Any chance we could get the "Cc: stable@vger.kernel.org" tag added to this
> patch? More than one large cloud company would like to see this in the

Well, no, it is already pushed out...

> stable kernel, as it significantly improves the reliability of IPMI
> transactions on platforms that use i2c for this communication.

... but with that commit desc it will surely be backported nonetheless.
If all fails, it can be manually requested to go to stable, but I am
sure this will not be needed.

> Sorry for not including this tag in the submission.

No worries.


--hAYC832Rq+wQi06x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVVE2gACgkQFA3kzBSg
KbYhqBAAkspivkHfj10mw0NlonXTazQdxZcKrDS6p6//oEJ1urnZYedbVTdUGNhq
T+fTKtNP7V9IgtNIG/Sz0b7i23KoDMb31Ut9+XpgkHIJOZQlXZi9kbUBdRGd9dWk
a4ksoLLV3g4Yhv9gEJvic4brY3zhM7nKsJAcdpnz1bGWvT1N57ntuTKzcsW07I+r
tWN5fKiRl4gtOIoIjq96P4eaVITXlpmmzEyifD6v21ypejwNb7E5qnDRbKzGC1gj
sHr0cR6fpatLnzYndDCw3mTe0dPjHHYS5fLjQaVhIZNh8WQ/ryChh4JT6YX5PE0t
nFFVEwRaeJi/LljzWzvHeQuhlmeYs5kLWmesuFt+vBYOEAHZTK0zYRdJ9kZkT5cp
3y3ohyydl+0KhCyqRrcokpAJfMI5TbDRi5QTTq/w7vwd85lbLQL/xdf+i0yWoxzZ
6QgCjKIIGrqv0CYijPHtjJY+RFY0LlfGVcx229iKmcIHjtGi416dnjqSXO5k/KW4
gqI8lbGus2OFUBbQ0nL0Rw9Qm2+IkvVi2K5lerWLthiK7DRFo1COW04gGo63rv/P
6MUV3baHQtygGs5/OEVWX9/VYRiC+Fecg/zcFA1chSe5/pzArC+5Ry/zBkGs3QbR
TTNat9mOO3lSdMZNQ53eDrqtDEVf5WQb1yfGdAACpM8aK/nHDPs=
=5b9n
-----END PGP SIGNATURE-----

--hAYC832Rq+wQi06x--

