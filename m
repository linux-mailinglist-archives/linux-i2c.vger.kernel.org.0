Return-Path: <linux-i2c+bounces-8512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD59F29F3
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 07:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13F0A18856AB
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 06:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4C61CCB4B;
	Mon, 16 Dec 2024 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjFzXe+I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673B1189902;
	Mon, 16 Dec 2024 06:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734330079; cv=none; b=giMFHAJDZYtRvvNjyUi1UdyuBecmyqIfolPaN3T4ZgZWLpENAg0yJXTSOUBLV7CDf1jVAmHsbKkDqHR85GDBviOqFFhdgl/f3x3lhe5ev24EgO4FzMGReIMPiSx11emdL7GZvZ5Rk0fxzIUKpTFkyAD79OVlVg0EkhxD9Iuvo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734330079; c=relaxed/simple;
	bh=LO8aGlbj/h5gU87Hx8F+5X+oQydffRM+JGGAmulNass=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/TA6Lul3fK67+Qit2GE7VaVZz7daYIyId6arK4K+pJvEnN+q/QrXRTRxHJ1PnPmoZwrlB9B/HPUE/mHwzwJEnazT5LUpemQ61hgLuPxApfwOdj6w+U2A8sasxhOhZbqrfBwHDmSTBZgG7w+w+0OdJo4fC8940Ook4AUeITXHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjFzXe+I; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so818513276.3;
        Sun, 15 Dec 2024 22:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734330076; x=1734934876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPlcscq2fhJrMWQqpc+/Ewie0Zw0MO/6t7Wy2HxsZt0=;
        b=LjFzXe+In8lozTosM43iIbtxUlPiHsBJOhH+Ym5UGqZ3Aoi6jSCSQiwyjyMdbiqO7O
         5dNTT58Dhsbh6d7IiJnqajSYEW8m6WA1QMrcOOG//07DT67J7Q/yWOOz47cs6cjhZ+AW
         EqAOaRL5i7UdccT9RveQ3uxv1h/tTS2xlBe8jRvi4crEOnLoBETuYfDBwKMoNZfecTrx
         FLvcSjUez2kvjfmP34XRETYCkftD5siUyWcxW8cTZIELJj8c6oijQevC8U73IlmV74nN
         dpMnAgKmxV27zNuhiK5QVal/a6X0paAQEjYHnyFdX4tZO4CrQFT0ZfjlTuDZ8CXGlIjh
         Klpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734330076; x=1734934876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPlcscq2fhJrMWQqpc+/Ewie0Zw0MO/6t7Wy2HxsZt0=;
        b=imMPNYkIGyuGYTUHzye77YzXuljx9gc9qlT+WsO8ILNWhg6B2rprk1ppVZ4UkYtViY
         2xysyQaW6qBGKEplB4JnhFRxKE2nZx57jzDJUSZTiBvnNIcdnmj4xnpSC8z24PZmXLKJ
         NiMZ+jynICV2YZu4K1AFbFcFBGcxmhtTElb59+ULctS2LKcMsXTgxz1m+2sW32ZTBo/b
         G3cBtt8d+ZQspcDGuI0ZaI2lP56FcnccHZewv+XuLmK6s3XlyEoj8jFgCn7vvGvU9AUC
         U9ZrJCZ461lt9wv/EubypA3u7iZ702HgWaayyGKjsII9PJm/8N7Qm/+KyvCxNUT6vX8o
         JxoA==
