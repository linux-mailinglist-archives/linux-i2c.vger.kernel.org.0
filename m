Return-Path: <linux-i2c+bounces-13087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3BBB91B15
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 16:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A60A93ADA2C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C061A23F429;
	Mon, 22 Sep 2025 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LaInY0YV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576BE1EF091
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551177; cv=none; b=h/93z8p5dSKZ+tKw+1VYFUZD+KhmCtDP4pdDwXlV4NJu8imJdRnVGVtpT5s3zFuhw87/mzvvaTz/T35BQ2vgqTXajbpmfwtiPpBwy5TjLn9Rg1LDYQMc8AQnt901N8eInmfNu7V5NFMFRC3Ofbcy+CwvB3895gluETYpWhg8Bw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551177; c=relaxed/simple;
	bh=mP96DEmh2bjOnupXEAFWa9ertPrArnBqiTrrqz2g5Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LN+F67Tdw12hxtfNoQ53Ct3VFjq2PW/LBsyMQx9J7bZlplpIaoljaInbE5ifP9VDx+KhxuAY/B5/W3q8o7VFcSfe9AxxXPVCXStFeTLOTIPHzPfjYrmgBWVK+6hx3UvBB0iDCQnpjEDafZV75kdkUaCcOs4XeGdZmnAVTuVtmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LaInY0YV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso1576721e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758551173; x=1759155973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNq8LByj5pwbTMU9Znek1vsRvf2KZXNAUyuTdvujvsc=;
        b=LaInY0YVTAj1nxSq5wIUGYCuGUBvT2Z1sAZLZQefqscoIG8qdxXWtVlrvB69kcy7Ib
         SHe5cXycnYbOTKMwSlodbuIjtMheNLcdNSEW0S0LI2cnoaoQcUi+jOm4lcN5EqC2HiR1
         mc8LUYgWpGvf2b1dbnCVMtyf0rqZDcaCXUvxvX2+FFz2YvNLeWBX1iEbhh36VpXjFUx3
         mOtO/nv56gUzd9PFFToex88zhXzVNpyelImZKOj9/0ta+KWeydTTTJDU8sMq/WT7MK+v
         Tfu1CdGOpk/7N1FlYkWHJlgzQAnkEM2WmaEbJ6Ht8RVbrcfftC581m1f6r+JrP1YcJtL
         f2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551173; x=1759155973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNq8LByj5pwbTMU9Znek1vsRvf2KZXNAUyuTdvujvsc=;
        b=Zj8acglVIUNppx9jNSSMFFwrAEbHDEZZVOgmw3rJSnE8VY77UbVWPM2MdQW5kfm9xx
         rM2lMtVjAyofa3tCBmN/8ng7dTiXbj769ZKpASyzgFGNINNota8J06FTLrfXgYRJdNi3
         LojUBwXN9Wipu2MKi+azty0slcZHbx4RF72YExJV+8fxMo8008PihbGXr6Eq89CIQ/NX
         RhM8AtzRRGhUPR6YDuEQcRQjePALbhhIwKPvKiT97WA0wRVPaAdARhfHXVrKkEBeMJ+Z
         csuHPpNITB+vjjkeovEyNI+OpXLzLieIl/MLxPjD5KdF0eKtY8GJ5hHl0QBcdjX7g0uk
         A6gg==
X-Forwarded-Encrypted: i=1; AJvYcCW7PA9BMI//miPpnX4OTu5Kf90HevCxhotwaeszJ0kd2m+iLd6ofsiz2HOtyMnDstc8a8UbEXDj9yM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPTt3PHlwUa9jLOtFWLKvzmIPFLXHHFpWOZKm9w51yaNJQBnf
	wOC+156iYR44eeIYl9CxQ0u0DE4XGHCIRYEi9+W3fd/phW4X3L0MD+rjARaYfXBV/6DPnsnjOnq
	e5LNGALCauT+1ItIpkr/dqFTF3fd/F+oX4OwFjc6O6g==
X-Gm-Gg: ASbGncsOuv53gTPMv8FMxElpTK7kec2VfUDIuojm+RlyoZVvm6GwWdFbmlIZVq7FTeD
	PyjMqTono89+VwIWCVzP/gmjqqSsr/fTcrWTzh+Nbrbz52xshMT9ZwxRNjXu+8ks6WJZ0WtRYnv
	CjxMlvOJNG6RrIUnkwIsWuZXYsoPb+35T88DOXBmEuGEwErM+t77K67pgX41qfHIaN/KHZS/kY6
	H3RBQeeTzoZNiFZ6c9psv8rHqoxCACo6o+ufQ==
X-Google-Smtp-Source: AGHT+IE7DmYOUjyHSgUJniPn7e9AJvVcDzh95Q1+d6oD+mIbIisj0H6I1VaeOo8cYSd50AnJUrfkdbDELShAYcU4hiY=
X-Received: by 2002:a05:6512:b09:b0:57b:dc46:b9f7 with SMTP id
 2adb3069b0e04-57bdc46bb10mr2828551e87.29.1758551173483; Mon, 22 Sep 2025
 07:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com> <20250922120632.10460-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20250922120632.10460-4-sakari.ailus@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 16:26:01 +0200
X-Gm-Features: AS18NWD6NsOoZOr-LD3KJ3t9qbbN9qckcANb7bMcNVYUpjUM9Cnxvw0B1IHlQqY
Message-ID: <CAMRc=MfaybFsuW1f=obVEX+1ij2F3vui2Q=3eTs5LVd2BCrv7w@mail.gmail.com>
Subject: Re: [PATCH 4/5] spi: ljca: Remove Wentong's e-mail address
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 2:06=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Wentong's e-mail address no longer works, remove it.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/spi/spi-ljca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
> index 2cab79ad2b98..3f412cf8f1cd 100644
> --- a/drivers/spi/spi-ljca.c
> +++ b/drivers/spi/spi-ljca.c
> @@ -289,7 +289,7 @@ static struct auxiliary_driver ljca_spi_driver =3D {
>  };
>  module_auxiliary_driver(ljca_spi_driver);
>
> -MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> +MODULE_AUTHOR("Wentong Wu");
>  MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
>  MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
>  MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-SPI driver");
> --
> 2.47.3
>

That makes perfect sense for MAINTAINERS but why would you remove
someone's authorship from a driver's C file?

Bartosz

