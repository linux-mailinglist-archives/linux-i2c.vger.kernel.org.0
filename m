Return-Path: <linux-i2c+bounces-3058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BDE8ADF81
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 10:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E288B24894
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 08:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B134D5BD;
	Tue, 23 Apr 2024 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ujh1m7Oj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE8F10949
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 08:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713860049; cv=none; b=potqdRZDXWVJiYYK1xBqM0jbXBYFI98sYKqOmAH46WYPw5wkqfwNccyeDlOP1MF1B4Rkyv+DQ6yiP0BhSP5Rroh8pgr6eKXb2lPXjD08txsjBx0ftppKzVV4mrvaixr3lYILAs77PUu4O9lq/4+zyvX5u53+XRPncmv7afsbU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713860049; c=relaxed/simple;
	bh=G2XMAS/2nOFbF5ygFwHume/DKQrQBVpGicjHQGx3ULk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9IMQNX2Ir4gso/d6jH/TeUJc28IuLtp8h1pMEixrOMV9+oErD+yfP2nzPidcOeKu6AfhlyaHaXD1oMjiL82wv34s5ssCaoueArv6/2plyG4xGfx/z75u5Qs+aGfo/CRLPMZu+IjCPDedJqSrFIgfoYKVJ1Ac5sIxPcukaj+VXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ujh1m7Oj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51ae315bb20so3709849e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713860046; x=1714464846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2XMAS/2nOFbF5ygFwHume/DKQrQBVpGicjHQGx3ULk=;
        b=Ujh1m7Oj9WnVALsuKExEGRdukKWAwwyPd0CjPbXkJT/x6fhfFKAHSRqJlSLTH+cj0f
         FbLwkwa/fLtnazTqurrTnmFg/SATsknre0CwE+E4QPWzIHxihBKCenFqQrpSvdVgIbaP
         CKy0ZOl4d8aYlo3g3Vr55BqwGDtrBAYCllx8k0I6AHlEJ1NwYgXSBtpir3vWg8gtfhBI
         1ZO9iVMNznyeAqtp32QQQIqKI+eOuE41UjMwv9CaFZAdCax/K9wOAi3SFcnFFQQ+b1Aq
         rmeTnEnU88kgPLnfEpCYgsdoMVDq1UzHgmxlvbEnGrLA25WEDtOYSgZ/LxZYNcyz8ssd
         h/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713860046; x=1714464846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2XMAS/2nOFbF5ygFwHume/DKQrQBVpGicjHQGx3ULk=;
        b=DDT8SGyY5FQN0/VaWi6Gwk2FXKVaDO9A84JdO1nG8/d3SKDJWoyNOVeYXRvXrBNm4t
         937gCpQDgciokpIXfJb3oThha6m6rwRK4k9zZhRSshRLb0FolhiWtyL49/OQlj7B3z40
         Fz8rtruwwePUHP/8qA1JnxBoKflRCuQeF9HUv3lt1lP2d8oqc84IahFaQrQq9zEGFJsX
         +oKjwfTgFSq5aBmx7Z0gzxCkBEsJfmQbaEHdGTvzyk1cB1+eZQQxReNj8dRP11kzEWlo
         xwJENvprAQbgGVKrsf7sP91vYmAHZVHFOackm+MBBaotumoaZduvq+pnmJHIHmJ03Ozo
         dJWg==
X-Forwarded-Encrypted: i=1; AJvYcCUuJBhQVp/wOHs1KER7ZH51/NuEsqfnFmKjt1WPAeM4SM72B13F5nEjKtclpkEuGYj4DacKYFFsDoOEfUK6ThsvdyyLDJjgcBbl
X-Gm-Message-State: AOJu0YxVe/6VJdG9sDZRHTTUIxbost2lBn5t6WhtXLfyYpbFZN6ECBWX
	CkliM58/cwvJ9mcXsMQKuPUAp1WjyaZjV77ACo3ZYo8aW1aT4QQyiSVUQlxOF8rbrVjOazjzd0h
	EydL02jMx0Dlk+HTnezkBSyn9sh0Cxq2FaaAXUA==
X-Google-Smtp-Source: AGHT+IEqIjrpXL8hbzlug2nyOdo3DkQZYKQEzNJ2dsA7qTtdOAw0OjD83wxQWvJGHM1B7Xj4HS3T0bMIR9XXnlqH4y0=
X-Received: by 2002:a05:6512:3090:b0:51a:f255:ade3 with SMTP id
 z16-20020a056512309000b0051af255ade3mr6588814lfd.20.1713860045873; Tue, 23
 Apr 2024 01:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422174337.2487142-1-dtokazaki@google.com>
In-Reply-To: <20240422174337.2487142-1-dtokazaki@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Apr 2024 10:13:54 +0200
Message-ID: <CAMRc=MfhMZPfCRGBwsWQFxvyWtL5mE9A21vNGSKhM-Kc2h5xrA@mail.gmail.com>
Subject: Re: [PATCH v3] eeprom: at24: fix memory corruption race condition
To: Daniel Okazaki <dtokazaki@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-team@android.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 7:43=E2=80=AFPM Daniel Okazaki <dtokazaki@google.co=
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
> Fixes: b20eb4c1f026 ("eeprom: at24: drop unnecessary label")
> ---

I will take this patch because it does make sense but for the record:
this doesn't fully fix the issue with the nvmem race when tearing down
the device.

Bart

