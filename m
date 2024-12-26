Return-Path: <linux-i2c+bounces-8717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5E9FC784
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 03:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1B57162B21
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 02:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7DF288A2;
	Thu, 26 Dec 2024 02:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqZTAdf4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1554D629;
	Thu, 26 Dec 2024 02:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735178796; cv=none; b=EqZzVuzhB1tpg14iW2cJPWiQGc0eLN3CwxMfqfY0QxAFCQKx3QbGgVQ0CMp/pquzFK2yzNsDd5yu5+8CO51p3kB73urNXTXEkPfNBZSDoIzgvYW32sDeja+0nwaFdBMczIsQK6jnmKxbBqsU6+M1gtMVbrx4dMVbtlMaoqEISgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735178796; c=relaxed/simple;
	bh=tazDpeDzYCN18LgkWbAGK/OqE3YfuiHFsDYSZh+HAyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRDhY9dHx7sJ6jtC0nuJaTvc9H92K/gMpHpA9zsyTuiEzlcgrZOvTlhGbpI8bQM9a95TWaCVvliNBwnMn23032bkDYOlEsSg2CxU92u/lc2ZelxZrzKFhKhzoaMP8I3AxNnOD1H+filzn0musWtcq2LzxN80uEnymURi0r5AZSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqZTAdf4; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e399e904940so5506358276.2;
        Wed, 25 Dec 2024 18:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735178793; x=1735783593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkCBHoqavQ55PZKZXnXOlnXv7rNiEnW2J8MOTpYz9yQ=;
        b=YqZTAdf4q8aiDJ61Kt+tLoR07nu33+VAYNNhXsQ4KzkX+QKFZqkn2nDlCKo8xGuJUz
         CjpeR/Mk7jE0RxsXD2I7nYn0s7NWSgBMVNtnfTCKkV8UKFhqKKjffYQ7iKDhGSQDg3+Z
         spKYfJjtDb52aZqNGIvvFYCJAzW+uUZJHL9r7eNAid9MyogPayDlDUse3zFaUKyq16ow
         IbvXhDOB+ou02ETZy+XpvinGB2rfrJa2MRHvlxPRMxHWV/amZkJ+eVfcTiBo3Tgx7BK7
         OO7Q/rwk78hFAqOZ/+OicaskDQwC+TdrkX5gK/Wk+1e/BvDi9VsGe0PB4a0kvIL07Z5A
         bJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735178793; x=1735783593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkCBHoqavQ55PZKZXnXOlnXv7rNiEnW2J8MOTpYz9yQ=;
        b=Uk2shAfroW2z6158ba7RXJrUnntoStBRYXPvD+M9EV1NP3vTdKsQCGIMGo9sw+8X/6
         RH8yaghBW/G5JSqQgUgf+fFSLeEeghZbXE07qd37MbBrsANiSxyq7i+HccS26AIBDzai
         u99Ugj+LSWVsPgeAEk8h1aZ5fOsBURQBXMmJ8Y/9R+2AZFixDH8esGXydCCgQZ/yA6OQ
         U311SrLNm3ZKOtAy05v4Tb/ju3EHBSENFH7zkYonh8kNVqSKOdKvW/V3Vl5h+2CGoSIT
         qMR5ViqKs70N3aGmuBznQ7kO5iDdsxQXUm4QEPc4oBTzYyA513GcX9Ij1S353S5n6sNH
         FQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1jAccQKs5fNlRfymUyuQYLWpBwom9YyfjJR/1CJoHWYj/ElULq8QIQz92pcFPEp3tT3CZEAVXDE=@vger.kernel.org, AJvYcCVOxJKAKn07Z4l6fgdmCpMpd1mzWg5DranHXUWMbsHK7wWlo8nWfDxh10rVl/0P+Inhjgx6uqsI@vger.kernel.org, AJvYcCVRvMaLJHqkkd/0tz4iC5AyMMF97thYlsMMB4aIEuKM9v1xtilFchwgyzQsVm313OnsaB9njn2sj8G2@vger.kernel.org, AJvYcCVdPRtrL2oXZL2n7rlhdgBasLh3+IoK1UO8UFXjxAaChCS/Y0eAPKL/uuUdFUvDHS22tANVjmN607Q5DRX5ES0=@vger.kernel.org, AJvYcCVitAwcDsZN6dIo8mfAaUlvhBy1mbbHJxCpa+QXyn0iADYDL1yOwacSs7tryQtZ47zhI637zSSiroNapg==@vger.kernel.org, AJvYcCVprShn/44q0VvQ/cWa9rIc7GuNmjX8MURbwW/XQ53oMtsMbCejLbUMKBKMUHGzT+34e3lTVuJajpFRKBmJ@vger.kernel.org, AJvYcCWbYI6Oc3FY/Jw503yjkSp0gNH+TFuJ1nqRjtieu4MgrTIeebc4almkWhEEqwtbuANNYeH4QXtHn5Tq3mk=@vger.kernel.org, AJvYcCWjvI1EYu2mPXYDh1cuxf7d/ovRatz+oYohaIhcKms7PWZIVG5gqDe2XY3uMfdv8GDuNyl33euwa6kX@vger.kernel.org
