Return-Path: <linux-i2c+bounces-10016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DBA707D5
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 18:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE1B93AE110
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 17:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07A22620C4;
	Tue, 25 Mar 2025 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahSCyNqj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9F25FA1B;
	Tue, 25 Mar 2025 17:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742922890; cv=none; b=O6wrPDqCCY1ZjplxyTUE6SY1qfjEbukfaBeDU8dOGe/UjQFmfo0cU6zMfaqBpRXfdwpX9TVDFNsaOEbfDHg4ixxTga0VvFjUp99Skb+KPYLVjOYeQtkxBBAolyyzUD4emIbhUlpZvutCDLkmEZCOC41Bq4/Lw5OZ5cHUoczbJNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742922890; c=relaxed/simple;
	bh=7LjuFHI+9x6bjZK/FeC+1TifxlFCEgZtEhKL3VJCkJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2AfUzlY9BoWG2Bv9/yzgss7PRag2n0X2FxGfV9r3zSiGg/PtZMRXBe+y0qA0lom1N+ITjFBhejH/XscBWSZvMRjGQGj4QD4U/UAfIxQehUVoLGZdfOPadl2PC/+SDc5PLxFcXN1ExwBCWpUAxvcep8geVKVX0L+E4YJcbygLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahSCyNqj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so5205280f8f.2;
        Tue, 25 Mar 2025 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742922887; x=1743527687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QLnwbdMaL1/FwcJKrrohuVnu32gSpBukuyMJRAcqUuU=;
        b=ahSCyNqjBqgKtmZRcIN1ij9XOpPD2vovZzsHll63bNdcRrwL+9nIBsxqfXWcm0QJOb
         dAENJx1OkDh5eMHAcJlfR3+WHRcAmUP4FRZw4un6DW6C441jq6FywWWQAVQcw/Aa1Wib
         oE8O3t4j0AAyCOVxGzzye/TExb8Z7i64nz6VUrOMwRZqXja+1ulPEPxpONY+qgXp7r8u
         MaOPjjm3964XysIXFczlNZgJzFciOmf+XJdPqPqKwYb5J1KyHc6cVrskBJQME0yStXVR
         Qu3xzAC/Or9lvGNFbIC7lPKq1eRqlsuojEpU0bOKHRB+c8slLT5nFqBepfWgThqe+OXW
         fZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742922887; x=1743527687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLnwbdMaL1/FwcJKrrohuVnu32gSpBukuyMJRAcqUuU=;
        b=kCSd6ywXIc/nIdOkuqA2N5UQVzU+bj0IR+p880lR5isO3OBe5ukR62eSKcYDM0AgWP
         gNLfW/lg82K3LfYgdyUfRfwo/3L9EzEUetj4k6n/F6A8W+RUNBPXp3dI2ovuPmGXoc0e
         5NXCkts5nniwau0ZAxg4cq+SyQifl0QcBh4aVTKAay3BQGfoia83PSFSJTbyre8hWw4J
         4CyLfu6ruMfvRvFl+l0ZH4LDWV6iItArWimMT1K9/AJMlyWlEwzwt9M3ca81BD+lffHa
         +WFYUNElJa8/FNbp2LC2KDMzQ5wQ2CkQa4oQbx85gdoM2NHdy2Zwcqzp15aXrLIFPlMv
         ACtg==
X-Forwarded-Encrypted: i=1; AJvYcCVkMceX2p2ocLITyuSFReCpe9ZOFAbxpSlEP6V9snF1XSos7PK8D87vJ1pQxb6u18laUFCBBOZWS1A=@vger.kernel.org, AJvYcCWWnuvdIUZet8SQVKCRnkmLAwP6Wiw8ARc2UmCr/xQniUELZo0kU0pTjpBOrJqG7u490JbPmDfVUvXqdf8=@vger.kernel.org, AJvYcCX+52sPWhPYhJjvIYnkXPXRR8XQYRtmLT2SMrtiE39FTWlgZAZqzCiIFsI1qbUL8zGw7jTaMAsc/zyl/bNI@vger.kernel.org
X-Gm-Message-State: AOJu0YxtLFnKryr7pfijLaB8y13NKLt4Z38/cYF6/XnB6oiGQaIvfFz8
	5jTdAJmOS59LzWntZ88mU4h+FxMi+f2u9U025Xyls/dp2OS03qJ6
X-Gm-Gg: ASbGncsy1xCsVYMdxighPpchr5Y3WtLejYRvjrt2ieJApFO7T08If0GdHzomTYf1zA+
	UPgUc2uVd9q7FT/siSveFkAI2cbnA4UQUNnRlg+3L5ClHDoRAZUNPaq053VQVg1dWxwbbtZYlQf
	nD79ogRIpK9UWBinQF+uBlkl0b5xvDeIW1v/ae86TQFHg9fcSa/vGYm9/99EjtmpG0s0XOodQhu
	rNi1Ht83Z2rMKHwBYkGzGcOyCsDmHtSGDYsYPT1fuuJqYJ73ODotxWWxwO13tTBE8ix/Ar04QFh
	UF3fvm09I9hRAVnj9CF6wRDFAS8eDAl5R3FA8R5DV9wyL57ozAd3QTTvtfdEHQeJxGDYWxAOOmR
	Mx5J109sLtIAAdKgTnedrXvOrIfoTY30=
X-Google-Smtp-Source: AGHT+IHgo0Q0bPOcCYzchQiU6TCha3M2YaTp1OkI/gjnRtvmyKxZA1brxp4uLScoHj6BKvWm0D0joQ==
X-Received: by 2002:a05:6000:188e:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-3997f8f26b5mr14688915f8f.4.1742922886794;
        Tue, 25 Mar 2025 10:14:46 -0700 (PDT)
