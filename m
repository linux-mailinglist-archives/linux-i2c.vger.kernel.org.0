Return-Path: <linux-i2c+bounces-13955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD6C2CEA9
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 16:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC6C188AEB9
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 15:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E56284B29;
	Mon,  3 Nov 2025 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CkEDBbj+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB8313E2C
	for <linux-i2c@vger.kernel.org>; Mon,  3 Nov 2025 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762184907; cv=none; b=kv/IjmcfNjGIVV3NC8vsM6Y1+SjjcUtE56LF9sG95DkqL5bGDbGxp9LwMNdb53xenehJcf7v4sTPnivYkUWbJKwvo+WAtYS5J7D/1zVRghDWaLuNKyyYoyKruJ40QP/HGPZg5z4jgyf9kZEPEc3tBuCUKI+Ns4C+snFRX1PhZUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762184907; c=relaxed/simple;
	bh=UJtC9At+gQ5j0jy/77qU0l/vR6Z5gX6qh/rlWSlPnog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwyWtQG4Et+Pwb83ztg2hTtZzcBxGVGCBnIqcz0d5D0sot3/eo5I+PZpJ7qytfA108u/b5VnuWfuOAKmtm/ovNeMZWApD63Z3Hovsdqb2lvP7sGRAbp+WZX4Ul+2XcwYrABQMDpazUfzg665e8Z51v9DxIIAUthfwW6okl91xm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CkEDBbj+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UJtC
	9At+gQ5j0jy/77qU0l/vR6Z5gX6qh/rlWSlPnog=; b=CkEDBbj+DFwxoDLlkoXM
	wCzLhOFIZb4iN1UWMRstM0Aq0BtmSyBDBRwhlf/u+SBXqh22kdfFW+1jj3+L+DgB
	ot/7UWn1kt1tAj9x2B+fnMtoMP33krEeTEjCHOo6JX4ycDdM2cZ37+hEFfvMqnPV
	n594sXds/cN4vyVAa3H2aPJdr8NCa/s8IojC/fptqCTlNO14uhd3LlS4/tZDR4uM
	Pj9bPCtZQYOVAeyHJ7LWMl2igC5z0gcwyq3ioGhgAEk0bX6fY+cXpKD8f72o0nvD
	07O4yi4Lv3rRVL6X/isxwdFIKItZTQN23H4iAGJP5nu4fdllCabR0YGMQfSm8Zln
	sg==
Received: (qmail 2276747 invoked from network); 3 Nov 2025 16:48:17 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2025 16:48:17 +0100
X-UD-Smtp-Session: l3s3148p1@0MTRpLJCDnNtKPNt
Date: Mon, 3 Nov 2025 16:48:16 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>,
	Wojciech Siudy <wojciech.siudy@nokia.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: muxes: pca954x: Fix broken reset-gpio usage
Message-ID: <aQjOwInKQWIVdjQJ@shikoro>
References: <20251103151905.297014-2-krzysztof.kozlowski@linaro.org>
 <69ef304b-491a-4434-97c1-97eccd99ea66@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8lOM+RnPg6CHzkcF"
Content-Disposition: inline
In-Reply-To: <69ef304b-491a-4434-97c1-97eccd99ea66@linaro.org>


--8lOM+RnPg6CHzkcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Maybe I should also add to emphasize:
>=20
> That offending commit 690de2902dca breaks the ABI which was:
> 1. documented at
> Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml (line 57)
> 2. implemented in Linux kernel around v3.14.
>=20
> This ABI breakage was not justified at all, not explained not even
> mentioned in the commit msg, which is a requirement (see writing
> bindings document).

We were under the assumption that the reset-core will provide exactly
the same functionality at a centralized place. It made sense to me, too,
to avoid all the open-coded reset-gpio handlings in various drivers. I
only learnt from Morimoto-san's regression report that things were not
as I thought.

So, I sent out an RFC to discuss how to handle this issue. And if even
Philipp as the maintainer did not point me directly to revert the
offending i2c-mux commit, despite it is "obviously" sooo wrong, then
probably that optional fallback part in the reset-core needs way more
explanations and documentation.


--8lOM+RnPg6CHzkcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkIzr0ACgkQFA3kzBSg
KbZCmw//WnCZHgv/YdR+CXWWUqRGjThUkCrcAhvIjjC7suf4RO1oDE4pnJs6GXZR
EAG4WJcMDBa4+jnQC2q8O3uzTp0Rz9sgJJgFUX26eb8Eru2kOskJO7CTTcSrK1Ak
8PZaacQay5I9FIYQGJpVaWxWT6h+S8HUglRUYTQyIJzx3Ikw2hexBN6rSyDEukrF
vQDQS5e8ckPP02npNskpMrIKfZdkkjpkf9eezb8LA6ZmXwUr9iS4IObMwooJ88Xz
z5hK0IWJbU2XZB9UATbGIZhtEreoRJga8tuRb+6vYFWfr6qfaqm8fTgoqPLCfK1U
14/tmDg+0lH4Ya5ScUYAmX1RKkX5Y/gsIMlDXCKwLYWO8n03B2njTyK80qyT2aMW
mDGlVeNSe3yUMstOn97gvGvrVr2Vs6iProOPlJwEotiaP6lF8meplTplZo4gk1N2
N/hvptV5xojtRxPLzhg9InYe4yhx1JTPKPzqParTo+22Gk7DhQUt9GAn+CGYMUpA
iCLm4pQgGQRoFB9H8fZ+JIpKnDOrO842C1RqtSfydCev2GMqg1fjdeG6gQl+rpNv
rKaFtObpOw/XvYnhWDZHzlA5Nwt74VzOQS+VKvp/Q87MZOKO5ArAc9KJu+KEk53d
um7KedWcVA8IaMXarnlaRn7z4RrI+vBoEO6NvjKQWxjXGvZPXug=
=U8Fj
-----END PGP SIGNATURE-----

--8lOM+RnPg6CHzkcF--

