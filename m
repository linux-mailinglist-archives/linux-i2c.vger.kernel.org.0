Return-Path: <linux-i2c+bounces-1422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3983756F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 22:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF43288CF2
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 21:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D13B48CD1;
	Mon, 22 Jan 2024 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiSnhIeW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31FC3B19D;
	Mon, 22 Jan 2024 21:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705959134; cv=none; b=HvCmlseyJrrOsM59nhzWG4O81iDiDAqlaoReyjy2Ny3x4u3yyDcYmRQayMbxVHhiXbQTc2dvsfcKX7+rOw1zwT81CPGsO0lhaC7yWqlOq+5ENjR14fW6+hlYEBRd/q1GMWQRceUOqK++UdJn5eKhawOLDzAJ8RuLSHpaA08935k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705959134; c=relaxed/simple;
	bh=y93E4YvjGd6mBHXJcCWxKvGZJaewLFcxc2wYZenhauk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1AbPKuzCZ9MiTQ2I5dILiYXJhpqcDHeFtSwfj35NnOGIO1JdKOeOQt5HffSy4+29Ukj2MzNB93TNTGxkePkYNHuccRo4QZ8ushhjt82/Y6k4SFvJHkC9zQQW/x8s2em5N/sxCi2lOLLu9Wfy8Uqy3NvdT+MuWzALLjgjhnHrWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiSnhIeW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7C6C43390;
	Mon, 22 Jan 2024 21:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705959133;
	bh=y93E4YvjGd6mBHXJcCWxKvGZJaewLFcxc2wYZenhauk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RiSnhIeW3JyXlrkI/butXVNkd9SAEws/TAaYgZxnUaSgCqGa5XItlrTyZJzv+7wf4
	 Fw+kh2sqx2QX1/s01BeL5sqM8tgfSL/hLHL4VLTK1cKPTpYm708ycLRBPMDdUGrT/j
	 KTT4ks8EgKDRRJzHY9EyJsYgbN4INZrSNUEB2ODJsk7X6SLOE7rZCsiV5PBM8jAJ9g
	 nVEWdk1JLuPgOx/j8xWHoBxVx6XiJ0xAfGKkWXrFECY8DsTPOqDEfIP+SVMdPeVF8F
	 abicriQp1cxcGiSDUkuo/XpYJq2AeowjNUqN83SG+qRNPno3q8RzU3y4Lf6cZY9E7e
	 pWinb2MVEbiXg==
Date: Mon, 22 Jan 2024 22:32:07 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Drop my "+dt" sub-address
Message-ID: <Za7e1zsTh93nVK7p@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20240122211528.1719994-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UgoOrNTIKg1LV01n"
Content-Disposition: inline
In-Reply-To: <20240122211528.1719994-1-robh@kernel.org>


--UgoOrNTIKg1LV01n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 03:15:26PM -0600, Rob Herring wrote:
> I never really implemented any filtering on the "+dt" sub-address, so
> drop it.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C


--UgoOrNTIKg1LV01n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWu3tMACgkQFA3kzBSg
KbbU3Q//c5KN9OmG2jWYpDMR+t0VqnYb298ZKjJI/AFU4uVR5a77uD+H9p+QjuPo
R+YfgYqXNc4l+7/Q7H2/Bh5Sg7H3gF88gwaRo8LVtkniWCXTJIUqvLB1SV/7uwOT
t1k8XDYnwhHZyUK7Jzy6VNQVWf8nRf04piATmat9CoU9TYR7REu8AIpr5vKkc27a
8cQUmkp7wNNEebDE+7OCoJ55/gXZU+scBhGAMyp6bqnVmKF6ZEziQaTmW0/gPTLR
q5HKjd2NOILFB+jCnlpBqHzLQcut1kFIU6EjUFLbHFbJRYHJWh3rfsM1VRCpCVbO
yl/Pu2oO7WtnlTfGjlPKA+T3TJXLP1S6rscYxCh9PnMi0FX423EbwWRvR+/avohF
Dm/paBzj1he7HjXfiAmeVg8sXjMYP2LQlOnEwIFm7zVDnOqJytrcQROHGLW61NDg
tSGKsDePJ0hXhDKLnN/kSo82K5mOGE3Fr5vwwSGbPrzuLO2+l4u6QX6lwII9st38
zKLB8mc3+AxwClt/broyyRBktQc58JKGS+T7Q5JCiKb4lSkQlPT5jBQF3OdYnn7p
byQcIRVu+yJURbpCUE35bknblRHehfL+n9HjMRlBXh/VlM8CIxrjmEEfDuewS2PX
naXrCkChfGcpWK8o8y53TYk2dJXbURsHXL07NAspE8n4bISjOFw=
=ngn/
-----END PGP SIGNATURE-----

--UgoOrNTIKg1LV01n--

