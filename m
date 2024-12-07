Return-Path: <linux-i2c+bounces-8361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBFD9E7F53
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 10:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D300165C16
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 09:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E2313A3F3;
	Sat,  7 Dec 2024 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lyaRSXZh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604A583CC7
	for <linux-i2c@vger.kernel.org>; Sat,  7 Dec 2024 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733562844; cv=none; b=buqZB/rsyISFKZxp0Qw3xRaqnp8hPBsIiczbiZ5OWgus6nEURuIy/zvktoAR80Gy5t7pezQ0vqvZq5Df42infuZhSrohh6Lvnz9cNW+gwAoTDFC7+jNynTu5kcQL5Oi4k07w3OL7s5YyFmAQvA08p5d9kdi87zQ5B7dklTArVwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733562844; c=relaxed/simple;
	bh=GaP2m7+gewbgxasItmgoa6OskM9hEMHHwgOMkxTMqKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sR7HBRcon9ES1Xtd7oE/zNEMK6KDi5nxpOARGTJBaVUl4mANVAUF7mjcwcoQ5V0vORNH1nAuGbgE3Ci4LZ72PrIjhVMsGPn0YtAVzfDzPoH8+CRLZj9nweEgz1MSO2lds9kJl6xwXeW0lr1lAC95JvaVRTYRjlHPcKDthgdOyyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lyaRSXZh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa5500f7a75so380124466b.0
        for <linux-i2c@vger.kernel.org>; Sat, 07 Dec 2024 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733562841; x=1734167641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7aWLngRiqO8WHMdwigYnffvFiIotz7popveEtuBc/M=;
        b=lyaRSXZhL7pLljhELe77wnKhEiYe0fZYqQMK+8CXSiht6VHsubyZrgq2CfLklWvX/C
         ezyoq0DdPwb/Dql80YQhTr4/nbFuklbuTHAWmGaIFCd/nB+QpFpplYHMr+T/dySel0Dk
         +mj+EHJaW94pQR6FFG7M3YXzDiv4pbPH/OqHbfznSk52IgmTE+TxBACDfGIz+MmeVoEv
         TM5s2mYC+ZJKcxBFkxCVrMrk4xx/B44oFSHNpl8h81z/VlaD1jEw++pzTbI1WCpzmyrd
         n5x+H8AbUWGH8LHHCDnfsLt6/xW2J1icVvfD5mQIOUVKJejJXg0AmVnNOqB7PZiQtwv8
         i2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733562841; x=1734167641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7aWLngRiqO8WHMdwigYnffvFiIotz7popveEtuBc/M=;
        b=G3rbKH/RdvTXLRsj4rJehFVxtzNGq7UOWKi9fuQ/DU3xoAjj/bQ3Gg9DOL5nizuE20
         r2k+oafLKPvZpjzBSdZgnnm/+y2je4yxQi+86kBBpFLrhg904RfLKw+SA+WQSlYKnq/U
         XeFQ1CygtzfoXFppwex+3/0/KZMB4UyAgNEhJMu2OLJOdf+01wSn75dJGEh+Z/ZHT+sV
         GW9UgRjdXFDALBusVE+VnvFP8YilibNxUfF3IGgwA2Z8WPy8ZCYCXsuC/K0/SI6/hIDQ
         ws5EA88SYtuxi0vUYvlpJDjPBdWMrLcuWHvicHSOqO/WkR6XvYBSnCKoE5okhSmCYr9w
         0CwA==
X-Forwarded-Encrypted: i=1; AJvYcCV96bnHApXxVezlufdHGnyvprSC1+qVTOzbMYHR+MxFFnuxiocvdNwf4oWPT7Vn+hIu8hCQg4BuW7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JbXF/y+ibsbl4tCMmfNzC0v7/lRTLKWdXi0FYSJ+tY7h4pl4
	vrL3KpcsCl6DaMEm7WYtXAHBD2naoo4NDNGHunl2WXRednXiksCjF02NIN8vt1s=
X-Gm-Gg: ASbGncuhGwO1ZoeTucsGpvV20D9Jaa14hmJ82aDd/Df4sIrTYjYRng6lyCiF8wPt65H
	ktMAveZXjqSrYjFe+kSScGg/68FAOEKh+x1/aKn3EWW4paDkjUgHJk0i8H2TZzI6Fa26y7ypmzn
	0fVdPDElW+EQilh8gPYoGQvHwP+TVmZd2ZM+FzpLoA4uFu4FB615Jro2EdDAbrfhfJMz5XzCSYO
	wYWvml/xQRG/XwP6kltcW2c4Y07Xp4i/3gIQAROG/bTFTO8NpLoSWM=
X-Google-Smtp-Source: AGHT+IFlgDt8bGuN9Jc1LWQbaHF0RoApQkBJ/4mrDE3rNU3GNy9s89zGkr2LAMOOdFc5PerI7iCBCw==
X-Received: by 2002:a17:906:32d0:b0:aa6:1c4b:9c5b with SMTP id a640c23a62f3a-aa639fa5cfamr357253866b.7.1733562840571;
        Sat, 07 Dec 2024 01:14:00 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:e614:87a3:d4c7:31de])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4f571sm355646466b.18.2024.12.07.01.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 01:13:59 -0800 (PST)
