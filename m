Return-Path: <linux-i2c+bounces-5223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D083994C0E5
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 17:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92305285CD5
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 15:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B7818F2D0;
	Thu,  8 Aug 2024 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fxLpjck8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224D18EFD3
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130475; cv=none; b=MVOiy89HQYeaakx3amqg6gtS4FyHgpzvtnhrPz4VXxg2SD8UYUt+V9zFxWHGc9cXNtyuBLkBPqJgPdjuzaYM0bvhWFltYY+xm+ZABUkPKaSAb/LGnGJCe4jLXf6nVYfp2NEXDFnXwEvu/9FdF5Rzp75KTReS53DTKdh9VJPA8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130475; c=relaxed/simple;
	bh=Ov7Fqd0mS9ahFAup2iztfvF0GpMTqVzHVCCfN9ngwGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JR/s9fLGKCcK8ObHr/W/FAJpLqkxWJCZVE3bmj5KQKoHixAAzCZaR1XsrF0ucrvpC0IXgL2zYaFDs24sXA6GabR257WUIj2V4LrfAP+igOiaMbm4gcq7j8mps1/0mfsh8YP+w7w45+SdHM2bH1Jd9znSG4rMqO+cnwal7NSkkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fxLpjck8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LD/s
	gseAClYXyBndeJbn6ysTy+uaUxkOkF5tuweLCO4=; b=fxLpjck8+7Hcm5HuW/na
	tgblRwgSzNJ7VzmYSwRaeTJ9JbpACbX7V8IPHnsi+FkPTe7xgNzXQyf6jj3w2btS
	wr5GK9JMkff6HXeE2ieh9qTSfngl4ZyemBA3STtqtX3sK498rYO6I9DMLEsy1OtS
	GHwChDLuKrqPJbIfmrrLc/ildeonBqE5QhMv2j4ePeVpTrjK4cVTBAQLNKfFKCSR
	3sB6NUXCEhJhzdmIOOLN+EqLdK6g3Wf5DiYQI2taa853Bl5QdefQFRsbL8koMOS3
	AmTJFWAaVEwvwRy4kat74wBWnAwJJdPfUqLq4/Dt6CXQl7rGkh+RNIgYrVSyvgGh
	TQ==
Received: (qmail 355118 invoked from network); 8 Aug 2024 17:21:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 17:21:11 +0200
X-UD-Smtp-Session: l3s3148p1@9V2gky0fyhptKPBr
Date: Thu, 8 Aug 2024 17:21:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Message-ID: <ZrTiZtD9U4I2LYZj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-8-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6V+kovb3+CQbdwxA"
Content-Disposition: inline
In-Reply-To: <20240711115207.2843133-8-claudiu.beznea.uj@bp.renesas.com>


--6V+kovb3+CQbdwxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +          - const: renesas,riic-r9a08g045   # RZ/G3S
> +          - const: renesas,riic-r9a09g057

Why no comment after the latter one?


--6V+kovb3+CQbdwxA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma04mYACgkQFA3kzBSg
KbaHNA//VlRwPnhnEU/HD1UwyZLn7B/GQc4GIgy4g785jDsvDAY0xbxWqnQWwrjX
MAQYSJYnsTj5jfUYwKNKLtFzpnGtOAVdDYD6H7bLW8GAl/0APnJnEefUuLr5g9QL
eP1IpWGxeaUJlYrk29R8JZ0DGtyKP6jZ4WUGtsx0bAgYu9UKpKI0rV0lEjHNueVQ
NQQSr++8CH34WiJz68reZYuSr+0geW8q+ibd1xBay1dXF9vVTufTizDisEbmEYDR
Pc0eio8fVixDlhwCB87qHbj9QeJnz7vuPOjUTHmP0bQOwYA9OPfTbzox/7luo2w+
ktZiGb9t29KgYinTPpP0fnmcjCy+769D6jZiTZvWF6zo0MO/bSPZu4Apo6qLtwL3
7gUXAqTwAoOlDvNamhiHoJYFlIHd5VQ+ga5D0Dgwhe8ImxhFTy7btyieF7dE5Ns5
mwddFzQtQMkwMJlQUqx1dZaWwpi4klaNT/LxNPW4GPezjfchfnEz6jVk6YvtJ3VC
h1PWSmuROWiOfqjebcC8ERU9SqpbN3Fh6wZedB3EqQJxdcuyXNo6UEMEnbYIV+su
nUnc1eACemMkHL6SXikYQosMEoA8ivja8Cwpt5mE6uIrPU2KuPVwKnWCoTxSpjgz
3r5Fbkx97OO3ipatKyykJjbmgcdfFYuIiwVt4iQ+l5qdtkEMZUw=
=JfKY
-----END PGP SIGNATURE-----

--6V+kovb3+CQbdwxA--

