Return-Path: <linux-i2c+bounces-9372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6EA31C52
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 03:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D105163956
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 02:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7231D6DDC;
	Wed, 12 Feb 2025 02:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIlQez6+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0949F78F5D;
	Wed, 12 Feb 2025 02:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739328598; cv=none; b=q9OId6MaHpybG0eQy+nqrSGXL9NvDk3ahWPnfrt19WxHsJms20kN5jjz7VVDsrO+nFfh2PO065fHY2QrhldZKLNkOfidi+8q6GBmli2OrZfMPYSt6wwgky2BvG2T9d0ot1upnxJIIT7t1r5fm+deCUsa30tKTXAZRHUsfKNaLS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739328598; c=relaxed/simple;
	bh=75WbVlIulPllI8IGzSeA0N5ptGhmxGXBkEZwmeHX0j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtTcJnWVfakmJ0ZakmZaofK2b3frt8g8lX5aWYNwEcBBbaSJoPol0ygv4djduYelo9kARAOl7fvX80bHJbOUnPRKsyJKpkCUGpDGiyDA0LVrlZKrjar/XG+fjZrimZa0JDjGOqlc7IfuH1zuCrfXcxmKntjGpuWER4JhSlrc9AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIlQez6+; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f9aa66cbe8so46985147b3.1;
        Tue, 11 Feb 2025 18:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739328595; x=1739933395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OFjQV9KxOR8usKYsZuCWzHZV3UKgC2zTUyoTT0Ohho=;
        b=gIlQez6+GM4bPh9NTEQEM7uf3qF/LZfsYOniMnZQv1DOn3sX7hs/c47W3qU4fI6KA0
         0jkCovg68eCCX/LxW+NBuFZPuzkUtfPrcjBWMClmEK5ZDh5iVxu4Og8tGuj/th6kDALN
         V8VyCARH692Wqd4B9DhAgSX7M943g1n+dkcw2yyf1GIT3I6t5V+guQM0tGseUlm/gZBN
         OBtlK9nsi8r83LaPbgPpinMAQ0fz8FGEDJORzRgQLjSS5btx5uRPhkPF4ktQhlbA6gs3
         MAd7OeF29XmiLI2vTLa6w2vAQm7pn2EAilEOZw/iruAau5ap3t/8PQ5/Le/fveptcxce
         32Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739328595; x=1739933395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OFjQV9KxOR8usKYsZuCWzHZV3UKgC2zTUyoTT0Ohho=;
        b=QMjhI2g9SsymAhPhykVYG5ZKVImMdlUXI3aMPlpp4X1Mcx9AgD9lNQcUacfw4w29KE
         LldNNNG5km5bFlb1sBM8TkY2BItDePGvkcs9vwUWSTRnzk2E4ZkcHvS6Y22csAIm8cgj
         6n/iHthyAfNbY3x4ew4EL9PH2Fls667FLib0jwJsHJMfEelTBrKATKhRqlCyGmoX1Hnk
         7sXdbxMpfghWo4gtKTJDQLp11zj7BRVaA79A0rI9Ipr8m/HhOdtyQ36EREhiu5qkkyPH
         WHrc0Yn4ll/lD8wux4iDgXNPYh7LxTNxKx7VsT3iKoiaQ+lP7wzpmNYQgxJ7SD8RWnpn
         FGBA==
