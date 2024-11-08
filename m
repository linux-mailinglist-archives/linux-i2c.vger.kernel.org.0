Return-Path: <linux-i2c+bounces-7905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCEC9C2567
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 20:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4FDA1C23795
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 19:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A001F26E6;
	Fri,  8 Nov 2024 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bnhapw5f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647201F26C2
	for <linux-i2c@vger.kernel.org>; Fri,  8 Nov 2024 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731093085; cv=none; b=WRteD/dD5k+eDPLbKSmHRTv9Q+tsG6Ucnq3EtqGcW8a8iF+TgvU0z1W8UFQsG4iwUuXE10XkH1N19PSCEJ3i59265p2mnPLxmEYckH+mVlGLb6Wm8LspGcQ6E/xresXW1Qwp6gwKCfwHDckIIfRNM+jQcT7uCR+62qlT/3L816U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731093085; c=relaxed/simple;
	bh=VIRkx+efX/6GJFRSs+ScK+sQvOdc8uMwqc3bnd22j8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fl0rdC8tf0dzmg5aZdimpRHp8T1qC3wIZxTtXMzf/2jlYML3u98EJGpr/rlOCcKBzTGy+MJ7RPeHQ2WTSWL65dV4C2/fHqgwcXGc2LTt3tf0KZi87vKta6Gz+3aaLsHpYRaIdn89dWS3WZmGF5Y1FzVevNjt/Hv9gn+oJCxFL2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bnhapw5f; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so21937871fa.3
        for <linux-i2c@vger.kernel.org>; Fri, 08 Nov 2024 11:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731093081; x=1731697881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIRkx+efX/6GJFRSs+ScK+sQvOdc8uMwqc3bnd22j8Q=;
        b=Bnhapw5foka1Ig1WeR6wObMuvHk+Lkrn7kqmlqF+/eF0YfntamtnA6RoJgRnXGf8Jv
         YY8KT/AFztF1GTtnF2u0ZfaFB4SENE1oc2ohWEwM+3YJ6l3x/q8xm+gMvfb4Tpurs9x+
         G3YrI9rB0ERKoVnfLENfxxzYRGlFQAnWdT8O1Tm9EvhVk7W1RieTNDgGPABuE0KxIdMZ
         WUGfSyzxXFKUEHiUVSJ+REFhwODHSMZGwOa8jDg+WbsWtfVlAboZivA5VPaEXC3Crva0
         S6sPm1NUgCBrLKt8FTfWYA/NddiT8ORoS+FPzyqc8A7RQlBcWwCmySP12MrPwhC6gq9m
         qUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731093081; x=1731697881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIRkx+efX/6GJFRSs+ScK+sQvOdc8uMwqc3bnd22j8Q=;
        b=uvGPqgMpQz4yJWk/8dOwzkWl8KXRtt3HT45npcJSReKDU+TppVsVS7LybxcVdo1nmZ
         CrRbX+sw2piMaWgRq3VOn+Fi6mT2fAjWYg84xTUkh2ZOvzbfvdLmOuUtr3o1RmdUIDpL
         9rWxBZWCw172KarQ3YqpLVQCYWeySr6J9nsVdHu7rex9vLKHZIboCVJ7vw5g7vNnEW6V
         CVMZgI34vX8wS5tY8dYzfw3E5cq2EurzxNb1IoX4P6nUqlqLe/26lutBpXW7gxx6Ze2t
         soLatI4H9GMwSlZuDPdfiCydTm2uN5sTGaKadjCkTUPk8b+JFCAP22abKrr521TZxTjy
         plAg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Qpmq58bi36PM+6tIgqqpJsapcEHjchDjHGSO3zZSh72GLv1Jv+MD1n4y9uFNq0KqRhQzNQ/W4gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSGiwWkU5z2uUBhREddeSCpOHSqgb1upAMt+UOjX+gEri817g
	vfagJtL3FaV6RqFgSNltbLldwiZDYZ+e1bBXBkv2jdKKjLAzXCN6lsjh69dYV9895WP2sUnDUjm
	hYnY7Jg8vThbMrx7MnZvyyfe000MG5BJwbzYGDg==
X-Google-Smtp-Source: AGHT+IEyu3ErGRSaoQFi38Acb6XQ4BU2dWUjhmoCrPXW6aChPPUQ0fFsyrxlijdB2I2MeCnQFX6bAQ4S/Z/CIgMGk7U=
X-Received: by 2002:a2e:be24:0:b0:2fb:591d:3db8 with SMTP id
 38308e7fff4ca-2ff2028a90bmr22074941fa.35.1731093081457; Fri, 08 Nov 2024
 11:11:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220616013747.126051-1-frank@zago.net> <cf32d676-831c-4c3f-8965-c9be3abd5300@gmail.com>
In-Reply-To: <cf32d676-831c-4c3f-8965-c9be3abd5300@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 20:11:10 +0100
Message-ID: <CACRpkdb-VWnOcHBcHOfMMxKicDGvGt3vB-dSo2nhz_M7oxq35A@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] add driver for the WCH CH341 in I2C/GPIO mode
To: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>, Howard Harte <hharte@magicandroidapps.com>
Cc: frank zago <frank@zago.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
	Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 4:58=E2=80=AFPM Matwey V. Kornilov
<matwey.kornilov@gmail.com> wrote:


> Hi Frank,
>
> Are you going to further proceed with this patch set? As far as I can
> see, there were no updates since 2022.

I suggest you take it over if there is no reply in a week or so.

IIRC Howard Harte also has this very device inside the USR8200 router,
but I don't know if it uses the I2C/GPIO portions in that device.

Yours,
Linus Walleij