X-Forwarded-Encrypted: i=1; AJvYcCUdCPvcvyK4w8Q4soPKi7PjWKQ6BG0qWdDx3oFo2ygeYu8ernV1bRCFP6VEXZzqhnk30mCE4ky+zvF0qg==@vger.kernel.org, AJvYcCUkx+GvqfPMRnufjsH7rMiVxFAB2BajWPlDsJyI07DFPYS1VLeUwcm9prfSlyHv0e2tvQ7nvS18bAz7NKMG@vger.kernel.org, AJvYcCVtqi7eFbqfzerb6/IWTDubXk2vULxaJwLkjt5at7we8Nqcb+znpZOzyfXYxYabvdK0W8m+sqtK@vger.kernel.org, AJvYcCWAYu1ZKJjReIs1UeT/lMbLKIT8uyopMLMAFLu2F0Vrs9nHRy4z3d80dXJgVT+b8lwVw9s8iU0sJoeTDN0H2zc=@vger.kernel.org, AJvYcCWHH7UxqRvRCAJZLUIqnHBQCjLmGUh3fQ3avgmCtXAlCfJdB2BcOMCt23Jw2gD5a329O8aD0BOftDgKepk=@vger.kernel.org, AJvYcCX/hcEDehRv2bpBCtNxSo5vBDVb4tx2JHiMNY/FAkNsKM+6h+bwTmH2DZi5LfjfGtfDn1l9S63HGWmc@vger.kernel.org, AJvYcCXYIksXbw8YDloGpo6U1AzCJDzBJE2tM+1r+nM31esN4RwGRem1lvU8Vh3nHB9NO/lVy8F9ROYcG9g=@vger.kernel.org, AJvYcCXycjF0UpbdELN3bCetGUOhFJAt0ukgaXSLFw7FJ+oz/R9UjPpiOieZNXCnAF77VHl4kwgW8iiIkM6A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg3kzFZD1F3HxiyYie+1ocBj+qhhEQ1+KMn/88ftkWQEw4AXWE
	Hll5DV7tA0tAwgeaOVjG6ia06Rz+NHYlv2EQG3hnXG5cnCsLNT4rPF+SEl5M+jFWQ82fCFw5B7V
	rkFnc4Se9V/xwigkS7FC/iR0KfpM=
X-Gm-Gg: ASbGncstx6uuARhPlCxXNzQd1V9af5vsz+GDkTmt6TZbSLNKLAmzlGW4qIcXi5ykqrv
	FJIykzc4Tvxu7MtsCwHhn/wWbZkEAtaQqdu62wTh3Gs3bMOi/B1rSlIfYKJc5HM0Fc8VeZG4=
X-Google-Smtp-Source: AGHT+IF3OpmXz6FP/hsB4VcYkEBawTR69ZPuiZiOcoQ4n7PMVxoxHu0kA73AxLkM424FRVcip81rlx5bNMLDvArXfuw=
X-Received: by 2002:a05:6902:1542:b0:e4b:f516:38ba with SMTP id
 3f1490d57ef6-e4bf516431amr2367517276.17.1734330076195; Sun, 15 Dec 2024
 22:21:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-5-tmyu0@nuvoton.com>
 <20241211-taupe-leech-of-respect-4c325a-mkl@pengutronix.de>
In-Reply-To: <20241211-taupe-leech-of-respect-4c325a-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 16 Dec 2024 14:21:05 +0800
Message-ID: <CAOoeyxUj8EBWNr0Pi8O3+Tua=gBRWRmQQe4WbwwE=gq3CGO+4w@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] can: Add Nuvoton NCT6694 CAN support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Marc,

Thank you for your comments,

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B412=E6=9C=8811=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:59=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 10.12.2024 18:45:21, Ming Yu wrote:
> > This driver supports Socket CANfd functionality for NCT6694 MFD
> > device based on USB interface.
>
> Please use the rx-offload helper, otherwise the CAN frames might be
> revived out of order.
>

Understood. I'll make the modifications in the next patch.

> >
...
> > +
> > +struct __packed nct6694_can_event {
> > +     u8 err1;
> > +     u8 status1;
> > +     u8 tx_evt1;
> > +     u8 rx_evt1;
> > +     u8 rec1;
> > +     u8 tec1;
> > +     u8 reserved1[2];
> > +     u8 err2;
> > +     u8 status2;
> > +     u8 tx_evt2;
> > +     u8 rx_evt2;
> > +     u8 rec2;
> > +     u8 tec2;
> > +     u8 reserved2[2];
> > +};
>
> Create an extra struct that only describes a channel
>
> struct __packed nct6694_can_event_channel {
>         u8 err;
>         u8 status;
>         u8 tx_evt;
>         u8 rx_evt;
>         u8 rec;
>         u8 tec;
>         u8 reserved[2];
> }
>
> and put an array of 2 into struct __packed nct6694_can_event.
>

Fix it in v4.