X-Gm-Message-State: AOJu0YydimtZeuAeWg7TPJEJNqovsNDdOKLQa0vkLiJRPdRpv2EGeZZg
	PDLls15lRifu7gVkL1D4z3p7jpkGsTqwl7EdVcd0gx4a2Wr0G05UOGkX1xOrjZknw8oBQv97Wt1
	4BfsQmPB258IUSi00UaBw884yqs8=
X-Gm-Gg: ASbGncswhYBciIvPfehlV/zPWzsqhJjdKc8dlrcabkvAp75Pi15AO6/GLDH/uOL9jUA
	VuByeclPnLLSzIXOJFtBWV2gxLSWaBOHoPVt4pGrydfNJiPgBIdDrEiQny5z1IeXRY3AVE0Q/
X-Google-Smtp-Source: AGHT+IG5V9kgN4KFR2d/Ij736vONLybGw6IwUqTpy3TNfYr9s117zUMMGcR4U1TgSaPWAXXtzBYE3DNwyLaFV3J2yEY=
X-Received: by 2002:a05:690c:6ac3:b0:6ef:4ba4:eca8 with SMTP id
 00721157ae682-6f3f7f3fa78mr164105067b3.0.1735178793196; Wed, 25 Dec 2024
 18:06:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-4-tmyu0@nuvoton.com>
 <qe7rucm65tixgnlendfdlr6iemrvs2ecun7odlbl3csofj7qjj@sl6vypb66awz>
In-Reply-To: <qe7rucm65tixgnlendfdlr6iemrvs2ecun7odlbl3csofj7qjj@sl6vypb66awz>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 26 Dec 2024 10:06:22 +0800
Message-ID: <CAOoeyxX475tHNqoejX=DcY2ow2+rPc=_qXuX0O5AGumLPFoQGA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] i2c: Add Nuvoton NCT6694 I2C support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andi,

Thank you for your comments,

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +/* Host interface */
>
> What does it mean "Host interface"?
>
> > +#define NCT6694_I2C_MOD              0x03
> > +
> > +/* Message Channel*/
> > +/* Command 00h */
>
> This comments are meaningless, either make them clearer or remove
> them.
>
> > +#define NCT6694_I2C_CMD0_OFFSET      0x0000  /* OFFSET =3D SEL|CMD */
>
> I find this comment quite meaningless. Can you please make it
> clearer?
>

I have already updated these structures and comments following
suggestions from other reviewers, and I plan to include the changes in
the next patch submission.

