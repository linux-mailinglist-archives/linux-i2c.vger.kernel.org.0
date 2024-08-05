Return-Path: <linux-i2c+bounces-5154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7539483B3
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 22:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A667B222AF
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 20:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A68214A092;
	Mon,  5 Aug 2024 20:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO7okQHx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992958469;
	Mon,  5 Aug 2024 20:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722890930; cv=none; b=rVlUheyGX3vbBlL9jcJdbDYq1OOBthsRRVOX+pLEZ1zT89nyWWoyq6nlTmLUnPwqMi+Lvw/zD3pGytq+ICbzdLvHWkXzv0a+L65bmvIYh/YODNaeaM/MDoHw0akFEj1rM299brDd/3c14GZJhzkO4pfzLj+T4g3KbbgEudbXTFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722890930; c=relaxed/simple;
	bh=ZoLB8QIZQcDr8iVlGX10A2ANxy/Nd+X7qP67YGJ4fcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYiDX0/R0Zi+YtNu1GuD8Rx9a5KlzKwrJLCXmU+LoZu7TyIquEqtF/C6qZ2/PIBoXyjlpK5trR6GrlKAtaRjK6zRiWEZA4qNfD4IAnmuvK5xaCV7abeblUUhiGu700Bsb2Rh15VQcLqI0gLsnSxNCOmIzJyAnErlVM9lbKKmLmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO7okQHx; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef7fef3ccfso125408051fa.3;
        Mon, 05 Aug 2024 13:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722890927; x=1723495727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6cxroCX7AEneNYQKvPWCaDGXW+uX4gppCtsJ+QiTsE=;
        b=cO7okQHxClbtXAKDUNHMERg40V55Wzwdvh2qk7atE7T8i+X9NK2cND/yTEy5kUYVDT
         Pugo4QwXrB0zceCCdDAKqJOZ/08zm/jPcylxkmkd0HJAqJoWotCqEHwv29R3TZ7g6+aq
         tIThONvpJGyuwDNf6/fdn0jHNFc2LGpwKkzBkie7Q7clGBOFZyv7TCWmIynAF2cP6xO2
         oXivQhkQtjBbnTCyI/Melzv0bK/Pt/2FzU3nVIs95lHpX8nccWJr20resDYK1BAVSyrP
         xLoMkqKUTy27UmConZjJY40qi2iae+qeX63bLS+InWJ5W25nkkRkReqkRTqky7T2TTqc
         qqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722890927; x=1723495727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6cxroCX7AEneNYQKvPWCaDGXW+uX4gppCtsJ+QiTsE=;
        b=mNj+0Up/5lOaQzvLmKK8SS4m81NFF+zOCOIyjCUQj7tGOFl7TtvgW2uXYJWgtdytYA
         XKLvO44bPd9v8P2TJ1kbTJPpRG7wvHQr6eM1/i/2L3HU2KXIn5dSry0JamHeAyzqZVkS
         3k/INVSYz5bioxyiHpOhmlg7u7zt89UNXM/N4DHB/2tGqSA0BpiodnuBKnf4fmZL9hrd
         rYpXV+J6ePPZ5rRhQ/iLSTfVptW8OCixq9BpnXs7RYjclIfrNlJpSFgxw1OqPOCwjPV7
         4MrxZe+qX6jzJIPkRnFMQLyrY4klPAWlir2Qo3W2dNzU9WAjmXf0Fmp3I4z4lMxAYc+6
         gwkw==
X-Forwarded-Encrypted: i=1; AJvYcCWop0MfYXBJsRBCjTirGpnnsYPItBvJE4jx+KBfxvV0miquJEL6gjdxgc3e/Tzl5SOWyqsq/rd4+etKZ8ce65t7S7NIrgnw9GADwbyJ8RjPnN7CXQDROcKtiJ40yA2StUZ+hwWh8lU3ObmMmmovTg==
X-Gm-Message-State: AOJu0Yxab+Y1545aPVsbLaxOp+kQdLowr6NTUV/aq9Mjfp6dDMoXrUNW
	fckJX3G21hkTNb5EOpF+v8Io3gVpb4qqxurEvhOGvroEjD66ClRA4kToJtgdHW+heK9gLarQVN7
	yoH1TPwJqURVK8HLf1Ul8Uc6QbEI=
