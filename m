Return-Path: <linux-i2c+bounces-5610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B184959106
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 01:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF2311F22456
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 23:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5D81C8243;
	Tue, 20 Aug 2024 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONq7IcJ2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E8815E5CF;
	Tue, 20 Aug 2024 23:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724195934; cv=none; b=q46VI6Fywn8q3L9lIXoUeCxOzTuLA12bvy4YfVlT6u0uZ0dcO4oB+R/wrWz6n8wQtHTDtszLysE8EbkxILgX1L9UPjFrBymxSIkCy+c3DMufhKxySR48hXBXY7/ogzJjbZBQX7y3KBhu7Ja4GqRaL6pK3rzn7r1FbfFGW5c1T5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724195934; c=relaxed/simple;
	bh=d60nT1u03Qy3Q7s2fv6T2XrNNU7KG4m5JFfp1UY20n0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6Z15A1+UlQ7IxudvizLGeKz9K/Z4SfuONCBsGVqRSQUyYdLHAgILssV+rQ8U5dF99h0DdgBl2s92V6tJoIBqB7Rfw8L+UUCGHw3ZH4pL+GhCsKguv5YaqjSsw0NXUHjTQojvNHk2XLKB2fCWOCEr27xwpRPtqqRCFNUdj6re2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONq7IcJ2; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3cb747ed7so43614771fa.0;
        Tue, 20 Aug 2024 16:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724195931; x=1724800731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF6wfgyRdYKFN8d5+8XVfRoeXiJGMMUTPZXUm54bPBc=;
        b=ONq7IcJ27MxR0RbeLVryPUjMMJqsg8vhlnbI9FB9V5d2C6krXvJxDVHVw/WqGUeHPI
         XzUwJddU6EKa24z1L22uLfFt8Qn+iFfflY1wWhSZceceM2MK9NgApz0lQAkHwsaBue9H
         Lf33ad0WsO5Ea/saBc86F669pWXTPyxTNYwKjy2HkBFzUofR0cBsCrmOf+xWMT9vQNIM
         ygVBKSDIHlP/3wHlPFLTHBvjSXj5SM+q/tnyEzbtVP4HlsChsIqu0gtQA/SoDoU+MZh+
         p0YFBNWhKvcso6nxSxftsv+agdIUORe4yQ3klXCHlq42SQVi522OKtid0WQRNUMip9Df
         gi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724195931; x=1724800731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF6wfgyRdYKFN8d5+8XVfRoeXiJGMMUTPZXUm54bPBc=;
        b=BFZuX7lyW7MYqYQyqKDLJNgVN6/qHFKvsOHEAJJV9dzCpuIxOJruHAEMHQkfOBd2Uf
         9wkOfzvivejarsOQ9vOc+VaXDfTQXFFlQxJzrIKeMsuuvX3PctbzbTX1bFcjfapqQR+8
         dRiAxuyWLKSD5BvRfQkD9VKf//qc/E874xkhXDdydFsJfE3rco3PRMtpi2yZSpV+BGoS
         x3AZqlOa63lMIJHQQLC6irmPMor8ET2y3WWE8jbm9cIZU5QG/epUVafjV9Q7b3wJ/Jb3
         KglC1e8QS4hsQzUpiBGsEBowCAR6DSgmuKrXNEV1iUhgcv95xcF4CfAWokg/cEjjtBxh
         TKpg==
X-Forwarded-Encrypted: i=1; AJvYcCUj4/Rr7fJW4RUM7s9fsZ5BW8Zd8JVaMNtrL1zYkSYIIiMC1qfSbtxjTBts8/1FHcaLDu3vaGmEbC6d@vger.kernel.org, AJvYcCVjKQHliUJjk2pI12pMoaC5BXTdREbJxHtAhUtQKSMDlX9GjslUJ4iNO/axuyrIi5QeLvdMsMRD5VPr@vger.kernel.org
X-Gm-Message-State: AOJu0YzZUeDqdFsenziRWQnBWRzFP7Vcaqp3h7FkyjEX6w/8fvX9NLas
	7iuLWQU/OBYe23cBWheQK0omh+GfNlt6o/oXcUJHjz4TTmwpYGHWBmtZ+Y4BuvHslA8SKU0Ia9L
	4mFIKRB/846psR4N+GZJYOiJxlUY=
X-Google-Smtp-Source: AGHT+IE1Ov1daYK0RsGFoMEB0RO19ht78k22yFLni1S5zEZjKgYuK2roDvpFAcrUbgGVXqiTfaLBjGwsK78HhqStM+U=
X-Received: by 2002:a05:6512:3a94:b0:52c:e084:bb1e with SMTP id
 2adb3069b0e04-533485565cfmr211475e87.13.1724195930268; Tue, 20 Aug 2024
 16:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
In-Reply-To: <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 20:18:38 -0300
Message-ID: <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Tue, Aug 20, 2024 at 7:22=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> This is where:
>
>         ret =3D regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chi=
p));
>         if (ret < 0) {
>                 dev_err(&chip->client->dev, "failed writing register\n");

Yes, correct. This is where -EAGAIN is coming from:

[    1.745657] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.752502] pca953x 2-0020: using no AI
[    1.756579] pca953x 2-0020: **** failed writing register: -11
[    1.762510] pca953x: probe of 2-0020 failed with error -11
[    1.768298] i2c i2c-2: IMX I2C adapter registered

The pca953x driver tries to write to the i2c-2 bus before i2c-2 is register=
ed.

This is the point I don't understand: how can the pca953x driver get
probed before its I2C bus parent?

Thanks

