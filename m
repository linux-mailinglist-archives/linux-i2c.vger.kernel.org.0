Return-Path: <linux-i2c+bounces-3038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8790B8AC561
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 09:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D04028310A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 07:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499D352F9E;
	Mon, 22 Apr 2024 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG1DoltD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598A5524DF;
	Mon, 22 Apr 2024 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713770442; cv=none; b=oY1y3UUXrrlXVNE+ruX80ydLffnaIWk+3wKt5l4NoDXLkL2BzD8ZDdZbN9dkDLecVb70+ymBm5JzdLFcmM+QqDtSwu/yShB3b9Jlyz9qAkUKmz1iU29N8YqSd2xas/QaNQA2I7As2LVVTKNTIf5n9iyD9uSIgXG+y1PiS3Q2n2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713770442; c=relaxed/simple;
	bh=uPlezz2Ez9/dTrBAPaxi+db3VKiWsUtlmOPLdiTex/M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vjo9tTYWeb0lOtVRyMmX/HfwckFhHuZePKlvj2iuPZNWqe4P5JhH69Gm98oR1SHJEOQ0Prp+QqcG4mHxgaCy/qS+jWFjAshwHtmry3ZoA0HJPk7ZoDpNmucovc8w1FKipvU+eibB3yua6BY2JZlYhXfLBVdWUrrFS/JYBsn0MjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG1DoltD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4187c47405aso26780755e9.3;
        Mon, 22 Apr 2024 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713770438; x=1714375238; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6EaonTNElOrU9KYAF9Ym3jHzAyGlcNAFxjBRES5df84=;
        b=RG1DoltDYKDfraGFQZeiHgwvAXH1JpdncXeIRIYeU5KAMfMsinmdpxfpGyxwDNCWkV
         WjH747obLiYSnScUXyhkXzYVX2jDT90U6iNpsSdUJ/DugPQfkF2Z7Oa1mcAA8yPtMokf
         IJSUGFcrUzVWO7oRP0I/HI/UnkegRSPkKRvP7rpbTJd1zpqpoaU9KqMFPwLzX9HRP+CJ
         6IgUzODjYHLCxTmzbWfBMgptLsE1KjefZ0kcqaDO72QRgs1KDV+lHxscb//Y4z+r/ZgL
         uv7hPB20OZkIZPDKHKg7Z/s4vimwLlY69foG6esmpoIM9x47D+5GapQucV4uYoB8TPJc
         oWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713770438; x=1714375238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EaonTNElOrU9KYAF9Ym3jHzAyGlcNAFxjBRES5df84=;
        b=e75iB2kewhTelAI/MdbbYx0msB6otfKan5BIG75dZVK+mEiWBp1gpvG5zjLNA2N+HT
         DUv44WW/tgPzeNsYMQMabgwGEvGOSuBfRKTrWG8AXUvUDVv6dp2oss79igRUrlwQOogY
         mBdPJqTlGsWB2hdb6GVBtzizOon3rityXkecJmzKE8G7NZzlD2MOlBXgts1nQOBnTAW5
         LxPAFi5RB1VjbbPX99R7xmud8d9m0+FameRVUGB5j5Lf8OpD8G3YR4ha1w3nV55uTVlB
         tBKDwMYuwV7U0WlEm+OA21I4ff2cYfJwF9w0T5x6KWkXfXam4VeWe+M7tnLhUeucTKVW
         0nTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLD6JhrWzHpc912TaAs8M1E9LF7iXVZaJz5pkLl+3Btr9jf2pDvzAtKjSOn8V2pFra3UQod//rvQz1prBl51LwNMu/Fddalq3/7jVUz+5rFiBgsPO1eixu6ssEaqaPrUt8vBYrOOGdRFO2YaZ6nu52+IKV8C6XBvNPsEZqefDPbqs5Flgj6g40isG9CRR3HXOnqF+AaQyNjGZazXQDYqhMw0NYu+xPwqRZBOycfjFLp8ZqvtamM0Hd6eHj
X-Gm-Message-State: AOJu0YxCRGdKCNmpbQ5DxYuLGvc4TeH9EFZ0cQ38zGVpM6kwNM4RCLR8
	hOgujuhG6WHUV65Tvis5fh1Z9LsnsmgcSGU0GYOYXKK7uBegqYM1
X-Google-Smtp-Source: AGHT+IG18tDEfuYY3xdQyQpAeuUl4OviaoiabRHeU6w9ApLuluqyg5EqxpUki/BSMPPsSv1FO9Eqow==
X-Received: by 2002:a05:600c:1da3:b0:41a:3407:78f7 with SMTP id p35-20020a05600c1da300b0041a340778f7mr1872160wms.7.1713770438136;
        Mon, 22 Apr 2024 00:20:38 -0700 (PDT)
Received: from ?IPv6:2001:a61:3481:2201:6106:96db:d27b:d2c2? ([2001:a61:3481:2201:6106:96db:d27b:d2c2])
        by smtp.gmail.com with ESMTPSA id m25-20020a05600c3b1900b0041816c3049csm15650842wms.11.2024.04.22.00.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:20:37 -0700 (PDT)
Message-ID: <a00c375a9e96ea28f5d8cb0d0eaeb750ba462b17.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: adm1275: add adm1281 support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Date: Mon, 22 Apr 2024 09:20:37 +0200
In-Reply-To: <20240422025123.29770-3-jose.sanbuenaventura@analog.com>
References: <20240422025123.29770-1-jose.sanbuenaventura@analog.com>
	 <20240422025123.29770-3-jose.sanbuenaventura@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jose,

On Mon, 2024-04-22 at 10:51 +0800, Jose Ramon San Buenaventura wrote:
> Adding support for adm1281 which is similar to adm1275
>=20
> Removed extra case for STATUS_CML in adm1275_read_byte_data function.
>=20