X-Google-Smtp-Source: AGHT+IF5Yq2QJG+t80u6BzI+ewBgxQhh+EAs/7/2maehwH4Xy4ENMeHZTNLXcLtNEvT83SKvWRCzf18jwplYWLXXJaM=
X-Received: by 2002:a2e:3c18:0:b0:2ee:8453:5164 with SMTP id
 38308e7fff4ca-2f15a9f899dmr81203871fa.0.1722890926158; Mon, 05 Aug 2024
 13:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805133708.160737-1-hdegoede@redhat.com> <20240805133708.160737-5-hdegoede@redhat.com>
In-Reply-To: <20240805133708.160737-5-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Aug 2024 22:48:08 +0200
Message-ID: <CAHp75VeCVCqmG0Px8_EyztS6ZeBbhU0Nbtru5mkQxKNeR6pynQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, 
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>, 
	Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 3:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Various Dell laptops have an lis3lv02d freefall/accelerometer sensor.
> The lis3lv02d chip has an interrupt line as well as an I2C connection to
> the system's main SMBus.
>
> The lis3lv02d is described in the ACPI tables by an SMO88xx ACPI device,
> but the SMO88xx ACPI fwnodes are incomplete and only list an IRQ resource=
.
>
> So far this has been worked around with some SMO88xx specific quirk code
> in the generic i2c-i801 driver, but it is not necessary to handle the Del=
l
> specific instantiation of i2c_client-s for SMO88xx ACPI devices there.
>
> The kernel already instantiates platform_device-s for these with an
> acpi:SMO88xx modalias. The drivers/platform/x86/dell/dell-smo8800.c
> driver binds to this platform device but this only deals with
> the interrupt resource. Add a drivers/platform/x86/dell/dell-lis3lv02d.c
> which will matches on the same acpi:SMO88xx modaliases and move
> the i2c_client instantiation from the generic i2c-i801 driver there.
>
> Moving the i2c_client instantiation has the following advantages:
>
> 1. This moves the SMO88xx ACPI device quirk handling away from the generi=
c
> i2c-i801 module which is loaded on all Intel x86 machines to a module
> which will only be loaded when there is an ACPI SMO88xx device.
>
> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) tab=
le
> between the i2c-i801 and dell-smo8800 drivers.
>
> 3. This allows extending the quirk handling by adding new code and relate=
d
> module parameters to the dell-lis3lv02d driver, without needing to modify
> the i2c-i801 code.

...

> +static void instantiate_i2c_client(struct work_struct *work)
> +{
> +       struct i2c_board_info info =3D { };
> +       struct i2c_adapter *adap =3D NULL;
> +
> +       if (i2c_dev)
> +               return;
> +
> +       bus_for_each_dev(&i2c_bus_type, NULL, &adap, find_i801);
> +       if (!adap)
> +               return;

May i2c_for_each_dev() be used here?

> +       info.addr =3D i2c_addr;
> +       strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> +
> +       i2c_dev =3D i2c_new_client_device(adap, &info);
> +       if (IS_ERR(i2c_dev)) {
> +               pr_err("error %ld registering i2c_client\n", PTR_ERR(i2c_=
dev));
> +               i2c_dev =3D NULL;
> +       } else {
> +               pr_debug("registered lis3lv02d on address 0x%02x\n", info=
.addr);
> +       }
> +
> +       i2c_put_adapter(adap);
> +}

...

> +static int __init match_acpi_device_ids(struct device *dev, const void *=
data)
> +{
> +       const struct acpi_device_id *ids =3D data;

Wondering if this is needed. Can the compiler implicitly cast const
void * to the const something * ?

> +       return acpi_match_device(ids, dev) ? 1 : 0;
> +}

> +        */
> +       dev =3D bus_find_device(&platform_bus_type, NULL, smo8800_ids, ma=
tch_acpi_device_ids);
> +       if (!dev) {
> +               pr_debug("No SMO88xx platform-device found\n");
> +               return 0;
> +       }
> +       put_device(dev);
> +
> +       lis3lv02d_dmi_id =3D dmi_first_match(lis3lv02d_devices);
> +       if (!lis3lv02d_dmi_id) {
> +               pr_warn("accelerometer is present on SMBus but its addres=
s is unknown, skipping registration\n");
> +               return 0;
> +       }
> +
> +       i2c_addr =3D (long)lis3lv02d_dmi_id->driver_data;
> +
> +       /*
> +        * Register i2c-bus notifier + queue initial scan for lis3lv02d
> +        * i2c_client instantiation.
> +        */
> +       err =3D bus_register_notifier(&i2c_bus_type, &i2c_nb);
> +       if (err)
> +               return err;
> +
> +       notifier_registered =3D true;
> +
> +       queue_work(system_long_wq, &i2c_work);
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

