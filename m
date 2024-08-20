Return-Path: <linux-i2c+bounces-5608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B291B959040
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 00:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D190B22CE8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 22:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C5C1C7B65;
	Tue, 20 Aug 2024 22:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qno3ldDM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509711C68B2;
	Tue, 20 Aug 2024 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724191663; cv=none; b=nex1uP78IU/cL9H68XlWAe9FlIpq4OUH64oRD/k6rrQhBqH82NDWTsQbaNzqxKtPA5ZGMFv8vyjGZRTZFICajV2v7xnxsruLwFUWfoglUbqg6DAjmi3NDmwUltoa1DKS5+GePaWpIcPlK8cLBGwWbhmFBSkyeYND6PVmGO3EAz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724191663; c=relaxed/simple;
	bh=S3mpOjdi14VHSCLnuZBDQBu52u7Ft4eBzspfymP1PJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Om58f+EbBcHGPx80OuX3Ag/5wcRfnZ5ZIvmMS++CJZwO15FfNBmDx020HKJxSeUwcUHUduvK0Aysm1jO41raQcVGryGJxkvGF7dHFQu+84NDsyQjW4PGr97llvBf3TObJpgVH8VyV25Y734LIcD0gmkRK037e5ufuLHV8dotg4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qno3ldDM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8643235f99so205005666b.3;
        Tue, 20 Aug 2024 15:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724191660; x=1724796460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3zG/pSsvdgGO5mZ9CA/2SfMOpcuDqe6+MqB8h9/BT8=;
        b=Qno3ldDMNq/Yfcphi5FbsQ3voKs3erRyZ328dco6yDUDuGE8O41hlqj+RO47tSrlLP
         WnPQLB3U/4iS/GOjeZrPsCGSpQAerJvxd3aGYRSUamXS0xPb5p3YlqFSzGY3f+VwDNkJ
         hF9tYxzpZQW6W6xBlf9b6TNMdsd3Jfcgemo5Uyq/yes/EXkm9ilnNdOOaJBUNtPK34uw
         3xxksmuAYXLpH6wMjVOJU5cYeRB8E9trm6+2UiMfkUGHt6sMv/V26P3Y0CKHh2TWkgAw
         E23ga5IHeOAZYw44YsHaIEyVrdp8xwGLWB7plj5p3A2qWUqhX/7Rh5FshdoWvyDaND9A
         sHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724191660; x=1724796460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3zG/pSsvdgGO5mZ9CA/2SfMOpcuDqe6+MqB8h9/BT8=;
        b=faNsbVAGrP2WgNHeC8LIEiDpuc5CPKR5L4Rq9/cNo0zleu+YU2YrdDss7uWzP/vDOs
         V5Ef7eE2gfLcVeVEl+Fxqe5SNGoobx8o/SRRT5CnuEmpI6uo2MsrbMQXzLFcfL/wsAoC
         lXDUDHBEnUIYi48Xc2ik9Nm2UHKJhDtxMgoRSWzOqHH6qWfZ36cwGiYV0GowHOnYMcZU
         c3Sd+F7crLrj1HZnpHc2QJfQwEZEivCgIOogPH+QRzbqrhSUFaF+hRfyoBRVMhO6OGlD
         Bg82FvcgtxHOh9ObrPMaV5j4QusAlTiOanCeiZMSw+jVRX7G0X3Tk+d1YcYNBdjWjfQO
         6oaA==
X-Forwarded-Encrypted: i=1; AJvYcCVIYxMkkDvBrctL5Zbeb/jG2nMJ5OBoCSz6F4P7dNbYto6Lm0ZMr8xvgyCxyjTqDFH2bXNf95DEeO43@vger.kernel.org, AJvYcCVu4Bz09jJX3t3UrWv55jCcpZubiIkJ4Y7WxHDa2t0YpNKu6+PmPxP5q0LjuldrNFoCkhllwms1NMf7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0+wZFzkAxSsQGBkYwqQklpw6SYXvvcwTspSzQkbXJ5drVFgP
	tmuq0OVte+jOfCxbbC7G3Y4O7vWXl6bEskImMz5lRP2Djc16IW7zw2tWHq/FIoe+/2OoYxLBt7l
	H9fKofDzhA+F36wgGcvi9uU0uh1MltK93uE0=
X-Google-Smtp-Source: AGHT+IFYilS4JfW+wXgXlmrG71yQwpId/Qb/cCUo2FEGaPuRuQPzw+RLTkroFwUqoH9ve+07Xnvmvgo4klxfGFlR+xk=
X-Received: by 2002:a17:907:e604:b0:a7a:a892:8e07 with SMTP id
 a640c23a62f3a-a866f3622damr19074766b.31.1724191659300; Tue, 20 Aug 2024
 15:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com> <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch>
In-Reply-To: <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 01:07:02 +0300
Message-ID: <CAHp75Vd3uUge7QFb4eOZb_nGNDu-GFDTZMyS9aZSm-D4LkT97A@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 12:29=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
> On Tue, Aug 20, 2024 at 05:47:27PM -0300, Fabio Estevam wrote:
> > Adding the i2c-folks on Cc.
> > On Tue, Aug 20, 2024 at 5:02=E2=80=AFPM Fabio Estevam <festevam@gmail.c=
om> wrote:

> > > I am seeing an issue with the PCA935X driver in 6.6.41 and
> > > 6.11.0-rc4-next-20240820.
> > >
> > > The pca953x is getting probed before its I2C parent (i2c-2):
> > >
> > > [    1.872917] pca953x 2-0020: supply vcc not found, using dummy regu=
lator
> > > [    1.889195] pca953x 2-0020: using no AI
> > > [    1.893260] pca953x 2-0020: failed writing register
> > > [    1.898258] pca953x 2-0020: probe with driver pca953x failed with =
error -11
>
> -11 is EAGAIN, which is a bit odd. Given your description, i would of
> expected ENODEV. My guess is, it needs another resource, a GPIO,
> regulator, or interrupt controller. That resources might not of probed
> yet. If that is true, you want the pca953x_probe() to return
> -EPROBE_DEFER. The driver core will then try the probe again sometime
> later, hopefully when all the needed resources are available.
>
> Track down where the EAGAIN is coming from.

I bet on __i2c_smbus_xfer(). Which comes from
https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/i2c/busses/i2c-im=
x.c#L549.
Very easy to check is to add at the top of i2c-imx.c the following

#undef EAGAIN
#define EAGAIN __LINE__

and search for the respective line in suspicious files.

--=20
With Best Regards,
Andy Shevchenko

