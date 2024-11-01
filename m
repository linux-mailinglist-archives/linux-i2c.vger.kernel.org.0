Return-Path: <linux-i2c+bounces-7707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364F9B8B0B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 07:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76EBF1C218BE
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 06:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747B914B96E;
	Fri,  1 Nov 2024 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvIkWFbx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952614A4D4;
	Fri,  1 Nov 2024 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441501; cv=none; b=OgJGTejBJXn2PTCAqO7iCUjwMSbEwK9KTa5qpd5sY0OgNJ8NyAXgf0QprJEjoRiQflN7C8xPVftoeRaW3YWcwKyUR3sRXDyJ8Pu9t9GKSlvHrtnpoDsONFpbJL0D+H8NqSAevSB05H+PBEmHqrq9xXOzN+BKh67m+ibnk5pze74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441501; c=relaxed/simple;
	bh=wzoFJly/IZv/pxBeHPzRoYbyHVICd310aWVYgU7yi1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohEYotElnhnUbD2QHmiMC5pWM4xtm4kHB6Gjm++9gJNK+6Kj4vRr2G0i7CI0v0aUrnavcjIjaJbXW6rwP+ZqLSWQntMzESJi3fCOkvmurYYnPevp51V78Y8fyc/XY/LF+bhztYRpN4zy1ocblsEsV2qZjcRKLbtH5lya6OLs0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvIkWFbx; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e9ed5e57a7so13577127b3.1;
        Thu, 31 Oct 2024 23:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441498; x=1731046298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wzoFJly/IZv/pxBeHPzRoYbyHVICd310aWVYgU7yi1A=;
        b=YvIkWFbxLBZd4KZiAxuL4OEZHTU2ojs4J6LaGPtZZWuaVIWcbhcnO5nEq4g6zhOrPy
         QzoXD0isBVkjOOyzXTUh3d3v1vj1AFTu0WMDnlzI8Ltd9TFCHxkOPxwlJSmKDYTEHrMg
         lnpL8WcJcupJYubxfz1eY6vNrjLygP3+U75d7DI5mka3cUl4GxolWsRaX2moOUOerJnq
         QvHSIQcbFSp3bmULy1bgnBwnjD+MH3xpLuckDapuxmZgIRQOgZma7no/kdPDF2waDfOu
         3FJTevA5w/pBJGOt71To2XDU330foZEHL+/rUpjvMC7rJWwL6/ZckJBXKh2Ht3idI+sw
         xSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441498; x=1731046298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzoFJly/IZv/pxBeHPzRoYbyHVICd310aWVYgU7yi1A=;
        b=fIek1pJx4EKY6KS1A07UbsqF7oVotxZP2gsnTdZPZwUac3YcLyw/sZdQ/PlQGaLE1G
         Yv7R+AO9376/BxbTjSXHdmdBbn3StOsEaSJtJ56UNiF5t06K6VmVnXrOgIcbxKFvnhtz
         ZHff7LrkrL78PgYFB5RIuE5wc18Svl32T6Id1AQ8meSAVugmP6o77HkQaqAJKte4iR6k
         /tkivjjzpgnnl4Aahiu+zijlZXgXHxlf1ONmXmrVIWGtmUQdkBjtLvQm3rlt2QO9KT8b
         9vZZF0ta1RAZgO6uQRt5GN4j7e7U1mlz13bCDAYkLafEYkVl4HpiT2Lh7Yar58Cb3hgZ
         SdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYJQIL/HShjZ9zAnG9Sbh6Hdv28N8KbnBi3wNZ4IYe+L9wFOnakVtoEGTYMDccvzgZRd75xFc2+wZ65Lty/go=@vger.kernel.org, AJvYcCUlx1rjWGm6lAqiYyrc4eaQdO3YYtb9vYrCBun/A7U/Wr3pKpKipsVbe9SlU14DZ6nbhmlZEpqA0UUB@vger.kernel.org, AJvYcCVMeSMiHOittRn3DLEck7WYRFqUu5wDHE5ni4qn8FcZyeYssAlSbkFX4IXwXucYdFQusGvXnEG3mqONKQ==@vger.kernel.org, AJvYcCVwN8JuEx0xbzusDMUUW7n+FM+xpOJ1jDWKP8ivhwx4TbSFasaL0W6m43fNBzWhQtEZHSrsjSqpktJ9Hqc=@vger.kernel.org, AJvYcCW+7blr+KCxUxZwJQKApqPp6TkIKbpjUxkzjDv54NnXFCLau3H4TQKbBvn3vRj3Bx6M4TExe/pQ1h8e@vger.kernel.org, AJvYcCWCsvBFIGtFKkaKvgaEgzMwlqdNk5IlpKKQ4hR7/jpkUYbGGKV96sWf9LK73cl9mN42PGcHVP+iXavd@vger.kernel.org, AJvYcCWUwrvLT57pLbTiRwe85Nd8XG2qvfDDPcQvo2CRQnoODfCI6WEjvb9gGtNZpByei7pD8irbDfiySOaP@vger.kernel.org, AJvYcCWdqeetOrCXy8EW7ecKAbfl5GwC5ddSUtZ5qskgzvQsWZUIhjcOAj0n26bdw5elDkTRDER4HP/P@vger.kernel.org, AJvYcCWijS28Vz9vJEJSxk8TZ1szodtQ1a+NuK+ywVv2BCHkl6lYykk3m4iGtRsCpofr6Qc5zrdlBTykcg7NOz2W@vger.kernel.org, AJvYcCWmaYUjwt4nV1Ro0sB1L+5+eEFl7K3J
 rk4+zwTb94GKdKaVzckgPzhm8R4vBStcfS2HXYQO91hvPeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8COJtpWVUGbK6gkfpxubO5jEI1FWy8lStwyBltk7qZaltR40V
	VRorv8UdVjUPLA+9+Pk2GGlKWjFdpevtu481DztK+zs2Oc0o4viIt0P2SQdR1UXw+odVo5VFXhX
	4y7jbACbhnNYGeoYFopdJuQu+BVY=
