Return-Path: <linux-i2c+bounces-8995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5EBA07315
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 11:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6484D188A605
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C072E218EB1;
	Thu,  9 Jan 2025 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWOK3bSE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC5216385;
	Thu,  9 Jan 2025 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418294; cv=none; b=Cq7S0ofZNBhbYFqbCN4ydiRLUWeNOWv99Que0roSpsW5c9Fl6phqxVwU8A/bt5SHUTvwRchpCptynte6l4uaAjOOCbnxiJS5u0nR7JNfA/6waEM6GVR7aJcypBAK8TcZoNCEg0bE8d+ALWkjBsz7/WPm/obenVlw7dG7j/OJCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418294; c=relaxed/simple;
	bh=Yf2UpcvT/ezyfFXqnyO4EHqkm0uGMY9g8jnHu+/OuCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDhtPtpBT2ztuGuEcojev8jt2m/L2wNp5594HUJCK6im+eSGD3KM7Ap9EO7UKkIbqc5rv77SNoEl33RIpSlOnNsPg6fYmFUkdQKlMJS/VetPl2Qv/nmRPONdqASpy0e3XSeR3b84w7cWwVsj/NemkBlyVHUfxeiX4QdjxITvWzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWOK3bSE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283dedso7677485e9.3;
        Thu, 09 Jan 2025 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736418291; x=1737023091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q673bkgQLGNdm1lsfizgrDaBiAHvgHxvgO0n9zxPM0I=;
        b=mWOK3bSEKZMosqbrtVLVpN+9DcbZ8LDc1CmbCgGYAfbfi1EvUu5FPaEtKb85RgBmqU
         s6DWb9vaZduFYRI+3poTUbEwqnNjkDv98EuTRnOW2/uPkwxHTljryslXuvcBZbGAhM4+
         72V87ThPzi2+tgh9BKOTspFolUZyl5+HI5qgw4kgHz9q72WX6HDEhVy60QKRMUez/b0Q
         eL1wdiRZib+mDNlU1fKALjgC/5ozjtnJoj6/ei1CbQrhdYsysVZ/m9XQPsO8ntg36N1v
         ZvsJxWJkR1FG5n+54R+MNBpddsoQji+lwBxmIIeu9mGZ7KaErIg91nF1+l7Z1efK707I
         cC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736418291; x=1737023091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q673bkgQLGNdm1lsfizgrDaBiAHvgHxvgO0n9zxPM0I=;
        b=EckBpR6WKmN0Xs76pd7/QEw3+peJnPooVW/zudpmeTJIrxI6MDTMDUJ458n5U6oDlD
         MjwuKVvtxBzLspp0o6DZOWVOfTmLnf/Z0CvqyqqjBiMgPUppmXklclIxwKDGAEkHayoD
         i2KinMCEB4VYJ7W6r85pYdiIK+cOfc3X9lDN7176maT5UjdJD7fDlPIw7bxf1yfqF1St
         4AbZPTyFL+/fIH3zMqEyvCiEL1oAsR7E31ihzDfrzDb7ASjZiY1Xb2IHoz3zie58edxT
         GXE7oy53PABn/yPD2EwBv/AdFjF/X8VoF+IuCKI3ydrs/Bm3GD3m3tkK/zhHkg+UHlIF
         hKXw==
X-Forwarded-Encrypted: i=1; AJvYcCUIWSz9RkXzFqeVEd/zVZ0bCGqKocXwOsiks7AQRdKj+5LPy+oasOIbJmu2HJQmEb55G7kcNAMlC3zhDlLG@vger.kernel.org, AJvYcCUy5+38vPRIc1XhVvJef7oUfX8LweILtUoewBIISWnMBJvCtHSECeiKPdWmVNmoOJVVQmYwG63v7vby@vger.kernel.org, AJvYcCWH8NCwOaNFninaXclE9pqWuZQpnraSPZJZ31TfJfht3d3JvNH4g3NmXi9NdyidpIQYNutE6KeNUJamad0=@vger.kernel.org, AJvYcCX75kkHIEkKcG4Aa5zntmBebvu0Ll3sYAzJRLtP/v61/7TJ33QIn7bQ27+y8v7Sb5LGa7YaZnvyu8xQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ7kEWZXRESTJ8D/3mCsHdjUxsSOs96+yHxMfwcFCuETkzKhCi
	3gtcS6FkdfYl9+FPM5psJ7JUejbSIU68vJvw8ZcoVBilY8F2D3nL
X-Gm-Gg: ASbGncsJWE3elVpndG4abQy+f5fk/ATvF1pdnCJJfHxjpW2Qzsc4lsRlkOeoEaQ08mH
	/6QVmSqYtZ71z2VBmJANbD3MROSR/R+H7CudTwvNGs+syTrURKA0+0dc7SDPicESFRaOZTHUe9e
	idt5yAuXt/+/a/AdIAdL2komtKncvOzJdx+mRAX875EfkF/otIdOlNAuFd0NvBsBjcBAaznAnxi
	a5e56lp961cHvYE5vvXdc5EBO/aefA1Yw6gtJ8HxsOCd8nKYUF4CKKpEEZxZ2RcIqKkpiAo8qg3
	09S0iKYheryMqCqkUVFRn/O6LP30ny5HYFMejJn5QtU=
