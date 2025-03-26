Return-Path: <linux-i2c+bounces-10024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FBA70F1C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 03:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14FFC189DB7E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 02:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3608213C682;
	Wed, 26 Mar 2025 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sbw4m/LE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE9D1E522;
	Wed, 26 Mar 2025 02:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742956645; cv=none; b=QpEX+XchB5YbVMlCZk3t7IYi/NdmjERA8r4s56umRwmR+Xc+94NKKjvqcuzW8n6KtTs0qVpOLrb+uZYYEgjRilYdF0lVtpiW5FfSBAe2UNkVWTB4ySFC15efP6o5gXVkIb895VnE5QwaLYjgdcq5/QfLMEZe7Oh9NQDsgmPamHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742956645; c=relaxed/simple;
	bh=4aKVdki5wns6qRzTx7R+loqMBGca0hbPQ5jyuD8BmtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7dItRa/Sw6MH3H3wSPFcHDQBwE5Hibd1fIovRyRgHUE2o7SdAAXEmI/wWIevAs4mnnMbhSeb9ZG7zE0IGbNxMFyG6UqZAwJ4eASCCzsfvd9VjlSvkLc2k2luHpQyIaOkbrSl9W7au4Whl34IRqHgtmP13nWpcrlxVkOoU1JtME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sbw4m/LE; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e63504bedd0so4549166276.0;
        Tue, 25 Mar 2025 19:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742956642; x=1743561442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0T4kJi2YlX/9jr0Egj3I/ehfw/D62slsl5V/JEua0fA=;
        b=Sbw4m/LEZezUJ3/vDThK7OLNQwBaXptfzwVWr/68q2BwU+OjxzCVxttk+RqG/xclDU
         dLD5ayx9GbrERA2yELAhyPk6d3ckr1BxWqDlkdXzVv+26oKkT2RUOLJb4bOqDtWvO1Fe
         Yd/G5sXAsS1bGqq4Ia1/i1hRT0PbJW+6W1Vn7q7dQUcCUkWCmRebytcxJZGNEmBRPYFC
         XD7w/Tns+9AwBOUu4UXliuyyIJjWBEaDipfCfqmykvui41v/jrw27ssCIJBQU4neSIcM
         78tFR1wGPppOfDuq3RePpio6aNtRvhQtMvejLtmww3NPAXZtEzneHUvG7cgo+NNSc5q9
         hsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742956642; x=1743561442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0T4kJi2YlX/9jr0Egj3I/ehfw/D62slsl5V/JEua0fA=;
        b=M1mqwbvZhcutdOMOidXxNVJMBQzmWPZd6xjASm1Wo7UYaBuPDJpHXMN58RwlYgNbtb
         LDgxkE3261oTCtZLgl22WL8cgTHuyfUgUmuEVDgj4io25TF4/945saBz4DGgjrMbs9Gv
         MVynubbxSwi1KzWtPhqZxwt1IjHO+Vsw6xnMyZw3zsE2PIwlRVNbQiPcun5NNGJnKK/V
         8fVvnF8cFbi3g5sSHlffRSHtbIOaNufOL/Dc3z5hWxiELqgHMVJ4BKiUFgiFFURBBFhH
         T6qAH8tjCsTlQ9kZ+2fcVmUVyq6GQelD0ur3zqA1bxnHxYlX1tiAzHIsgm0hp6uPQ12F
         HRgg==
X-Forwarded-Encrypted: i=1; AJvYcCU6dUnYmHgYx2dlZHogsxHNvVM44rHA6cG18tFSrd8WDqpyyyv/MU3kXbv30ZiVyQW9FWxNKTDr/rM7vSGq@vger.kernel.org, AJvYcCUg2+Bhbky4IZ8Djt7doUMN/WxRIPwzlD5bgrNxegbEkGE8p0HIpXEOJIX2ZvpH+88UBYTG6kzd7wOE@vger.kernel.org, AJvYcCV/7SGeSTkPR2gn+og5JjOabaHKcgQAYWABucEuqiOvvU7qDgIdyTTx5uDO4mJSP0l1jczaXEiw1J8=@vger.kernel.org, AJvYcCW2fncM/UFJ9J6c+WpcmyBrX219wOZ8Os/DNnLK+H2RO/N7gmRS1L0vv0qfcNUzGQXlBwZrjY+X6alJ@vger.kernel.org, AJvYcCWGX/a3qtIhubUurW19iAnkBYw8rU6SFWkhhWhOiigg4w44909Rh7OtF050aGm2Izm7YFWBw+71@vger.kernel.org, AJvYcCWK3VdcljBm+B4Z7O1malzU8lI8F84lZCfR+sFaVqgqH+iR0isX7mVKq/gc7uGmGAjXHc29OHTyZ9jepotSgxw=@vger.kernel.org, AJvYcCXKmPa4CuByF9x0CIsDC8Hp1igPTCHqRgnH+i79Qpyp4LDpajDhyu3mIjfZtXk+BtRUqkKKMG6rLy1T7A==@vger.kernel.org, AJvYcCXRxfRnBnGDkGC7EUZHCh/OYb3S4BgTfJbcDRmcR3jq8GsTywOe6b3j7x6B9Q89eKP2CJaJqCLorI65Sb8=@vger.kernel.org, AJvYcCXWZecKHpdllQtHNPfqAt9kEU/mCdQGbfeRg9wjOzfiH/XYqU43Nm/kwN8bCYf68u6oY57WSL15LVJC@vger.kernel.org
X-Gm-Message-State: AOJu0YzQx1jZRyjJjO8iwVo0fSz4GmIIXNl8NWRsUwatvvIR8XDfbogW
	tIL0lrFqb41vrOp/gWkXNu4Xa+BS35/+sSbYeRJw0h8vW6pil823zyBUhiNV9zlZhYHkkHcByXE
	yhYpTb8AicGQDmbNtAdSfLo28qk0=
