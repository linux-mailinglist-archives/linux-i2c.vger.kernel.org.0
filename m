Return-Path: <linux-i2c+bounces-4742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D705292977F
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 12:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C33E281515
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 10:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7908D18E2A;
	Sun,  7 Jul 2024 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="cprcw1Ql";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v1QhUSyB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D045217C6D;
	Sun,  7 Jul 2024 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720349471; cv=none; b=BMdeBJ+nyrQVbwu04jAL8iiCWztcpSph/Ym+gYs+XX08gzUqNmVdz/aUZoIyQUBsXZdVwZpEi53f6BJ1k2Gt97tzmlSGGkJ6m6gonVIFOncBokpmGvQDGyp4N3Y58etAhCH2Drfw14JXy9xLVtpiY8G0TCUcWrcqxYQvKlaDd8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720349471; c=relaxed/simple;
	bh=Rgtc2lyLn6FzAPWzNFxENvhimL7rtgwW8A+sAVRafQI=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=iZi1cxIZ7kGKRXxCncG5WQybqhCh6B5IAlIupiqK4t6BcTGC/fuo5wJ+mFXSxeBlShIIYrTI8S8Y5SZaX0qq1kxeY9gdZm7dA6SZ2goJyWq5rpX6sP3bsNfaEtcJUO3Qq2DwOhZg7VQMX2MHJ/Ozfjp0tQxXxNy+/305EY8Z9ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=cprcw1Ql; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v1QhUSyB; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id E8E5D138028A;
	Sun,  7 Jul 2024 06:51:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 07 Jul 2024 06:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1720349466; x=1720435866; bh=CM91Q+xk6v47NTJaf4EjRxe1prnQaEL5
	7qc/4uZC+jQ=; b=cprcw1QlsKeiNk3LZ2L3GkAaIv//2bvNKcwt88hqTRMizi2x
	y+QXCK0222ig8yo7Dqb3aFaGqf+XXOGbIa6qNbzEqsJNSeJ6PvZK2+UuKRNz7z5K
	BPgYLM1SfxCDMWU7IPtGrtG+4mWK43Tm1wW+mkif/IzzMsMoVKaX+jwXHk4v9nLU
	9fxUwF+JlQCSe+2mXznU4uL43GqaoCC5CE2D3vFFwMXg/9zyk38MiO/BGF5wEebR
	w1u/C7rrp/MJL+r5s/d4TUI3g9WpRg730oG1+3A1Xq32mise1VPdV/EcNR0sUsR9
	Pj3uhFOxou1fliH07dIRyJwx+XCKinMgiaGRUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720349466; x=
	1720435866; bh=CM91Q+xk6v47NTJaf4EjRxe1prnQaEL57qc/4uZC+jQ=; b=v
	1QhUSyBP75i4EnOm0GDFaVBq6D+IA7MkKdawMwIJdV3eOnEEUpLjaaFJ2KZWBSN5
	iNIJAJykZ/KQjd6GiuPLTFODSnLaWmRnT+aw3smHgh+CWpYvDOPAM39Lpc8LgenO
	xNlYUMgYtOiNS6N2ZXFUbvcPTLBtS7GIdQzhz4vqoLBhNZ9BTY9VPxzJF20KaNa9
	9lBCvXEqMu7aiHEnUJl3TNnfPsUiKQ8VOIm2PsqcDUykHKTIuZBIsKtTEAFhamyf
	SRhPiNDYY+6B36tlkVwi718GHN6WZF39frNZBwj45mj+c6ePzODiixcVEcEgEwBx
	oJtgOUufHESnK7IE90RRw==
X-ME-Sender: <xms:GXOKZkl_2Y_oD207xHOvrlwWM2DhpxfLpxAJBHnRCT9pgFCP6JahjQ>
    <xme:GXOKZj3kOJV1CEdX-j2K-BHv7FhbS7I2ZhvUdeCAUSwfyiZ9vWL0p0P5d3Se9j6PD
    FfvYQUbcko370WCY88>
X-ME-Received: <xmr:GXOKZipU5Otrs1RIBOYEnUM0_Zun9gSNJz6l0xH0v9b3z7P60BxkGAYdxCoHKnE_BrBU0mcNZlVbSm-BfDsDgZJq-usVNmxVp4UxA1p00hSQexoJ_5OCFnxE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpegtgffhggfufffkfhevjgfvofesthhqmhdthhdtjeenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpedvhfdtudduvdeujeeufffgudekvdefvefgueeiiedvledtheegieevffdtteek
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:GXOKZgn-cNueNhVzEF1lanMlyYKkFqHMPXXN--BKnWzyhaiu45OzHw>
    <xmx:GXOKZi0E6C3kKEM4hXM78hwZNcm3WXOdKqoalxcGlLu9Pvx5RDvdsQ>
    <xmx:GXOKZnvR7F_FJNEFo8rDc76qkz6TT-Q3QndKLpyy--P1HbDV6wZ7ww>
    <xmx:GXOKZuVEC9aj0iQwRazWxsL2RPSnJ2_AC2exX0cEhIzDFuRir0TsQA>
    <xmx:GnOKZoNI1i0hZHHb3KYgYjHPBsUjfKiNDprhVdoQP7aFgkRD7f_8ofEa>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 Jul 2024 06:51:05 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Sven Peter <sven@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 37/60] i2c: pasemi: reword according to newest specification
Date: Sun, 7 Jul 2024 12:50:53 +0200
Message-Id: <474C20FC-5A3C-473E-A0B2-A2382CE134D1@svenpeter.dev>
References: <20240706112116.24543-38-wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andi Shyti <andi.shyti@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20240706112116.24543-38-wsa+renesas@sang-engineering.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: iPhone Mail (21F90)


>=20
> On 6. Jul 2024, at 13:22, Wolfram Sang <wsa+renesas@sang-engineering.com> w=
rote:
>=20
> =EF=BB=BFChange the wording of this driver wrt. the newest I2C v7 and SMBu=
s 3.2
> specifications and replace "master/slave" with more appropriate terms.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>


> drivers/i2c/busses/i2c-pasemi-core.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c=
-pasemi-core.c
> index bd8becbdeeb2..dac694a9d781 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -336,9 +336,9 @@ static u32 pasemi_smb_func(struct i2c_adapter *adapter=
)
> }
>=20
> static const struct i2c_algorithm smbus_algorithm =3D {
> -    .master_xfer    =3D pasemi_i2c_xfer,
> -    .smbus_xfer    =3D pasemi_smb_xfer,
> -    .functionality    =3D pasemi_smb_func,
> +    .xfer =3D pasemi_i2c_xfer,
> +    .smbus_xfer =3D pasemi_smb_xfer,
> +    .functionality =3D pasemi_smb_func,
> };
>=20
> int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
> --
> 2.43.0
>=20


