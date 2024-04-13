Return-Path: <linux-i2c+bounces-2932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162BA8A3CFD
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 16:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F298282429
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 14:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB1610957;
	Sat, 13 Apr 2024 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="f1xi1Yga"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E482901
	for <linux-i2c@vger.kernel.org>; Sat, 13 Apr 2024 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713018914; cv=none; b=T5KAluqFkeU72rGHn5m2htZ/3xxT9NIFNyJM9XihYMHbguer3+kwQyEm5NbrGDbSOAxqAop/CW4liVbp1PvBL7zQFM1ah6BekPlXP7xAEKUYUzAfzdrarof00geydclsGGecJcuyfG5127YvIO5BFfiUS3e4wueeB6bCtD26cBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713018914; c=relaxed/simple;
	bh=dPk0cDacUvwbrHHuf9fZXLRbdY/HN7S5wX29Cy0IFyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXRjZYrbbENkBYOi6VGmXgE6dk0k2DtlwhhNX4jTw02Xt+5d/2JhyqmrkEc0fK+/MgcaaoJpSEcXoSPFxnBt6lDwLFz5mqc+TU2SqrYnt1TaQNpZCYwtJS2+81zRW9jb4IwYy9fi3P8ib72ibx0nVdjDsslE5c442R6xw7XzBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=f1xi1Yga; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dPk0
	cDacUvwbrHHuf9fZXLRbdY/HN7S5wX29Cy0IFyk=; b=f1xi1YgacavXRDSt6xtN
	LvS4ALlTEAcOlRfGb8vyAFs8ysega+SUXmBbQ2z1BSK5kgHOPfvVaW7Dk3hHKrsS
	cxfUbpkwMFqx1QOXiq2GZXTLo3cHcIcYJGEmQLtK60c+ZkhksY07L22O94u0aNpu
	FlyzDY++jCJSe8UdT257ReMr8csMORsb01IR5bOskz1PjykKHs8PfS7/V+yE3Qto
	Q/mtH9gmDrtyxmX/uCF0PgvqtTk0bDn5sMJczCKdT6Z48TtziMasNrA6brcx+jn1
	AIaMpQhA8LoAW2cWPqFnemid54eYIsrOUmTtQUXNZKRYP35ahggC/XGvyH/OqE60
	Rw==
Received: (qmail 1533133 invoked from network); 13 Apr 2024 16:35:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2024 16:35:07 +0200
X-UD-Smtp-Session: l3s3148p1@9IltS/sVoppQk7GI
Date: Sat, 13 Apr 2024 16:35:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>, linux-i2c@vger.kernel.org, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
Message-ID: <dnh4yiajjqcxcq7xjvj35quda7yrf7tubp2l2ktsaf4zgzai4n@xdefxkk76yyg>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, linux-i2c@vger.kernel.org, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
 <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org>
 <8358604.T7Z3S40VBb@diego>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3rm5ajlyb22bpc7l"
Content-Disposition: inline
In-Reply-To: <8358604.T7Z3S40VBb@diego>


--3rm5ajlyb22bpc7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Also we're talking about two lines of code, I wouldn't call that bloat ;-)

With this patch, yes. But once you allow debug code, it is hard to draw
a line which debug is still okay and which is too fine-grained. And then
you end up with a lot. Over the years, I developed the tendency to try
to have less but meaningful error printouts. But I don't enforce it
strictly because it is too much bike-shedding discussion.

In case of this error printout here, it is just wrong. But, see, it also
came from this tendency I don't like to have printouts for every error.


--3rm5ajlyb22bpc7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYamBoACgkQFA3kzBSg
KbZ5mQ//Sz4z/OJ/HyrUnuAtL6eJjBPkhIyxgjlxGgFSZ7sPECcUBR6Y0itNh20D
LVMfF3XdU05v1wHMbmysTKBje3SdNsBMhLpM4hYXC65CLyO9mlPGeath+W0yMtGR
DQIaItYs4WssxmRd9C9gbi9XDINsMq8JfSccPtVgFqWMXowYtnJHc+y9ykMH65R0
YT9X05NYGdCd9aNEfyDDb6I4t4S3v3p20/va00L/jfaQubpoTomDfuhtOGy04cQn
xzT1PAdTR6HPLN+2Nl0FUHMUhO1GaJzsn5MT5XSuuHzIgQ+d4zrVzfPXziP1fJP8
jsR/FMHBc7uhFtinY5YW+8DURLwA6zwe8pGNvuf5StFfGQK8MIefDH6cIOz4c3y1
xCbz9B7a/dOKB6Q8VkFLgvEC2Uxcj8J0klrG1vuxAtqTig30dm/zJO44gi9luivY
mUdkrCF6JDQlBuWdyku1U26vGbUZq/y5x3xLU++BkuaDBRQNyBo9rZi5up+FhZTe
rsRKO+Ey5ils8d1zyElAnaUylSoMrFlMpTb7IATzM4+v59+T9kCv1DL2cOrYJKb2
NU+Mp6yjYXAmK8fP/OJzO/7FzMlS7nxGue1XKaTH2NNM9Dq/SEvQIU5JZKJs27MJ
oYVVlVRo2cXhZIZ6Yfo9WvO91vYe9lWTxl2+MIJKhs9dhzNlTYo=
=I1ij
-----END PGP SIGNATURE-----

--3rm5ajlyb22bpc7l--

