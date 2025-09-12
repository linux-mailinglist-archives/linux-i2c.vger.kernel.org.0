Return-Path: <linux-i2c+bounces-12926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FCCB558A5
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 23:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A11741CC5BAB
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 21:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC3D2D0C96;
	Fri, 12 Sep 2025 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Yes8bdoN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536D2C11E4
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757713941; cv=none; b=eV53GNVPPAijfIVd36+//di8g0UXLyAR5nwYiHa5zSuIvSp/HjrMQ7T4UZc0RRTb5eP7I9DtnTq3m5MEzj42eHBBz1w0idvI4MRyzkSLSA23Xz591FniLgaT0CEbcDdn0isQve1SBIVrxD2hkXo40xsRPf4FDhxBWpXAcntWXbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757713941; c=relaxed/simple;
	bh=wPA97b6V//Ti8Do+nraSoCXvD5g+auNcs7NBBJoNq+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOYkMDrAfo4eGcbriaRyxtob0Ij48tcrpWYIMmQWhvKdsCQWW4So5ND1NW/XmwxGACb+/6+KfWUPmL9vOrYqnZfZwXsjtp3fpuS+6vbAwL5Aw01mcELiSB/FsSL8RWtvfX7iEoCW159OnGQswrQ27vpG7st/PmyBZU1m+4W8VfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Yes8bdoN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wPA9
	7b6V//Ti8Do+nraSoCXvD5g+auNcs7NBBJoNq+E=; b=Yes8bdoNccyD5Ctik2hi
	hrEzN+UCtctNOnL2M2KHpTs5Pmuj2/kuzWxQnRqFJ/7LzKtC7LKm0kblnykFL3Ji
	+TVQ6kgH8aCUNAxLGnt8XcqzxpAr51tD7Q2NqgS1kUFl2ksR2jtcb2bc2eQB44WC
	5DEtNH2idxxcHYh03dPvmp9We03gDuVPK3zh8BqcPgEHW0+vaB/LKEMFBYRGY5XK
	BhxeAaw+GEiHREwgWXf/2fIUEzTkNAxSPREcT0KWt4O6fZhhikPfISfk0GSEN7jF
	QDmQGGouNWEO+nBbV/fCPvbLmDhpMCrrOk2695pJ9xpOQi3aoHdNXPL5DikXcv4T
	tQ==
Received: (qmail 1496210 invoked from network); 12 Sep 2025 23:52:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2025 23:52:12 +0200
X-UD-Smtp-Session: l3s3148p1@kd6DqqE+nq0gAQnoAHJ8AC93OVDMgFWg
Date: Fri, 12 Sep 2025 23:52:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Wenmeng Liu <quic_wenmliu@qualcomm.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
Message-ID: <aMSWCw3LI6Q9o4gr@shikoro>
References: <20250912-camss_rb8-v6-0-c9a6c3d67392@oss.qualcomm.com>
 <20250912-camss_rb8-v6-1-c9a6c3d67392@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sCEER0/hlgH7qpUm"
Content-Disposition: inline
In-Reply-To: <20250912-camss_rb8-v6-1-c9a6c3d67392@oss.qualcomm.com>


--sCEER0/hlgH7qpUm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 11:19:25PM +0800, Wenmeng Liu wrote:
> From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
>=20
> Add the sa8775p CCI device string compatible.
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>

Applied to for-next, thanks!


--sCEER0/hlgH7qpUm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjElgsACgkQFA3kzBSg
KbZvmxAAjntXh3QhT7wW/5CITKV7K1xT5vhMhtTSjW+iA02PdhjJsv1mAxyVwAE0
7tvE82O9P/5lOy8ez3BViXwyieZE9F5FzHQ69+dxsCN2B8SJjmu4EEsoqRUXgnQd
1AI5fqQEWBPB+DIVtKcmJCx5bnW3KvuNAS4s2zTNsGkALE1eUCUCmJZ2DOOBZiav
fMaa22Wf3ohLffkiyz9p+CnqN3J78TjEwH57hc6gK6+BpJt4/5E2yFhyXsxlw7WW
AT8+gkXkanWonFgEfeZmfhqcwp94u1iKO2Zf2H/mp4lWlxEbeKbyzc3YEQZgmz0s
e0o2EsCBK8fQAQGCy4bz3kSYhUk8vZa9SH7D8gXv/ny+Dl+KSyGnwKcEfnnd6ehM
lgnQbg8+YlEMVN+m5x6LT4Ly/9qz7DYhyCXo+0lKzTZKJj5sOi1XDyvR3ohisrun
yVKUl4PweaW5SoPNEC6fK2Fras2BxCK/XLD1bsDuSHWkZ+y7NGP7KcJoiCcyKsO1
KhY7+K++xIfB7z+aknPsK5+ojAP3niWK/izB5kOIFPnUIrdiSxlyGfmPBUupBwVS
dICWSzxG1zfcr26fGvDnAYC5nr83gu3y6Mp2919JwE8hnB4AnThy4s7pWBv0Qr4P
hTeFF3yx5pIsHo6RQ03xTUGD+ITc90w0JM54oDE9V81vMtaU0EI=
=5/Pv
-----END PGP SIGNATURE-----

--sCEER0/hlgH7qpUm--

