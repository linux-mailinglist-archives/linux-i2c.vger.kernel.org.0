Return-Path: <linux-i2c+bounces-7504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6249AA14B
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 13:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D75F1C23622
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AC919C54C;
	Tue, 22 Oct 2024 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w3pkMXVB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571FA19ABB3
	for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597440; cv=none; b=C1Bq8l1uGBQbYpMSBsnYwfSnfUHGE8zWNk9V+YQ1Mb7Q1jspk545rj3sWzz4Af1qdF6xmo5JG8OHx1t0phKWnTQVtkcBeTFYwJxjsR6b1xP8QgntvaVPucF5yz8YtJR6H1QmqhZt24Tfuen1mKDhvOTaGy8vXLyc5Sto12Ax6Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597440; c=relaxed/simple;
	bh=eBU03LmBOctVGp3oQT568nIvHtsc4hRjT+IESSBuhGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6rj9IIoh34Fa8rPE7wA+269DeszI+NH1oFv8Ri01uBMxc90DS1tJ32qOK4S/V+MJYATasbOwznfrKk5iFC+qshgf9WcmNqZ9hPKo8x/hau3HpaKvqwT1HRTU6BWFYLvHziKc6v0GMw1x3/5Mtx0i4uv/abuUXIJ/b+EibNsoRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w3pkMXVB; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so49657521fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729597437; x=1730202237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBU03LmBOctVGp3oQT568nIvHtsc4hRjT+IESSBuhGY=;
        b=w3pkMXVBMOj8FFJsS1BfBAs6LPmi6Z5zx9/+7Td3p8ahd7GgOnAD6ftGnQRAryDK/x
         qKPAHLFHJzNpIBNGPPYNWqObSKIpYbBC4zkP/xWgmN3/KESuEiMxE+cZOc1rcw9lzNCV
         YdvC5mfrrpINcgRLf2cx6lzCoU6E2ZYNqjqiQF6TfTMEC0yQyQzx34sK3oyHvgC8bLF6
         tNBxRRq+57pviehJChEmgAzAjM+z2NE9RvtcAEWCvLDGZH71CJRB2wAqLQQMsPN9PpBX
         EuIh4EJPnc3KzCGZdq56LrtsTvLEwrWZGq5QYcdCqwtDfrxFW4sgBaCMZ4lbsEEFry5/
         z8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597437; x=1730202237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBU03LmBOctVGp3oQT568nIvHtsc4hRjT+IESSBuhGY=;
        b=aVsx7jZusdHO6g0ZvpsT6LSUmWOFpNJmKPxpZBe8nlLS3schnSP2PFVnA1KL63mM7d
         JPbxjnT0cDYTcDC/IhoVYeC+0oHv4Wa+I2EFphzoPs1YQvWhSDhr/a8a0HLTD5IqQuZC
         PkpPds0iU1xI0vXFXcELgNnk3GrbPBWSZfuq4yNOmVdr7x0m4y/pO3yqXyvdcbKzr69M
         HxikcDeFQG4xX9msQMgvngCyA/YZh1AM98kuDo3y/AzK9/dDyRggmrc469Lk22UTw35Y
         IYfLxnSKqyFqPCuIb6L1WaHq5xa5viVW2s/k512h8UacKDiFc9X8oM99dyj/fbDaq9uG
         9gsA==
X-Forwarded-Encrypted: i=1; AJvYcCXjSNF14ekMwHl94IfE4fnVm585pNEp6zDS/FMFrZxEfH2OZobC5o7sdS5eLZjfne4NoAFpzMtDRuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOZKr4qOwYI53f1TcK9DIBCSK2SzBzEemw+YLpwJq2T9QkEwK7
	t7RsTe/tMuklLrRQc34CdLzc/xs+O35lECLMc+VqidjgcjnTiM5wUKzR0ttDbtpu0JuJdHuMBhA
	Obd7lCRela6gp1zhE7R8/j9K/DI30cyGqfnNgkQ==
X-Google-Smtp-Source: AGHT+IHv0JU0J9PGLy6ffpUD6D75+O0gIi950/5GHBOoWR6xI0HvKP8Mmi0qw9gOuB95udIKzZNZU/BQNe7LaDl6Z0M=
X-Received: by 2002:a05:6512:b01:b0:539:e776:71f2 with SMTP id
 2adb3069b0e04-53a154d04a7mr7743012e87.52.1729597437395; Tue, 22 Oct 2024
 04:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008160947.81045-1-brgl@bgdev.pl>
In-Reply-To: <20241008160947.81045-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Oct 2024 13:43:45 +0200
Message-ID: <CAMRc=McL8DzSeiYm2C6f8NeyGFtZ6FZ2rycx8y2OrenNCEH7hQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 6:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's no reason for this driver to use OF-specific property helpers.
> Drop the last one in favor of the generic variant and no longer include
> of.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

It's been two weeks. Ping?

Bart