> > +
> > +struct __packed nct6694_can_xmit {
> > +     u8 tag;
> > +     u8 flag;
> > +     u8 reserved;
> > +     u8 dlc;
> > +     __le32 id;
> > +     u8 data[64];
> > +     u8 msg_buf[72];
>
> Why is the message so long? What's in the msg_buf?
>

It's deprecated, I'll drop it in v4.

> > +};
> > +
> > +struct nct6694_can_priv {
> > +     struct can_priv can;    /* must be the first member */
> > +     struct net_device *ndev;
> > +     struct nct6694 *nct6694;
> > +     struct mutex lock;
>
> What does lock protect?
>

The lock is used to protect tx_buf and rx_buf for each CAN device.

> > +     struct sk_buff *tx_skb;
> > +     struct workqueue_struct *wq;
> > +     struct work_struct tx_work;
> > +     unsigned char *tx_buf;
> void *
> > +     unsigned char *rx_buf;
> void *
> > +     unsigned char can_idx;
> > +     bool tx_busy;
>
> IMHO it makes no sense to have tx_skb and tx_busy
>

Okay! I will revisit these to evaluate whether they are still necessary.

> > +};
> > +
...
> > +static void nct6694_can_read_fifo(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_xmit *xmit =3D (struct nct6694_can_xmit *)priv=
->rx_buf;
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +     struct canfd_frame *cf;
> > +     struct sk_buff *skb;
> > +     int can_idx =3D priv->can_idx;
> > +     u32 id;
> > +     int ret;
> > +     u8 fd_format =3D 0;
> bool - no need to init

Fix it in v4.

> > +
> > +     guard(mutex)(&priv->lock);
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                            NCT6694_CAN_CMD11_OFFSET(can_idx, 1),
> > +                            sizeof(struct nct6694_can_xmit), xmit);
> > +     if (ret < 0)
> > +             return;
> > +
> > +     /* Check type of frame and create skb */
> > +     fd_format =3D xmit->flag & NCT6694_CAN_FLAG_FD;
> > +     if (fd_format)
> > +             skb =3D alloc_canfd_skb(ndev, &cf);
> > +     else
> > +             skb =3D alloc_can_skb(ndev, (struct can_frame **)&cf);
> > +
> > +     if (!skb) {
> > +             stats->rx_dropped++;
> > +             return;
> > +     }
> > +
> > +     cf->len =3D xmit->dlc;
>
> what does xmit->dlc contain? The DLC or the length?
>

It reflects the actual data length.

> > +
> > +     /* Get ID and set flag by its type(Standard ID format or Ext ID f=
ormat) */
> > +     id =3D le32_to_cpu(xmit->id);
> > +     if (xmit->flag & NCT6694_CAN_FLAG_EFF) {
> > +             /*
> > +              * In case the Extended ID frame is received, the standar=
d
> > +              * and extended part of the ID are swapped in the registe=
r,
> > +              * so swap them back to obtain the correct ID.
> > +              */
>
> You comment doesn't match the code.
>

Fix it in v4.

> > +             id |=3D CAN_EFF_FLAG;
> > +     }
> > +
> > +     cf->can_id =3D id;
> > +
> > +     /* Set ESI flag */
> > +     if (xmit->flag & NCT6694_CAN_FLAG_ERR) {
> > +             cf->flags |=3D CANFD_ESI;
> > +             netdev_dbg(ndev, "ESI Error\n");
> > +     }
> > +
> > +     /* Set RTR and BRS */
> > +     if (!fd_format && (xmit->flag & NCT6694_CAN_FLAG_RTR)) {
> > +             cf->can_id |=3D CAN_RTR_FLAG;
> > +     } else {
> > +             if (xmit->flag & NCT6694_CAN_FLAG_BRS)
> > +                     cf->flags |=3D CANFD_BRS;
> > +
> > +             memcpy(cf->data, xmit->data, cf->len);
> > +
> > +             stats->rx_bytes +=3D cf->len;
> > +     }
> > +
> > +     stats->rx_packets++;
> > +
> > +     netif_receive_skb(skb);
> > +}
...
> > +static int nct6694_can_poll(struct net_device *ndev, int quota)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_event *evt =3D (struct nct6694_can_event *)pri=
v->rx_buf;
> > +     int can_idx =3D priv->can_idx;
> > +     int work_done =3D 0, ret;
> > +     u8 evt_mask =3D NCT6694_CAN_EVENT_ERR | NCT6694_CAN_EVENT_STATUS;
> > +     u8 bus_err, can_status;
> > +
> > +     scoped_guard(mutex, &priv->lock) {
> > +             ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                                    NCT6694_CAN_CMD2_OFFSET(can_idx, e=
vt_mask),
> > +                                    sizeof(struct nct6694_can_event), =
evt);
> > +             if (ret < 0)
> > +                     return IRQ_NONE;
>
> propagate the error
>