X-Gm-Gg: ASbGnctaoCbZy5KjTedHTM7ofnzml1VetNsJOmrQ8oFUi9YerHPLagElUv/r6bqiI5Z
	CDv9wOWgC5JHqcGE9I54V0oLocn3CLd3Qxyxf29lgJp/UoP9VBuwLQgTPNyujKU+rrFLLSKfWNS
	+VlAt6SEVy6FTg1KJv+jj0vsT2zqaCSYSV97YNLroCHVfq2hwnve/tMPrNdGyz
X-Google-Smtp-Source: AGHT+IG5aqamBazHGcglJhnmQUC1EqM+w9idtbItezzAn5GTsOL3nj+p/kfRDDrQ6dTI4NF5PXbmX69K/YimNo8Iegc=
X-Received: by 2002:a05:6902:cc5:b0:e5d:fecf:9acb with SMTP id
 3f1490d57ef6-e66a4d5988cmr25337306276.12.1742956642135; Tue, 25 Mar 2025
 19:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com> <20250317-outrageous-helpful-agama-39476f-mkl@pengutronix.de>
In-Reply-To: <20250317-outrageous-helpful-agama-39476f-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 26 Mar 2025 10:37:11 +0800
X-Gm-Features: AQ5f1JqWfqANJXxVxhsOmk2h30Jl9M6xAz4-tpF9pseWjGYdxNzmcOylUXKtSMU
Message-ID: <CAOoeyxVF9baa8UKJKWcbTLzvMo3Ma=GRCbdnBSoGOw0Lk5j4sA@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=888:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
...
> > +static const struct can_bittiming_const nct6694_can_bittiming_nominal_=
const =3D {
> > +     .name =3D DRVNAME,
> > +     .tseg1_min =3D 2,
> > +     .tseg1_max =3D 256,
> > +     .tseg2_min =3D 2,
> > +     .tseg2_max =3D 128,
> > +     .sjw_max =3D 128,
> > +     .brp_min =3D 1,
> > +     .brp_max =3D 511,
> > +     .brp_inc =3D 1,
> > +};
> > +
> > +static const struct can_bittiming_const nct6694_can_bittiming_data_con=
st =3D {
> > +     .name =3D DRVNAME,
> > +     .tseg1_min =3D 1,
> > +     .tseg1_max =3D 32,
> > +     .tseg2_min =3D 1,
> > +     .tseg2_max =3D 16,
> > +     .sjw_max =3D 16,
> > +     .brp_min =3D 1,
> > +     .brp_max =3D 31,
> > +     .brp_inc =3D 1,
> > +};
>
> [...]
>
> > +static int nct6694_can_start(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > +     struct nct6694_can_setting *setting __free(kfree) =3D NULL;
> > +     const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_SETTING,
> > +             .sel =3D ndev->dev_port,
> > +             .len =3D cpu_to_le16(sizeof(*setting))
> > +     };
> > +     int ret;
> > +
> > +     setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> > +     if (!setting)
> > +             return -ENOMEM;
> > +
> > +     setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> > +     setting->dbr =3D cpu_to_le32(d_bt->bitrate);
>
> I just noticed one thing that needs clarification/documentation.
>
> You have nct6694_can_bittiming_nominal_const and
> nct6694_can_bittiming_data_const, but only pass the bit rates to your
> device.
>
> Do the bit timing const really reflect the HW limitations of your
> device?
>
> Are you sure your device uses the same algorithm as the kernel and
> calculates the same bit timing parameters as the kernel, so that the
> values given to the user space reflects the bit timing parameter chosen
> by your device?
>

Originally, I only intended to provide NBR and DBR for user
configuration. In the next patch, I will add code to configure
NBTP(Nominal Bit Timing Prescaler) and DBTP(Data Bit Timing Prescaler)
based on the setting of nct6694_can_bittiming_nominal_const and
nct6694_can_bittiming_data_const.

Thanks,
Ming

