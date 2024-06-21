Return-Path: <linux-i2c+bounces-4225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADEB912901
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17EAF28BF19
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D1E58ADD;
	Fri, 21 Jun 2024 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY1Vc0h4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C931884A51;
	Fri, 21 Jun 2024 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982572; cv=none; b=WhNc+o85DvZ5UOror9cgEPZuEZxPcou9YHgdOxS718UbqWEM1edQg0uvNSP7jFocVHL4xyvkmjMzvGQrgCwKPHnasIOxq7gS9Vvg4zYtYauGAJqdcWIWXFl8JK0DQ7yzUHM4NHdNgVokxYmgmkYvOR8Zs/X0LgUfQ69+3IdZSRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982572; c=relaxed/simple;
	bh=2JTgUTLjkr/9WTdsNmsRqweKgT0dnJ5mxkw5tC+SdIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuFNcd0yB6QYtJmJHikWIbTq++aSw3vcrL8wHjRRVvJAaOuYXDT3qW3RQoDWa5GgufN0wveuMalBUlIqt5BHTBt0JodhvvJiOjzCZl0rm3I/e4W7IsC8o1IQ1dcOibDetP9WqNb7WjMiD9j6m706gXZgOMAqjE1+faeXwbTXf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY1Vc0h4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6efae34c83so245924966b.0;
        Fri, 21 Jun 2024 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718982569; x=1719587369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjNhtf/a9WCTMVLZ3fPzAAINqRbnyLD+7rw+nQLwO6A=;
        b=aY1Vc0h46chQ2wK9Ac2WKcdON/Nc+6U4g9acZ8P87kh6q4HfGLVS1V95qnCMrRVGX9
         N75gCXCIbFdH9bt9lKkfcEEvOV//8AVsSgtnfyppfl16kttJPi0jhBXPvQoP5kg/mjHr
         mBcRKlveAXPAorA8jqpUWvdCN3Y7NrYdWf+saJvOB1gqBubq0nwOKjp4BnH52nh78e4T
         4mgXsZ7qI+/2qETwmZe3Ibjci3fjzmmXjVTh7UhyziNls5X937TakZXeB61eooh1QK5r
         X0m2czUHdSdi3sBUPpret6r6se9rOj+ti9kRNn2chPr/vSVyi+FWAUFXuEyye1fdM0/P
         Pgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982569; x=1719587369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjNhtf/a9WCTMVLZ3fPzAAINqRbnyLD+7rw+nQLwO6A=;
        b=vbfLY1516k/b9v/KFamb+OhYH0YS5D7lPMUbSpefb3hFJcRAH459HwfjivKLIehrt+
         nwrDSzLrX22923FpWHEssXpqcVVY8MBTwX7FhhS1dC+WHwWrQUylXqdTQjNIm3939jxO
         9pGRytFPZ1fgWS2oZ9xK/b6obk3gZoP+/PVscbLXr9ki6JTgIcA/whV2+bc5A0FSKpJ7
         +7p7xRd2ETNIPNc06ZjTNmwZXNRBD178VYJ9x1XaBTnKC5W8kiB4TUi7EWURzY0E4+Jg
         m51LKvp6K+fnf3pKNUd0r2pmDdavVM29ncxAT1YhUv1f7sJBptYCotvbrsbnRG/pFxs/
         0DMA==
X-Forwarded-Encrypted: i=1; AJvYcCW4dTf77oFrCm+KbvlmBSm/qwDdqQVxsZnIAOEL4elVsdunFKHkKMsGOx+NADY5chEc8UZ06Ej4IFiQ8h2KgizNxh/hu6hOmmjYiypYYvoynPpxnrYNTnRMVerW0vCRaxSU9oEzp6qptFQDafWl6A==
X-Gm-Message-State: AOJu0YyaJHjgPb59TWV2ynMbUNm9kyfawrMWtFGf6fVTgp9R5WLdlel2
	gR2d57h4dv41Tq/AY2hWTIB2tQ0NvR4yjV2RsDUTy4ASft5dYc0VskK9KXZ6tgmAeBpOVS0O2l8
	bQSN0/fcqRS0MqJrmCOwSbZ1ty2M=
X-Google-Smtp-Source: AGHT+IGjHnIKJaYSY7jUaB2su0ehIX6i26rFg2ViCSr2NUO+NqwoYzPFYawL8R3N+QUMH9ylfsb2zfweV1i3GGJStTw=
X-Received: by 2002:a17:907:c003:b0:a6f:b320:f455 with SMTP id
 a640c23a62f3a-a6fb320f483mr538568766b.32.1718982568803; Fri, 21 Jun 2024
 08:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-2-hdegoede@redhat.com>
In-Reply-To: <20240621122503.10034-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Jun 2024 17:08:52 +0200
Message-ID: <CAHp75Vcuz7dk558PNeKBcpra5Oj87M5Dk23zSyhDm2bLpr1sJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] i2c: core: Setup i2c_adapter runtime-pm before
 calling device_add()
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
> Platform glue code, which is not build into the kernel and thus cannot
> use i2c_register_board_info() may want to use bus_register_notifier()
> to listen for i2c-adapters to show up on which the platform code needs
> to manually instantiate platform specific i2c_clients.
>
> This results in calling i2c_new_client_device() from the bus notifier
> which happens near the device_add() call.
>
> If the i2c-core has not yet setup runtime-pm (specifically the
> no-callbacks and ignore-children flags) for the device embedded
> inside struct i2c_adapter and the driver for the i2c_client
> calls pm_runtime_set_active() this will trigger the following
> error inside __pm_runtime_set_status():
>
> "runtime PM trying to activate child device %s but parent (%s) is not act=
ive\n"
>
> and the i2c_client's runtime-status will not be updated.
>
> Split the device_register() call for the adapter into device_initialize()
> and device_add() and move the pm-runtime init calls inbetween these 2 cal=
ls
> so that the runtime-status can be correctly set when a driver binds from
> the bus-notifier.
>
> Note the moved pm-runtime init calls just override the initial value of
> some flags in struct device set by device_initialize() and calling these
> before device_add() is safe.

LGTM, but this is non-trivial (I think) for the usual cases, can you
add a comment on top of the code you modified?

...

...somewhere here?

> +       res =3D device_add(&adap->dev);
>         if (res) {
>                 pr_err("adapter '%s': can't register device (%d)\n", adap=
->name, res);
>                 goto out_list;

--=20
With Best Regards,
Andy Shevchenko

