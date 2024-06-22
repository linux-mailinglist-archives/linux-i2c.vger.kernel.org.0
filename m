Return-Path: <linux-i2c+bounces-4267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB129136B0
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 00:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CAB31C20C01
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 22:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EEF77A1E;
	Sat, 22 Jun 2024 22:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSG7KBLC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D4629E4;
	Sat, 22 Jun 2024 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719096238; cv=none; b=pAmqAH0chCFQLPbdeTmZLr83KKeyzA5NiMVe/dVWqfMLLAs/B9H7TIC8EqNgkVEi4Ykvo987MWNT3ZbMOqZRPYjZ+zXlR4gA97gxFBhXS1nEYmvcVGI1Tc37dJeD8MdT6PcyOW4GOL73v2tRPKseDwbPUcpGVJq08nNBxFqa734=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719096238; c=relaxed/simple;
	bh=cPqWY7xCNRchFC9ZKbfO5GFZRJ+alulxGrKML0JOE0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5ChsLO28fF5ViisGVD3Rzil9kfWONUUt3KdtoGd3nyNzm1N2xHFlmh/v2GA5z2ZjYh/WF54prWfKJpLL0QWBDn9COpMrtSowRLSbsb3eaC2HmwpEVNV01YOlnJ6a3AmKNI/uijSHrwH2bqb3TNRLb59CPmrxJfwp1VA6hG3/Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSG7KBLC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5295e488248so3634794e87.2;
        Sat, 22 Jun 2024 15:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719096234; x=1719701034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnzURPUfEHBnj15KnhdvxzQ/Vy169RvhLQ3nLWjYHfU=;
        b=eSG7KBLC0SbA1PsPfqaUUsrCmuQ0QF0HLeVGvNmtu50Z56FzK7IpnNXonWbmVvQiWz
         mct16R0QPkHdKGlOvNFPdDgjCU8bhBGB4mQHNE/yeyaL7ygww7iaSL2EwfZUQ1iUuNFV
         XWjYWiP969jGNlUhX4Iv3cDc3jvEn58L9CfIJTCrBIPGDYiZwT1EYilddXIWEV6inSet
         i0Bx+VPWgEA1ghoIUnpmwBp4Y5jvnMQEbEM9PRtBO3oofMUSidqGEEoGWNdfUguCsA8q
         a+VVGsQV4RiEiDPssBgPSvilZe9K9wBSMbPszvaTL+B30389S/uebmGyPO49t8C0B/si
         /DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719096234; x=1719701034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnzURPUfEHBnj15KnhdvxzQ/Vy169RvhLQ3nLWjYHfU=;
        b=NbUI7LBFDRpit+BERWOxQwTqAlOeYYPxnnhOKbv9f45Fk1MmqxHOKX8S0eKVY9X0si
         hFgUAGl8ic6IeqTRjT5iH/j5lRcb9oF89kx7ZPSjHVJGVbTmwgM8WOZq6IYXpPeueC7R
         nup8TJknQIKGB+2OOzWICppShjGepiMfKPIeOco4gLsK2xdM6Og5FTsBcsx1EH2u4KEk
         qiPa/8wZOft44FM1llAn9DFouKDG7aBm/lWePkBDOHxo8XgQ/22e7sg4OTGuo6J4rhTa
         qYFsYV/FdzPFPZbxkD1Lyi3p5hUxh8CBtWGY9YBmUgFAHZwka+my4nzj+/wZTW+jZxRe
         Kz5g==
X-Forwarded-Encrypted: i=1; AJvYcCUoyivc5BhXC1WNH3Vm1OG5D3auJFwkQqP+XDeb8BQ+tq/b295hoN5t/y8K2qd8ja3oxMkA1zsYQcGhInMAMj9bvZQ5dVfI2w5JZCws2DFSmImZB4OCzXFaew/p8PSKmwGtIQZBfXYXIijSwAVxDA==
X-Gm-Message-State: AOJu0YxGou66JWFkHOiLUEUKHCpCEIsYkGXXjcjpBF3GOm71l1eF26bh
	VvFYOp5ZB8YjnFqqAtFBJjuPvalK7Iv2y7zwD2IZhbS7Lt4tPwML+B1pbG6Gab2jqLK6P1AH2Nn
	yN0Ur0TXyaxFbH1zK6gGj917pCAQ=
X-Google-Smtp-Source: AGHT+IHyaxj5U8UqQ9uYcIWzp8VM691fLIAeNIjMTZIVBJazbzjeR6tEbggrkXU7h25hCe7kQ/ZTT34nMwthWFXLO78=
X-Received: by 2002:a05:6512:48c6:b0:52c:818a:28f0 with SMTP id
 2adb3069b0e04-52ce1832b8emr376968e87.6.1719096234291; Sat, 22 Jun 2024
 15:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali> <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali> <20240622164349.fycelzxcd45j4g22@pali>
In-Reply-To: <20240622164349.fycelzxcd45j4g22@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 23 Jun 2024 00:43:17 +0200
Message-ID: <CAHp75VdVhiMN7TN-OwF=9ahv9W-2Yk+k=V5DvQGhTpUuR-b-xg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, 
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>, 
	Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 6:43=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
> On Saturday 22 June 2024 16:20:15 Pali Roh=C3=A1r wrote:

...

> Definition of the table can be simplified by defining a macro which
> expand to those verbose parts which are being repeating, without need to
> introduce something "new". E.g.:
>
> #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr) \
>         { \
>                 .matches =3D {
>                         DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."), \
>                         DMI_MATCH(DMI_PRODUCT_NAME, product_name), \
>                 }, \
>                 .driver_data =3D (void *)(i2c_addr), \

I'm not against this as we have a lot of different examples similar to
this (with maybe other types of ID tables). But what makes me worry is
the use of (void *) here. Shouldn't it be (const void *) so we exclude
the (potential) cases of dropping const qualifier?

>         }
>
> static const struct dmi_system_id smo8800_lis3lv02d_devices[] =3D {
>         DELL_LIS3LV02D_DMI_ENTRY("Latitude E5250", 0x29),
>         DELL_LIS3LV02D_DMI_ENTRY("Latitude E5450", 0x29),
>         ...
>         { }
> };
>
> Any opinion about this?



--=20
With Best Regards,
Andy Shevchenko

