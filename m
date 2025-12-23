Return-Path: <linux-i2c+bounces-14729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CDCD9034
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 12:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 073E330194D9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCC233F8BD;
	Tue, 23 Dec 2025 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4iFTtyU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B833F37E
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766487866; cv=none; b=Rb9+MISghfYFMyDFeV2WIPsIaK0mbRzJyz3AholdCe1kpDlPMBPO2hUXsFR6A/zz9cBTBGR4TZktzQs8mjieG+xoq07n6m6E0R64VxVRRrMxQ04sRuqSiL7d8PgTkf+Ft6FBaHShkwYO3QuERACCvUXll6HSrDufVqsnobQBMFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766487866; c=relaxed/simple;
	bh=biUgEjzTLA2qxnGKmM6Ej5xs7lQ2WYxGQ9yr+adss88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOgX/uLVVunJGQU2+4gj3woy4XQFRUdSCErirgPD19f5IqLkzuk2YVricMkVfhSbkfOJHnoCHFGBi8unDhUZ/DoEXYcQJEV6SK6rHqzTrjzHjnmqKNkCVGexpnlrodSpgDQHjyK0EGrp0X8sh5D/8UkXbN/JIcByAJj64/Y+VNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4iFTtyU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB34C116C6
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766487865;
	bh=biUgEjzTLA2qxnGKmM6Ej5xs7lQ2WYxGQ9yr+adss88=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=r4iFTtyUaJSeS53r1g6gYRFQ7LBaaU420AqItPgA01WKlV5q/GSaZwo5Y56adUcE8
	 u2d8PJaKvSBlyIoSlSx9EBMkmTqI5lE7OhtEd3m0mt0ypIdXUu86yEReqPgADay1Wu
	 1TnsXU79RRm0GCehzjxo1DccTqpYKDFimY3zRVGjBpBp140cl2IXt8llhHYbkzj44P
	 qS0WPx5fFkv3eVcFgNTxYag6jaHPWTkeJ/ATaaWXfpJNzDAbCJOolk76PdEn3+RgFT
	 6TM0VIWEe4Bs2OipQqftao//8I0zJxrPlQ1NbUAPqeZEUiBGfxuVW3LxW5SuVxbQy7
	 Ut4XKpDb0EqCQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59584301f0cso5254665e87.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 03:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTgCDAADOFR9wKBf0BUMFm62FWE0zePbBu/lmMTb/YZTW4T12faHITfF5iQkDN7KgxeuaTmRheyTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBqdryza3SCyq/NUHynPaoJfWpVatbfD6THwFBU3XDhWgJm/d
	9WStsT0a3yBLClOg5fF0ZFMt7ZoRrms2oaHSblHXgfZRJAtezf9x97PK7DQwIB7TH3j2/whc8HZ
	OCaNBUoU3ggsoG+ijmG1bFg6iCfpOGyE=
X-Google-Smtp-Source: AGHT+IHFRCOw1OndrHUP8fu/5Pu86rNoly2fZw9WpBncVYiaNKQ4oxRlCC+E8Yk0b5wLZeLJPra7VnbPIBMd4pnW17A=
X-Received: by 2002:a05:6512:b85:b0:598:853e:4865 with SMTP id
 2adb3069b0e04-59a17d670demr5354973e87.50.1766487863823; Tue, 23 Dec 2025
 03:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 23 Dec 2025 19:04:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v65_bC23uVNdXXy0OW3Zx4wxO+CAuae5zPR4m2zt29kYXA@mail.gmail.com>
X-Gm-Features: AQt7F2oTKoNzOiHRkxSJE0lLrLQx6-2c3kaid1cyT2kNWjPKTkvyybHt0ZNsvmc
Message-ID: <CAGb2v65_bC23uVNdXXy0OW3Zx4wxO+CAuae5zPR4m2zt29kYXA@mail.gmail.com>
Subject: Re: [PATCH 02/12] i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 6:02=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Convert all instances of using device printk helpers with struct device
> embedded in struct i2c_adapter to the new i2c-specific macros that hide
> that dereference.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648=
c082f319d955b5e 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         unsigned long dlen =3D P2WI_DLEN_DATA_LENGTH(1);
>
>         if (p2wi->target_addr >=3D 0 && addr !=3D p2wi->target_addr) {
> -               dev_err(&adap->dev, "invalid P2WI address\n");
> +               i2c_err(adap, "invalid P2WI address\n");
>                 return -EINVAL;
>         }
>
> @@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         writel(dlen, p2wi->regs + P2WI_DLEN);
>
>         if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
> -               dev_err(&adap->dev, "P2WI bus busy\n");
> +               i2c_err(adap, "P2WI bus busy\n");
>                 return -EBUSY;
>         }
>
> @@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap=
, u16 addr,
>         wait_for_completion(&p2wi->complete);
>
>         if (p2wi->status & P2WI_INTS_LOAD_BSY) {
> -               dev_err(&adap->dev, "P2WI bus busy\n");
> +               i2c_err(adap, "P2WI bus busy\n");
>                 return -EBUSY;
>         }
>
>         if (p2wi->status & P2WI_INTS_TRANS_ERR) {
> -               dev_err(&adap->dev, "P2WI bus xfer error\n");
> +               i2c_err(adap, "P2WI bus xfer error\n");
>                 return -ENXIO;
>         }
>
>
> --
> 2.47.3
>

