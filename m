Return-Path: <linux-i2c+bounces-8136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3B9D5A96
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 09:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B46A81F22B65
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541F6187321;
	Fri, 22 Nov 2024 08:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY/KT9Ju"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A335154454;
	Fri, 22 Nov 2024 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262606; cv=none; b=a+GdzrqAWllz8mREuR2mjNfMDv64sdUpTlWrfdxwBOzQj0g3lHCOGzxIv5iuctYuBZKI6Tr7We6l7dl4mfJLmEvpi/E6rfcydJlBxHtzffiw6R25Rq/JtkAcaSAsQGV5QUs4FGnkWyAiaHmFMzL3jJ3AV2Hei2fllNQ+EKkA8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262606; c=relaxed/simple;
	bh=Y+YUR2Fae+PwIeeUgv2c2m7+q5l/+vpmOpmbgPj/7R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYHU2H7xD9KF1NZLcGdHmmUeuT79RQLwtJwSqZKIP6sLXIraHIx8sa9TdjtiePzjjW78xY0REKjjNE5RYPwxbbMWqvYogaQdekYaQ+Vq4lxB9oCy1DjxrYU8x/HpJdMSj+3blYHLrGQgqXdOmw2L6Zcrb4uPViKObpDR7QqKx90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY/KT9Ju; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3839177651so1528357276.3;
        Fri, 22 Nov 2024 00:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732262603; x=1732867403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRPajfXYamrE2oaZvDzqAyzECG0pqfiS5EVqNFRx9FY=;
        b=MY/KT9JuYQS4Lsf7GcL4CSHsyhiEF72ybKV6d0d8xkCgUg/eO5/hM13hwFNyLnKBkG
         ba4en7RhtGKkwIFvWger7hd83A4D8FiAf8gmrI5ehO5PGce7LKXGTuR+mhDdfWCdFm44
         ih65BYf2YusVYPSaJd8IJ+AWRDQAdnQ5DcaxN7pdXPMSpB4qvGlkDAPaBSCxpPNvIwwJ
         CEGPmzhLf+U4K7MMa/zyDgcPxWxg/FonH4Dy7iGO2+KKXFGlr5q+xhpDMXZi0yq4gPPF
         9rhhDTYCe+EZFmOkp5e57LyT9Ml73wnHZsXS6Ldefe8rCueDUdEGJzDLTPG0OUZP81BB
         FNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262603; x=1732867403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRPajfXYamrE2oaZvDzqAyzECG0pqfiS5EVqNFRx9FY=;
        b=QnSh0BZoYdTRefgY3WduUU/9eJAeKzgzbszqXiA7o6lkbSRQavRhLUV9RlyufEOYSq
         u/5UqsMMZ/M10pL05IYoC+eaztctxs6oFfRPpqQrXRm12pbjdF311Ki3lPLoW2jlEhI7
         NNMHgNHkRLCERGa9iSnMWXEpHYVoJNcrJB/6KrCofSgBoJb3NT4kaZBMwLPZa0+yzQn7
         I9f++g2VAGWMan+dYOFsVuQpzwQexxt6VGfps+8WmJJaaA0tC4QklJk2mNgmwpeHgaV2
         olYuNaypOTQRaqmRCJKEe0IVFgV2ZQIbFMak/yF6ABXLS44T2oxT5mI54EVEpN05Z7I3
         C5RA==
