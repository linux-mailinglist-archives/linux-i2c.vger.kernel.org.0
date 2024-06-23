Return-Path: <linux-i2c+bounces-4271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA60913704
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 02:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7341C2136B
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 00:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1F31C27;
	Sun, 23 Jun 2024 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZMw9EXEB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8674E10E4
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 00:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719101717; cv=none; b=K1IRX8wn9u+YvAEKIxJhJZBdJihBfqCltHhnn+cSq0ScSeSyovoQvvfWmu9XGPH7Gpdw5e1CLx5sQMfwmf5CsaOFaCB6+059xoaNMaEdl4KCJezZOM8tcbbXTgLgv2O9Iblw+hov1jKLL0NWfUWiy5aeAATmKug8NkPBdTgNeQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719101717; c=relaxed/simple;
	bh=cmWrLgGiS2ZLhPC3ntK0l4B8Ll+nJKE9+yx2u91LRfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0xh8KCg3fr1xs9u1kJ/SwS3jQ/ieaXRHzLiWuNpdMX7bw+fz2twZE2s/rEn2+5hgDwjkyc/Iacp19El7p3om46xmk0FLOEZNyEW/CPZpVg5r9hkAEglL9HDAnj0zjLQIBOGsvS5SjpvyhJn6Qr793iXfTSPRHk03YwFM8j6qn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZMw9EXEB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zPu9
	dFxZmhOF/UTcgUWkSXWBx3llklKXT0q3IZzL42w=; b=ZMw9EXEBkfkwlYgQ8ipD
	MaMPAUCsgRH4wtTBp4EpNSLMk+WKiTAdRAcidQX5BYQdzh7JwFg1Iv1Kj/91pL57
	WYfvKR7RRHgX0iQkJNLHBbcJuzJf5h6cvpmLC7E9bXa+vbONwWS8nJEb7sK6+7mT
	xUxBvMmqiXVBWFsC6xjN3S+qBcTtzoDIxupNhvGEnjDkVAgcXMLng8XcsPJeONeL
	dJHCxXjZH3z4m+/I7XSc0inShau6HGmPrjXjOdRLrSuhd9IbTZ6dqWbkKNE2wV1W
	A93Pochgj9Gg3sz3VADxHoBMhg19d1ahd6fLyxpGuCcUzMy/faBrHfFOV8SVRfJe
	sw==
Received: (qmail 1777053 invoked from network); 23 Jun 2024 02:15:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2024 02:15:09 +0200
X-UD-Smtp-Session: l3s3148p1@58mzjoMbmuNehh9j
Date: Sun, 23 Jun 2024 02:15:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Grygorii Tertychnyi <grembeter@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.10-rc5
Message-ID: <c2x67wutymfrguefx5djbtfnrlds7c5oz2xod4xwuzflcw2ss5@cwrkuua7lztx>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	Grygorii Tertychnyi <grembeter@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <z26bzagsktppxbftswcocv66a5xmx6kbxn3ui27qq2iie6z2mo@r22mkxmxwfu5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="slehwknibtnn2t6j"
Content-Disposition: inline
In-Reply-To: <z26bzagsktppxbftswcocv66a5xmx6kbxn3ui27qq2iie6z2mo@r22mkxmxwfu5>


--slehwknibtnn2t6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 11:13:52AM GMT, Andi Shyti wrote:
> Hi Wolfram,
>=20
> Sorry for the late pull request. I wanted to allow a few days for
> testing this branch, which has resulted in a Saturday morning
> submission.
>=20
> Thanks,
> Andi
>=20
> The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d5=
8f:
>=20
>   Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.10-rc5
>=20
> for you to fetch changes up to 5a72477273066b5b357801ab2d315ef14949d402:
>=20
>   i2c: ocores: set IACK bit after core is enabled (2024-06-21 01:17:43 +0=
200)

Thanks, pulled!


--slehwknibtnn2t6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ3aQUACgkQFA3kzBSg
KbaVHw//XBwde8I/iJKLm+wqsb97f0t6S44b7ysYHN3vlW3xn7fGQrQIBpSX4iUS
ON6ubK/n/43PzKmQUYVU03lGphF0yS9hLXMgZkEuPyl+jd8eD7hWWfvZtBDe4JRs
eQpzEZw3M7z095Q0N3vPozjPbG9aKtl+hQ1eEiMfTqM2Gl3aTfXY5QODKJ3yBTWW
iVo78vum9/r+AXfGzDT6TU6pFED6teOUzLne7OL0YRmQr1IVFY1N+Aht1aySHEJa
Qxrv4eDvIx2eNgDXnj9u+8YTfEluVteisoIQ4WE4vY0sphkkSXg8cBINwb6VnjWW
y5zxTr2vMTFRcMfEiDngISSL1arsnHiyaDY42krglJRPq2Bpc00Toz+DtqB5KBHx
2mlQRPs41wKMwvPzzbEPdwSBsfeR8GT9EKybxk+X5VFFN/Cg9BfcgXtvzvcT4zDG
7RfwGZlw4hqnWC8O5to6QwCbGknCdInwDGOUTeFq+FO6LszvqaFl9WABSQnD3njd
HOcczU28dWzne/EzIYywV30U/AZDXCRBQwTr48UopyyuUQuWqJrXRX01UScLPtjX
4sCVlxxlro6w/yJ/zRUMESkCc7/M7qtuu9fuy+NVF2TEoNqGA5dsrS8lFkmnbGq+
6b7ZAPmZzX8vYmcKnJQIrMCCES0JpOkhsSOi+wfpEgMNX2Am08c=
=bLO4
-----END PGP SIGNATURE-----

--slehwknibtnn2t6j--