X-Google-Smtp-Source: AGHT+IGg/E6FzY0OHcjvbPJ07IqUYTali7IXYaPNtYzJyxw+EgH55NcxJviyK9dTNhyBbEuYme3KKg==
X-Received: by 2002:a05:600c:5117:b0:434:fe62:28c1 with SMTP id 5b1f17b1804b1-436e26cfe5bmr49798415e9.18.1736418290742;
        Thu, 09 Jan 2025 02:24:50 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc05a1sm50789975e9.15.2025.01.09.02.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:24:49 -0800 (PST)
Date: Thu, 9 Jan 2025 11:24:47 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com, 
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] i2c: tegra: Add Tegra264 support
Message-ID: <37faddynpvhj7nfp5si26tajnuhb4cuzkf5gveqsl2ewuazcut@tpcp4b67gtae>
References: <20250108110620.86900-1-kkartik@nvidia.com>
 <20250108110620.86900-4-kkartik@nvidia.com>
 <fc239699-d3ea-441a-ab48-0191fcda09d2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lycwta56gl3k7quj"
Content-Disposition: inline
In-Reply-To: <fc239699-d3ea-441a-ab48-0191fcda09d2@quicinc.com>


--lycwta56gl3k7quj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] i2c: tegra: Add Tegra264 support
MIME-Version: 1.0

On Thu, Jan 09, 2025 at 10:13:48AM +0530, Mukesh Kumar Savaliya wrote:
> Hi Kartik,
>=20
> On 1/8/2025 4:36 PM, Kartik Rajput wrote:
> > From: Akhil R <akhilrajeev@nvidia.com>
> >=20
> > Add support for Tegra264 SoC which supports 17 generic I2C controllers,
> > two of which are in the AON (always-on) partition of the SoC. Tegra264
> > I2C supports all the features supported by Tegra194 I2C controllers.
> >=20
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> > ---
> >   drivers/i2c/busses/i2c-tegra.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index 7b97c6d347ee..cf05937cb826 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -1646,7 +1646,35 @@ static const struct tegra_i2c_hw_feature tegra19=
4_i2c_hw =3D {
> >   	.has_hs_mode_support =3D true,
> >   };
> > +static const struct tegra_i2c_hw_feature tegra264_i2c_hw =3D {
> I could see 7 controllers have been already added. And this may keep
> growing.

I'm not sure I understand the concern here. This is IP that's been in
use ever since the first Tegra chip was released about 15 years ago.
It's quite normal that the list of supported hardware will grow over
time. At the same time there will be occasional improvements of the
hardware that require certain parameterization.

> Can we make either default set which is common for most of and change only
> sepcific fields ?

It's difficult to do. These are const structures on purpose so that they
can go into .rodata, so as such there's no good way to reuse defaults. I
suppose we could do something like add preprocessor defines, but I doubt
that they would make things any better (these are quite fine-grained, so
macros would likely only cover one or two fields at a time).

> Second option - read these fields from DT and overwrite default if it's
> mentioned in DTSI.

Some information is already parsed from DT. What's in this structure can
all be derived from the compatible string, hence why it's associated
with the compatible string via the of_device_id table. Moreover, we
cannot move any of this information out into device tree (at least not
for existing chips) because it would break DT ABI.

> Please review and see if this makes sense. what others say ?

I'm always open to suggestions, but I also don't see this as very
problematic. It's data that is cleanly structured out, not difficult to
maintain and doesn't take up a huge amount of space.

Thierry

--lycwta56gl3k7quj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd/o+wACgkQ3SOs138+
s6EiZg//TjFCfvdV/wnnLEQNgnZMyXdpVFUD7R9Xknm+qw8USfEEFIMUd3/zmDgD
7FZdUvFa19nh/DBULbEV/sDp2zn34ctM64nEvUqT0k22373An5WbQGHkkNlrtkwu
EbWQ+ODDvhT9EvDTnW4kybO6R9f77BKwiHA4HdFlWRZS1NP9QEcOFnUSfQva9r0f
R885zvIME2OgwtzsTEXT/+ECTlWOc6C5iksfhxytrt6dL3VLuAgTStz30X99QeCI
VElxBX5nsosFpANYIyUv4fuNgeg+5EtBEmTjTlIJJMsM9NesaQ08lBKVmkYhB4xX
F2RJqcoijkWUUofj9CAHHx/uGBdn+zDFq7yEVpruI57QB5DL6oXm9zMDjM6zbXbM
RXSiEWgXu63yqeuU9MRTWR9Sm9I7BwL5H2Eop2Z2Dnq/mY77/fIVLW2tOFnJ8uMV
H6IcBAJjeK0hgzORNEq0qmZy9FjVLKFrtftCvB1mTRuRUcRH18LzYrXoLABo3TUh
9pDyRvf/EjtR9WzlTmNaay2GomesgNFTvNFm9/jWa1hREU4JGM+qvQc/nTioWjAs
uQAvE7fNzTe2jbwHL/2foZ9pwinA4aSBScBbSOdycFBMG3ZxKUFmoQAcVtanZ4hx
qIlhiqIVA/1kci4E9FJVsKELtmaoh3zlEgcY6J4G61H9pFZi8Is=
=8k3I
-----END PGP SIGNATURE-----

--lycwta56gl3k7quj--

