Return-Path: <linux-i2c+bounces-4067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CAB90B6EA
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 18:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F4A1F21FAA
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 16:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8978E16B3B3;
	Mon, 17 Jun 2024 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="efi+96RD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC416B39E
	for <linux-i2c@vger.kernel.org>; Mon, 17 Jun 2024 16:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642729; cv=none; b=nnjZM9KSyLS5tgBpO2YXX2eIKpyS8JMk2XL76Pfm350G5MpsjvPvyXkeFwX5wmZiyAE2z/UzByWA3uNrCJUyC0AdWeH7ydzMR6rbqHd5997jipHP78bv/d4QYhLjAiPBt/aS6p3aVtlXwE9TwJPfGCsEi/OwGyu0j8Mr1/ybKt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642729; c=relaxed/simple;
	bh=JF0DRVdvDrP/X63k/t+c0ChsmTu8fE208dmE5UAaqJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUztZVgQFGI3FPVzGyzov1c/M7scg/RtWaDt8kL64pJUfU6+qJlcH1UVKb+KT18krPwnKP+/IA5IZVGgNW5/+J5YEv6qjfUz7mgy53YXFEJH2drV2USpcjqmIpFGDGwF1A883mCOD27nzNmR95MX5UgbDuAB9Y1hDIQwHO1+N14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=efi+96RD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BbrA
	mQRWzGJDhWszxc7y+nTSszXSsCm9K0tXqx6rv4o=; b=efi+96RDtVB4BJnrqr7O
	6Rqi120Ip6IDqJBQ93KM75t40Oamx2nEsr1emGQtybSMOEJI7T2PtnJUIc+SRizY
	PESjNJ/kzJFGhqGjFNDXxR78Y2SSS1aJBWS1czF3JH8HArq7v3TogW/6ncq37hw/
	jjOuTWFym5GQEcDC4DHKcMmWXsZ8gvgGF+2qiVSTxQ8D+TfqYrvjoTgGn/Zy/QTA
	HLG5xh1TTMxVhJ3TLa8rxTZ0JQCsmXkqhv03KW9aOkotz07PgKGbwd/F/A7/w+fD
	ku5houZctoWcksRXlp3zCK9VYeJKnD69LV43IUxV/GgipRbytXzWMc+sgR0dRm09
	wA==
Received: (qmail 2400428 invoked from network); 17 Jun 2024 18:45:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2024 18:45:17 +0200
X-UD-Smtp-Session: l3s3148p1@hYmmsBgbwqNehh9j
Date: Mon, 17 Jun 2024 18:45:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <ir47gr6evieqekm5ws6stmaqqc5td6o35s6orus4nqhgw27o2n@ex6bqs3yuejm>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
 <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
 <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="grmagpcc5ztiysln"
Content-Disposition: inline
In-Reply-To: <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>


--grmagpcc5ztiysln
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi

> > Have you read the paragraph "Synonyms" from patch 6? I don't think we
> > can obsolete client because:
> >=20
> > $ git grep 'struct i2c_client \*client' | wc -l
> > 6100
>=20
> yes, I know, but I would be happy if we start changing i2c_client
> with i2c_target and at least saying that "target" is the
> preferred name for what was called "client" until now.

This is largely what patch 6 does? Let me quote:

+As mentioned above, the Linux I2C implementation historically uses the ter=
ms                                                                         =
                                            =E2=94=82
+"adapter" for controller and "client" for target. A number of data structu=
res                                                                        =
                                            =E2=94=82
+have these synonyms in their name. So, to discuss implementation details, =
it                                                                         =
                                            =E2=94=82
+might be easier to use these terms. If speaking about I2C in general, the =
                                                                           =
                                            =E2=94=82
+official terminology is preferred.                                        =
                                                                           =
                                            =E2=94=82

> I think we should start somewhere from using the new naming
> provided by the documentation.

I think I can justify replacing "master/slave" and create quite some
churn because that terminology is unwanted language.

I think I cannot justify replacing "adapter/client" just because it
doesn't match the spec. Plus, the churn would be a lot bigger.

If everyone (especially affected subsystem maintainers) is like "Yeah,
do it!" I can do it. But I have my doubts...

Happy hacking,

   Wolfram


--grmagpcc5ztiysln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZwaBgACgkQFA3kzBSg
KbZXNxAAhjbiM9/e2Nkpvmf/06Db4tpb/+ObSgtj6WOEGfzeTKlaDjimYF9p34x+
U4jjzfhK9X9FSaDqlYHrxsEAFVhn2bRWewgPXcm+/uge3kIkyhgbjTAmQESV9MeQ
qZH0c0VKQaySF65tv2YnIFvQIDgjkkLx+tUgqiOixWZ/31Vr4++DS3xr6Q2TxfXq
ibjgYNqD5v6znN5v0z5Hv1R2ZYf13S1AB3PxxSkQwirV4abRd3Gv0VOB4jO8gwN3
jVudv/I22XHGNpl485GDS55UmN2V4KUGyF9SK5IrwFxTAjCHiuGAS2TdVwIXmbKf
h8qnWyOj6FlcnmId7UinSegKKFEF5pvSxAPRd5efYpJM9vdQuvepZyLbOdHXZaBG
t8XSVIV+lQSkbwEaqFvjXk5HT1+lo9oPso9CgtnNrECfqHIIHZD3sD3RFbxCpTPL
I6n9pn4RgY0Igq7o+eWuJ1P/s7m5vy3uVFRTY2rhzxQR99vaIb/zEctFkeHzjpwu
ZHrIiYnKix1/l7p7IWrNSm/tUbnHpk/sM9nOhf5ckyxr8yQW0R4P5uxPDkDDkOzn
nsCUaTiMJVxvV92Xfl/FK70JVsMrurgYUrumBqhsIDa0xNKwOljHLF878padc23c
cfh/G5w/OivNSG/PO6rJ9twGlmaRnYVPA8MiYt20FMb2koyrB4U=
=SDUa
-----END PGP SIGNATURE-----

--grmagpcc5ztiysln--

