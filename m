Return-Path: <linux-i2c+bounces-12927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0DFB558AE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 23:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38CF97BE451
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 21:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934722C21C2;
	Fri, 12 Sep 2025 21:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CPwJDOaH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AFC221264
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757714220; cv=none; b=p0MWYR6EF5ZrmOgr5GuMxOXpUSdQzEQSCzqxhMNnOyD9nZIhrz+6/esxSpI1Ic4sYl3WaeLe26F3YQsDA5a3jBazqd+JcsuDmFl3hyJjddXsWgKUJhtuxoNmUWsD2OkgXoy+YBdO4XvDQ35h8g3oCg4BgJR+3Q7w4yhlSNophxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757714220; c=relaxed/simple;
	bh=vgUHLh2WDG6vmvZXtQuwei+9BmWgXyLrwR8bmVuIg+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzaL56reLrnfKTLU44uBO4rVZm9ugMoBmZknyb+fZEN7zebQ7Kjc3m8paDWp1quSNd8oS86/2XfjjwcYy4xoHgaY/kDg3fiCuStnZeN+Z/dLb2L+EMtzhsCldqvlvN6ZKq+etkNcYW5Ugy+2XHWguZ1U3QoaNFqruUKlDnaJRV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CPwJDOaH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vgUH
	Lh2WDG6vmvZXtQuwei+9BmWgXyLrwR8bmVuIg+s=; b=CPwJDOaHBZNRm0ncDf1h
	uffUWnSyt44H5Zv9qXPhkMcholFTYYBf3hF4QAIsf+F78e456kFSogVEIBe7a2zI
	32UX8wUBslW5lHEpJghixhl94/rDhq4MUxQJaodxrXsh3XbH0pFy+ie2pZr8dd/S
	xGkw8glIONU/ZrgISp0B77IDFzrCqb6gc0pi54qgLGNLcutBkeO47BMD2dglrIYx
	zUKoTzKpnNP4xt2aFQKR7ygF6Kcxp5xS+pIDxuBojCBeAkkGwh5vy/Wf/IEmofhY
	1k5YD/fpn9dVLAURbrWV+quAfNmYQ3FLhM2Cm4L7+mmmgUNKGRUNBJrxpP2mO+oF
	PA==
Received: (qmail 1497381 invoked from network); 12 Sep 2025 23:56:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2025 23:56:56 +0200
X-UD-Smtp-Session: l3s3148p1@rvd5u6E+eJkgAQnoAHJ8AC93OVDMgFWg
Date: Fri, 12 Sep 2025 23:56:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: qcom-cci: Document
 QCM2290 compatible
Message-ID: <aMSXKBO2lJkV1YC8@shikoro>
References: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TwqxwFyp512nx4Nw"
Content-Disposition: inline
In-Reply-To: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>


--TwqxwFyp512nx4Nw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 11:21:01PM +0200, Loic Poulain wrote:
> The CCI on QCM2290 is the interface for controlling camera sensor over I2=
C.
> It requires only two clocks.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Applied to for-next, thanks!


--TwqxwFyp512nx4Nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjElycACgkQFA3kzBSg
Kbb52hAAh84yHSLR1P+kekpFCx+Lc6xyWCddGRbFA7rNbRc5jU+zpfwCnV4/rPYS
aPc5XKDJMyL5I2q7Tfy6ZwKQktIEDUhNIW5PX1OlifgG8CnMnuls1NTAi5cfBU1N
gcmHFxNo+gXyahQCIo8ISwusT25b/IoYF+kocfGWJPZGbVUliQABTozDLJLfzv9D
VOrdFuA5N6jNkkcHX/bUkJ93jpH2LWkJ1DrDUUfZoCLblBhVgDs35RB2QjZSOOV8
aUnduyJi2ql0KyxX1r6Ko+tGcwMNqy5POJUg0D/CywS9Er7vZBm9ODAims8n5RDo
+GQEi9HIWzrJKNq72RxHkoDL/RmtR5QcKeNepfATXtVBY4XN7HxQQlaITgHqursI
CvYsjp87h0MEST8Z+37lOopfE3MfjY0RL9m2Olgavm6+l5WCPIeg7BClPDHYDLiJ
kjj6Tdwp1JG7ybSG91MsxgXFzfa0CwMsmxOlauzqjpksv08Rzw9lUrWq4GKqbdPO
xcR0mon33FezjBMVgP9aYF038oZiODYPX64Mlu3/7It0tdPIWIEWqMrLc5e8Ba/B
RC/wQCqgXdBHXEfdrF8/xnxMq9KC14jjz/PZucUPazMY0Nll5OkRIpcHZAK3Hc1A
U5AaBUOBIN71F4cP/Wj6gvVlCxA3bAXrT/zn8qSgPiXxzC9LtNs=
=ZGzr
-----END PGP SIGNATURE-----

--TwqxwFyp512nx4Nw--

