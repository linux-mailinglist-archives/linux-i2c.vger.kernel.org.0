Return-Path: <linux-i2c+bounces-1132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7E8250C6
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 10:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F4828522A
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 09:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4332C22EF0;
	Fri,  5 Jan 2024 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m8dJbu6n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847FE22F04
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4b73e952ef2so328280e0c.2
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jan 2024 01:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704446586; x=1705051386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmNAC7u17lO23Io/rGh/z8NMlZ+4NCrMEvkwZ8tJYeA=;
        b=m8dJbu6nZHWK3z6WRR6PKhsCwcWGyhBKJgxZFUMl86CxWqwU8TQpXrn2XuTWDdBPxF
         ljzAuNSV/3BtoQllq8RJfyDkT3p0PrrxX7jXYa0SuXlhZ65Lxh/0ZJy/RGLtJl9VsmjS
         J823NX8i5YQ2vomVmQon6I6HGijfsOQuDb2ApHs+HTq7QR0bepuA5cWKxGntAE01dyii
         /k67L2HKbtlIJ6QVG51cG5VedfqbihboA6+AjMopCDdLrxzBE3YbF0Y9wUstEKXxBvIb
         wavM1cfHMqs9SDyfaZ9ku6lI/PyWhvcLnxw0lxU2OFGzEcD1/lOx1UyN8Zp+ggcb5AjT
         2vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704446586; x=1705051386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmNAC7u17lO23Io/rGh/z8NMlZ+4NCrMEvkwZ8tJYeA=;
        b=mG76vZOiy776kjH9F0oRB7e11xx/WGy27Zfr+pwMFTSMdEZT3Kg/ncjaEZopKOF7Yh
         zImNctmyfhozv52OdaCbh2ukkeqNroouclo6vJvEGOnc0eTRimlHzdJpNrCe3yIZyuHs
         kUHwgmT9ZHehXqk/eDqIJeGfz2jF6uUMJ00+oBOPNWY6OvrccDQGI7JSukT48jiSc29t
         FECVPydk82dkrYPUCtkFiFYskYvHnXYHpTl/l+Ux8q3qHRVZ7YAKqMhogJFv0xtRun5N
         RIw/dkAtS4vnjmsWcF9keYl/c0nalrk7pd52aH0Y8rcQgLF/rPrAzFK/8X+LkBB+l/gj
         ICbg==
X-Gm-Message-State: AOJu0Yx+4o6lCSLrCLur/xzojwjbnDxbjkOh8NlkcysaMmKPSNuW9Nyy
	Wa7bwDG+k4ah0M7Jqx3AXo1fO0kyik2MuZGj5VKLM0d4/s6jCA==
X-Google-Smtp-Source: AGHT+IEtLYR1Pi/7e+H2OQDuwftl/fJOgXhr8778Lt5aWGUjpHgRMA1KtKvgaYJ8xcBZ7QujkydccWgsPrF6TXaYSN4=
X-Received: by 2002:a1f:fccb:0:b0:4b6:ce08:cc64 with SMTP id
 a194-20020a1ffccb000000b004b6ce08cc64mr1074799vki.12.1704446586270; Fri, 05
 Jan 2024 01:23:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c3045427-da42-4f7c-8a96-3c4756646cd0@gmail.com>
In-Reply-To: <c3045427-da42-4f7c-8a96-3c4756646cd0@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 5 Jan 2024 10:22:55 +0100
Message-ID: <CAMRc=MeKEVFFE6Pw3KBXTVgA3Y0sUswBKAWqEOSDyZk_QLhQQA@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Use pm_runtime_resume_and_get to simplify
 the code
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 4:11=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> Use helper pm_runtime_resume_and_get() to simplify the code.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

This looks good, but I had already sent out my PR to Wolfram when you
sent it, so I'll queue it for v6.9.

Bart

