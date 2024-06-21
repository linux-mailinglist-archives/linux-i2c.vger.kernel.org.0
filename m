Return-Path: <linux-i2c+bounces-4228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9559129B1
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69B93B2BAEE
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191CA79B96;
	Fri, 21 Jun 2024 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibFHdMZB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C39981AC3;
	Fri, 21 Jun 2024 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983489; cv=none; b=IR5w8VMrHywqzfInuiVc3030vaM9Q+MyWcuBkS7Bo9kXsPxPXqO88IUM659cXMGdYaPLMxY57nkVVd+orhbRWnPeOE8zTzxycAHaDCs/R0U9x0rZAalAraE8ixrRfyBqPV9aC3CqFtEmnxTs1GDtVAoDnzQpkEpfPaskaKEfNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983489; c=relaxed/simple;
	bh=pl74LSfHAjEuEahAE8rC5970tdmVlNJ5h4ZEpEhNC0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzLAVohl02Oi548kCjRJHLhVToWhlV9TSGqCHasqKBDf/INIi74hAeSlNgwHwABivOiigfFBSZP/JdvYpymuCAilaVPZcTSFzof447Fpkg1DEMLaQWygp9p4ij5vo+o3ZR0Y6dKPoZY9krs3hZUvgv6B6RfER6xL8/5MUkSt4h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibFHdMZB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6fd7bee2feso53341266b.1;
        Fri, 21 Jun 2024 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718983487; x=1719588287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix9xhtVwApjWVQeLV+612sT4TrVLx0O3AjVOgGgrg6U=;
        b=ibFHdMZBgkTWVePVwiV8HzjEUqNPjIc0AillbtN3AEtvzeZtgmsxKFcMWDOCT+SN61
         Re/OVuWnr/eyXwXGtJ3zAISsH/MaNTAwNGa26Qh2BEE1acBzaY/QuYhLeWRHudzevxkX
         oFboENzPmHEu+K5n+uT+K//aqAi3fUCICkK868/N5glgJzqpsVP6oi3j3cKHHTl2Uocm
         aqkTBGG0LHHpmiFwnKNXpYV+2n8Y+T3zup8ll+/OlYDNNmrY2c/qI/p+n1mxXJpCNhUd
         N/0NfU7kCLV7vTsTsj+BxyHpKnNd0b7pAUDu+YhqarjJJZsgQbPizstQG4y58ElAy0Fg
         LQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718983487; x=1719588287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix9xhtVwApjWVQeLV+612sT4TrVLx0O3AjVOgGgrg6U=;
        b=bZuRka2qzdvZwLDk3rmmtqyOJlhVzGPWTO8Iez9nANXVVFbaYVPXWwFja/1mozhpJ6
         yFRudnSw5KPJJPos5iCZLz/+C5/8zxa5Pxga/n5aQLfwe/u5VeoWN4ztk91ACSi3O5kF
         w5VJKWElLWw7PLR08ys+YnUXbpBx22QWdWKr9oVFZA4aEt/apFU5iHwTmVgyfCDAdxxw
         MXYLnUeJufpykXGVMASpenxPA7uytA+Yz1YdI+Qh7CNQ7jH/FmWtVQmLX/ydvOjPTcoo
         mEPcX+psnrRqTD6MLiI4glXVZKv5WGuoOGwGeJGt/ikiinsl78+CqLrzmtO6y4mFl3Ee
         Avdg==
X-Forwarded-Encrypted: i=1; AJvYcCX5tWpsNZP43qbO62mxPR8iz9TmB+8oELl8RKPvHRo6gMF1j2dP2McxoPB80TG65u4/3o8apisTLTWA66bFO+YTNsAeco2vywuA7NpIbxb/DJZiGp5wz8O/BFPeebOGSnU0ZwwurLySZu7iClMqnQ==
X-Gm-Message-State: AOJu0Yzku6u5A4vf/HQtdDeHeRdTBYXDSU86oUKA084+BADuwWsFJgHr
	Gh4geoeip7BjruKI1FdOCXhPCpCL4knjFoGHLMcs8WBShu/U+XS9FOCAQ7QEhiWggyxNFQY+6z2
	GMeHvwqYDPCqPsvfAge/5KfRBBpsbRG6p
X-Google-Smtp-Source: AGHT+IHZCFXzvVN5NzuTkg9fXuxNe8FkKbHtwjLzsdsTnGetNhmoRISKeHF/2ujchmBHHebYLBMhG+g1YncO68LYxBo=
X-Received: by 2002:a17:907:d406:b0:a69:67e3:57f6 with SMTP id
 a640c23a62f3a-a6fab605f2emr652830166b.5.1718983486691; Fri, 21 Jun 2024
 08:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-4-hdegoede@redhat.com>
In-Reply-To: <20240621122503.10034-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Jun 2024 17:24:10 +0200
Message-ID: <CAHp75VewivTXEfzdH=cE-HUtDq9RdpzVkBsUqQPTTksF9fJDDg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
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

On Fri, Jun 21, 2024 at 2:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> It is not necessary to handle the Dell specific instantiation of
> i2c_client-s for SMO88xx ACPI devices without an ACPI I2cResource
> inside the generic i801 I2C adapter driver.
>
> The kernel already instantiates platform_device-s for these ACPI devices
> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> platform drivers.
>
> Move the i2c_client instantiation from the generic i2c-i801 driver to
> the SMO88xx specific dell-smo8800 driver.
>
> Moving the i2c_client instantiation here has the following advantages:
>
> 1. This moves the SMO88xx ACPI device quirk handling away from the generi=
c
> i2c-i801 module which is loaded on all Intel x86 machines to the SMO88xx
> specific dell-smo8800 module where it belongs.
>
> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) tab=
le
> between the i2c-i801 and dell-smo8800 drivers.
>
> 3. This allows extending the quirk handling by adding new code and relate=
d
> module parameters to the dell-smo8800 driver, without needing to modify
> the i2c-i801 code.

...


> +static int smo8800_find_i801(struct device *dev, void *data)
> +{
> +       struct i2c_adapter *adap, **adap_ret =3D data;
> +
> +       adap =3D i2c_verify_adapter(dev);
> +       if (!adap)
> +               return 0;
> +
> +       if (!strstarts(adap->name, "SMBus I801 adapter"))

With the comment on the previous patch I'm wondering if it makes sense
to have this to be as simple as strstr("I801") or strstr("I801 IDF")?

> +               return 0;
> +
> +       *adap_ret =3D i2c_get_adapter(adap->nr);
> +       return 1;
> +}

...

> +       info.addr =3D (long)lis3lv02d_dmi_id->driver_data;

Hmm... Usually we use uintptr_t, but okay.

...

> +               if (strstarts(adap->name, "SMBus I801 adapter"))

A dup? Is there a possibility it may go desynchronized?

--
With Best Regards,
Andy Shevchenko