Fix it in v4.

> > +
> > +             if (can_idx) {
> > +                     bus_err =3D evt->err2;
> > +                     can_status =3D evt->status2;
> > +             } else {
> > +                     bus_err =3D evt->err1;
> > +                     can_status =3D evt->status1;
> > +             }
> > +     }
> > +
...
> > +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> > +                                       struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     if (priv->tx_skb || priv->tx_busy) {
> > +             netdev_err(ndev, "hard_xmit called while tx busy\n");
> > +             return NETDEV_TX_BUSY;
> > +     }
> > +
> > +     if (can_dev_dropped_skb(ndev, skb))
> > +             return NETDEV_TX_OK;
>
> please drop first
>

Fix it in v4.

> > +
> > +     netif_stop_queue(ndev);
> > +     priv->tx_skb =3D skb;
> > +     queue_work(priv->wq, &priv->tx_work);
> > +
> > +     return NETDEV_TX_OK;
> > +}
> > +
> > +static void nct6694_can_tx(struct net_device *ndev, struct canfd_frame=
 *cf)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_xmit *xmit =3D (struct nct6694_can_xmit *)priv=
->tx_buf;
> > +     u32 txid =3D 0;
> > +
> > +     memset(xmit, 0, sizeof(struct nct6694_can_xmit));
> > +
> > +     if (priv->can_idx =3D=3D 0)
> > +             xmit->tag =3D NCT6694_CAN_TAG_CAN0<;
> > +     else
> > +             xmit->tag =3D NCT6694_CAN_TAG_CAN1;
> > +
> > +     if (cf->can_id & CAN_EFF_FLAG) {
> > +             txid =3D cf->can_id & CAN_EFF_MASK;
> > +             /*
> > +              * In case the Extended ID frame is transmitted, the
> > +              * standard and extended part of the ID are swapped
> > +              * in the register, so swap them back to send the
> > +              * correct ID.
>
> You comment doesn't match the code.
>

Fix it in v4.

> > +              */
> > +             xmit->flag |=3D NCT6694_CAN_FLAG_EFF;
> > +     } else {
> > +             txid =3D cf->can_id & CAN_SFF_MASK;
> > +     }
> > +
> > +     xmit->id =3D cpu_to_le32(txid);
> > +     xmit->dlc =3D cf->len;
> > +
> > +     if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) &&
>
> No need to check ctrlmode
>

Fix it in v4.

> > +         can_is_canfd_skb(priv->tx_skb)) {
> > +             xmit->flag |=3D NCT6694_CAN_FLAG_FD;
> > +             if (cf->flags & CANFD_BRS)
> > +                     xmit->flag |=3D NCT6694_CAN_FLAG_BRS;
> > +     }
> > +
> > +     if (cf->can_id & CAN_RTR_FLAG)
> > +             xmit->flag |=3D NCT6694_CAN_FLAG_RTR;
>
> you can move this into the !can_is_canfd_skb branch of the if
>

Fix it in v4.