Remove the above line. As nothing to do with supporting the new device. Thi=
s is what
it should be in your v2 changelog :)

> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.c=
om>
> ---
> =C2=A0Documentation/hwmon/adm1275.rst | 14 +++++++++++---
> =C2=A0drivers/hwmon/pmbus/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/hwmon/pmbus/adm1275.c=C2=A0=C2=A0 | 11 +++++++++--
> =C2=A03 files changed, 22 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm127=
5.rst
> index 804590eea..467daf8ce 100644
> --- a/Documentation/hwmon/adm1275.rst
> +++ b/Documentation/hwmon/adm1275.rst
> @@ -43,6 +43,14 @@ Supported chips:
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 Datasheet: www.analog.com/static/imported-files/=
data_sheets/ADM1278.pdf
> =C2=A0
> +=C2=A0 * Analog Devices ADM1281
> +
> +=C2=A0=C2=A0=C2=A0 Prefix: 'adm1281'
> +
> +=C2=A0=C2=A0=C2=A0 Addresses scanned: -
> +
> +=C2=A0=C2=A0=C2=A0 Datasheet:
> https://www.analog.com/media/en/technical-documentation/data-sheets/adm12=
81.pdf
> +
> =C2=A0=C2=A0 * Analog Devices ADM1293/ADM1294
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 Prefix: 'adm1293', 'adm1294'
> @@ -58,10 +66,10 @@ Description
> =C2=A0-----------
> =C2=A0
> =C2=A0This driver supports hardware monitoring for Analog Devices ADM1075=
, ADM1272,
> -ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 Hot-Swap Controller and
> +ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap Contro=
ller and
> =C2=A0Digital Power Monitors.
> =C2=A0
> -ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 are ho=
t-swap
> +ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM12=
94 are
> hot-swap
> =C2=A0controllers that allow a circuit board to be removed from or insert=
ed into
> =C2=A0a live backplane. They also feature current and voltage readback vi=
a an
> =C2=A0integrated 12 bit analog-to-digital converter (ADC), accessed using=
 a
> @@ -144,5 +152,5 @@ temp1_highest		Highest observed temperature.
> =C2=A0temp1_reset_history	Write any value to reset history.
> =C2=A0
> =C2=A0			Temperature attributes are supported on ADM1272 and
> -			ADM1278.
> +			ADM1278, and ADM1281.
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 557ae0c41..9c1d0d7d5 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -51,8 +51,8 @@ config SENSORS_ADM1275
> =C2=A0	tristate "Analog Devices ADM1275 and compatibles"
> =C2=A0	help
> =C2=A0	=C2=A0 If you say yes here you get hardware monitoring support for=
 Analog
> -	=C2=A0 Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293,
> -	=C2=A0 and ADM1294 Hot-Swap Controller and Digital Power Monitors.
> +	=C2=A0 Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281,
> +	=C2=A0 ADM1293, and ADM1294 Hot-Swap Controller and Digital Power Monit=
ors.
> =C2=A0
> =C2=A0	=C2=A0 This driver can also be built as a module. If so, the modul=
e will
> =C2=A0	=C2=A0 be called adm1275.
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.=
c
> index e2c61d6fa..2baeee8be 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -18,7 +18,7 @@
> =C2=A0#include <linux/log2.h>
> =C2=A0#include "pmbus.h"
> =C2=A0
> -enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm12=
94 };
> +enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm12=
93,
> adm1294 };
> =C2=A0
> =C2=A0#define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
> =C2=A0#define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> @@ -101,6 +101,7 @@ struct adm1275_data {
> =C2=A0	bool have_pin_max;
> =C2=A0	bool have_temp_max;
> =C2=A0	bool have_power_sampling;
> +	bool have_status_cml;

don't think we need this...

> =C2=A0	struct pmbus_driver_info info;
> =C2=A0};
> =C2=A0
> @@ -482,6 +483,7 @@ static const struct i2c_device_id adm1275_id[] =3D {
> =C2=A0	{ "adm1275", adm1275 },
> =C2=A0	{ "adm1276", adm1276 },
> =C2=A0	{ "adm1278", adm1278 },
> +	{ "adm1281", adm1281 },
> =C2=A0	{ "adm1293", adm1293 },
> =C2=A0	{ "adm1294", adm1294 },
> =C2=A0	{ }
> @@ -555,7 +557,8 @@ static int adm1275_probe(struct i2c_client *client)
> =C2=A0			=C2=A0=C2=A0 client->name, mid->name);
> =C2=A0
> =C2=A0	if (mid->driver_data =3D=3D adm1272 || mid->driver_data =3D=3D adm=
1278 ||
> -	=C2=A0=C2=A0=C2=A0 mid->driver_data =3D=3D adm1293 || mid->driver_data =
=3D=3D adm1294)
> +	=C2=A0=C2=A0=C2=A0 mid->driver_data =3D=3D adm1281 || mid->driver_data =
=3D=3D adm1293 ||
> +	=C2=A0=C2=A0=C2=A0 mid->driver_data =3D=3D adm1294)
> =C2=A0		config_read_fn =3D i2c_smbus_read_word_data;
> =C2=A0	else
> =C2=A0		config_read_fn =3D i2c_smbus_read_byte_data;
> @@ -703,6 +706,10 @@ static int adm1275_probe(struct i2c_client *client)
> =C2=A0			=C2=A0 PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> =C2=A0		break;
> =C2=A0	case adm1278:
> +	case adm1281:
> +		if (data->id =3D=3D adm1281)
> +			data->have_status_cml =3D true;
> +

and this...

- Nuno S=C3=A1