Date: Sat, 7 Dec 2024 10:13:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	George Joseph <george.joseph@fairview5.com>, Juerg Haefliger <juergh@proton.me>, 
	Riku Voipio <riku.voipio@iki.fi>, Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>, 
	Zev Weiss <zev@bewilderbeest.net>, Eric Tremblay <etremblay@distech-controls.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Grant Peltier <grantpeltier93@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Peter Yin <peteryin.openbmc@gmail.com>, Potin Lai <potin.lai.pt@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Konstantin Aladyshev <aladyshev22@gmail.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, Eddie James <eajames@linux.ibm.com>, 
	Lakshmi Yadlapati <lakshmiy@us.ibm.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] hwmon: Initialize i2c_device_id structures by name
Message-ID: <3qfvfqjp53yhfaf327rqyxzrrxrataawubetwcipv5dmrplsez@pe2ressulfxp>
References: <20241205152833.1788679-2-u.kleine-koenig@baylibre.com>
 <89b8d605-c5ac-490f-977d-76315d6d5f46@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ea5rlukmxm7r6wgz"
Content-Disposition: inline
In-Reply-To: <89b8d605-c5ac-490f-977d-76315d6d5f46@roeck-us.net>


--ea5rlukmxm7r6wgz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] hwmon: Initialize i2c_device_id structures by name
MIME-Version: 1.0

Hello Guenter,

[dropped Jose Ramon San Buenaventura from Cc: who's address bounced]

On Thu, Dec 05, 2024 at 08:27:15AM -0800, Guenter Roeck wrote:
> On Thu, Dec 05, 2024 at 04:28:33PM +0100, Uwe Kleine-K=F6nig wrote:
> > I intend to change the definition of struct i2c_device_id to look as
> > follows:
> >=20
> >         struct i2c_device_id {
> >                char name[I2C_NAME_SIZE];
> >                /* Data private to the driver */
> >                union {
> >                        kernel_ulong_t driver_data;
> >                        const void *driver_data_ptr;
> >                };
> >         };
> >=20
> > That the initializers for these structures also work with this new
> > definition, they must use named members.
> >=20
> > The motivation for that change is to be able to drop many casts from
> > pointer to kernel_ulong_t. So once the definition is updated,
> > initializers that today use:
> >=20
> > 	{"adp4000", (kernel_ulong_t)&pmbus_info_one},
> >=20
> > can be changed to
> >=20
> >         { .name =3D "adp4000", .driver_data_ptr =3D &pmbus_info_one },
> >=20
>=20
> How about introducing a macro for that instead, similar to I3C_DEVICE() ?

OK, for now we'd have then:

	#define I2C_DEVICE_ID_PTR(_name, _driver_data_ptr)	\
		{ .name =3D (_name), .driver_data =3D (kernel_ulong_t)_driver_data_ptr }

	#define I2C_DEVICE_ID_ULONG(_name, _driver_data)	\
		{ .name =3D (_name), .driver_data =3D _driver_data }

plus maybe:

	#define I2C_DEVICE_ID(_name)	\
		{ .name =3D (_name) }

for the drivers that don't need driver data?

And usage would look as follows:

	static const struct i2c_device_id pmbus_id[] =3D {
		I2C_DEVICE_ID_PTR("adp4000", &pmbus_info_one),
		...
		{ }
	};

or for the ulong case:

	static const struct i2c_device_id ads7828_device_ids[] =3D {
		I2C_DEVICE_ID_ULONG("ads7828", ads7828),
		I2C_DEVICE_ID_ULONG("ads7830", ads7830),
		{ }
	};

When all drivers are converted accordingly, we could change the
definition of i2c_device_id in a commit that only touches i2c core
things to introduce the stronger type checking.

One additional small but nice thing about that is that it could be
applied to the other *_device_ids, too and then the inconsistencies
between those (e.g. for dmi_system_id .driver_data is a void * and for
mei_cl_device_id the kernel_ulong_t member is called driver_info) could
be addressed without having to touch all drivers again.

I would be open for that. Wolfram?

Best regards
Uwe

--ea5rlukmxm7r6wgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdUEdMACgkQj4D7WH0S
/k6SHQf/YA3pwdSIn8tMdHpMCEagpGqIxr243cm/0kHyBiGBIJ80U2CA+h9W9CeJ
wKE6/3oxKOT6da7tkGX6iJguCeuljZoxU5+ZWhuBIWHkGmIVk/MpKW1TS3pk0RnQ
awcaIZhZ2aWgw/nC660tgMYVK8Rq4O0GzUtuEEByqf/LEzDGuvLy7NAmEpnKWBSy
m8u5KbSD8fFvDn1bwEY0v4AJycgUPWxm6wlYL5JXGlytkO7c0aUqwvm2vIIxttEt
lIBztLeoU0oQtaD9G51VnajMCMfa5eWbKy0Z6sB2YAMtQqitzcaAqlB7h5EPkryQ
+nJDsUYOf9SHW0fa/ssT0nAO+EHglg==
=rQOX
-----END PGP SIGNATURE-----

--ea5rlukmxm7r6wgz--

