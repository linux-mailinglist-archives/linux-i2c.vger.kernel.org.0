Return-Path: <linux-i2c+bounces-6019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B19699B1
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 12:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050191C23031
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 10:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1366319F409;
	Tue,  3 Sep 2024 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dcFLintO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600D2AEFD
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725357814; cv=none; b=ZzJtLKFlQsjtPqxFtoyoHnwQXvewnWIn4oN2I0v5ge3Zi/XH22ctZM33OipD3COBTpt8+Q1zJHZqkcwgSdgI7npr6yAywz2EIyDrSYSZJDtkYXPBfTNMY0XhdWujnTdWY+fDrUNAAXufUseYTWjHEDRVofZHMWhrogHxRKc/hd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725357814; c=relaxed/simple;
	bh=bEjo5dr+wds5EUEW0FFUxDxhXD9qETwURck3LtJXIO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyBI8I0cetRRf3VMWUl4bwg99sb6jRxbLdX5y3NMnG15XV9t9VJidWc1tnBx/mw8MZ4SepQCylLpq4h7iuRXRf9o+NGRZVoptbtrpk0Va15YhmBIDyF7gPRcFyxIvArY1Sykn3lKhG0anifr6M/51MnxWspgLF49EhlUi00rgZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dcFLintO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bEjo
	5dr+wds5EUEW0FFUxDxhXD9qETwURck3LtJXIO8=; b=dcFLintOsQ7fwzigQkR3
	eWMN8zC5FZKJEeFFBjPStw2b35e4SRzYbNKYrrz/ZxJaMa4j51AbfgUd9Vi/lJDj
	zoi2b9GNptmgg+Kvh+W32xaAR1/8ZUK+HDhFO4X3QDTIqDDkKI7wfR0Qh19dIUMz
	pjt+8GDhPrkCm0lNe+XI0fEhA/F+M2dXKJAc3doXPjY3QWsQeXU0P3Nl8vGD3rlr
	bzQrBbmcLea55jDKFoBgWOfT6SQlxGKlh/vIQLpYRKMU/C8L8pYTML+6k9dq44Nv
	hnvFryWJCbtpIb8spTAMhYonOBPL1ukbmZBqCIgjY/0uBWCdQQqnFc0ipwIqw2gj
	Tw==
Received: (qmail 209907 invoked from network); 3 Sep 2024 12:03:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Sep 2024 12:03:23 +0200
X-UD-Smtp-Session: l3s3148p1@pi/7KjQhBo0gAwDPXwdRANgvu6DX4+2c
Date: Tue, 3 Sep 2024 12:03:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: simplify with scoped for each OF child loop
Message-ID: <Ztbe61hW2dNMujce@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240816151340.154939-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dAVcFfMdPf4jMhsZ"
Content-Disposition: inline
In-Reply-To: <20240816151340.154939-1-krzysztof.kozlowski@linaro.org>


--dAVcFfMdPf4jMhsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 05:13:40PM +0200, Krzysztof Kozlowski wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--dAVcFfMdPf4jMhsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbW3usACgkQFA3kzBSg
KbZ+eA//XFM8HLyX/AfuMJEht96Vz7RgqXsrMxxIAH1ez9s8+LdsKEQOQZL1y7q9
/JmMog+yNXWCIJOW58rclfNNK3QbnuP8lHlK+Llld5GXpIJXcnclZLtCSvheMTpJ
rcxahx+fK+RrFthVyAA+Fe/9eQUlwaLI1QJl26AFbxEl7KalLCJjuBwX2h2OwcA9
ppTKfAnvj/L5aziTNLhrkOKPaLzzXoPw7wamD1Dgi96DYM+wZq210Urv7Z0RRtAV
MifUMAOrxqY8W4pjjb9oeA8PsJn2nQLlDuIaF5cE7BSCLtvsX/gXiFCTPrZgVaKK
TMblnQws+enLRx5q6O/6lauhZI4ty2PAOZO3iO2JLj1WGwfsh2kU2pHEX+9/xjf5
EZlpwneQ8L7J6qs96WCIN2l0eBULfp0pBO3y2sFLYETtEvU9/q3OM0hfHIW0EUZo
CdLU32zAwaw5YNiFuoS/vSleNHkv1D+xxKZ3s8zyOL1AlbaXEpKljzfgJau/IyNv
kVmSDMzDfOfgbX2mBLHYMtIAKCKopN+YnJEiDWpLYzsp2zlc9kBcPqhWMRoqkK83
pLC/SPM5SAQWY3NYXQbH6Z9SaDyR6kplrzwO5BcOZjcBLK7cRa5Jpq0E3Uio0rrw
R9ODbJZjDw4VCX4hK7wDRUWV2+d+phcYBW8Z1mKX3mO/1YXwBL4=
=tACZ
-----END PGP SIGNATURE-----

--dAVcFfMdPf4jMhsZ--

