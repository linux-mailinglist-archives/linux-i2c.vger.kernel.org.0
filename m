Return-Path: <linux-i2c+bounces-7155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B508C98C5B5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 20:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 441DDB2213C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 18:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4490B1CCB58;
	Tue,  1 Oct 2024 18:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fbyh1WRY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F31C6F7F
	for <linux-i2c@vger.kernel.org>; Tue,  1 Oct 2024 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727808759; cv=none; b=K3gP7/DWd1euxGVum5ueOYBcJr/Sbg1Kf03U8G0SjxuyxMNHmOrDoq/JnpIJ7lBfXJ4G7VKxy8lVjJ8sO1px852OCu9jv1RSBbOU5uVEaoAAWFF4+CnYMIHmr5MYdpZS8lVQIWsOQgwSF7sxK9oRStK86z3o584PghYvsSbinsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727808759; c=relaxed/simple;
	bh=sD8E4e+PPFfoPemdrxEApnMQulCxcLHme5ymLS77OkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSWG3Ee1RPWEMbj3HkUwDmkIAm28VFDqT8/2zM9k1mgbNHZQVwZG95WiyVol5qGwW6SINewr4UTPr72wZK0WwGjEhnuzzKNpJu3L8+OoR87MNzBE15B2Hw1RXF3xfXodBlA/ujvtxLTSh9QEWX88oZcWdoEeS5UIl4qgLs/vgl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fbyh1WRY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5398ec2f3c3so59788e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 01 Oct 2024 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727808755; x=1728413555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sD8E4e+PPFfoPemdrxEApnMQulCxcLHme5ymLS77OkM=;
        b=fbyh1WRYT5iKrurPqvG/zXCY4YTt4zA5d2I4oQrAgnycvOSuoNcALMcWNCyDkgRr9C
         OJSrgyvUwHy7gH/3UzwHZ4dAEI1DbgdnTdR/gg1xmSIrCnsoAORTNRBh/JfJgctnQOQ0
         5WFTSiTYJD3dgsAE9Z9xRRDNtWw7XL/iTR5fOZBNdEVIZNkf01duKbc77I+yclER8Wm8
         s1k+MIYn39e45qrZImZzpnWd2nkYc1dcbACAW/PVCkPCv3vjuQCFsBtYtcGvW1Y5WfxA
         XtVCBhXunuyBZh1I70LvzmwEFbszDFtjM2CJj5YRovdLtR5JQAx0DZ8rPCmnTn2iidMU
         l0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727808755; x=1728413555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sD8E4e+PPFfoPemdrxEApnMQulCxcLHme5ymLS77OkM=;
        b=PFKflLSputmmgh97yvXy7RsvnuP1cTeptafdRq3hMRXOSuQz4xm6FwHYMceE6ALhKS
         CcSXOL0mKNY8vSzJgtlb+CjMjBZFE7Lrjok6Tyk8Q/UL+wlBJEf3M/PVPV+GKWXWOaCN
         FcQC/VQJWL/yovdy+hvd73IwTNgEJFaMJw1SvLYrlEJSODuFH6O03QppMkERUEVAhN/2
         8+dRfHLr3e1Vv9vUh+9QqD/WMyN1yo27Fer/USC/1eK0O4WQ0Ml4ld422XezEqYK3qGz
         v6E9D2PsE/Iz+VQ0zKa1SKNfitmv+TDHGTp53iMm0nKi9ghTTYoKX/lTvUQrob23uXI0
         LeUg==
X-Forwarded-Encrypted: i=1; AJvYcCXxLQhG9oLDmHa1kTGRLjtEnW2HJoHBItGBCaq8ppIYVDEtrQEfIpwE+/1Pz9wvR2kA89NTYTw9Qt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/NfDjgRKaIZSTEfYqCdahMbA5DXWPX6Z6g6F+ps7j9prThof2
	krr/cqcYcj/3J75dNrd6FWd8uMmXVc2d5b/tE1XY3e7T+KGqWKNsQiSUJMP03bS0gM3onzYDQEQ
	iWSP+88OL38BYjLF0WvEZ+r9Ao/IXSL9mBvBTUw==
X-Google-Smtp-Source: AGHT+IG41sCRZbM6//whDIpTonuwAIsnbWZRJaaYzsvm+L+r9ge26qwBfuwOHKSHxHakYmEWv1+JQdqE3PMHOMQu+pA=
X-Received: by 2002:a05:6512:3a96:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-539a066336fmr236090e87.14.1727808755057; Tue, 01 Oct 2024
 11:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com> <20241001-congatec-board-controller-v3-2-39ceceed5c47@bootlin.com>
In-Reply-To: <20241001-congatec-board-controller-v3-2-39ceceed5c47@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Oct 2024 20:52:23 +0200
Message-ID: <CAMRc=MdGYUt25kE+rVHvKhgLw97aS7KDLHRXv9M+G5sz_qqYZw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] gpio: Congatec Board Controller gpio driver
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 1:54=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add gpio support for the Congatec Board Controller.
> This Board Controller has 14 GPIO pins.
>
> The driver is probed by the Congatec Board Controller MFD driver.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

