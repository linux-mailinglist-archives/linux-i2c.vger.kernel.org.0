Return-Path: <linux-i2c+bounces-8513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD49F2A8E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 07:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C906518878D2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 06:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8591CDFD3;
	Mon, 16 Dec 2024 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnJ3RcJo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B28B14D2B7;
	Mon, 16 Dec 2024 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734332339; cv=none; b=fcz60EwMJ+oxASCzeURlIRpquzgOFBoaWafM+KeJTPeoUJBCkGaK91rfLA5bHi/rI/XJCP6LFDCvOllJ/6gLJWQhhNIiD9JgYv8arw6bcadM+uhpPNGIkxlTdgJwo5+tvSrAQ2NmwdSyqeNY8oYpSqSeSwCCsUQ512J/KhvryUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734332339; c=relaxed/simple;
	bh=kP8o3Wu5SYeGQi4i2KBYOL+w46QVsw08vfpOkpaw96Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9Mvq0zR+mkpiXq2AGpmLQMfOB3GIlCkJL4AsYcAM/JQKqh6azz7G7PcEaoaTn/G8En44gu19gAQwVJt0OTK6T9lJhxg0uTkzW/WMOgS7wdQZRcHNZvOldWpjups+X4OCYysS4B6JUUPX8D8zTT9OBRIyrLekn+a21Ps4rGRpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnJ3RcJo; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3983426f80so2320938276.1;
        Sun, 15 Dec 2024 22:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734332336; x=1734937136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xjdIjnVedjMiPMGG0oBsM1WtHoC9LAFAnmOL3SpTf0=;
        b=RnJ3RcJoqwFfqz8WUvMxkQk7YEKkM0ZHaxMULyyUZdYaD8C97WYilZjhJGTcoEEFt+
         TUh7jNzFYsetbFBFfCvRdQ5924tVC+kB8U1VSSRsipF0pxF2Meox63Qp8Fvzc2P304Wx
         9Q2WlIWIX4sXRnhTCpVagisTKE8hjEn4ESYtQEj4mY2yBt8uPrz2ERE5AfO5Fq2tMUhK
         WpLZNBne53+K4kMYpOsN0IaHyQ4W5hB2hO/UVpgSmyMH3nChwD6A7t+biqG5IkCArn8H
         Dc4p8KdtU5cqXJodjhm2DcXDLSD+axNh3VZoFW75ONhPi4ZZu4lDgnQI6zBvWag+nIHO
         1tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734332336; x=1734937136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xjdIjnVedjMiPMGG0oBsM1WtHoC9LAFAnmOL3SpTf0=;
        b=fV+GXcohNeiGvAUhCZACGvzFCnf5mdR9s0DdKoVN4CeH8Tj+zoQCr/FngmravAdDKi
         iJiUi27Jojh0aruRGLmtWGlQojIFgDOk+pe3E3ZNB3LVGNoNsLgQ3ZBxVH7ZuD5xQ+eE
         71LgYCwWgzh7PAMF0N3gI9jaf3YQ1rXDEpn2YOi6WMt6es0CKb0MLeCKXcBqndf6DWXf
         IQ+3T+XI1mU1RJa1CNqWPsIPXaggL/2XzD1NDYqEIfnvb8H7ozlEUu0dReRVaVS+jXmr
         r1zMZ6XBuiZ+y3JvqEZTAlSzaZ6hFYe5bWvDo6l+rq/QVBX5q4+UqfQ8IVRIy2T6850w
         9F2w==
