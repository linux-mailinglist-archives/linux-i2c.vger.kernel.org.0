Return-Path: <linux-i2c+bounces-102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D67E996E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 10:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34329280C3E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 09:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6771A59A;
	Mon, 13 Nov 2023 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMf1fvui"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B31A595
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 09:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7372C433C7;
	Mon, 13 Nov 2023 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699869065;
	bh=4MkvGrUVycKC9A5KUDfRgr2hBxqeKe3Fbl93G9r6QU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMf1fvuidE8Ce+YR3AqKli/uC4lIUpcXFPN8xxfLW3cn3K2MwgVCRB1zE4+ZEfoBN
	 Od/ciPeu2XLepeAoYki4mlM1uSiJeXgQ9mjkrMIMFpqmEGMg9MJi4daNwm94acCEab
	 IpfAxZacFNDpCX1nQxaIlYrYbKtv2sA99Grct/BTSHJTSSdZCAzVprljXuSH42RxoW
	 wFQAS85X0Uy+33UzuuhlqRPI4oWtEES3SG0D1AmHNsAHT72ncWLknU7wuq4J6/E9QB
	 Ax7dWdznLEvCo7EHdG3Z1ZOivz9/R/iE0XQCHzsgDkDqzaOXksgvQWyoKUfohgsfNd
	 wphqJhnosx7yw==
Date: Mon, 13 Nov 2023 04:51:00 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Jan Bottorff <janb@os.amperecomputing.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZVHxhN+dxJSUkEOg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jan Bottorff <janb@os.amperecomputing.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
 <yuperxjytpcwz25fofjut2edzjc4i6jgymcraxp4q6mfe27taf@b33ym5iuubji>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t8LnJb9u6oVhM1lW"
Content-Disposition: inline
In-Reply-To: <yuperxjytpcwz25fofjut2edzjc4i6jgymcraxp4q6mfe27taf@b33ym5iuubji>


--t8LnJb9u6oVhM1lW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The patch has already been merged in, but in anyway:
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks to a restrictive hotel network, I haven't pushed out yet, and
could still add your tags. Thanks!


--t8LnJb9u6oVhM1lW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVR8YAACgkQFA3kzBSg
Kbajpw/+LsHLEOAvcgLU2sJpusYw4cLrC6K8W6W6+LdxH+2DJAeOQYgmpgOKBUAd
rf/I+o9AELntKTLeM47y/iUcXNMBM5/d8+S8JnENGrv+IsHPDM6a7Jd/axnMrpXG
aj2hX3IrRjHbjEnZr4o6/nCXxUp8twFNRCaguJOFjHLPM9noJsAuTWaDklZyW4TS
pDYS2vL8IeF/DLzqQeoF4VuCM50O0KwIjuabRRdpaghFS/nDlAfI1GC+6a3V0rGA
/vNDhT7unaBQLZ6l8QA9lXgtJ8XFJzryyWE1hZmUIo1AaA7hw84eb1qoQ/L/nCY6
P5OVtVhHqbEG2nFH8Tan+s9T1yFux1juL/C5rnJ0R+4WM+jrQVsXhopODV1XhvsZ
yfgYZPMMntwAYwsCkcsc3GkViHWrJysutUsGJBjyS1bdUbpNY7+qa0gz1CL5jCDj
wrgX6FPWrbzj4pOHE4G9ay+vJMXPrHwSzLx0Fwwu1YtnC8k/TzL9vPx+PdoW5LBt
JUVdiA71b7OcI25HLDcQZviA8MSjVU0YwMD1qs+LA8R/uF7sZ8DK/VIO/Qejq+y9
1GqLTcNRQ7bdJcVLAW/LsY4Nfq0cXkRJVCvCvicjRxLQ/K6WYpfHZYNqDVwy7/9P
E2OTA4i3Cr+//bIN08ilELRPOfqmoxJUwx3FSCOyjSfOTLcgm20=
=DqV+
-----END PGP SIGNATURE-----

--t8LnJb9u6oVhM1lW--