> > +
> > +     memcpy(xmit->data, cf->data, cf->len);
> > +
> > +     nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                       NCT6694_CAN_CMD10_OFFSET(1),
> > +                       sizeof(struct nct6694_can_xmit),
> > +                       xmit);
> > +}
> > +
> > +static void nct6694_can_tx_work(struct work_struct *work)
> > +{
> > +     struct nct6694_can_priv *priv =3D container_of(work,
> > +                                                  struct nct6694_can_p=
riv,
> > +                                                  tx_work);
> > +     struct net_device *ndev =3D priv->ndev;
> > +     struct canfd_frame *cf;
> > +
> > +     guard(mutex)(&priv->lock);
> > +
> > +     if (priv->tx_skb) {
> > +             if (priv->can.state =3D=3D CAN_STATE_BUS_OFF) {
> > +                     nct6694_can_clean(ndev);
> > +             } else {
> > +                     cf =3D (struct canfd_frame *)priv->tx_skb->data;
> > +                     nct6694_can_tx(ndev, cf);
> > +                     priv->tx_busy =3D true;
> > +                     can_put_echo_skb(priv->tx_skb, ndev, 0, 0);
> > +                     priv->tx_skb =3D NULL;
> > +             }
> > +     }
> > +}
> > +
> > +static const struct net_device_ops nct6694_can_netdev_ops =3D {
> > +     .ndo_open =3D nct6694_can_open,
> > +     .ndo_stop =3D nct6694_can_stop,
> > +     .ndo_start_xmit =3D nct6694_can_start_xmit,
> > +     .ndo_change_mtu =3D can_change_mtu,
> > +};
> > +
> > +static const struct ethtool_ops nct6694_can_ethtool_ops =3D {
> > +     .get_ts_info =3D ethtool_op_get_ts_info,
> > +};
> > +
> > +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> > +{
> > +     struct nct6694_can_information *info =3D (struct nct6694_can_info=
rmation *)priv->rx_buf;
> > +     int ret;
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                            NCT6694_CAN_CMD1_OFFSET,
> > +                            sizeof(struct nct6694_can_information),
> > +                            info);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return le32_to_cpu(info->can_clk);
> > +}
> > +
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
> > +             return -EINVAL;
>
> propagate error value
>

Fix it in v4.

> > +
> > +     ndev =3D alloc_candev(sizeof(struct nct6694_can_priv), 1);
> > +     if (!ndev)
> > +             return -ENOMEM;
> > +
> > +     ndev->irq =3D irq;
> > +     ndev->flags |=3D IFF_ECHO;
> > +     ndev->netdev_ops =3D &nct6694_can_netdev_ops;
> > +     ndev->ethtool_ops =3D &nct6694_can_ethtool_ops;
> > +
> > +     priv =3D netdev_priv(ndev);
> > +     priv->nct6694 =3D nct6694;
> > +     priv->ndev =3D ndev;
> > +
> > +     priv->tx_buf =3D devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
> > +                                 sizeof(unsigned char), GFP_KERNEL);
>
> devm_kzalloc()
> > +     if (!priv->tx_buf) {
> > +             ret =3D -ENOMEM;
> > +             goto free_candev;
> > +     }
> > +
> > +     priv->rx_buf =3D devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
> > +                                 sizeof(unsigned char), GFP_KERNEL);
> devm_kzalloc()
>

Fix it in v4.

> > +     if (!priv->rx_buf) {
> > +             ret =3D -ENOMEM;
> > +             goto free_candev;
> > +     }
> > +
> > +     can_clk =3D nct6694_can_get_clock(priv);
> > +     if (can_clk < 0) {
> > +             ret =3D -EIO;
>
> propagate the error value, don't overwrite it
>
> move the dev_err_probe() here.
>

Fix it in v4.

> > +             goto free_candev;
> > +     }
> > +
> > +     mutex_init(&priv->lock);
> > +     INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> > +
> > +     priv->can_idx =3D cell->id;
> > +     priv->can.state =3D CAN_STATE_STOPPED;
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
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +     SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> > +
> > +     ret =3D register_candev(priv->ndev);
> > +     if (ret)
> > +             goto free_candev;
> > +
> > +     return 0;
> > +
> > +free_candev:
> > +     free_candev(ndev);
> > +     return dev_err_probe(&pdev->dev, ret, "Probe failed\n");
>
> Move the dev_err_probe() with an appropriate error message to where the
> error occurs. If malloc fails, the kernel already prints for you, so
> here it's only nct6694_can_get_clock() only.
>

Understood. I'll make the modifications in the next patch.

> > +}
> > +
> > +static void nct6694_can_remove(struct platform_device *pdev)
> > +{
> > +     struct nct6694_can_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +     cancel_work_sync(&priv->tx_work);
> > +     unregister_candev(priv->ndev);
> > +     free_candev(priv->ndev);
> > +}
> > +
> > +static struct platform_driver nct6694_can_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D DRVNAME,
> > +     },
> > +     .probe          =3D nct6694_can_probe,
> > +     .remove         =3D nct6694_can_remove,
> > +};
> > +
> > +module_platform_driver(nct6694_can_driver);
> > +
> > +MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:nct6694-can");
> > --
> > 2.34.1
> >
> >
> >
>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

Best regards,
Ming

