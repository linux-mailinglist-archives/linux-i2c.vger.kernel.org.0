Return-Path: <linux-i2c+bounces-13361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB3BB435E
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 16:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D7219E2C3A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 14:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FAE35942;
	Thu,  2 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ydIXfp5d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4702F872
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416601; cv=none; b=qAm60hDdEKUUk4X2tvHpue3+G7ubHPzb2ksbjh6en5X1qTDvbrRtImGdVYYlUOeLernBhkEchxGd9UJmL3ydkffSOHx0wst/IUm5oL+bEBvJnUnbJPSAwotl3WUsBgXT4O03v1R2OC2cviCGULB2bbe7Qsr07DR6Bc3UXkiL/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416601; c=relaxed/simple;
	bh=3DEtzWzJ+5AbtUuYByrnTkKmHNnskh1UPwBWzowwkgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLxeVQdaxGJg+L6nHbs9ajqJMey+boepAK/eZ9H7wiLdmOGKeVL8F9nK9QoKTsQ7IJVMuH5DPpddPVwBQMIQMlyK7VS8H0chYSz2s19YPtCggQ3gSxtWje+VRnNAs+suNj0HDp9UTECcwd42gIeJNYaW/Q9T7MhUgdeDCaObq4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ydIXfp5d; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-36bf096b092so15324691fa.1
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759416597; x=1760021397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DEtzWzJ+5AbtUuYByrnTkKmHNnskh1UPwBWzowwkgg=;
        b=ydIXfp5dpkCzuZKHZsEydCQOSr/Qo6bwdcESVHpvFsJkYDN1X+GueJ1gmP5EoBZ3C0
         pPa+rLyzZnoIlryxXtJBtwjhdypHk4JIiC2ejn1bYCLNOKUZyu/jCD/9PmwFJEuk6gDq
         oP5eA2QI83QoRML+ueEm5tL2dniM6LhFcEqvXZ99mnov9ZUNwoiFC/0pKkUn+LMekX0e
         sTV6cBYxLdiCj/sOIBlXtYi+e9PYEX33zLYWLZiQh8mvjrpk8ooj8CIOnDl3E4rDr8rt
         /n2Hs6fornyHh3gqgwZ5t+NMkCN0LrLwMf6VHml1k/RYzf7HZakbg6gqnAMSv/8AZrir
         v8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416597; x=1760021397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DEtzWzJ+5AbtUuYByrnTkKmHNnskh1UPwBWzowwkgg=;
        b=qfwk94Fkv3phLxUUEC1cOGmO8UCFzrGPu/U6O+UkcSSXH7cic71EIC8olKRCUM2Zna
         vEG6hFkGORV2BOMCT6A/TJUqdNSmiCQHEJ62VoR8bhZNX8ez/e9hJvPp5SbJxfZlmc9F
         i3o7vriSviMFdpJn/EEdIc06C55G+TENoMOdD9FbAW0Z4mo2x/vNBY6VmtgZUGub9izW
         HgnLcasddgPDH19JW0I67c+S48IXSEDiKUuMW+HvoqFlVmUZwYEzeaIMu1Afpr/ALO6e
         sjMES3e4okzF5zJkSSw+5hDaMgNk6AotVUTzYhG6R+qeke0Cdate8E5eGsRkAlstjn91
         VdNA==
X-Forwarded-Encrypted: i=1; AJvYcCUDdLSgvo8LbGwvCox3winWmCORhVjO/3eUOtv7Ghsa79rpx87RryacPpOwsm/egK5mSV0LccatBA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7GJsTWGRC3FS+Jtu1YwRPHohZLyUMXKu5a0V7D+OuMDE7L/l
	xymywE0JsJkdtaV3ckWWGQJBWlvEzPx+aYwsflj0Yxkvm0HNDcFvNRJassufq0P5sL7LZcvcSV2
	81TbWjAcKTkM+iDP4sR+WcrMwgSEqPlaB23Ik8MF3hw==
X-Gm-Gg: ASbGncuBdBykpzGxM2zf2psQB/pETPOg49pm+0eWEqaNJKqaWsJIytA+7FvvbtbXHA8
	ltLcbMZYk6fadDYmSy8Zn57Udj7wEDQy8U63W1oUJLb6AjmFZa/mscWllyRFccD/kihgFIqEGF+
	VyBpEyW29TQ6fuUHX5d6vVc9FnAl5NrKvEr4y059tnNkuzpzIXDjnnnaZkfLgodoGV4fRoiJ/P+
	PlpRcnsJxBKaGgLdyMIuneHwl+xoKp9jmHxwymRUb2akSSyyuWzx9iVwuzOVi0=
X-Google-Smtp-Source: AGHT+IEFxaUXZbW4cydqpBo5P7Gi6kzBpFsb/v/pBDTMbOwFFLX/m9JHrRJwODjL2sU3sJEEl4mXuOKvbZUzvPir5oM=
X-Received: by 2002:a05:651c:c90:b0:337:e151:9ec with SMTP id
 38308e7fff4ca-373a711564bmr20327891fa.16.1759416597435; Thu, 02 Oct 2025
 07:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com> <20251002-i2c-mux-v2-3-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-3-b698564cd956@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Oct 2025 16:49:45 +0200
X-Gm-Features: AS18NWC7qjlJCo2wv35_zng7a-THUxjToC7YH2tPnfIiOSWbAAuz7_LLpy1uN60
Message-ID: <CAMRc=MdUHQmbDOGW1LMhE8iZmJszmC0oyOJYvVssap9wshBkmg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] i2c: davinci: calculate bus freq from Hz instead
 of kHz
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Michael Hennerich <michael.hennerich@analog.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 4:42=E2=80=AFPM Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
>
> The bus frequency is unnecessarily converted between Hz and kHz in
> several places.
> This is probably an old legacy from the old times (pre-devicetrees)
> when the davinci_i2c_platform_data took the bus_freq in kHz.
>
> Stick to Hz.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