X-Forwarded-Encrypted: i=1; AJvYcCW/sNugRBSCUR3Y4PvIdaUyg0WBdfzHVc53NT4qLc5kA5TbK1dqLI1BO7l1NyYK75Pf5yU8L/59leYE@vger.kernel.org, AJvYcCWJXv0AyI4cqj3oWB0M84o1WeQTfTZPS/KeMdgdtf54ivKmVIgPgH1vI1VIX3sAV8m7ZRMIUhcU@vger.kernel.org, AJvYcCWkOL9eIJB+LXWEX98qWlxdBnKdVDd5Xetu4YYefl01X+wGBpoNZB+fB7jcW/b3i6VaTj6vB1vo4xJFTA==@vger.kernel.org, AJvYcCWlox2L6RJX58qj9L3GDhOhRDVp1XOXYCeDRwEgpafKJn6KcoUcBGvbsvartAknbioL1syb5YaquxY=@vger.kernel.org, AJvYcCXJTWYp4rWhwcS4PaycJhMyAsUuJw5vLHA/XpE2U8GkKsaWPoWhq9w6nefqXOawzANMbi7z8vNeqa+z@vger.kernel.org, AJvYcCXRAJnbDwQkK1mZqWsza/AroHulJvq8UiqAtwWIDosdAFo4BtBh+UhBbjlTf4HYFkxAbv3LMso0oU4aKkkS@vger.kernel.org, AJvYcCXSjrXjCiPSsPvBDv0CJ8ym4hvW0Yf1OTy97ry35ODhvoh/3gtRA/uM3o5aptH41nYulqRuoBTQpCmuWX33R/g=@vger.kernel.org, AJvYcCXgCuEVxB/oCK8F4vaLohmISS/gnfOw5SZbI9nEw1rWdqpCbHwbsWHsUIa5euvZGPbaqoOiB3gFft95IFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQhfW0cXYEusrs63hdUm7xoQ45rTvuYJiNXA1BKsSvgrbSFvWt
	uU5QP8ApEfrt1ozL7yi0sFKNkNa76eZa/sCBbiEf0yHiY7IzxpL6ELvkT42R/oBntg876ukXY0M
	L0f2HtUqA8A/xxwNqPTsyv0n6ssE=
X-Gm-Gg: ASbGncsk7q2drA0/DlBJi2X9TWOZmSeLmgCas0ib8d8crmuy1RgUz6IxKWwPrLMPiMu
	c1BVB24g8YGjvZPkxCDAZ908c4yHsx3g=
X-Google-Smtp-Source: AGHT+IFpxcWhp36ECFmdpGFa2DRQqPb5Q4aHwvEoDsWfHiMZDbVRDfnJZ32bdLPj9o2rmEZW07vf8an9iFpvdZIYOgI=
X-Received: by 2002:a05:6902:20c3:b0:e38:cdff:830b with SMTP id
 3f1490d57ef6-e38f8bdf359mr1613926276.38.1732262603464; Fri, 22 Nov 2024
 00:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121064046.3724726-1-tmyu0@nuvoton.com> <20241121064046.3724726-5-tmyu0@nuvoton.com>
 <08a91d47-ad78-4f7d-896f-b75d7418be1e@wanadoo.fr>
In-Reply-To: <08a91d47-ad78-4f7d-896f-b75d7418be1e@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 22 Nov 2024 16:03:12 +0800
Message-ID: <CAOoeyxVjBsmOr=-14iq7pQamJ90j_PBMhQK0Lo=xmvPyqqseGQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] can: Add Nuvoton NCT6694 CAN support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for your comments,

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B411=E6=
=9C=8821=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:47=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > +
> > +struct __packed nct6694_can_cmd0 {
>
> Give more meaningfull names to your structures. For example:
>
>   /* cmd1 */
>   struct __packed nct6694_can_bittiming
>

Understood. I will make the modifications in v3.

> > +     u32 nbr;
> > +     u32 dbr;
> > +     u32 active:8;
> > +     u32 reserved:24;
> > +     u16 ctrl1;
> > +     u16 ctrl2;
> > +     u32 nbtp;
> > +     u32 dbtp;
> > +};
> Always use the specific endianess types in the structures that you are
> sending to the device. e.g. replace u32 by __le32 (assuming little endian=
).
>

Okay, I'll fix it in v3.