X-Google-Smtp-Source: AGHT+IH7DeTGYtJCfx2zi8GRVSwaVViycaNFXyMUeR15bSll31rLaHQT6exvev42RR5TDOOECfpwjOBeoliFCUJhfv0=
X-Received: by 2002:a05:690c:e1e:b0:6dd:bcce:7cd7 with SMTP id
 00721157ae682-6ea52551ef0mr68329527b3.42.1730441498036; Thu, 31 Oct 2024
 23:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-7-tmyu0@nuvoton.com>
 <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
 <62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net> <CAOoeyxX=A5o5PhxpniPwPgMCBv1VwMstt=wXCxHiGPF59gm5wQ@mail.gmail.com>
 <817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net> <02f05807-77ae-4a3b-8170-93dd7520c719@roeck-us.net>
 <CAOoeyxX2Jk+76Cedu5_ZGgeRCPmT8Yhczmx7h+K-za7r2WS=Sw@mail.gmail.com>
 <20241028185414.65456203@jic23-huawei> <CAOoeyxXJa05XxTg0JpZ6GRV7XMMa3Rct4+c5Q3cqCtW9KZzQLw@mail.gmail.com>
 <fe2a7f2b-6405-4be7-90b5-0490761908db@roeck-us.net>
In-Reply-To: <fe2a7f2b-6405-4be7-90b5-0490761908db@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 1 Nov 2024 14:11:27 +0800
Message-ID: <CAOoeyxXd5iN5O5+8epHcoCdNr21CZRjXUFy_i0+=CmPe-6R_kQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, jdelvare@suse.com, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Duplicate drivers for the same hardware is not acceptable.
>
> I see that so far only pwm and fan control is implemented in the hwmon driver.
> There is no public documentation for NCT6694, so it is difficult to evaluate the
> chip's capabilities. The summary doesn't even mention fan speed readings, meaning
> pretty much everything is guesswork.
>
> Either case, I do see that you also implemented a pwm driver which _does_
> duplicate hwmon functionality. Sorry, that is a no-go. Again, we can not have
> multiple drivers controlling the same hardware. A pwm controller implemented
> in a hwmon device is supposed to be limited to fan control. It looks like
> the pwm controller implemented in the NCT6694 is a generic pwm controller.
> It is not appropriate to have a hwmon driver for such a pwm controller.
>
> Guenter
>

I understand, I'll drop the pwm controller driver in the next patch,
and implement only the fan
control functionality in HWMON driver.

These functionalities are actually implemented by NCT6694 firmware,
which supports up to
16 voltage sensors, 26 temperature sensors, 10 PWM controllers and 10
tachometers.
Do you think implementing these functionalities in the HWMON driver
complies with regulations?
If the answer is yes, I will drop the IIO and PWM driver and implement
everything in the HWMON
driver in the next patch.


Thanks,
Ming

