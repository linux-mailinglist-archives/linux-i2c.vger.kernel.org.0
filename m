Return-Path: <linux-i2c+bounces-7933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBDD9C4B48
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 01:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74C30B272D1
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 00:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6C8201030;
	Tue, 12 Nov 2024 00:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRyOWKnN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EB720102B;
	Tue, 12 Nov 2024 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731372710; cv=none; b=pmYlyHn6pQNifkp6B7/VdzSl9ZJg5VyXuTQhbtzXX+Hq9kxYdyQ2aWx0F0IOk78/JLsDlVWsVEJES7xGw+SIOmiJs1RjUYptKflaj7ixY3eSSXtJxOvRY6DMDuS0mTElZlS/XPeCzb2YZGeyXSsgqRDwX8ZDp2o4NOnO1RYR+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731372710; c=relaxed/simple;
	bh=9tfPNV02GCkITZAOAN9kCGxQqCXY5PZBvXb7afmjqQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epdI+Udy+DP8JYfB936+eRcSlo1B3rxjs5cvXljjD5M1X+L2spLxMWSx1HWMSONZBi6u7vNVGsccWbis2IrJlfknWJUm7RdXmoSWqhwRZRWmuVm47qBRR06fBX0hJFmj7dcBENrnVaxVbxl9c5HLkUhRt8lkJ/KbciJDDj7/3jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRyOWKnN; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so4072906b3a.2;
        Mon, 11 Nov 2024 16:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731372708; x=1731977508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3fL2pW4OdzbftIG60Xwe6fk+2YDD50T0x8PSYiwmv0M=;
        b=RRyOWKnNOF9ucAbWMffLxI+b3H/z02b9mvo/7X8bJWLASDpi17BWXhE4pEUL4M+Uj+
         IaJFCwOd1IFFwnOZVT8Xsas9MoavkFgTgGurODqnZrehRPU3Weo99eS5SkS/csF0uP7U
         6mETWSYMsbDstwZa2IOibqp5pPX0oD0KCl8T/spRcvqRmSORVNaMwvTDmNIaI1Cq+j8L
         kr2DEnH0IQZGDDDtx5aob1zwjU0NI9g9wKBfRXL0kGEI5q9AglETCbvfMaMXNAxJZ2FR
         gtsFNJycQIkDFAKtiHAkXmLTr0XFTOAXJ7XnJYWxDKfo96/Ej9PRu0eDMDhVeExInBFn
         BB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731372708; x=1731977508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fL2pW4OdzbftIG60Xwe6fk+2YDD50T0x8PSYiwmv0M=;
        b=r7q0fEx/gVy1uIQY4iZfZ+BxDw/+/RDSHZXNUvrQ/92lEOMgvoXcAeQtLVW/JL51iG
         A6ZfjDeNSV3i0tbHxKhJYmkDtebd1IiQWr/TqmbVQICQyCyId/YVI4b5kgNvWkAPWSQM
         X+jLPj0ly8VBOuvbi/CyJj5S/AaafTp4caOTsIt5jA1Rx2YcX2ftERkxd2b+Km1qoSh4
         2TJItTIYPumPSE4QhXFSvqKc2r0NyKsvCEfN/qfulzi8+CtjQjBr5gNhdQ6qpGKC/KM6
         //+K/CxltzJ7PZRum4QiGLPUj4ch3U9IarH/gbFSj2G2cDPQOuZWMH8Px3LDryuucM5X
         gXfg==
X-Forwarded-Encrypted: i=1; AJvYcCUKMqO5h73dlDCx/WttGaOZOk5zvCe7Rxc3pvWsLJqYty5Pp8djgNUhaNi/sfOBWRf4zqACPsN2EIuhsorS@vger.kernel.org, AJvYcCUTUf8p8PJua1Jq2g4OlOvPsUi88fT83tFwI2TlCuoq7O9lXlE7rtm6uUqFWbF0AsRPsBjaNUITPkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ivZ2RrpanPb+Xy+zSY1XUgZ/aEXbVqVN/ZuU+pbXTrqf4Hk+
	F7MX5PIlC0Hg0M3g5EAhsMq4VXO87qv8Yi+VC2VH2fanj4dW2qmX6HfMJg==
X-Google-Smtp-Source: AGHT+IEHZ9vBflMx6lLV5ldmHmhWu2yFR7l6cgJMNdoDYvtIQPYQJO4WD2MuFw8Y2xI3HxND8hVKsg==
X-Received: by 2002:a05:6a00:148f:b0:71e:6e4a:507a with SMTP id d2e1a72fcca58-724132595d2mr19646669b3a.3.1731372708255;
        Mon, 11 Nov 2024 16:51:48 -0800 (PST)
