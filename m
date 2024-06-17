Return-Path: <linux-i2c+bounces-4069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0990B7E5
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 19:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8D88B2418A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 17:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1508E16D4E1;
	Mon, 17 Jun 2024 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikqqk0Ap"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0EA16CD29;
	Mon, 17 Jun 2024 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718644963; cv=none; b=U5Z/NtIBMnl9BNs/tQgbnVM3Nhm3K75f/TJ6aviODPFwsSpB2mI0zMgQqKKgF1iobqbwsk9Slx+QDjmo64tYapg731ic/y776yRDC7LceO13CrvNCjx5kjOdcjNCjQTb6W2Xi/cbrmVz9iUrh98JH9fduAZckrDauDYN1L9WZ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718644963; c=relaxed/simple;
	bh=RhcWC8Rp8qIRElpRJW6lfTPluwKHaTBVKBkoTRLSNBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEfN7dN9bst4o9yoepAY+0icrOSh8tQOnSkV9u8VAbeEyXw9G4XWu37kLEPjz9d3K2X5Ty7yT0sJzBlKFInFZGknCqKlkwCW/dlT0xzKj2jyux9YDV2ioqXhmT1WXkSYEl2KjLBe83o8sGqZKpl4rRLxMxFtKUfG1Z6CZRydMxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikqqk0Ap; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f21ff4e6dso629382666b.3;
        Mon, 17 Jun 2024 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718644960; x=1719249760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb+O+cmwbTR68wWYVOzyym9228SgymLFKXuelmNx6q0=;
        b=ikqqk0ApnccGCgcR8mcQ7u3ZUzNhy/nqO8Xi0BIGu7FJZKuCZanySAVjoRXwv0kSIf
         eqKt13KqB2iOWorCx5yvMK+s1hVuzfl1tUln0o1VNvTj5D9blc+ioh55v+11L1dkNaNz
         0UezB0615k+Firjg1vAKrK4ImVSJUoXDRkv4kHgikYLU6vg0wcBAjWYYiOyOZWUpm2ao
         o6VTRxnpzeVIUFyNfkVad6zFOlbeObkMHEVeL5J8vVCVD8GqiDrgBQA2RjAp0iApA/L3
         +PEyDZ+u+xZcd27OYLnV38hE5Md0rwO5ZlnRkZmZaaxHytjiZIXuwaFKtL/Qu1e9vyco
         LSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718644960; x=1719249760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hb+O+cmwbTR68wWYVOzyym9228SgymLFKXuelmNx6q0=;
        b=uroBsMPenKo+T6VHSxtp4l+fgBEv9YLxYOfXjuXZ39b8uhAFDHacnVviZpKKVYCGhy
         sGTlYHuLVaY3D0s8YOzf2O366GwCQKeMEGUI6FmP54b7KMGIE2XS6bf3VwbdO/xPFGZ6
         rK/pShaSDKBLdq9qsqttqLAkvjjn4WBztQVRiob9X7AzWLgnFXfcmiu2XeH9tMlSpRlN
         JRwUZMbpQU6NHvdGgCbvGLgthX7yXDUFL/a+aYI+459wDgO2xP+i38lfsrSF/nFaho7i
         rRwCtOYbo/A5bin4Yechr0TpXX5hNzdVfIz6zGFWH4befu6bdf69cxSTbYL7J8aLPkem
         osqg==
X-Forwarded-Encrypted: i=1; AJvYcCXXVmUXfWK/0gnTS6JIwQOhXUCAq/cRXAZEi1ujpPRbO8ZMTT80tfTsJizDyQbYYpR9GLCIQvon4bADEuDECAQBXfSgtrinD9TLL3epYBaqswL3+zOCazUSitZG1l3jRkOm2bSDtMG6vudU+6ui7nuE6ujFX6Yq2pA7kqN0jcue
X-Gm-Message-State: AOJu0YyfLic3+VuPjootXzoOSmta94RDZ3GQYL60E0W1g0URi+i3Ijw/
	RpZiFwi9HzvdtTPIQJvPrzwH9QiDB85EzspMhl6xLWC1WPkA9uMWP2Kokh8HN5sm+e/201TI0+l
	I5yqwqK7z1k+sgmdP/1majC3Arn/LONyn
X-Google-Smtp-Source: AGHT+IGnUeHwYXqk7NzEsZfA4FseFP2/mMs3rIBad0z44NEgcX1zYFY156NjbYIoC/3fW1+aZn7fmyhRi0w47SRuCDc=
X-Received: by 2002:a17:907:969e:b0:a6f:5723:fb12 with SMTP id
 a640c23a62f3a-a6f60cefc7amr714824566b.1.1718644960188; Mon, 17 Jun 2024
 10:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
In-Reply-To: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
From: grygorii tertychnyi <grembeter@gmail.com>
Date: Mon, 17 Jun 2024 19:22:44 +0200
Message-ID: <CAGFuAux+x17M4XK6jCHknYecvq97GxKTHz6ZLh8iTmL6Wmz-Jw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: ocores: set IACK bit after core is enabled
To: Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Cc: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>, 
	bsp-development.geo@leica-geosystems.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

just another gentle ping...  Not sure if I need to rebase it on the
latest master?

regards

On Mon, May 20, 2024 at 5:40=E2=80=AFPM Grygorii Tertychnyi <grembeter@gmai=
l.com> wrote:
>
> Setting IACK bit when core is disabled does not clear the "Interrupt Flag=
"
> bit in the status register, and the interrupt remains pending.
>
> Sometimes it causes failure for the very first message transfer, that is
> usually a device probe.
>
> Hence, set IACK bit after core is enabled to clear pending interrupt.
>
> Fixes: 18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C c=
ontroller")
> Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.=
com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> Cc: stable@vger.kernel.org
> ---
> V1 -> V2: Added "Acked-by:", "Fixes:" and "Cc:" tags
>
>  drivers/i2c/busses/i2c-ocores.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-oco=
res.c
> index e106af83cef4..350ccfbe8634 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -442,8 +442,8 @@ static int ocores_init(struct device *dev, struct oco=
res_i2c *i2c)
>         oc_setreg(i2c, OCI2C_PREHIGH, prescale >> 8);
>
>         /* Init the device */
> -       oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);
>         oc_setreg(i2c, OCI2C_CONTROL, ctrl | OCI2C_CTRL_EN);
> +       oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);
>
>         return 0;
>  }
> --
> 2.43.0
>