> > +struct __packed nct6694_can_cmd1 {
...
> > +
> > +struct nct6694_canfd_priv {
>
> Be consistent in your name space. Sometime you prefix your names with
> nct6694_can and sometimes with nct6694_canfd for no apparent reasons.
>

Understood. I will make the modifications in v3.

> > +     struct can_priv can;    /* must be the first member */
...
> > +     } else {
> > +             if (buf->flag & NCT6694_CAN_FLAG_BRS)
> > +                     cf->flags |=3D CANFD_BRS;
> > +
> > +             for (i =3D 0; i < cf->len; i++)
> > +                     cf->data[i] =3D buf->data[i];
>
> Use memcpy().
>

Okay, I'll fix it in v3.

> > +     }
> > +
> > +     /* Remove the packet from FIFO */
> > +     stats->rx_packets++;
> > +     stats->rx_bytes +=3D cf->len;
>
> Do not increment the rx_bytes if the frame is RTR.
>

Okay, I'll fix it in v3.

> > +     netif_receive_skb(skb);
...
> > +
> > +     switch (new_state) {
> > +     case CAN_STATE_ERROR_WARNING:
> > +             /* error warning state */
>
> Such comment can be removed. Here you are just paraphrasing the macro. I
> can already see that CAN_STATE_ERROR_WARNING means the "error warning
> state". The comments should add information.
>

Okay, I will drop them in v3.

> > +             cf->can_id |=3D CAN_ERR_CRTL;
> > +             cf->data[1] =3D (bec.txerr > bec.rxerr) ? CAN_ERR_CRTL_TX=
_WARNING :
> > +                                                     CAN_ERR_CRTL_RX_W=
ARNING;
...
> > +static int nct6694_canfd_start(struct net_device *ndev)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_cmd0 *buf =3D (struct nct6694_can_cmd0 *)priv-=
>tx_buf;
>
> Give a more memorable name to buf, for example: bittiming_cmd.
>

Got it. So, every buf that uses a command must be renamed similarly, right?

> > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > +     int ret;
> > +
> > +     guard(mutex)(&priv->lock);
> > +
> > +     memset(priv->tx_buf, 0, NCT6694_CAN_CMD0_LEN);
>
> Remove those CMD*_LEN macros, instead, use sizeof() of your structures.
>
>   memset(buf, 0, sizeof(*buf));
>

Understood. I will make the modifications in v3.

> > +     buf->nbr =3D n_bt->bitrate;
> > +     buf->dbr =3D d_bt->bitrate;
...
> > +static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
> > +                                         struct net_device *ndev)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +
> > +     if (priv->tx_skb || priv->tx_busy) {
> > +             netdev_err(ndev, "hard_xmit called while tx busy\n");
> > +             return NETDEV_TX_BUSY;
> > +     }
> > +
> > +     if (can_dev_dropped_skb(ndev, skb))
> > +             return NETDEV_TX_OK;
> > +
> > +     netif_stop_queue(ndev);
>
> Here, you are inconditionally stopping the queue. Does it mean that your
> device is only able to manage one CAN frame at the time?
>

Yes, we designed it to manage a single CAN frame, so we stop the queue
here until a TX event is received to wake queue.
But It seems I lost the error handling code for the tx command in
nct6694_canfd_tx(), I will fix it in the next patch.

> > +     priv->tx_skb =3D skb;
> > +     queue_work(priv->wq, &priv->tx_work);
> > +
> > +     return NETDEV_TX_OK;
> > +}
> > +
> > +static void nct6694_canfd_tx(struct net_device *ndev, struct canfd_fra=
me *cf)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_cmd10_11 *buf =3D (struct nct6694_can_cmd10_11=
 *)priv->tx_buf;
> > +     u32 txid =3D 0;
> > +     int i;
...
> > +
> > +     /* set data to buf */
> > +     for (i =3D 0; i < cf->len; i++)
> > +             buf->data[i] =3D cf->data[i];
> > +
> > +     nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                       NCT6694_CAN_CMD10_OFFSET(1),
> > +                       NCT6694_CAN_CMD10_LEN,
> > +                       buf);

I will add the error handling to wake the queue in the next patch.

> > +}
> > +
...
> > +static const struct net_device_ops nct6694_canfd_netdev_ops =3D {
> > +     .ndo_open =3D nct6694_canfd_open,
> > +     .ndo_stop =3D nct6694_canfd_stop,
> > +     .ndo_start_xmit =3D nct6694_canfd_start_xmit,
> > +     .ndo_change_mtu =3D can_change_mtu,
> > +};
>
> Also add a struct ethtool_ops for the default timestamps:
>
>   static const struct ethtool_ops nct6694_ethtool_ops =3D {
>           .get_ts_info =3D ethtool_op_get_ts_info,
>   };
>
> This assumes that your device does not support hardware timestamps. If
> you do have hardware timestamping support, please adjust accordingly.
>

Understood. I will make the modifications in v3.

Best regards,
Ming

