Return-Path: <linux-i2c+bounces-2175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819487060F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 994991C2030D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92511482DD;
	Mon,  4 Mar 2024 15:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RqrWTCk3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9EF482DF
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566852; cv=none; b=oUSV9i6Sw+R9KSu/ryhvd2IxgEumBHgWxBu35CcX4VOaE4mvDYhYFx2VQozpr/0zV9nnTy8RMKzLL1cM57wHFOvgGPWkT+wuRn6ciiKUnlHWAZB78pW6Q/oFGlUclLWmc4C2DGhkJT/VPmRG7ljU+vS8fPUlmBzv0GLY+cfGpSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566852; c=relaxed/simple;
	bh=uD/ZOIIYdAxiTign+/0uOdZFUKosmxXX63brbDCyi1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIeCszzBtjt/A7uMtIpdZuU6x3+T3E58+rfJy7agYgfTCBXzrVjPokev2Ovr3qY3dxVPdmWu/jRM4vIvaL6+IyXqvecYgmjS8oit1bDqt2DLKjgCtiZhHd1oahqeGhs8s5l1CJTit9gvrnS5i5wB60Zj4zo0nemZQ0sxfcimNMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RqrWTCk3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uD/Z
	OIIYdAxiTign+/0uOdZFUKosmxXX63brbDCyi1k=; b=RqrWTCk38mtLR2O52WdE
	r0I9EoVBNbJMWg/OPmEOlW6jCXdgM0Do618j6n21RGHLLf61M+p5hoERwxg2XdYI
	NciUkXXJAOWzPE/YIHuubgPVmyg0oq/60tO3hsU7me3RJhlJIS+J5oxzp3Qh0+iC
	LLDk8oxiOfeF28Txt8RqyosKIA146oGkXavkpK41QVg3WTFrmG+ou0iDLiKAgmd9
	CRfDW9oImAaKOxVQstIF9q/DNadAPrQgf8ajA55/FSwUEmkEyqDoKv0Ut6ug1A6L
	QpiZX1V2dCXqXAVq1j8GSf0ydBVHPzfZYjdCcijNOc6Y5t1O+sAk3ipbtm+2jsPA
	bA==
Received: (qmail 3551405 invoked from network); 4 Mar 2024 16:40:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2024 16:40:46 +0100
X-UD-Smtp-Session: l3s3148p1@W6WSjNcS9NcujnuA
Date: Mon, 4 Mar 2024 16:40:45 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 1/3] dt-bindings: i2c: mpc: use proper binding for
 transfer timeouts
Message-ID: <ZeXrfYyf9GClCj6O@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
 <20240229105810.29220-6-wsa+renesas@sang-engineering.com>
 <r3tho2bh3l23f5xkjc3ovq4xdehpsb3nz4ukbkremxvzq6shpe@kdsxfz4brskb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8dqE1F9IKolprz0p"
Content-Disposition: inline
In-Reply-To: <r3tho2bh3l23f5xkjc3ovq4xdehpsb3nz4ukbkremxvzq6shpe@kdsxfz4brskb>


--8dqE1F9IKolprz0p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Chris, can you please give it an ack?

He did on the coverletter for the whole series? Or did I overlook
something?


--8dqE1F9IKolprz0p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXl63kACgkQFA3kzBSg
KbYBww/+KZxlgQy3nPQ4hTE1wxdYLQqFbrSMxQ+/a04oDzPcPr0ds90n8GU7QU6m
hU3sgMjVNAIx8MuUCiv4YEMyO5dORPFKYk2+WIRxrVoRdBnjbs0TggLwGVfYUQXG
heWpYIjQEdOf7/LRU/0ESgEIubK+i4kqsTzY5QbfleivLA/LVKV7zXfomzsQrWPi
3w6OQFkGjRWm9OrtySeFLhPUifNOR2wDbkDWlNoQK1XwEZ9bxFwbi5Xj7CFnsAP0
etfo96pHpf11Eudp+PICEY1q06sa8lXcR473gbJhwhazqtgio2XTkkk4S0bPq2Ih
xRgxRjFvZRXZethQ9cDI6iBcluRQS107T3JgQKF4M5qJMb5nPZEHTLURQuAmgceA
7sxaRr4fNFBXwxcB2xNyXnST4jsbzuGYOIxz3X+CZetFCl3Nj1XecHaV5gnAtEZQ
t5tYapA2OEVg9c1Ch3vyuGKs/D+f1k3NT/T5X4p3PnyTsSvxBOaPzbJJeHqlY0An
jdMAdBkPCRWtUYOYK/Ed/97F9OrL0LwzIhU/ON6vLxFFueZlkFe/8q0gv5Q0Fhsq
JxMno8xFnN+g6Pz5mjifl9vpdBCSObCmXmxmwNGXaAiUR2hFu2EJOHBg6nX3f0BQ
r4Dm58k8MoqhS1rvwwNWd6kuW2TFXJez7daNa4M+ipjWvgrH1xs=
=VT1J
-----END PGP SIGNATURE-----

--8dqE1F9IKolprz0p--