> > +#define NCT6694_I2C_CMD0_LEN 0x90
> > +
> > +enum i2c_baudrate {
> > +     I2C_BR_25K =3D 0,
> > +     I2C_BR_50K,
> > +     I2C_BR_100K,
> > +     I2C_BR_200K,
> > +     I2C_BR_400K,
> > +     I2C_BR_800K,
> > +     I2C_BR_1M
> > +};
> > +
> > +struct __packed nct6694_i2c_cmd0 {
> > +     u8 port;
> > +     u8 br;
> > +     u8 addr;
> > +     u8 w_cnt;
> > +     u8 r_cnt;
> > +     u8 rsv[11];
> > +     u8 write_data[0x40];
> > +     u8 read_data[0x40];
> > +};
> > +
> > +struct nct6694_i2c_data {
> > +     struct nct6694 *nct6694;
> > +     struct i2c_adapter adapter;
> > +     unsigned char *xmit_buf;
>
> why isn't this a nct6694_i2c_cmd0 type?
>

Fix it in v4.

> > +     unsigned char port;
> > +     unsigned char br;
> > +};
> > +
> > +static int nct6694_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs=
, int num)
> > +{
> > +     struct nct6694_i2c_data *data =3D adap->algo_data;
> > +     struct nct6694_i2c_cmd0 *cmd =3D (struct nct6694_i2c_cmd0 *)data-=
>xmit_buf;
> > +     int ret, i;
> > +
> > +     for (i =3D 0; i < num ; i++) {
> > +             struct i2c_msg *msg_temp =3D &msgs[i];
> > +
> > +             memset(data->xmit_buf, 0, sizeof(struct nct6694_i2c_cmd0)=
);
> > +
> > +             if (msg_temp->len > 64)
> > +                     return -EPROTO;
> > +             cmd->port =3D data->port;
> > +             cmd->br =3D data->br;
> > +             cmd->addr =3D i2c_8bit_addr_from_msg(msg_temp);
> > +             if (msg_temp->flags & I2C_M_RD) {
> > +                     cmd->r_cnt =3D msg_temp->len;
> > +                     ret =3D nct6694_write_msg(data->nct6694, NCT6694_=
I2C_MOD,
> > +                                             NCT6694_I2C_CMD0_OFFSET,
> > +                                             NCT6694_I2C_CMD0_LEN,
> > +                                             cmd);
> > +                     if (ret < 0)
> > +                             return 0;
>
> why not return ret?
>

Fix it in v4.

> > +
> > +                     memcpy(msg_temp->buf, cmd->read_data, msg_temp->l=
en);
> > +             } else {
> > +                     cmd->w_cnt =3D msg_temp->len;
> > +                     memcpy(cmd->write_data, msg_temp->buf, msg_temp->=
len);
> > +                     ret =3D nct6694_write_msg(data->nct6694, NCT6694_=
I2C_MOD,
> > +                                             NCT6694_I2C_CMD0_OFFSET,
> > +                                             NCT6694_I2C_CMD0_LEN,
> > +                                             cmd);
> > +                     if (ret < 0)
> > +                             return 0;
> > +             }
> > +     }
> > +
> > +     return num;
> > +}
> > +
> > +static u32 nct6694_func(struct i2c_adapter *adapter)
> > +{
> > +     return (I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL);
>
> parenthesis are not needed.
>

Fix it in v4.

> > +}
>
> ...
>
> > +static struct platform_driver nct6694_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D "nct6694-i2c",
> > +     },
> > +     .probe          =3D nct6694_i2c_probe,
> > +     .remove         =3D nct6694_i2c_remove,
> > +};
> > +
> > +module_platform_driver(nct6694_i2c_driver);
>
> what I meant in v1 is to try using module_auxiliary_driver().
> Check, e.g., i2c-ljca.c or i2c-keba.c.
>

I think the NCT6694  is an MCU-based device, and the current
implementation is as an MFD driver. Are you suggesting it should
instead be implemented as an auxiliary device driver? If so, would
that mean all related drivers need to be revised accordingly?

Best regards,
Ming

