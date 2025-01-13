Return-Path: <linux-i2c+bounces-9056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD524A0BA2B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 15:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8031888B00
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 14:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD6322C9E7;
	Mon, 13 Jan 2025 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPO8LK3Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674F22C9E1
	for <linux-i2c@vger.kernel.org>; Mon, 13 Jan 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779357; cv=none; b=S2IbDAQd0d+8OuQVk4Smk9J2riO/PK73F0Z/oSATkdEL3du5bcAgNYWpOEsa9JjtxGjmBnfb1nHCFfVy1IHtIHV4tijKmJUoRhFQblOD8+f6bNg43eJvuMqMGU35Ga3MCXSNhZ5tuoWzCV8PZy+KEhlY/ahVXZ4BBjwbOAyggIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779357; c=relaxed/simple;
	bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0IsfnYiqLJFdNVIhtZVWQMrfmroV734DfDgJuLJ9UxZfW4TIDPJeZqezvUfn8Zweonejozz0Kmnmw4M9iovPTvV+0mTIjsrcD4LNhZihPVStUpPKGfgDh3ROWQtdYQDJu03aBdnqD6rWPPsuIm0FJKONA6vIcDcdofFM/jd75A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPO8LK3Z; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-305f529a987so33005581fa.2
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jan 2025 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736779353; x=1737384153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
        b=pPO8LK3ZHzhtuzWp7Qv6FslshKIVbUM9moWsnJxDXjErWmnt9WSQFmRanC8GmWavj2
         VWSa5I9ZVwtm4vnlKG4WwMGhGfKi3CzMScEtVkKmfOKeesesTBqZFAxtt1BeLKekdl4t
         sdJPeCGdFJG54YLJWLf5zKoCe9cKY0Zr3sjpenN5V6Df8/zklwLsDIi9euf3priKIIpe
         p5OmycaxzSZdxrf+N0k6b/ZuVxWIOaj+8tCAfx9tDzB/srwOxSuri2oPWS2Olu9b0oai
         2Aq7zlEGugacFCP/BEON1yX5ScuMAaPeduSXKL/J1140IHm2vRqiTPhN3x/zRCEQOdle
         fTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779353; x=1737384153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
        b=lbahx0kaINeKzzCBGFilBTvf8Izk/XGj/HCUxy0j7RalP+YOhbU8e/5P0I7cZ2Ur2p
         +ovnX9HIAumEbcGlNmyZ9V05eD8v7cssxW9DbC4ZF7srGLK/02Uq9W+DAphmtKwv3B3/
         bFbiRb2kOsQola59IN7W36kwsiP2+hh3vLJ97pRX88TOH/EOUyXEdfCm7ij1oKcht//4
         I5ZX5KCaEGh0LTd7cVO6WtfoeLgXF2LMNRsI8x/EUx4Kd9m7a6oAGcrjJLWepJe1I8+P
         AKl5iNggbLYWkj1YwoGZ1BAr1ebpnuqfA+hlVpPOsYO7CHsqkd9EwGNg8r/J6oTt1Hso
         UPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfER+h9JzDUOOJcY1IT5T26tVA8oGcr5n3lz0cgnufDKfRIsi15grNMEYUB0Je+Z6FhwD3eLj+g8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbk+RlZ0Ri49X0Yc67Yl+UY4g0LKv+u9pcuwQb9AEqRG6IKA5y
	Zu2r0UV/duvUPEZtLji+rRcsgWAb0aTMWbd/XSyPC6fWf4P1TXtDAujMHlGeI3DJBu4fmZGRceA
	HsRYGCXomKFo7gZxxgJzWt5drzSEjRJ0adWtBHQ==
X-Gm-Gg: ASbGncvwyBHYT/81U3RHquFeXbvtG1j8rIPcgenHskiY7R12Q0hjerCY+2DUti/7bLC
	8Ss6Ry6cG2jLvdMMvC09JPoHc0lhR6d1U5MLQ
X-Google-Smtp-Source: AGHT+IENOE2ll5qeBQdJ80yylesb06tRQDSUG+UU61Vm3q3uDxQQ0+DlCXsReKBTut8XEJ7ObVreQKDUPla+i1+OZQk=
X-Received: by 2002:a2e:bea4:0:b0:302:4135:7d99 with SMTP id
 38308e7fff4ca-305f455e7b4mr69133281fa.4.1736779353384; Mon, 13 Jan 2025
 06:42:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-fpc202-v5-0-a439ab999d5a@bootlin.com> <20250108-fpc202-v5-9-a439ab999d5a@bootlin.com>
In-Reply-To: <20250108-fpc202-v5-9-a439ab999d5a@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:42:22 +0100
X-Gm-Features: AbW1kvaddZgkHI_ZE8MDKIDy3uHycNLLq64wY8GBa-n8x8phy3UrJ9DEp0n2mjk
Message-ID: <CACRpkdYgJ_rbrTWh0HS-F8DJJ6u48uqr-zQ555o3Q4mYnFhjXg@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] misc: add FPC202 dual port controller driver
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kory Maincent <kory.maincent@bootlin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 5:14=E2=80=AFPM Romain Gantois
<romain.gantois@bootlin.com> wrote:

> The TI FPC202 dual port controller serves as a low-speed signal aggregato=
r
> for common port types such as SFP, QSFP, Mini-SAS HD, and others.
>
> It aggregates GPIO and I2C signals across two downstream ports, acting as
> both a GPIO controller and an I2C address translator for up to two logica=
l
> devices per port.
>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

From a GPIO point of view this looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