X-Forwarded-Encrypted: i=1; AJvYcCUb6jbtcCGi52QsdsFHiagQV7sloGFYzZs0lOld20ECitrmiY4BNp+rEZCQzjIEwKavNJ2ksYDMdtoX@vger.kernel.org, AJvYcCVEUDaQsBwO5oJjl5uFZ3LBclfgkZ4+c2qUHZ7UZ7KQJIciw79ainBdXkw97HkOGORWBaqZ9GtFYtNbrE9d@vger.kernel.org, AJvYcCVfSe7jCRv4GfYB7H/iTX7y9sHdOLZDFW8HXmKue3gSRtzLby+lVdj1LFuSqWT54r009yDnCg2FSEdJBg==@vger.kernel.org, AJvYcCW01b9ppceuSLiohpP0XVBqHOLk6DIYmFSTCJTIwXZiM8r80QyfWSH2isoLT4k3GjtNJ+H9vduo@vger.kernel.org, AJvYcCWZd4vLsKZk/inPLlSl+SUbW/MxF0dD/Xhl7oKzHUUor050TU1Rp4PYAGtXDInxS0/X3gG5S1QhJ27etVr7LWU=@vger.kernel.org, AJvYcCX2Vm2LBf/3xYiVQ1WnmA2im6kIwYAjycEOy15e7Yf1TPZhHj62g9LU66sCakpz8G4m6IXoBDAQF9rFKh8=@vger.kernel.org, AJvYcCXglwniWLP3V9wcF7Bc9gbDqUWuOX+X8bg937YCM9uT+WBjdI/Ik90l8DUyvMkfiu5Au3d3yfs7yh+v@vger.kernel.org, AJvYcCXqWvEDigmbAoBzgf4rI17NQ0kEkXjHVMZmtD6wjZSO1hUL+OIt0TDLHZJ+omfh/H6N99jupcLgSZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAdp7mPeh3/+OIrXUohuv/MJGeT1BkrwqQVfirNBHytO4b8hz6
	hMBLFD4Ch4dG4g2rPo2cH8yq+GH4INkh4wi1igDBLfN1G+WoYQDp51nMqU9xb70rbQZNiUBycEL
	B9eaMkBy+8j8hTzAVYPqFrQy1q0o=
X-Gm-Gg: ASbGnctPDdF7UM2NR3fbT1cCNaxU6qwM48aSSk9XORlaEPVDtnAbLl58N5D+6BGxE5s
	ol+DS4yKMrJHK3uXi1lWgmai6kV8qcdVENuPdNNyGMHXbHwdY2wyVUsDbq+BsdL78BStQ0Ts=
X-Google-Smtp-Source: AGHT+IHkVx26ba7yHgLNAZTmlm3jy+5ZcRffvuvivl02GH5OlN5kqAaLE7y2/i/RPcRHIj/pTt2E0lgtRlIEPZpIzbc=
X-Received: by 2002:a05:6902:208a:b0:e38:f30e:9b52 with SMTP id
 3f1490d57ef6-e43492f594cmr8153492276.4.1734332336383; Sun, 15 Dec 2024
 22:58:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-5-tmyu0@nuvoton.com>
 <20241211-taupe-leech-of-respect-4c325a-mkl@pengutronix.de> <CAMZ6RqLMyW6HfTGEOHm7B8rr6=hvuxMEWfEEhxv5Nw7fgpM=WA@mail.gmail.com>
In-Reply-To: <CAMZ6RqLMyW6HfTGEOHm7B8rr6=hvuxMEWfEEhxv5Nw7fgpM=WA@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 16 Dec 2024 14:58:45 +0800
Message-ID: <CAOoeyxVoqtLPceHxH=eV=QfYuh9E0QEQKaMjdB4dyk9V_JarXQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] can: Add Nuvoton NCT6694 CAN support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for your comments,

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B412=E6=
=9C=8811=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:25=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
...
> > > +/* Host interface */
> > > +#define NCT6694_CAN_MOD                      0x05
> > > +
> > > +/* Message Channel*/
> > > +/* Command 00h */
>
> Instead of this comment, explain what the command 00h does.
>
> Also better to give a memorable name instead of CMD0. For example:
> CMD_TX, CMD_RX=E2=80=A6
>
> If possible, make it match the structure names.
>

Okay, I'll make the modifications in the next patch.

