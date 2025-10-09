Return-Path: <linux-i2c+bounces-13433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DEBC8C41
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 13:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B51573E35AC
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 11:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE6C2DF153;
	Thu,  9 Oct 2025 11:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A+cCwjgP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F92C1597
	for <linux-i2c@vger.kernel.org>; Thu,  9 Oct 2025 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008963; cv=none; b=KXXEMsfKQm4pdxJd0qeG0yq1ZM3TsbyejRY0cq9AXFjdI26xSypqcM4qAKZlanfMpD/IzItxGWHDjGd0YqkhEgCSqryjKJ61ojqdpKPuazcc3WdnsbVlTJOVWdE0P4w+acrNy1g806SzyWymjsBVx3ZvsBtC0lrp48nmve8buTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008963; c=relaxed/simple;
	bh=pxxCSE2KZHdFit3VvNcpMbzSxM+yyuyg2i3ud6ulMIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irUNtGfAc0xFtx7yck2iawIOivhO5/ugVWFdWPlF0+SwLJ7pyzyOQYB/H/tJIZ2Ru/zb0NvM65S/uTxvvS2ycX1OITPzpFxkSqt6W4vxBtJdUrFqt0h6k9Iynaer+LUZENQwRV11wLzV7A9pbAhVDdSewLsa0sufQfByJfz5s3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A+cCwjgP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pxxC
	SE2KZHdFit3VvNcpMbzSxM+yyuyg2i3ud6ulMIA=; b=A+cCwjgP6ISwR696vpu/
	XRDtUp8Me9cFOlDw69yCMhr/MEGlFl4jrPz5Z/tG2hu8aCzz0ccfqLPJvRpNitDx
	+74hWrUd5jM/uCBgzDwEo16LkgNo51PndXoaqRKujEEgBzAyQ695xlLR6+jLrB4I
	q0L5m7mBOxnziDnXlPKS0m24hvUiwPozdCSXxDPozLxAMz0+6V4tS2sdKTN0A98l
	VZAuuGOfETFvdcNhAfTPnfjNay+OzIOuQtLc1NbNFOUgoxTg4OB4+PB4xnKvnFue
	FywjllC1219ISTRbbICgx8uP7qae/04zqOaLqNrb0jgUlgtXGwGd3lr+nuMHqj1i
	uQ==
Received: (qmail 1055785 invoked from network); 9 Oct 2025 13:22:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 13:22:39 +0200
X-UD-Smtp-Session: l3s3148p1@AM7JBLhALMYgAwDPXwQHAL/S9V79e5yL
Date: Thu, 9 Oct 2025 13:22:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kael D'Alcamo <dev@kael-k.io>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Yan <sledge.yanwei@huawei.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: i2c: hisilicon,hix5hd2-i2c convert
 to DT schema
Message-ID: <aOea_vod4u9zlFC0@shikoro>
References: <c2e81faf-4d2c-40e7-bdf0-e0d41fc76d9c@kernel.org>
 <20251008200535.17464-1-dev@kael-k.io>
 <20251008200535.17464-2-dev@kael-k.io>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0LkWXR9DpKWUfQ3k"
Content-Disposition: inline
In-Reply-To: <20251008200535.17464-2-dev@kael-k.io>


--0LkWXR9DpKWUfQ3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 10:04:27PM +0200, Kael D'Alcamo wrote:
> Convert the Devicetree binding documentation for:
> * hisilicon,hix5hd2-i2c
> from plain text to DT binding schema.
>=20
> Signed-off-by: Kael D'Alcamo <dev@kael-k.io>

Applied to for-next, thanks!


--0LkWXR9DpKWUfQ3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjnmvoACgkQFA3kzBSg
KbaGAQ/+LGHz0IRK+R1aHwndw8OQ3TmbrnV1mtBbLNFyYWmQt3tU3Xh6beGeRCa3
Iem0fxZEnYNss7p9MqjaomoAgcxaCKyvyYO9QacXKtt0rG6nlhMMzCgdFRuGFscq
F06u/AllC/wMBxNAc3PhEiGOqvGmbNt6g8uEXEaKuOOgBQni7cMsyDkutjx6YjE2
WCDsGVOi1zRScUM+f85iKtegqdvZrEf3VrpJ4O6spoAIxoW0G/sTSlcICh0Rru1G
nBTfFsxJ4ItVpl2+q6dufq2ssz1f+FHbCUWCLt4UYfLWaqQo2DXdHXVwleqW4/9q
JPnvZ7aTJkEjunuIpC9aDpG/Xp6Ilwx9feDrL8FIqjV5+EpvgX+BBsZGdbiJ0A5t
JKtjtt9vDCOshCaUMwdMulxXiUTmgHp2H1bkFlAIDRCfKNendtyZHpyNvTi5bdXO
267MSpGx3+qnx5l6XinMOHTaLP92uPtM/waOJ7kwNJi4YYAD1uNPPWhsZ8OWCYl6
/pxvHDwq7BSwNm20ktuOwXyjTa14x9WlORGFRlJbgm+HsK7b6J289pgePKsoR98r
ZDK1qSsBbaTO1F3QywJtEO+dBzYN6bYcByaf/pk2PvhwgrK35566CLX/qDyuzewW
xIXB347KcjiOrSRMHOj//LOzwMAsX2BxGi2nTPSz+ucFQ7nD2vo=
=euhl
-----END PGP SIGNATURE-----

--0LkWXR9DpKWUfQ3k--