Received: from orome (p200300e41f4bef00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:ef00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e674fsm14021551f8f.80.2025.03.25.10.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 10:14:45 -0700 (PDT)
Date: Tue, 25 Mar 2025 18:14:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	"digetx@gmail.com" <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
Message-ID: <cao4thtbeenv6b5rbp5icijr7knp3k25zmzg7u7vdxi62hfyrt@ymchhtpwskke>
References: <20250320132144.34764-1-akhilrajeev@nvidia.com>
 <2rlnnjixgd65u6gbqxfuhzu5humehvjth7iysj23xvuv5fi2ft@i5su6kfrqnt5>
 <PH7PR12MB817882F6F4EEC820E22C092DC0DB2@PH7PR12MB8178.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mbx6h5ohg5ujq2jw"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB817882F6F4EEC820E22C092DC0DB2@PH7PR12MB8178.namprd12.prod.outlook.com>


--mbx6h5ohg5ujq2jw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
MIME-Version: 1.0

On Fri, Mar 21, 2025 at 01:09:32PM +0000, Akhil R wrote:
> > > For SMBUS block read, do not continue to read if the message length
> > > passed from the device is '0' or greater than the maximum allowed byt=
es.
> > >
> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > > ---
> > > v1->v2: Add check for the maximum data as well.
> > >
> > >  drivers/i2c/busses/i2c-tegra.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> > > index 87976e99e6d0..049b4d154c23 100644
> > > --- a/drivers/i2c/busses/i2c-tegra.c
> > > +++ b/drivers/i2c/busses/i2c-tegra.c
> > > @@ -1395,6 +1395,11 @@ static int tegra_i2c_xfer(struct i2c_adapter *=
adap,
> > struct i2c_msg msgs[],
> > >  			ret =3D tegra_i2c_xfer_msg(i2c_dev, &msgs[i],
> > MSG_END_CONTINUE);
> > >  			if (ret)
> > >  				break;
> > > +
> > > +			/* Validate message length before proceeding */
> > > +			if (msgs[i].buf[0] =3D=3D 0 || msgs[i].buf[0] >
> > I2C_SMBUS_BLOCK_MAX)
> >=20
> > I wonder if this can ever happen. Looking at the implementation of the
> > i2c_smbus_{read,write}_i2c_block_data() functions, they already cap the
> > length at I2C_SMBUS_BLOCK_MAX.
> >=20
> > I suppose some user could be explicitly sending off messages with bad
> > lengths, but wouldn't it be better to return an error in that case
> > instead of just aborting silently?
>=20
> For SMBUS read, if I understood it correctly, the check happens after the=
 whole data
> is read. So, I believe it makes sense to abort the operation before an er=
roneous read.
>=20
> I have not verified this violation, but I think the error for I2C_SMBUS_B=
LOCK_MAX will
> also be printed at i2c_smbus_read_i2c_block_data() functions even though =
we return
> silently from the driver.
>=20
> The check for '0' is not printed anywhere, but it is probably, okay? Ther=
e is no data to
> be read anyway. Please let me know your thoughts.

I don't feel strongly either way. I think it's ultimately up to Wolfram
and Andi to decide how they want host drivers to handle this. Na=C3=AFvely I
would say that it's better for the core to check for validity, if
possible, and refuse invalid messages or transfers, so that host drivers
don't have to repeat these checks.

It's also not clear to me how this should be handled if multiple
messages are submitted and one of them ends up being invalid. Multiple
messages in one means they are probably a logically atomic set, so any
error should impact all of them.

However, these are all issues that can be resolved at a later point or
not, and this patch looks correct (worst case it's doing too much
checking), so:

Acked-by: Thierry Reding <treding@nvidia.com>

--mbx6h5ohg5ujq2jw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfi5IMACgkQ3SOs138+
s6HHTw/+PeOIPsaHfi1pl2ATeqelhwaOzvQK3qIYbNmfneM/eChVeb/as0cr+Fb0
nYDYQ8mW+2HagWwz2ROgJcdZ8kKwOm+7QumnmPhKOE+kN3Khaf5wP5LKdLJRqhMD
u5ocGlseFO1c8eynmhtyZgp7LhCViYgJNOkHU5zZixDf65Zh6481/Ssf/YvhHZOc
2yoJeXl3/SLvHAlmRuYzAVPkP7WTfnCBzb/ziFS5LIm/IXqIflcOk59QBYx/5OXJ
w8fWa2Ysuv9Rmue9uYpr9F2pN9LBAgt0/MuIXhUPyqQ/5EY9JZ+N8IKfjV/X8a+5
/OszCOLHtZmgeS2dVUEwT5vKjSp2h7CxBuk0SsmMzVBxWGb1JKlsSBRo+8Vb1Adm
QlhTSZrTVwFFmKapL5xKqigAWiujfu//4eVrQ9IM8LQ4Ow7LjXnFhps5w5C6Id6l
fATsXL3p6b0cpuQVZWUrrfKbxCFOvE1XXRD4V4+ENkOe1ULR4PBkyi2jKxHqhPNo
SG7GWWXmt3q5IY7Nv4fmCYS3lM1QhJyeuNZR2ksK0PkBCUiovNDDMwDVKuhd7OHN
K4wensrK1DXmU/khTsx7Yn/ZDAAGWZt33HP5qePCh1i1s946y6iqXF0wyFY5Nyyd
N2ubAvh8BMAjiA1nScI4a4AHBT8piLZNLhoz9w3knUUCnhLjprM=
=x6ig
-----END PGP SIGNATURE-----

--mbx6h5ohg5ujq2jw--