X-Forwarded-Encrypted: i=1; AJvYcCVkIj8rpSke+jraUGmIJ1z/b2CwTOjh8FEUL2+AJrQiIi3HYAB0J5/SG5GmKFg8py8wkL1grDV3I+Yn@vger.kernel.org, AJvYcCVpEJ91FGhH1QxvAYvVcx8eNQ/6Q5fi/yjOyA3TRXVfC2PmH/pQGAaQoVX7cGxxr+/KuPjhTOUCdmWA12qG@vger.kernel.org, AJvYcCVwUMMygcCAo3yBZPsfJhPYELuGJLFotGRE7hOGz9FTg/em+9NVmPW2CAWvPicLyqXOw0LsitL5kNw=@vger.kernel.org, AJvYcCW288DsTNfeEBekJhsgQ/XCwWbiA7upf0PzALq1OlVdiAZ9xtzgPoWv9EW9pJGusfczhe83dlbIH/CgR/mCytg=@vger.kernel.org, AJvYcCWIosAZM+KKKvQGPMgTUrRzC/vIJg2qKbLfxvXDapT9rPEEB2Ue8zcVCW3qu5tGd6cnHwk+oXPyn/Cs@vger.kernel.org, AJvYcCWukcvoz1VP/E9qd2mpJ61j19weydTM4yCWvdVk9DiVSqbZ3P1RojgXryeX8Glxd3Z0VmBX7rHXNxKw0Q==@vger.kernel.org, AJvYcCXTSRvY9MNPiQqePNedMbSvQ3pOZEwiRlOHwNuVXcBaH+f1ItnusBajmhWugHSm/ktJDT1hFpHT@vger.kernel.org, AJvYcCXeMumcBCjvrLkS1UDvrorsIjlQKdrj88A9K258Gpt3x5kGhhnkB3UmLb4MejFo+7OzN/UWnQNkPGeB@vger.kernel.org, AJvYcCXthJmf3VoxzaxS/juMbK78Dj2kLURnZ9Iu1jGRY6cK3njvHGz+4Kpsc+Ibd2GNGLuadduV8IbczDlL490=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoPsXr4PTb+dcTVw0QXHUyawIg4FdO0zNXDH1WaiKp3SHWUsNi
	u78MZkDh3VCkykg42KMOSzqqGLqzHgJZsCzQBwKpyJSJM++sXaZzLJs6tog8RDh7Xbpg8iZENja
	snPnOeGrb2fl27B2PtLrP9CfFbbc=
X-Gm-Gg: ASbGnctSOhW0IOrcDYFktlM18rwlO8Ewn5JQAj3MJoOImKFfUMFzyIBNHtJpuLfGEtc
	zNjUti0Nmw8B5FUvDnEee2YAdGOV7Xy+zFAm4owUgLiRuCC+sN0FZyKA8QEu/6OfAAJe1nWkAbF
	L+1suotlp75Sc4e478j9G8txWV6hWhqho=
X-Google-Smtp-Source: AGHT+IHCfMLv4SCyfWv/GyglmXZIvTQ+EOSxbRFXJ1ei9e9yljKIiG+wiYtIOWT+3jwglkwkmPXe6Fiw/MMu8DHLl/c=
X-Received: by 2002:a05:690c:892:b0:6f5:3e17:7ea5 with SMTP id
 00721157ae682-6fb1f171da6mr19242137b3.7.1739328594696; Tue, 11 Feb 2025
 18:49:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com> <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
In-Reply-To: <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 12 Feb 2025 10:49:43 +0800
X-Gm-Features: AWEUYZmvwDIMk4-fdBjlV8o0spq55ZlW0LcOy_YgVp-WEl_BGkdbw71NI97UOm8
Message-ID: <CAOoeyxWKWA=OJB_MdWPdJQDic8=AXEbJiu2qW5u=CvphyAykzQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
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

Dear Marc,

Thank you for reviewing,

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B42=E6=9C=887=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:15=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 Socket CANfd driver based on USB interface.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
>
> /* net-dev style multiline
>  * comments look like this
>  */
>

Okay, I will fix these comments in the next patch.

> > +
> > +#include <linux/can/dev.h>
> > +#include <linux/can/rx-offload.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/netdevice.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define DRVNAME "nct6694_canfd"
> > +
> > +/*
> > + * USB command module type for NCT6694 CANfd controller.
> > + * This defines the module type used for communication with the NCT669=
4
> > + * CANfd controller over the USB interface.
> > + */
>
> /* net-dev style multiline
>  * comments look like this
>  */
>
> or remove the comment altogether as it's stating the obvious :)
>

Okay, I will remove it in the next patch.

