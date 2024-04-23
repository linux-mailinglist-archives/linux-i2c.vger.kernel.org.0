Return-Path: <linux-i2c+bounces-3059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294F8ADF83
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 10:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2983B24B9F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 08:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0664B5CD;
	Tue, 23 Apr 2024 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0edhszBe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7960A44C8F
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713860070; cv=none; b=TCNjNvNJ6EU2/HVjTIX2Nf6cLWvZD7YrWT114Rk5RVR26YlPxcjvTOVXHH2/I0r0xZfBzyc2/tpsFX5Ij0v0G4C9fsEy/J9rmFpW6NXaFdGQPoE/15XOqUqmmPU/qGHTZf0bE+UP0A3V5PaISQRb6JC3+mdHISHNMxDumDO3E/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713860070; c=relaxed/simple;
	bh=wG6WZUpRd/kgpR3jnKexoyxO7GupX187v2aFnXW6ETE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZSF2fAje0m8SyvT5zyFZ0ShUjH9weU5EoIjqQdRrOlk6O6HDBG4ZusvJnobUU/BBxfLXkTp3KOGM5A2zv/6cHQge00p7oJPbOlDnQFZLxhrzwZ6YDZUI4xorPD42jMcJfzsVy4rJyQFOeAjYGPLTG16w+hYShwG6T1mtAn4764=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0edhszBe; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51ae315bb20so3710307e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713860067; x=1714464867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnrklfKDWUIqP05rELUPFXo38TCciTnfkiMrHFZcSA0=;
        b=0edhszBeZKglHxghgKzf3jItk/+SToJzlfeZzOKrpBbF52aT35vbknnhmgvR17L+nw
         RDkfsazmNmFvaGv/ENvnEC7oWFeXuY5/2ynV9IOc68xio+Z3D17slj1UvTnslsQHvoso
         jgjIfkdJ6n1Efx3uLiu6hGxVtX6MQbRW6MiVHUr3W24kkPELA6pNfrtYDPEaCViRZ8xa
         JPGRo4qc268DrJxmEqjolNdi0gLDDXC90eAVTcd+U9pD4iJxH2O2CKUKlMkOisAKiLQO
         oOsV7SGijdW1JwShIleGXVQIocu3rKKRdGqYAmtuJTT2RsrR8iPwWedwo1NbjLUSsbDA
         fvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713860067; x=1714464867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnrklfKDWUIqP05rELUPFXo38TCciTnfkiMrHFZcSA0=;
        b=de4tt1MAIU4lIOtc3i69aPxh4l6yj7I55OGJGmBYQj5i0XUK1DcZcUXwVAgLGKNC8M
         pmhAeaokhixw7spuTF+mLWSvjG6VBC4SdqFBG4leMMquIA1TaNQeAALG/LaUvzEHPDU0
         lN9MWwYxh1473HtERba2pfYS8AQNstzE2O64gAnjgnoTc7Min3JiwttjDHhH1/LwQALG
         h/Bd23i3FabP+tQeE4bk92kZtfzBAraksCeiIPNRZ2Js0XInBqfaWjssRx55oNBHMcXK
         xFs91npD2HrkM84ekHZDZi4hJhjkHrug/ISoUUcQUZC45JTV8oV90wWdSY7YkXuiqRkY
         9iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCfhHrkVOEU7QdkBVhRMHxuorku5cUyxJj8BnIpwjxjLqUWT0/X33hoN8w/ZM9Ob9Gb5U0+E5s6SQ+C2QLo7zrDkALzuCge5bJ
X-Gm-Message-State: AOJu0Ywon50Qs0r16FbGFPs8hVLhIrqWYG4JBVtsWJ4BSspRXkVQbFWd
	PFG+qH33svAYDQRK36xYJ7TViqT6PLc8DTNLAd92lmgdiFwZUZ+v5dU34LBivFKaEGZljG0w8VJ
	WoBfJmI3KNzbODnPYreaXfjLt4LcLC3XIcQCmnWi/8I5Xc8+J
X-Google-Smtp-Source: AGHT+IFT5mw/VkxiK5lqt0jVSHXWxLoXZjq0sk+Ehe1bus84zOyUGBvUOArypZGnFC8w9m/x1qswTJnq8zLtb/vC3ws=
X-Received: by 2002:a19:f80d:0:b0:516:c9a7:82de with SMTP id
 a13-20020a19f80d000000b00516c9a782demr7121805lff.38.1713860066879; Tue, 23
 Apr 2024 01:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422174337.2487142-1-dtokazaki@google.com> <2024042324-public-disgrace-2674@gregkh>
In-Reply-To: <2024042324-public-disgrace-2674@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Apr 2024 10:14:16 +0200
Message-ID: <CAMRc=McBf57hRFwJtTGiM=3x9-D1zPrW8mDnMKmcnupPA6ZB5Q@mail.gmail.com>
Subject: Re: [PATCH v3] eeprom: at24: fix memory corruption race condition
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Okazaki <dtokazaki@google.com>, Arnd Bergmann <arnd@arndb.de>, kernel-team@android.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 12:09=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Apr 22, 2024 at 05:43:36PM +0000, Daniel Okazaki wrote:
> > If the eeprom is not accessible, an nvmem device will be registered, th=
e
> > read will fail, and the device will be torn down. If another driver
> > accesses the nvmem device after the teardown, it will reference
> > invalid memory.
> >
> > Move the failure point before registering the nvmem device.
> >
> > Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
> > Fixes: b20eb4c1f026 ("eeprom: at24: drop unnecessary label")
> > ---
> > Changed sha length to 12 in description
> > ---
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.

I fixed it when applying.

Bart

>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot

