Return-Path: <linux-i2c+bounces-3004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC5C8A8FC1
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 02:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 715791C21358
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 00:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F441272BF;
	Thu, 18 Apr 2024 00:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oOBChsbV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218484084E
	for <linux-i2c@vger.kernel.org>; Wed, 17 Apr 2024 23:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713398402; cv=none; b=QP0YhjCJ6HkV4JDZnBn7tj43XkKMuMu/lLlNjgeMIeoqv3QLHVBPFSdYCnj6WyHljoI2uzuwIsx3YkSJ0A5spiT4z2ZuZneMsW/SrKpKYfSg9CaOngT8rFaQyb9Y2qgaGKC+MNItxQdNVltVeXD4v8e2b3CxoK3IOU0Dxirg/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713398402; c=relaxed/simple;
	bh=SfWbGLTYXXko8g2ioHPgogIxHHSTBHU9JaaAWEgZaPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uf7g8efCbjHAcWILpCw99/IKn0rIw4Rpum9B4hkzQbfqcsOgx6hDsGQNroNHHbpBqxOMoGrsR+gnkIuCjSxutOn7yXpXW8YhCvHKdtVSygmbfc4AHloJZmaSuokL9bzQSOZUuk/O7cHW2+MhUgQ/dLjrfuhpw6s0JjendA6Oum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oOBChsbV; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2db7c6b5598so4625921fa.1
        for <linux-i2c@vger.kernel.org>; Wed, 17 Apr 2024 16:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713398398; x=1714003198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBvypBsMvnG3H6XpbX8oQ6ldyKG2ZjkHSahsMgFb2XE=;
        b=oOBChsbVsOFa8oWtfZbRaRpeWBRgGUYWPW83P7fhW2DXgmnwprf5o0Ri81EXBmQ3qD
         dYPJ4oRkq4CIPcFETgdZZFFGdCSmc2PPF/13s2KdTh8sAhCRL/nRmUGMpp1XoDWU/zQd
         wNAV9XLc8Hc1LKKH5AA5KzrHFdrvF7zMds3lVO5UX2nzsZOT6pE9PgMo6Z2Qg5wl6Mba
         ECriZgvQwadaNt+GgtYxu/F5jDH1+zpbpJVESf2MCNig1ALr6x2wY+bEBIcn+Dl38oiB
         Ov7Fil/z3eK4XSoegvTkzxjtTEX9HfmlG+vCDuVdjAYGTyHCK/77oqjYVhYH7xOmbnBd
         yO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713398398; x=1714003198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBvypBsMvnG3H6XpbX8oQ6ldyKG2ZjkHSahsMgFb2XE=;
        b=d+vbO0DUyA1BWu4B0LrUtEMFB00W8cq+zX2JnL7JOcBiAVcc/GWjJbxmre3RoyYNBc
         HBFBsSlUfc4aqaK3q1z26sX8VkXw3cSHuLjz/drMaBwQRUa2ciW3VqJQAFDMk514JnNJ
         zyrJqcmilL7qE69EHLEFrlM0K8zMxDKP8BoZoPKy6Qn7oxG4fxqlEgB6mA5ZAKpRsKcr
         i4cXzyx9BCc1sQTCZjuR45/914F0IXPapXamx1HvV+OZ25zfLjoPsevKNbvdf6cWqPK2
         edcwnwD8gCvSk57e+yiqXJ/eP635Cz3diuHSjUE1KTjW/cyv/vdIP9FdhggJshCwzODm
         dzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC5HKK4ezJ3sj8Zpz5rfohnERsvs0B/gCH8G6ZeaB6MZrjS93LPYlSCugZxGeQWN+cj4WnHfGpWw5TEL6lT+wnT81dHU8gXBK6
X-Gm-Message-State: AOJu0YyATY0MhoAQROSfmmaTTxeYZ/NRU2/DS4Ncl8DkkdTsBm5lRDvR
	AKLldQoxvF8+wXhHlL1db8qQZ/ZvVooOnbD2uAwX/kfJIqUknGLOS8vd957DJnEI7BugbU+YdFg
	hf97zdiAYVThzsoK4UBTIxaG8djsUflJCoOAMX7bVrYSHzMpnNbI=
X-Google-Smtp-Source: AGHT+IF9iJoCVl2UcqxxnXv8/WOse6a8aMNaA2CPr6Om2Kf0MS6MQL//ey1KZCqoYUnWuKSzrCZaUfF2mVdQ6TjVmJA=
X-Received: by 2002:a2e:994d:0:b0:2da:6f70:38b6 with SMTP id
 r13-20020a2e994d000000b002da6f7038b6mr487474ljj.35.1713398398135; Wed, 17 Apr
 2024 16:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417230637.2592473-1-dtokazaki@google.com>
In-Reply-To: <20240417230637.2592473-1-dtokazaki@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Apr 2024 01:59:46 +0200
Message-ID: <CAMRc=Mcbi8BQ-tHNs+BVjbm3aDSVY0zzOM4QfND3d2y8ryT62g@mail.gmail.com>
Subject: Re: [PATCH v1] at24: fix memory corruption race condition
To: Daniel Okazaki <dtokazaki@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-team@android.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 1:07=E2=80=AFAM Daniel Okazaki <dtokazaki@google.co=
m> wrote:
>
> If the eeprom is not accessible, an nvmem device will be registered, the
> read will fail, and the device will be torn down. If another driver
> accesses the nvmem device after the teardown, it will reference
> invalid memory.
>
> Move the failure point before registering the nvmem device.
>
> Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
> ---
>  drivers/misc/eeprom/at24.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 572333ead5fb..4bd4f32bcdab 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -758,15 +758,6 @@ static int at24_probe(struct i2c_client *client)
>         }
>         pm_runtime_enable(dev);
>
> -       at24->nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> -       if (IS_ERR(at24->nvmem)) {
> -               pm_runtime_disable(dev);
> -               if (!pm_runtime_status_suspended(dev))
> -                       regulator_disable(at24->vcc_reg);
> -               return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> -                                    "failed to register nvmem\n");
> -       }
> -
>         /*
>          * Perform a one-byte test read to verify that the chip is functi=
onal,
>          * unless powering on the device is to be avoided during probe (i=
.e.
> @@ -782,6 +773,15 @@ static int at24_probe(struct i2c_client *client)
>                 }
>         }
>
> +       at24->nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> +       if (IS_ERR(at24->nvmem)) {
> +               pm_runtime_disable(dev);
> +               if (!pm_runtime_status_suspended(dev))
> +                       regulator_disable(at24->vcc_reg);
> +               return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> +                                    "failed to register nvmem\n");
> +       }
> +
>         /* If this a SPD EEPROM, probe for DDR3 thermal sensor */
>         if (cdata =3D=3D &at24_data_spd)
>                 at24_probe_temp_sensor(client);
> --
> 2.44.0.683.g7961c838ac-goog
>

Looks good, can you add a Fixes tag?

Thanks,
Bartosz