> > +#define NCT6694_CAN_MOD                      0x05
> > +
> > +/* Command 00h - CAN Setting and Initialization */
> > +#define NCT6694_CAN_SETTING          0x00
> > +#define NCT6694_CAN_SETTING_CTRL1_MON        BIT(0)
> > +#define NCT6694_CAN_SETTING_CTRL1_NISO       BIT(1)
> > +#define NCT6694_CAN_SETTING_CTRL1_LBCK       BIT(2)
> > +
> > +/* Command 01h - CAN Information */
> > +#define NCT6694_CAN_INFORMATION              0x01
> > +#define NCT6694_CAN_INFORMATION_SEL  0x00
> > +
> > +/* Command 02h - CAN Event */
> > +#define NCT6694_CAN_EVENT            0x02
> > +#define NCT6694_CAN_EVENT_SEL(idx, mask)     \
> > +     ((idx ? 0x80 : 0x00) | ((mask) & 0x7F))
> > +
> > +#define NCT6694_CAN_EVENT_MASK               GENMASK(5, 0)
> > +#define NCT6694_CAN_EVT_TX_FIFO_EMPTY        BIT(7)  /* Read-clear */
> > +#define NCT6694_CAN_EVT_RX_DATA_LOST BIT(5)  /* Read-clear */
> > +#define NCT6694_CAN_EVT_RX_DATA_IN   BIT(7)  /* Read-clear*/
> > +
> > +/* Command 10h - CAN Deliver */
> > +#define NCT6694_CAN_DELIVER          0x10
> > +#define NCT6694_CAN_DELIVER_SEL(buf_cnt)     \
> > +     ((buf_cnt) & 0xFF)
> > +
> > +/* Command 11h - CAN Receive */
> > +#define NCT6694_CAN_RECEIVE          0x11
> > +#define NCT6694_CAN_RECEIVE_SEL(idx, buf_cnt)        \
> > +     ((idx ? 0x80 : 0x00) | ((buf_cnt) & 0x7F))
> > +
> > +#define NCT6694_CAN_FRAME_TAG_CAN0   0xC0
> > +#define NCT6694_CAN_FRAME_TAG_CAN1   0xC1
>
> in "include/linux/mfd/nct6694.h" it's CAN1 and CAN2, can you make it "0"
> based everywhere?
>

Understood. I will update these macros in the header.

> what about making it:
>
> #define NCT6694_CAN_FRAME_TAG_CAN(idx)  (0xC0 | (idx))
>

Fix it in the v8.

