Return-Path: <linux-i2c+bounces-11152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFAFAC76CB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 05:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9676C1BC101C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 03:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0552505BA;
	Thu, 29 May 2025 03:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="H8OwxZ9V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7CC24DFF4
	for <linux-i2c@vger.kernel.org>; Thu, 29 May 2025 03:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748490912; cv=none; b=FqRnNHD4eFTAcRFlJfGIOg0GyJVZCc3XuI9l07b61paVzjCUDZEK70t76TtaWHqzOYMh2tLqs4FuCz91VHP34Sd8edmSfzHpQ3vpUJeXUCiM0wKJuwoQWJyYu8jrZejCvPfAMs5wOEBx5JGr0W3RRkBJaZmqGwvnWyT/5gRpdmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748490912; c=relaxed/simple;
	bh=bjf/JLayP19bwsqdRmI9LExctVLA/PfSC/qjpvMxmXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3rFrkFksq5v1NaSS9Ox+FM5fIt8mlRWG37u0l8KZqSxB88rbpWjGHVyC+WC/noyVenRYJjOZIbgSpfBzJmTaSDfP+2jcp9KM7k/jphpYfZwt3c23JnDCd14F53ghRC1vUTg27x+QnPfKQDqxL2ugFaM9bhGh0ybLBZZihnygDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=H8OwxZ9V; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D7A9E405DA
	for <linux-i2c@vger.kernel.org>; Thu, 29 May 2025 03:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1748490901;
	bh=V4vVrDxJRiSVvwJTAsACN8FW8gcbiroxOJCqMNoZKGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=H8OwxZ9VzSKAECel3Kiz1vldLBXew6ORsOSOubY1Tz8fS00Z6/0XO01pv5DMceqM1
	 H5aFPsdjjbp8LC/BL0xNCOktVubBAX9AYF9LJudMMBmovDib/BAgurOseVXCXx7v0B
	 Cf6N+u3sxgdCZr/pHnP4tZRxSW6KwvmHWAGnhw7x42+w2WcmCr7EyexGoQY++0rk2S
	 k56q6Zv9B1EY5myj+ZQqJfeqP7fUzh5NX8dOu08us8ZYbnMzHNPartBMrenIYe163S
	 5bz8BuzjVdCQPf1GMc1sWRQKBXJ6sOQ1uwd7CUQvjrjZvKZcMXEAnuCFytK67Iron4
	 e4D+/NIRsPhhg==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-60498322443so443616a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 28 May 2025 20:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490901; x=1749095701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4vVrDxJRiSVvwJTAsACN8FW8gcbiroxOJCqMNoZKGU=;
        b=CvWaBHMurEM9uRgGVDdAKyzGLQJaEhNY6aVBasliBi0JegKUG1uI6XXvPvKripi96M
         LP2DZUpXyVmo0ZStGQgeKh8iKm8rqslcP3nM5vX4kTOicRXqQsidagQ5Si04RHutjKh9
         OJyvTKJugXKy2uIhjNw3eDB7yYlidQB3DgErnjxknmkKUcIoy/A+beTZQiJPvwm21q2G
         4ljrxqWy1yIysyVdZM9BowrZOkY93jY0mM5kH9QdOiTa58sMKoM6poLQMMGmwGZOP5vS
         uQtfeTn44jhHBfa2ns6SqP9DqMPHCJ1GChSxGlgEA1rD8/h8yyOASRYr+MfEgw4+937+
         i7QA==
X-Forwarded-Encrypted: i=1; AJvYcCXtPUUgjb9StrUY/nlIhjkE3Yra1iU5dT9mUx0koR00RoiUozEkA/xupALMLvygM6zeOs/+Spi05wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMmyCKbCDCnmUrXclu6fDc9jLjwAPH4cl7r60VqBprpzwbJRAb
	Q9Pe4HR4N1eGZNTYdFjVS+BzdLJ7/ByE8L2bZ2vdjmiv/6zixLr/E+7gxZh96aI4J/u3H+9d2nG
	5Mb17o1Dc+j63vZlBiM1L2anwYfKp69zlQ+it0Z1Budo7KHVNGIV9pqvmw0hhAmiAgSPI0I6frP
	WPpEe8OLRkzyH0yCatBtqpmPlx3W7qiMDa/2YaU84wYIaB7yTytJIX
