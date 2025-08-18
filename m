Return-Path: <linux-i2c+bounces-12316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFCB2977E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 05:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41F1A19676B8
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 03:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDA1245031;
	Mon, 18 Aug 2025 03:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WJ5KLW19"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D89920322
	for <linux-i2c@vger.kernel.org>; Mon, 18 Aug 2025 03:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755489205; cv=none; b=LHZ3E9WnLfNnE0fDJndSmVowBJnQIA/7SFwEjB+Nw85DDILgrrYjBQBPA70I371bk7nzy0b3fEbHbGbU0h9zS7ByQbSRp0WeAc72hQQhO1x+Jg8ggtNFIC9qpRb8PQ15qseojp5mE3AgsQ18AxeFSrG1uLtNy2EjqRw0NYtx3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755489205; c=relaxed/simple;
	bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQK8s3LsXZc3COiqo8DwQx1eJewwzVJ2igZqMyDoW0g8iZ1znvD/BODqLVLqa2DNHsaGjZupdzsxicyDLkh0VWZNSte5eBdwQibFE0xM4usA5Nk0X6qDLXWShhXQFdS/t4fPHRe+oM+FMBt9ibD3BQDvGDmMb5FxmCaRL4soUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WJ5KLW19; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-333f9160c2dso28092551fa.2
        for <linux-i2c@vger.kernel.org>; Sun, 17 Aug 2025 20:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755489201; x=1756094001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=;
        b=WJ5KLW197/8G2neR+DlUCExP4EYRUC5hmB3WAneNnsobQca60wIt0hJFm+wfN5HssC
         NWqwJh9MogpgWsivGgHJyZjDoxKPoPiNYFDvVDls/mg+rxkE2LweIzVfgrw+GxvDNLaz
         VXGxUaOZ96A4hx44fk/mdnWFodcjLv7D6wiGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755489201; x=1756094001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=;
        b=Ij1tPM5WRFmgrr/6YCNk6KlGWGo5QXMUizTOtOfNQvaofMWVlaXR1J2AtMJMYC0C/4
         Gk3UNGpUizEvc7Ilvu/4qcDKKypWYgQS4vJ0WIuKv0RNwCuyoqyOBFa+ZKF8vjVNqhbl
         zOwKxBS0JSiuUmQdTGIP3/0iWQeHOk5U3NWOsiZ5Iz1v9yKXC0O4Bli8U5Fn4HtpxvZi
         VGkm2Hqh5ykBkI2JmlYqixx9aDQg2+XaQf1TZi/fzUVS2j9hef7y9pQBX15oopx7lLrQ
         lWhq7lxfanI5C4bF4/mjz/Lkud7GOVsYLuV4883/pTjwl2zVu0zGyz6kIGpAnDjhInxO
         0DOA==
X-Forwarded-Encrypted: i=1; AJvYcCWLVxCtA8R+I3kkmFSYHljdaiLUXgPqGi/EL5biJlGsdyVKITknk3yv7tozxaAQSBTU8rwsioR4ad4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyilnPzoZCogaZjbm1+jiROffUawtv3/fyFcMnbSirbQwKNxttX
	7QRp6NjtT3uiVxv5yGQ/Toy2A4x71X7g1wmTrJypThwzeWbPxySGpiqVauDJ5QnHUC5zlN4/FbW
	/vEY9QSewDyRLxqBEdvaRNXpyX9b0uZuJ/53qFp3e
X-Gm-Gg: ASbGncvhFXbmHDvPmgk/37etvJxmHAqRE9VEEJ3ZwlKwXxmBwbfM4TsWNUhj8OoWZcr
	GX59s02hFGAFwlpE1yHlVs+lg+BM8bQC3fsIY9d0zfWjTsulpZEEhD6MeNDc1RXaPWM7dX8HvuV
	J7XgWIczl3n2eWWK+mF1YGNUIpUPdQ2BA3FIgMdZe3HKxieqNH4bvgSGg2Cwy5E6Z4VdmSBC4m4
	n2U4/K6uXJwIHDP42M/kT7nuKCGBFKgjwU=
X-Google-Smtp-Source: AGHT+IFPS+3sb9CZbTWfnTjbDa0k7A4z8cLwROgvhlDgLeCCeIOup1wcDfmt4xXnfNBN2Bv5bh02EwambURnN0B3nkM=
X-Received: by 2002:a2e:b8d1:0:b0:32b:6bae:e3fe with SMTP id
 38308e7fff4ca-3340982d970mr29405411fa.9.1755489201494; Sun, 17 Aug 2025
 20:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816075434.31780-1-leilk.liu@mediatek.com>
In-Reply-To: <20250816075434.31780-1-leilk.liu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 Aug 2025 11:53:10 +0800
X-Gm-Features: Ac12FXzbC3a5fYlt94iOei7CP2T8RPhSU-BFGXIPrEu4iVpFb5TXKRGwyAlG1lg
Message-ID: <CAGXv+5F8ABGTRdUrf0j68cLiHZHSEFjwDOBtfTZBTOWt9APVVQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, 
	Wolfram Sang <wsa@kernel.org>, Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 3:55=E2=80=AFPM Leilk Liu <leilk.liu@mediatek.com> =
wrote:
>
> From: "Leilk.Liu" <leilk.liu@mediatek.com>
>
> The old IC does not support the I2C_MASTER_WRRD (write-then-read)
> function, but the current code=E2=80=99s handling of i2c->auto_restart ma=
y
> potentially lead to entering the I2C_MASTER_WRRD software flow,
> resulting in unexpected bugs.
>
> Instead of repurposing the auto_restart flag, add a separate flag
> to signal I2C_MASTER_WRRD operations.
>
> Also fix handling of msgs. If the operation (i2c->op) is
> I2C_MASTER_WRRD, then the msgs pointer is incremented by 2.
> For all other operations, msgs is simply incremented by 1.
>
> Fixes: 173b77e8d8fe ("i2c: mediatek: add i2c first write then read optimi=
zation")
>
> Signed-off-by: Leilk.Liu <leilk.liu@mediatek.com>

This was

Suggested-by: Chen-Yu Tsai <wenst@chromium.org>

internally because the code looked funny.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