> > +#define NCT6694_CAN_FRAME_FLAG_EFF   BIT(0)
> > +#define NCT6694_CAN_FRAME_FLAG_RTR   BIT(1)
> > +#define NCT6694_CAN_FRAME_FLAG_FD    BIT(2)
> > +#define NCT6694_CAN_FRAME_FLAG_BRS   BIT(3)
> > +#define NCT6694_CAN_FRAME_FLAG_ERR   BIT(4)
> > +
> > +#define NCT6694_NAPI_WEIGHT          32
> > +
...
> > +struct nct6694_can_priv {
> > +     struct can_priv can;    /* must be the first member */
> > +     struct can_rx_offload offload;
> > +     struct net_device *ndev;
> > +     struct nct6694 *nct6694;
> > +     struct workqueue_struct *wq;
> > +     struct work_struct tx_work;
> > +     struct nct6694_can_frame tx;
> > +     struct nct6694_can_frame rx;
> > +     struct nct6694_can_event event[2];
> > +     struct can_berr_counter bec;
> > +     unsigned char can_idx;
>
> can you use ndev->dev_port instead?
>

Fix it in the v8.

> > +};
> > +
...
> > +static void nct6694_can_rx(struct net_device *ndev, u8 rx_evt)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_frame *frame =3D &priv->rx;
> > +     struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_RECEIVE,
> > +             .sel =3D NCT6694_CAN_RECEIVE_SEL(priv->can_idx, 1),
> > +             .len =3D cpu_to_le16(sizeof(*frame))
> > +     };
> > +     struct sk_buff *skb;
> > +     int ret;
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, frame);
> > +     if (ret)
> > +             return;
> > +
> > +     if (frame->flag & NCT6694_CAN_FRAME_FLAG_FD) {
> > +             struct canfd_frame *cfd;
> > +
> > +             skb =3D alloc_canfd_skb(priv->ndev, &cfd);
> > +             if (!skb)
> > +                     return;
> > +
> > +             cfd->can_id =3D le32_to_cpu(frame->id);
> > +             cfd->len =3D canfd_sanitize_len(frame->length);
> > +             if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> > +                     cfd->can_id |=3D CAN_EFF_FLAG;
> > +             if (frame->flag & NCT6694_CAN_FRAME_FLAG_BRS)
> > +                     cfd->flags |=3D CANFD_BRS;
> > +             if (frame->flag & NCT6694_CAN_FRAME_FLAG_ERR)
> > +                     cfd->flags |=3D CANFD_ESI;
> > +
> > +             memcpy(cfd->data, frame->data, cfd->len);
> > +     } else {
> > +             struct can_frame *cf;
> > +
> > +             skb =3D alloc_can_skb(priv->ndev, &cf);
> > +             if (!skb)
> > +                     return;
> > +
> > +             cf->can_id =3D le32_to_cpu(frame->id);
> > +             cf->len =3D min_t(u8, frame->length, CAN_MAX_DLEN);
>
> use can_cc_dlc2len()
>

Fix it in the v8.

> > +             if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> > +                     cf->can_id |=3D CAN_EFF_FLAG;
> > +
> > +             if (frame->flag & NCT6694_CAN_FRAME_FLAG_RTR)
> > +                     cf->can_id |=3D CAN_RTR_FLAG;
> > +             else
> > +                     memcpy(cf->data, frame->data, cf->len);
> > +     }
> > +
> > +     nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
> > +                                     struct can_berr_counter *bec)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     *bec =3D priv->bec;
> > +
> > +     return 0;
> > +}
> > +
> > +static void nct6694_can_handle_state_change(struct net_device *ndev,
> > +                                         enum can_state new_state)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct can_berr_counter bec;
> > +     struct can_frame *cf;
> > +     struct sk_buff *skb;
> > +
> > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > +
> > +     nct6694_can_get_berr_counter(ndev, &bec);
> > +
> > +     switch (new_state) {
> > +     case CAN_STATE_ERROR_ACTIVE:
> > +             priv->can.can_stats.error_warning++;
>                                     ^^^^^^^^^^^^^
> > +             priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > +             if (cf)
> > +                     cf->data[1] |=3D CAN_ERR_CRTL_ACTIVE;
> > +             break;
> > +     case CAN_STATE_ERROR_WARNING:
> > +             priv->can.can_stats.error_warning++;
> > +             priv->can.state =3D CAN_STATE_ERROR_WARNING;
> > +             if (cf) {
> > +                     cf->can_id |=3D CAN_ERR_CRTL;
> > +                     if (bec.txerr > bec.rxerr)
> > +                             cf->data[1] =3D CAN_ERR_CRTL_TX_WARNING;
> > +                     else
> > +                             cf->data[1] =3D CAN_ERR_CRTL_RX_WARNING;
> > +                     cf->data[6] =3D bec.txerr;
> > +                     cf->data[7] =3D bec.rxerr;
> > +             }
> > +             break;
> > +     case CAN_STATE_ERROR_PASSIVE:
> > +             priv->can.can_stats.error_passive++;
> > +             priv->can.state =3D CAN_STATE_ERROR_PASSIVE;
> > +             if (cf) {
> > +                     cf->can_id |=3D CAN_ERR_CRTL;
> > +                     cf->data[1] |=3D CAN_ERR_CRTL_RX_PASSIVE;
> > +                     if (bec.txerr >=3D CAN_ERROR_PASSIVE_THRESHOLD)
> > +                             cf->data[1] |=3D CAN_ERR_CRTL_TX_PASSIVE;
> > +                     cf->data[6] =3D bec.txerr;
> > +                     cf->data[7] =3D bec.rxerr;
> > +             }
> > +             break;
> > +     case CAN_STATE_BUS_OFF:
> > +             priv->can.state =3D CAN_STATE_BUS_OFF;
> > +             priv->can.can_stats.bus_off++;
> > +             if (cf)
> > +                     cf->can_id |=3D CAN_ERR_BUSOFF;
> > +             can_free_echo_skb(ndev, 0, NULL);
> > +             netif_stop_queue(ndev);
> > +             can_bus_off(ndev);
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static void nct6694_can_handle_state_errors(struct net_device *ndev, u=
8 status)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
>
> It seems you don't have dedicated RX and TX states, so call
> nct6694_can_get_berr_counter() and use can_state_get_by_berr_counter()
> to get the states. Then basically do that what what
> mcp251xfd_handle_cerrif() does, starting with "new_state =3D max(tx_state=
, rx_state);"
>

