Return-Path: <linux-i2c+bounces-5622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35D959A42
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 13:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CC9F1C221A0
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 11:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C241C32F3;
	Wed, 21 Aug 2024 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTzF/4Hs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB561C32F6;
	Wed, 21 Aug 2024 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724238097; cv=none; b=WqXcBFUqNrt0e0/y1gOEqZzXn5aOJI+XsVa/AEuo9NX07aE3bwnacBXhxvUvYj9FPzzQdSWg6TxpgXeayZJ0TWN6hTB/gySKesAJOzJVroz/akMEUb1ScfhrodOpRhfOPdcB9CMjfxQjbzOAu+mCsnHYYsXKxoVERQ0g7TNSaX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724238097; c=relaxed/simple;
	bh=1ATWO0C6NeF9kO9VsONSRBSudFtrKwUszSwK/I+7QXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egskFr/kL1MgaWZBxxt0ajg8y7gyxfhhy+MZ94n7ylZx/CjG+bDP9GY5pDFVMB71q6BxXlLGM7AwmRTdiAW/lCt3oJOPjWdiSU5OCIR4LeJ/AnlY98wkF1vXzpm7AlPAkQ7jBxJ7bPsH88WHHUTgnD4POVjvv4oIQjMOm7OuANE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTzF/4Hs; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ba0527a2e7so33535777b3.2;
        Wed, 21 Aug 2024 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724238095; x=1724842895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBwBSeUXzRzs+yYCt0wfdPJMoqP3GApebhtlrFr3gjQ=;
        b=BTzF/4Hs/huwQYkXyFXLogHuUL6Zbz/iy41509/pmUVGQmsbGBrMcacd7Rrg+hMEMT
         szoG0SmrYwruziPgYj5z5OFe4U7mREed4Ez91ehT5urKPSOql+9h/HduADYjOggZyAk6
         a1otp2ajM+60/HZwpKXTXP/2VJnNh49e1LhNVgjwi6LWz1Pov+aerp0BMtcjJ3AJL3TQ
         4Y1Vg67oUbP89RRVnqWZpYKGJeOa3aMVFuKMInKb/dd7lQaBvsOPKP1gIZnT7lLkHiCt
         N54p1Zc4M4wnkciMSxfNQwM3wUIkELqbH13wl8nVrrpAqVio1nVzoujzJWebeuskM+5E
         5G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724238095; x=1724842895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBwBSeUXzRzs+yYCt0wfdPJMoqP3GApebhtlrFr3gjQ=;
        b=GsYJ4xx0xOVsdfHffWpkDqwOHYgPBCsmMo0LxKsEFti5ULtQJ2mMkOakmfged7LOzu
         Rh1vD0T0iIn+q00XnkqKyrJ56g1oM9cCKLkwX5okz7sbG82Q9zfGjXoDPwE+54NIosk8
         v25ZfN9aPPAEqtG0JzyTB0aD8ve+RJtvT4Im+KRQLGUJfD9sCsp6GVCZbKbj8ugJK3MF
         U1Zoc9RAD5eHW6UwK8t4awOf4On41HzaGvHhAm3a4kv/7ANAtRp2YcAezVAV4uGWnaW7
         QE+dryJHZI8S3ARYPpqWxwLGmjb5UIN5EGQ6OqcfCTWBCpcjbnTIQLveevUKf8wBWqzl
         GIHg==
X-Forwarded-Encrypted: i=1; AJvYcCUWwm/gZ35KrhxjABgVTpQ39lWrzlw6CPwgnDdo0gmOfN0VZ5NWFINWqXIGNflASIZpY2lJglNL1qLGg3ZF@vger.kernel.org, AJvYcCViZMR9l1ranOO1DuJGcvkj232lDMGLwNzDZ5E7X+K5IGW578x4YrcEqi7G6oL+xeTxyZRGjvf3jCk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FOXJQhEJDcMrhTYkguMvqP2Xv2rDsQp7wc/s6tytGKL6kePW
	I0Ii2hLBmwUdTDTCHrN6vnLp9Af5JxOBq4VmUcmm0u5BebxVVCYb+AElfFBpmjubQxcw+Ena6WP
	eQ/ZbQWrY934arCj0wlXRi2ZzTIQ=
X-Google-Smtp-Source: AGHT+IFflDUPyRh/p1DW4PuCPtZ+YVQiKrj5ChifUTm7Rq3hEzBgJXAAr6Hid38Rs13o9exyvhRkgp1DGzTf+pLUgng=
X-Received: by 2002:a05:690c:6d0e:b0:6b4:3caa:e842 with SMTP id
 00721157ae682-6c09d8dc019mr27805677b3.18.1724238094553; Wed, 21 Aug 2024
 04:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819072052.8722-1-eichest@gmail.com> <20240819072052.8722-2-eichest@gmail.com>
In-Reply-To: <20240819072052.8722-2-eichest@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 08:01:20 -0300
Message-ID: <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Mon, Aug 19, 2024 at 4:20=E2=80=AFAM Stefan Eichenberger <eichest@gmail.=
com> wrote:
>
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> According to the i.MX8M Mini reference manual chapter "16.1.4.2
> Generation of Start" it is only necessary to poll for bus busy and
> arbitration lost in multi master mode. This helps to avoid rescheduling
> while the i2c bus is busy and avoids SMBus devices to timeout.
>
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

This fixes a pca953x probe error on an imx8mp board running linux-stable 6.=
6:

[    1.893260] pca953x 2-0020: failed writing register
[    1.898258] pca953x 2-0020: probe with driver pca953x failed with error =
-11

Could you please add a Fixes tag and Cc stable so that this can reach
the stable kernels?

Tested-by: Fabio Estevam <festevam@denx.de>

Thanks a lot,

Fabio Estevam