X-Gm-Gg: ASbGncuqY4Wuqzc8kWX1rbDksCHSC06oVWe+Pu76C6UXXkWJxXEbVxLFSv1pWluwjVZ
	K653YoC9IbHLAkUwVaa4l6lhuMBMquDHEOR0xC64lZEDa8jErkHYZ5WlPIWnYjqUgYM0Ngw==
X-Received: by 2002:a05:6402:1d4b:b0:601:3f5b:39ee with SMTP id 4fb4d7f45d1cf-602d8f5d70dmr18033632a12.3.1748490901400;
        Wed, 28 May 2025 20:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR0ej2bZUX3SVv9aAplyxdVXsmtwHM6QDoYTrTihqt5ALCD/GbQf0L7mvCwR+nlHJCc5oIyUGYNq9gu+JSggw=
X-Received: by 2002:a05:6402:1d4b:b0:601:3f5b:39ee with SMTP id
 4fb4d7f45d1cf-602d8f5d70dmr18033620a12.3.1748490901054; Wed, 28 May 2025
 20:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com>
 <202505290728.VsNgBfDO-lkp@intel.com>
In-Reply-To: <202505290728.VsNgBfDO-lkp@intel.com>
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Thu, 29 May 2025 11:54:49 +0800
X-Gm-Features: AX0GCFuvPqKC8O7DWOhXj72SBZClr0XkXQZTp2dRyjUTIGZ3F1XCKz6JwMpGoeY
Message-ID: <CABscksPBjQ14UrvCVwgVMHZ6NsPKN9tWscaOGBy8TjufgzPGFA@mail.gmail.com>
Subject: Re: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Write Disable
To: kernel test robot <lkp@intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, oe-kbuild-all@lists.linux.dev, 
	Guenter Roeck <linux@roeck-us.net>, "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 8:00=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yo-Jung,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 176e917e010cb7dcc605f11d2bc33f304292482b]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin/i2=
c-i801-Do-not-instantiate-spd5118-under-SPD-Write-Disable/20250528-163253
> base:   176e917e010cb7dcc605f11d2bc33f304292482b
> patch link:    https://lore.kernel.org/r/20250528-for-upstream-not-instan=
tiate-spd5118-v1-1-8216e2d38918%40canonical.com
> patch subject: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Wr=
ite Disable
> config: loongarch-randconfig-001-20250529 (https://download.01.org/0day-c=
i/archive/20250529/202505290728.VsNgBfDO-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250529/202505290728.VsNgBfDO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505290728.VsNgBfDO-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/i2c/busses/i2c-i801.c: In function 'i801_notifier_call':
> >> drivers/i2c/busses/i2c-i801.c:1304:9: error: implicit declaration of f=
unction '__i801_register_spd' [-Wimplicit-function-declaration]
>     1304 |         __i801_register_spd(priv);
>          |         ^~~~~~~~~~~~~~~~~~~
>
>
> vim +/__i801_register_spd +1304 drivers/i2c/busses/i2c-i801.c
>
>   1291
>   1292  static int i801_notifier_call(struct notifier_block *nb, unsigned=
 long action,
>   1293                                void *data)
>   1294  {
>   1295          struct i801_priv *priv =3D container_of(nb, struct i801_p=
riv, mux_notifier_block);
>   1296          struct device *dev =3D data;
>   1297
>   1298          if (action !=3D BUS_NOTIFY_ADD_DEVICE ||
>   1299              dev->type !=3D &i2c_adapter_type ||
>   1300              i2c_root_adapter(dev) !=3D &priv->adapter)
>   1301                  return NOTIFY_DONE;
>   1302
>   1303          /* Call i2c_register_spd for muxed child segments */
> > 1304          __i801_register_spd(priv);
>   1305
>   1306          return NOTIFY_OK;
>   1307  }
>   1308

I think this happens likely because I put the __i801_register_spd() inside =
the:

#if defined CONFIG_X86 && defined CONFIG_DMI
...
#endif

So the function went missing in loongarch. Will fix this in v2.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