Excuse me, do you mean that nct6694_can_handle_state_change() the flow
should like v5?
https://lore.kernel.org/linux-can/CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01=
VzZ0S_9H8g@mail.gmail.com/

> > +
> > +     if (status =3D=3D NCT6694_CAN_EVT_STS_ERROR_ACTIVE &&
> > +         priv->can.state !=3D CAN_STATE_ERROR_ACTIVE) {
> > +             netdev_dbg(ndev, "Error, entered active state\n");
> > +             nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_ACT=
IVE);
> > +     }
> > +
> > +     if (status =3D=3D NCT6694_CAN_EVT_STS_WARNING &&
> > +         priv->can.state !=3D CAN_STATE_ERROR_WARNING) {
> > +             netdev_dbg(ndev, "Error, entered warning state\n");
> > +             nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_WAR=
NING);
> > +     }
> > +
> > +     if (status =3D=3D NCT6694_CAN_EVT_STS_ERROR_PASSIVE &&
> > +         priv->can.state !=3D CAN_STATE_ERROR_PASSIVE) {
> > +             netdev_dbg(ndev, "Error, entered passive state\n");
> > +             nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_PAS=
SIVE);
> > +     }
> > +
> > +     if (status =3D=3D NCT6694_CAN_EVT_STS_BUS_OFF &&
> > +         priv->can.state !=3D CAN_STATE_BUS_OFF) {
> > +             netdev_dbg(ndev, "Error, entered bus-off state\n");
> > +             nct6694_can_handle_state_change(ndev, CAN_STATE_BUS_OFF);
> > +     }
> > +}
> > +
> > +static void nct6694_can_handle_bus_err(struct net_device *ndev, u8 bus=
_err)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct can_frame *cf;
> > +     struct sk_buff *skb;
> > +
> > +     if (bus_err =3D=3D NCT6694_CAN_EVT_ERR_NO_ERROR)
> > +             return;
> > +
> > +     priv->can.can_stats.bus_error++;
> > +
> > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > +     if (skb)
> > +             cf->can_id |=3D CAN_ERR_PROT | CAN_ERR_BUSERROR;
> > +
> > +     switch (bus_err) {
> > +     case NCT6694_CAN_EVT_ERR_CRC_ERROR:
> > +             netdev_dbg(ndev, "CRC error\n");
> > +             ndev->stats.rx_errors++;
> > +             if (skb)
> > +                     cf->data[3] |=3D CAN_ERR_PROT_LOC_CRC_SEQ;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_ERR_STUFF_ERROR:
> > +             netdev_dbg(ndev, "Stuff error\n");
> > +             ndev->stats.rx_errors++;
> > +             if (skb)
> > +                     cf->data[2] |=3D CAN_ERR_PROT_STUFF;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_ERR_ACK_ERROR:
> > +             netdev_dbg(ndev, "Ack error\n");
> > +             ndev->stats.tx_errors++;
> > +             if (skb) {
> > +                     cf->can_id |=3D CAN_ERR_ACK;
> > +                     cf->data[2] |=3D CAN_ERR_PROT_TX;
> > +             }
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_ERR_FORM_ERROR:
> > +             netdev_dbg(ndev, "Form error\n");
> > +             ndev->stats.rx_errors++;
> > +             if (skb)
> > +                     cf->data[2] |=3D CAN_ERR_PROT_FORM;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_ERR_BIT_ERROR:
> > +             netdev_dbg(ndev, "Bit error\n");
> > +             ndev->stats.tx_errors++;
> > +             if (skb)
> > +                     cf->data[2] |=3D CAN_ERR_PROT_TX | CAN_ERR_PROT_B=
IT;
> > +             break;
> > +
> > +     default:
> > +             break;
> > +     }
> > +
>
> missing check:
>
>         if (skb)
>

Fix it in the v8.