> > > +#define NCT6694_CAN_CMD0_OFFSET(idx) (idx ? 0x0100 : 0x0000)
> > > +#define NCT6694_CAN_CTRL1_MON                BIT(0)
> > > +#define NCT6694_CAN_CTRL1_NISO               BIT(1)
> > > +#define NCT6694_CAN_CTRL1_LBCK               BIT(2)
> > > +
> > > +/* Command 01h */
> > > +#define NCT6694_CAN_CMD1_OFFSET              0x0001
> > > +
> > > +/* Command 02h */
> > > +#define NCT6694_CAN_CMD2_OFFSET(idx, mask)                   \
> > > +     ({ typeof(mask) mask_ =3D (mask);                         \
> > > +        idx ? ((0x80 | (mask_ & 0xFF)) << 8 | 0x02) :        \
> > > +              ((0x00 | (mask_ & 0xFF)) << 8 | 0x02); })
> > > +
> > > +#define NCT6694_CAN_EVENT_ERR                BIT(0)
> > > +#define NCT6694_CAN_EVENT_STATUS     BIT(1)
> > > +#define NCT6694_CAN_EVENT_TX_EVT     BIT(2)
> > > +#define NCT6694_CAN_EVENT_RX_EVT     BIT(3)
> > > +#define NCT6694_CAN_EVENT_REC                BIT(4)
> > > +#define NCT6694_CAN_EVENT_TEC                BIT(5)
> > > +#define NCT6694_CAN_EVT_TX_FIFO_EMPTY        BIT(7)  /* Read-clear *=
/
> > > +#define NCT6694_CAN_EVT_RX_DATA_LOST BIT(5)  /* Read-clear */
> > > +#define NCT6694_CAN_EVT_RX_HALF_FULL BIT(6)  /* Read-clear */
> > > +#define NCT6694_CAN_EVT_RX_DATA_IN   BIT(7)
> > > +
> > > +/* Command 10h */
> > > +#define NCT6694_CAN_CMD10_OFFSET(buf_cnt)    \
> > > +     (((buf_cnt) & 0xFF) << 8 | 0x10)
> > > +#define NCT6694_CAN_TAG_CAN0         0xC0
> > > +#define NCT6694_CAN_TAG_CAN1         0xC1
> > > +#define NCT6694_CAN_FLAG_EFF         BIT(0)
> > > +#define NCT6694_CAN_FLAG_RTR         BIT(1)
> > > +#define NCT6694_CAN_FLAG_FD          BIT(2)
> > > +#define NCT6694_CAN_FLAG_BRS         BIT(3)
> > > +#define NCT6694_CAN_FLAG_ERR         BIT(4)
> > > +
> > > +/* Command 11h */
> > > +#define NCT6694_CAN_CMD11_OFFSET(idx, buf_cnt)                      =
 \
> > > +     ({ typeof(buf_cnt) buf_cnt_ =3D (buf_cnt);                \
> > > +        idx ? ((0x80 | (buf_cnt_ & 0xFF)) << 8 | 0x11) :     \
> > > +              ((0x00 | (buf_cnt_ & 0xFF)) << 8 | 0x11); })
>
> Simplify this. Do something like:
>
>   #define NCT6694_CAN_CMD11_OFFSET(idx, buf_cnt) \
>           (idx ? 0x80 : 0x00) | \
>           (buf_cnt & 0xFF)) << 8 | 0x11) \
>
> (apply this also to NCT6694_CAN_CMD2_OFFSET())
>

Understood! I will fix these in v4.