Received: from archie.me ([103.124.138.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a571ccsm9710542b3a.196.2024.11.11.16.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 16:51:47 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C5E5B4209E61; Tue, 12 Nov 2024 07:51:43 +0700 (WIB)
Date: Tue, 12 Nov 2024 07:51:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>,
	andriy.shevchenko@linux.intel.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: i2c: piix4: Add ACPI section
Message-ID: <ZzKmn2K3Uzp30i8Q@archie.me>
References: <ZzH-KeSavsPkldLU@smile.fi.intel.com>
 <20241111140231.15198-1-aladyshev22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qhBYF6HTZwxQb3Tk"
Content-Disposition: inline
In-Reply-To: <20241111140231.15198-1-aladyshev22@gmail.com>


--qhBYF6HTZwxQb3Tk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 05:02:31PM +0300, Konstantin Aladyshev wrote:
> diff --git a/Documentation/i2c/busses/i2c-piix4.rst b/Documentation/i2c/b=
usses/i2c-piix4.rst
> index 07fe6f6f4b18..90447dff7419 100644
> --- a/Documentation/i2c/busses/i2c-piix4.rst
> +++ b/Documentation/i2c/busses/i2c-piix4.rst
> @@ -109,3 +109,65 @@ which can easily get corrupted due to a state machin=
e bug. These are mostly
>  Thinkpad laptops, but desktop systems may also be affected. We have no l=
ist
>  of all affected systems, so the only safe solution was to prevent access=
 to
>  the SMBus on all IBM systems (detected using DMI data.)
> +
> +
> +Description in the ACPI code
> +----------------------------
> +
> +Device driver for the PIIX4 chip creates a separate I2C bus for each of =
its ports::
> +
> +    $ i2cdetect -l
> +    ...
> +    i2c-7   unknown         SMBus PIIX4 adapter port 0 at 0b00      N/A
> +    i2c-8   unknown         SMBus PIIX4 adapter port 2 at 0b00      N/A
> +    i2c-9   unknown         SMBus PIIX4 adapter port 1 at 0b20      N/A
> +    ...
> +
> +Therefore if you want to access one of these busses in the ACPI code, po=
rt subdevices
> +are needed to be declared inside the PIIX device::
> +
> +    Scope (\_SB_.PCI0.SMBS)
> +    {
> +        Name (_ADR, 0x00140000)
> +
> +        Device (SMB0) {
> +            Name (_ADR, 0)
> +        }
> +        Device (SMB1) {
> +            Name (_ADR, 1)
> +        }
> +        Device (SMB2) {
> +            Name (_ADR, 2)
> +        }
> +    }
> +
> +If it is not the case for your UEFI firmware and you don't have access t=
o the source
> +code, you can use ACPI SSDT Overlays to provide the missing parts. Just =
keep in mind
> +that in this case you would need to load your extra SSDT table before th=
e piix4 driver
> +start, i.e. you should provide SSDT via initrd or EFI variable methods a=
nd not via
> +configfs.
> +
> +As an example of usage here is the ACPI snippet code that would assign j=
c42 driver
> +to the 0x1C device on the I2C bus created by the PIIX port 0::
> +
> +    Device (JC42) {
> +        Name (_HID, "PRP0001")
> +        Name (_DDN, "JC42 Temperature sensor")
> +        Name (_CRS, ResourceTemplate () {
> +            I2cSerialBusV2 (
> +                0x001c,
> +                ControllerInitiated,
> +                100000,
> +                AddressingMode7Bit,
> +                "\\_SB.PCI0.SMBS.SMB0",
> +                0
> +            )
> +        })
> +
> +        Name (_DSD, Package () {
> +            ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> +            Package () {
> +                Package () { "compatible", Package() { "jedec,jc-42.4-te=
mp" } },
> +            }
> +        })
> +    }

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--qhBYF6HTZwxQb3Tk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZzKmmwAKCRD2uYlJVVFO
o6lkAQC2YG+wRNNVrbkIL8gpUWUTAZhOEbKw4zsaqGyOfQfhIgD7BXFqBfMr3wu4
6RPBVeocE2oD3/tatDuVdi9fB/4hvAA=
=G+tH
-----END PGP SIGNATURE-----

--qhBYF6HTZwxQb3Tk--