> > +     nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static void nct6694_can_tx_irq(struct net_device *ndev)
> > +{
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +
> > +     stats->tx_bytes +=3D can_get_echo_skb(ndev, 0, NULL);
>
> use can_rx_offload_get_echo_skb_queue_tail() here
>

Fix it in the v8.

> > +     stats->tx_packets++;
> > +     netif_wake_queue(ndev);
> > +}
> > +
> > +static irqreturn_t nct6694_can_irq(int irq, void *data)
> > +{
> > +     struct net_device *ndev =3D data;
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_event *evt =3D priv->event;
> > +     struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_EVENT,
> > +             .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, NCT6694_CAN=
_EVENT_MASK),
> > +             .len =3D cpu_to_le16(sizeof(priv->event))
> > +     };
> > +     irqreturn_t handled =3D IRQ_NONE;
> > +     int can_idx =3D priv->can_idx;
> > +     int ret;
>
> it would make sense to have a event pointer here instead of the can_idx?
>
>         const struct nct6694_can_event *event =3D &priv->event[priv->can_=
idx];
>

Fix it in the v8.

> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
> > +     if (ret < 0)
> > +             return handled;
> > +
> > +     if (priv->event[can_idx].rx_evt & NCT6694_CAN_EVT_RX_DATA_IN) {
> > +             nct6694_can_rx(ndev, priv->event[can_idx].rx_evt);
> > +             handled =3D IRQ_HANDLED;
> > +     }
> > +
> > +     if (priv->event[can_idx].rx_evt & NCT6694_CAN_EVT_RX_DATA_LOST) {
> > +             nct6694_can_handle_lost_msg(ndev);
> > +             handled =3D IRQ_HANDLED;
> > +     }
> > +
> > +     if (priv->event[can_idx].status) {
> > +             nct6694_can_handle_state_errors(ndev, priv->event[can_idx=
].status);
> > +             handled =3D IRQ_HANDLED;
> > +     }
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING) {
> > +             nct6694_can_handle_bus_err(ndev, priv->event[can_idx].err=
);
> > +             handled =3D IRQ_HANDLED;
> > +     }
> > +
> > +     if (handled)
> > +             can_rx_offload_threaded_irq_finish(&priv->offload);
> > +
> > +     if (priv->event[can_idx].tx_evt & NCT6694_CAN_EVT_TX_FIFO_EMPTY)
> > +             nct6694_can_tx_irq(ndev);
>
> Move this in front of the handled check and add "handled =3D IRQ_HANDLED;=
"
> to the if-block.
>

Fix it in the v8.

> > +
> > +     priv->bec.rxerr =3D priv->event[can_idx].rec;
> > +     priv->bec.txerr =3D priv->event[can_idx].tec;
> > +
> > +     return handled;
> > +}
> > +
> > +static void nct6694_can_tx_work(struct work_struct *work)
> > +{
> > +     struct nct6694_can_priv *priv =3D container_of(work,
> > +                                                  struct nct6694_can_p=
riv,
> > +                                                  tx_work);
> > +     struct nct6694_can_frame *frame =3D &priv->tx;
> > +     struct net_device *ndev =3D priv->ndev;
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +     struct sk_buff *skb =3D priv->can.echo_skb[0];
> > +     static const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_DELIVER,
> > +             .sel =3D NCT6694_CAN_DELIVER_SEL(1),
> > +             .len =3D cpu_to_le16(sizeof(*frame))
> > +     };
> > +     u32 txid;
> > +     int err;
> > +
> > +     memset(frame, 0, sizeof(*frame));
> > +
> > +     if (priv->can_idx =3D=3D 0)
> > +             frame->tag =3D NCT6694_CAN_FRAME_TAG_CAN0;
> > +     else
> > +             frame->tag =3D NCT6694_CAN_FRAME_TAG_CAN1;
>
>         frame->tag =3D NCT6694_CAN_FRAME_TAG_CAN(priv->can_idx);
>

Fix it in the v8.

