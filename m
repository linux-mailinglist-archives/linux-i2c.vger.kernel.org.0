Return-Path: <linux-i2c+bounces-7569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C19AFBFC
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11A311F22E55
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 08:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB75C1D131B;
	Fri, 25 Oct 2024 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u5wdzNpC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6D1CFECF
	for <linux-i2c@vger.kernel.org>; Fri, 25 Oct 2024 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843492; cv=none; b=n6L/kVfKaWYDilAXWTi6R6QxJ5cJW72VGRlT2w4eXnDroUE1EpvgyoTEJ8R0cGLQfIXYNZEpB9fiVjGP/7GYo/4UZ/+CppQ0vL+XCvEk9mp2Y6QCHep8c4drHWdj/mdiIfQWvW2iCXyq7oHThWyp6UpufXB8dVNL8JLVYZV6iZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843492; c=relaxed/simple;
	bh=LG27d/Q+yaHGWPjf2V5sya6Fe2YC42WZL5WrAo3sYzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNinc6uSf6fCJ2Ij88Axn4fOrkGYZAmjrGKWG5rNp3aHAbOFLGzHqGjTlpsrZpzCVhURBKDwMmQ8KIeyPj7mTSC0HbHnGa3f0n5SU+SmIh/WCJxWgoQ7pTSHCgWLz8/KsWX8t0dJUmxRXWRy0tvc3KDkRECvytK9rkzvkQTUa+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u5wdzNpC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1677722e87.3
        for <linux-i2c@vger.kernel.org>; Fri, 25 Oct 2024 01:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729843489; x=1730448289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG27d/Q+yaHGWPjf2V5sya6Fe2YC42WZL5WrAo3sYzw=;
        b=u5wdzNpC6sFSsSqJ6U7oFv9JrL4MWmHo7xxjknEMthUTAb8gYI6ZVWsEnBFYENPB4J
         Sp/giUW9N2Bqj0Mxrcnv19JSagNa7o9nJD+0EU5J2Sj5O7QlUBdksfLFL1gGvenCywLC
         5QLPD1cX7OaQWtPb6hRDdbxWJMk5c9pCFEDaNM3aSnw9qD2AgluaZEMkA+IxKHG4ykTZ
         6kxCfjYTYoekKabI9lAenIF6SSqQ/LVMPjVzLR4JmuqsLoD7FwSDdWNc9Knh+3Stq1dj
         ZqJ+Boe05X4FURUTaL3qHZRT9ukuGxk6SzOPJ2lSr6usKSJVQy6Ng7IJq/q6woh8Uq2o
         mrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843489; x=1730448289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LG27d/Q+yaHGWPjf2V5sya6Fe2YC42WZL5WrAo3sYzw=;
        b=aVDHalBETazS5lYekBrafweYFnzmKlBH0gm7tMgrSmEy+NOhtJjFC7o0z1iq3I/tbB
         rOZGJjo+4turs4lP2CWC1ZIp9rkbdcMnzopYoRN6qSJdIvXFkON1lPaIOdPJc0fWWkk3
         e5GsSsdFT1q2KAa3mvVDXESbEStU9wMIoMBkD021jO8ehVI5RW1dlefaG+76d9lXGlnM
         SnRzPbGfulpaEjRF1aNsxbWyC6S3EiAehxMu/MuF2xMTY+NFJqQ9EjT2YjBWjzXCyaRW
         Nni3YURfNQDPIx652G+0GRirtjc4UOau/sPJJDaUaRZxwb7blHdCVDcWa/ELAFgJ7bd3
         5fsw==
X-Forwarded-Encrypted: i=1; AJvYcCXshn3/wWKWBa+OQTxnOz5JXymbQMynHIpZhBSN2tXC07pd+fcnxc8YRo0cen3GoRUwnHT9ziT7FKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjgJ/lLeQvyTazvHCUFRNkpRkpzW6HRtKVn9QxxVGtz+2xefb
	fbMJyoeNR4zv6xGpnGgpafzIJskYWNsIYsJIbQMx+NeeP1JQa1e5vvKYPYbUmtk160hG5zrD7Wv
	Gmg/ITfyMPAXjTHyJ76b1EKHYS/VIdS83A14zwg==
X-Google-Smtp-Source: AGHT+IEAdmGToJtfPEIP9Z9qjfoac4exMG44N9ap94ZRpqSgEEayDPPOyfI6x6+N6f+f12j0SBz2mkUqGZBDIwXyAY0=
X-Received: by 2002:a05:6512:3f1d:b0:539:f7ba:c982 with SMTP id
 2adb3069b0e04-53b23e0d752mr3031299e87.33.1729843488663; Fri, 25 Oct 2024
 01:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008160947.81045-1-brgl@bgdev.pl> <55ecee09-196a-4c7a-b7cf-61c19737735b@linaro.org>
In-Reply-To: <55ecee09-196a-4c7a-b7cf-61c19737735b@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 10:04:37 +0200
Message-ID: <CAMRc=MeTgFaySBFya2e=CYnrXL6R7s9D1DRq+RxKcsf56xMc+g@mail.gmail.com>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 2:05=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>
> On 08/10/2024 18:09, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There's no reason for this driver to use OF-specific property helpers.
> > Drop the last one in favor of the generic variant and no longer include
> > of.h.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> LGTM
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Andi, can you pick this up, please?

Bart