> > > +#define NCT6694_CAN_RX_QUOTA         64
> > > +
> > > +enum nct6694_event_err {
> > > +     NCT6694_CAN_EVT_NO_ERROR,
> >                       ^^^ add _ERR_
> > > +     NCT6694_CAN_EVT_CRC_ERROR,
> > > +     NCT6694_CAN_EVT_STUFF_ERROR,
> > > +     NCT6694_CAN_EVT_ACK_ERROR,
> > > +     NCT6694_CAN_EVT_FORM_ERROR,
> > > +     NCT6694_CAN_EVT_BIT_ERROR,
> > > +     NCT6694_CAN_EVT_TIMEOUT_ERROR,
> > > +     NCT6694_CAN_EVT_UNKNOWN_ERROR,
> > > +};
> > > +
> > > +enum nct6694_event_status {
> > > +     NCT6694_CAN_EVT_ERROR_ACTIVE,
> >                       ^^^ add _STATUS_
> > > +     NCT6694_CAN_EVT_ERROR_PASSIVE,
> > > +     NCT6694_CAN_EVT_BUS_OFF,
> > > +     NCT6694_CAN_EVT_WARNING,
> > > +};
> > > +
> > > +struct __packed nct6694_can_setting {
> > > +     __le32 nbr;
> > > +     __le32 dbr;
> > > +     u8 active;
> > > +     u8 reserved[3];
> > > +     __le16 ctrl1;
> > > +     __le16 ctrl2;
> > > +     __le32 nbtp;
> > > +     __le32 dbtp;
> > > +};
> > > +
> > > +struct __packed nct6694_can_information {
> > > +     u8 tx_fifo_cnt;
> > > +     u8 rx_fifo_cnt;
> > > +     __le16 reserved;
> > u8 reserved[2];
> > > +     __le32 can_clk;
> > > +};
> > > +
> > > +struct __packed nct6694_can_event {
> > > +     u8 err1;
> > > +     u8 status1;
> > > +     u8 tx_evt1;
> > > +     u8 rx_evt1;
> > > +     u8 rec1;
> > > +     u8 tec1;
> > > +     u8 reserved1[2];
> > > +     u8 err2;
> > > +     u8 status2;
> > > +     u8 tx_evt2;
> > > +     u8 rx_evt2;
> > > +     u8 rec2;
> > > +     u8 tec2;
> > > +     u8 reserved2[2];
> > > +};
> >
> > Create an extra struct that only describes a channel
> >
> > struct __packed nct6694_can_event_channel {
> >         u8 err;
> >         u8 status;
> >         u8 tx_evt;
> >         u8 rx_evt;
> >         u8 rec;
> >         u8 tec;
> >         u8 reserved[2];
> > }
> >
> > and put an array of 2 into struct __packed nct6694_can_event.
> >
> > > +
> > > +struct __packed nct6694_can_xmit {
>
> Is this struct for both TX and RX? If so, name it something like
>
>   struct nct6694_can_frame
>
> The term xmit is only used for transmission, not for reception.
>

Okay, I'll make the modifications in the next patch.

> > > +     u8 tag;
> > > +     u8 flag;
> > > +     u8 reserved;
> > > +     u8 dlc;
> > > +     __le32 id;
> > > +     u8 data[64];
> > > +     u8 msg_buf[72];
> >
> > Why is the message so long? What's in the msg_buf?
> >
> > > +};
> > > +
> > > +struct nct6694_can_priv {
> > > +     struct can_priv can;    /* must be the first member */
> > > +     struct net_device *ndev;
> > > +     struct nct6694 *nct6694;
> > > +     struct mutex lock;
> >
> > What does lock protect?
>
> +1
>
> mutexes are good if you want to keep the lock for a long time.
>
> For short period, spinlock are more performant:
>
>           spinlock_t lock;
>

The lock ensures that data accessed by nct6694_read_msg() and
nct6694_write_msg() is not overwritten.

Since nct6694_read_msg() and nct6694_write_msg() use usb_bulk_msg(),
which may cause the process  to sleep, spinlock is not used.

> > > +     struct sk_buff *tx_skb;
> > > +     struct workqueue_struct *wq;
> > > +     struct work_struct tx_work;
> > > +     unsigned char *tx_buf;
> > void *
> > > +     unsigned char *rx_buf;
> > void *
>
> Rather than void*, tx_buf and rx_buf can be replaced by an union:
>
>   union nct6694_can_rx {
>           struct nct6694_can_event event;
>           struct nct6694_can_xmit xmit;
>           struct nct6694_can_information info;
>   };
>
> (same for nct6694_can_tx)
>
> Then in struct nct6694_can_priv, you will just have:
>
>   union nct6694_can_tx tx;
>   union nct6694_can_rx rx;
>
> With this,
>
>   NCT6694_MAX_PACKET_SZ
>
> can most likely be replaced by sizeof(union nct6694_can_rx) or
> sizeof(union nct6694_can_tx).
>

Okay, I'll make the modifications in the next patch.

> > > +     unsigned char can_idx;
> > > +     bool tx_busy;
> >
...
> > > +static void nct6694_can_read_fifo(struct net_device *ndev)
> > > +{
> > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > +     struct nct6694_can_xmit *xmit =3D (struct nct6694_can_xmit *)pr=
iv->rx_buf;
> > > +     struct net_device_stats *stats =3D &ndev->stats;
> > > +     struct canfd_frame *cf;
> > > +     struct sk_buff *skb;
> > > +     int can_idx =3D priv->can_idx;
> > > +     u32 id;
> > > +     int ret;
> > > +     u8 fd_format =3D 0;
> > bool - no need to init
> > > +
> > > +     guard(mutex)(&priv->lock);
> > > +
> > > +     ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > > +                            NCT6694_CAN_CMD11_OFFSET(can_idx, 1),
> > > +                            sizeof(struct nct6694_can_xmit), xmit);
> > > +     if (ret < 0)
> > > +             return;
> > > +
> > > +     /* Check type of frame and create skb */
> > > +     fd_format =3D xmit->flag & NCT6694_CAN_FLAG_FD;
> > > +     if (fd_format)
> > > +             skb =3D alloc_canfd_skb(ndev, &cf);
> > > +     else
> > > +             skb =3D alloc_can_skb(ndev, (struct can_frame **)&cf);
> > > +
> > > +     if (!skb) {
> > > +             stats->rx_dropped++;
> > > +             return;
> > > +     }
> > > +
> > > +     cf->len =3D xmit->dlc;
> >
> > what does xmit->dlc contain? The DLC or the length?
>
> +1
>
> Also, do not trust the device data. Even if SPI attacks are less
> common, make sure to sanitize this length.
>
>   cf->len =3D canfd_sanitize_len(xmit->dlc);
>
> Or
>
>   cf->len =3D canfd_sanitize_len(xmit->dlc);
>
> if xmit->dlc is in fact a DLC.
>

Excuse me, the xmit->dlc is actual data length.
Does it need to be fixed?

> > > +
...
> > > +static int nct6694_can_handle_lec_err(struct net_device *ndev, u8 bu=
s_err)
> > > +{
> > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > +     struct net_device_stats *stats =3D &ndev->stats;
> > > +     struct can_frame *cf;
> > > +     struct sk_buff *skb;
> > > +
> > > +     if (bus_err =3D=3D NCT6694_CAN_EVT_NO_ERROR)
> > > +             return 0;
> > > +
> > > +     priv->can.can_stats.bus_error++;
> > > +     stats->rx_errors++;
> > > +
> > > +     /* Propagate the error condition to the CAN stack. */
> > > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > > +
> > > +     if (unlikely(!skb))
> > > +             return 0;
>
> Do not exit if the memory allocation fails. Instead, do the error
> handling to increase the statistics.
>
> Look at what other CAN drivers are doing.
>

Okay, I'll make the modifications in the next patch.

> > > +     /* Read the error counter register and check for new errors. */
> > > +     cf->can_id |=3D CAN_ERR_PROT | CAN_ERR_BUSERROR;
> > > +
> > > +     switch (bus_err) {
> > > +     case NCT6694_CAN_EVT_CRC_ERROR:
> > > +             cf->data[3] =3D CAN_ERR_PROT_LOC_CRC_SEQ;
> > > +             break;
> > > +
> > > +     case NCT6694_CAN_EVT_STUFF_ERROR:
> > > +             cf->data[2] |=3D CAN_ERR_PROT_STUFF;
> > > +             break;
> > > +
> > > +     case NCT6694_CAN_EVT_ACK_ERROR:
> > > +             cf->data[3] =3D CAN_ERR_PROT_LOC_ACK;
> > > +             break;
> > > +
> > > +     case NCT6694_CAN_EVT_FORM_ERROR:
> > > +             cf->data[2] |=3D CAN_ERR_PROT_FORM;
> > > +             break;
> > > +
> > > +     case NCT6694_CAN_EVT_BIT_ERROR:
> > > +             cf->data[2] |=3D CAN_ERR_PROT_BIT |
> > > +                            CAN_ERR_PROT_BIT0 |
> > > +                            CAN_ERR_PROT_BIT1;
> > > +             break;
> > > +
> > > +     case NCT6694_CAN_EVT_TIMEOUT_ERROR:
> > > +             cf->data[2] |=3D CAN_ERR_PROT_UNSPEC;
> > > +             break;
> > > +
> > > +     case NCT6694_CAN_EVT_UNKNOWN_ERROR:
> > > +             cf->data[2] |=3D CAN_ERR_PROT_UNSPEC;
> > > +             /*
> > > +              * It means 'unspecified'(the value is '0').
> > > +              * But it is not sure if it's ok to send an error packa=
ge
> > > +              * without specific error bit.
> > > +              */
> > > +             break;
> > > +
> > > +     default:
> > > +             break;
> > > +     }
> > > +
> > > +     /* Reset the error counter, ack the IRQ and re-enable the count=
er. */
> > > +     stats->rx_packets++;
> > > +     stats->rx_bytes +=3D cf->can_dlc;
>
> The CAN error frames are not regular packets. Do not increase the RX
> stats. Instead, increase the error stats.
>

Okay, I'll make the modifications in the next patch.

> > > +     netif_receive_skb(skb);
> > > +
> > > +     return 1;
> > > +}
> > > +
> > > +static int nct6694_can_handle_state_change(struct net_device *ndev,
> > > +                                        enum can_state new_state)
> > > +{
> > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > +     struct net_device_stats *stats =3D &ndev->stats;
> > > +     struct can_frame *cf;
> > > +     struct sk_buff *skb;
> > > +     struct can_berr_counter bec;
> > > +
> > > +     switch (new_state) {
> > > +     case CAN_STATE_ERROR_ACTIVE:
> > > +             priv->can.can_stats.error_warning++;
> > > +             priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > > +             break;
> > > +     case CAN_STATE_ERROR_WARNING:
> > > +             priv->can.can_stats.error_warning++;
> > > +             priv->can.state =3D CAN_STATE_ERROR_WARNING;
> > > +             break;
> > > +     case CAN_STATE_ERROR_PASSIVE:
> > > +             priv->can.can_stats.error_passive++;
> > > +             priv->can.state =3D CAN_STATE_ERROR_PASSIVE;
> > > +             break;
> > > +     case CAN_STATE_BUS_OFF:
> > > +             priv->can.state =3D CAN_STATE_BUS_OFF;
> > > +             priv->can.can_stats.bus_off++;
> > > +             can_bus_off(ndev);
> > > +             break;
> > > +     default:
> > > +             break;
> > > +     }
> > > +
> > > +     /* propagate the error condition to the CAN stack */
> > > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > > +     if (unlikely(!skb))
> > > +             return 0;
>
> Same as above: handle the statistics even if the allocation fails.
>

Okay, I'll make the modifications in the next patch.

> > > +     nct6694_can_get_berr_counter(ndev, &bec);
> > > +
> > > +     switch (new_state) {
> > > +     case CAN_STATE_ERROR_WARNING:
> > > +             /* error warning state */
> > > +             cf->can_id |=3D CAN_ERR_CRTL;
> > > +             cf->data[1] =3D (bec.txerr > bec.rxerr) ? CAN_ERR_CRTL_=
TX_WARNING :
> > > +                                                     CAN_ERR_CRTL_RX=
_WARNING;
>
> Prefer an if/else here instead of the ternary operator. It is more readab=
le.
>

Fix it in v4.

> > > +             cf->data[6] =3D bec.txerr;
> > > +             cf->data[7] =3D bec.rxerr;
> > > +             break;
> > > +     case CAN_STATE_ERROR_PASSIVE:
> > > +             /* error passive state */
> > > +             cf->can_id |=3D CAN_ERR_CRTL;
> > > +             cf->data[1] |=3D CAN_ERR_CRTL_RX_PASSIVE;
> > > +             if (bec.txerr > 127)
> > > +                     cf->data[1] |=3D CAN_ERR_CRTL_TX_PASSIVE;
> > > +             cf->data[6] =3D bec.txerr;
> > > +             cf->data[7] =3D bec.rxerr;
> > > +             break;
> > > +     case CAN_STATE_BUS_OFF:
> > > +             /* bus-off state */
> > > +             cf->can_id |=3D CAN_ERR_BUSOFF;
> > > +             break;
> > > +     default:
> > > +             break;
> > > +     }
> > > +
> > > +     stats->rx_packets++;
> > > +     stats->rx_bytes +=3D cf->can_dlc;
>
> Do not increase the RX stats when you receive a CAN event.
>

Okay, I'll make the modifications in the next patch.

> > > +     netif_receive_skb(skb);
> > > +
> > > +     return 1;
> > > +}
...
> > > +static int nct6694_can_start(struct net_device *ndev)
> > > +{
> > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > +     struct nct6694_can_setting *setting =3D (struct nct6694_can_set=
ting *)priv->tx_buf;
> > > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > > +     int ret;
> > > +
> > > +     guard(mutex)(&priv->lock);
> > > +
> > > +     memset(priv->tx_buf, 0, sizeof(struct nct6694_can_setting));
>
> When you memset(), use this pattern:
>
>           memset(setting, 0, sizeof(*setting));
>
> Apply this throughout your driver.
>

Okay, I'll make the modifications in the next patch.

> > > +     setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> > > +     setting->dbr =3D cpu_to_le32(d_bt->bitrate);
> > > +
...
> > > +module_platform_driver(nct6694_can_driver);
> > > +
> > > +MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
> > > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_ALIAS("platform:nct6694-can");
>
>
> Yours sincerely,
> Vincent Mailhol

Best regards,
Ming