> > +
> > +     if (can_is_canfd_skb(skb)) {
> > +             struct canfd_frame *cfd =3D (struct canfd_frame *)skb->da=
ta;
> > +
> > +             if (cfd->flags & CANFD_BRS)
> > +                     frame->flag |=3D NCT6694_CAN_FRAME_FLAG_BRS;
> > +
> > +             if (cfd->can_id & CAN_EFF_FLAG) {
> > +                     txid =3D cfd->can_id & CAN_EFF_MASK;
> > +                     frame->flag |=3D NCT6694_CAN_FRAME_FLAG_EFF;
> > +             } else {
> > +                     txid =3D cfd->can_id & CAN_SFF_MASK;
> > +             }
> > +             frame->flag |=3D NCT6694_CAN_FRAME_FLAG_FD;
> > +             frame->id =3D cpu_to_le32(txid);
> > +             frame->length =3D cfd->len;
> > +
> > +             memcpy(frame->data, cfd->data, cfd->len);
> > +     } else {
> > +             struct can_frame *cf =3D (struct can_frame *)skb->data;
> > +
> > +             if (cf->can_id & CAN_EFF_FLAG) {
> > +                     txid =3D cf->can_id & CAN_EFF_MASK;
> > +                     frame->flag |=3D NCT6694_CAN_FRAME_FLAG_EFF;
> > +             } else {
> > +                     txid =3D cf->can_id & CAN_SFF_MASK;
> > +             }
> > +
> > +             if (cf->can_id & CAN_RTR_FLAG)
> > +                     frame->flag |=3D NCT6694_CAN_FRAME_FLAG_RTR;
> > +             else
> > +                     memcpy(frame->data, cf->data, cf->len);
> > +
> > +             frame->id =3D cpu_to_le32(txid);
> > +             frame->length =3D cf->len;
> > +     }
> > +
> > +     err =3D nct6694_write_msg(priv->nct6694, &cmd_hd, frame);
> > +     if (err) {
> > +             netdev_err(ndev, "%s: TX FIFO is full!\n", __func__);
> > +             can_free_echo_skb(ndev, 0, NULL);
> > +             stats->tx_dropped++;
> > +             stats->tx_errors++;
> > +             netif_wake_queue(ndev);
> > +     }
> > +}
> > +
> > +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> > +                                       struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     if (can_dev_dropped_skb(ndev, skb))
> > +             return NETDEV_TX_OK;
> > +
> > +     netif_stop_queue(ndev);
> > +     can_put_echo_skb(skb, ndev, 0, 0);
> > +     queue_work(priv->wq, &priv->tx_work);
> > +
> > +     return NETDEV_TX_OK;
> > +}
> > +
> > +static int nct6694_can_start(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_setting *setting;
> > +     struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_SETTING,
> > +             .sel =3D priv->can_idx,
> > +             .len =3D cpu_to_le16(sizeof(*setting))
> > +     };
> > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
>
> nitpick:
> move these 2 right after priv and d_bt first.
>

Fix it in the v8.

> > +     int ret;
> > +
> > +     setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> > +     if (!setting)
> > +             return -ENOMEM;
> > +
> > +     setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> > +     setting->dbr =3D cpu_to_le32(d_bt->bitrate);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1=
_MON);
> > +
> > +     if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) &&
> > +         priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
>
> We should move this check into the infrastructure. Please only check for
> CAN_CTRLMODE_FD_NON_ISO.
>

Fix it in the v8.

> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1=
_NISO);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1=
_LBCK);
> > +
> > +     ret =3D nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> > +     if (ret)
> > +             goto exit;
> > +
> > +     priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > +
> > +exit:
> > +     kfree(setting);
> > +     return ret;
> > +}
> > +
> > +static int nct6694_can_stop(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
>
> How does the device know, that it should leave the CAN bus? Is there a
> message you can send to it? If not put it at least into listen only mode.
>

My device only resets upon receiving the initial command, so can I
assign priv->can.ctrlmode =3D CAN_CTRLMODE_LISTENONLY directly?

> > +     netif_stop_queue(ndev);
> > +     free_irq(ndev->irq, ndev);
> > +     destroy_workqueue(priv->wq);
> > +     priv->wq =3D NULL;
>
> no need to set wq to NULL
>

Fix it in the v8.

> > +     priv->can.state =3D CAN_STATE_STOPPED;
> > +     can_rx_offload_disable(&priv->offload);
>
> Please change move can_rx_offload_disable() in front of "priv->can.state
> =3D CAN_STATE_STOPPED".
>

Fix it in the v8.

> > +     close_candev(ndev);
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode=
 mode)
> > +{
> > +     switch (mode) {
> > +     case CAN_MODE_START:
> > +             nct6694_can_start(ndev);
>
> please add error checking
>

Fix it in the v8.

> > +             netif_wake_queue(ndev);
> > +             return 0;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
...
> > +static int nct6694_can_probe(struct platform_device *pdev)
> > +{
> > +     const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct nct6694_can_priv *priv;
> > +     struct net_device *ndev;
> > +     int ret, irq, can_clk;
> > +
> > +     irq =3D irq_create_mapping(nct6694->domain,
> > +                              NCT6694_IRQ_CAN1 + cell->id);
> > +     if (!irq)
> > +             return irq;
> > +
> > +     ndev =3D alloc_candev(sizeof(struct nct6694_can_priv), 1);
> > +     if (!ndev)
> > +             return -ENOMEM;
> > +
> > +     ndev->irq =3D irq;
> > +     ndev->flags |=3D IFF_ECHO;
> > +     ndev->dev_port =3D cell->id;
> > +     ndev->netdev_ops =3D &nct6694_can_netdev_ops;
> > +     ndev->ethtool_ops =3D &nct6694_can_ethtool_ops;
> > +
> > +     priv =3D netdev_priv(ndev);
> > +     priv->nct6694 =3D nct6694;
> > +     priv->ndev =3D ndev;
> > +
> > +     can_clk =3D nct6694_can_get_clock(priv);
> > +     if (can_clk < 0) {
> > +             ret =3D dev_err_probe(&pdev->dev, can_clk,
> > +                                 "Failed to get clock\n");
> > +             goto free_candev;
> > +     }
> > +
> > +     INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> > +
> > +     priv->can_idx =3D cell->id;
> > +     priv->can.state =3D CAN_STATE_STOPPED;
>
> The device is allocated with CAN_STATE_STOPPED set, can be removed.
>

Fix it in the v8.

> > +     priv->can.clock.freq =3D can_clk;
> > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_nominal_cons=
t;
> > +     priv->can.data_bittiming_const =3D &nct6694_can_bittiming_data_co=
nst;
> > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > +     priv->can.do_get_berr_counter =3D nct6694_can_get_berr_counter;
> > +
> > +     priv->can.ctrlmode =3D CAN_CTRLMODE_FD;
> > +
> > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK           =
 |
> > +                                    CAN_CTRLMODE_LISTENONLY          |
> > +                                    CAN_CTRLMODE_FD                  |
> > +                                    CAN_CTRLMODE_FD_NON_ISO          |
> > +                                    CAN_CTRLMODE_BERR_REPORTING;
>
> nitpick: one space in front of "|" please
>
> Does your device run in CAN-FD mode all the time? If so, please use
> can_set_static_ctrlmode() to set it after priv->can.ctrlmode_supported
> and remove CAN_CTRLMODE_FD from ctrlmode_supported.
>

Fix it in the v8.

> > +
> > +     ret =3D can_rx_offload_add_manual(ndev, &priv->offload,
> > +                                     NCT6694_NAPI_WEIGHT);
> > +     if (ret) {
> > +             dev_err_probe(&pdev->dev, ret, "Failed to add rx_offload\=
n");
> > +             goto free_candev;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +     SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> > +
> > +     ret =3D register_candev(priv->ndev);
> > +     if (ret)
> > +             goto del_rx_offload;
> > +
> > +     return 0;
> > +
> > +del_rx_offload:
>
> nitpick: please rename to rx_offload_del or can_rx_offload_del
>

Fix it in the v8.

> > +     can_rx_offload_del(&priv->offload);
> > +free_candev:
> > +     free_candev(ndev);
> > +     return ret;
> > +}
> > +
> > +static void nct6694_can_remove(struct platform_device *pdev)
> > +{
> > +     struct nct6694_can_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +     cancel_work_sync(&priv->tx_work);
>
> The workqueue has already been destroyed in nct6694_can_stop(), so more
> work should be pending.
>

Fix it in the v8.

> > +     unregister_candev(priv->ndev);
> > +     can_rx_offload_del(&priv->offload);
> > +     free_candev(priv->ndev);
> > +}
> > +


Best regards,
Ming

