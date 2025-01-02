Return-Path: <linux-i2c+bounces-8848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC79FF63D
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 06:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E36161F52
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 05:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1871218E750;
	Thu,  2 Jan 2025 05:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKaTAGMo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177518C932;
	Thu,  2 Jan 2025 05:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735795540; cv=none; b=faQaCFko8wa1kSJao2GSXvGXk1t9oRZArILeYkE1FiZHgDbqO5agtWXdHfew53cWXEq5E2VJmK48Lae3oBh81t2Cb3vMR7C7b+EnBm3BpZkqEuOxf1aozkAL5UIxUeTpQdmOT72H9gI8bjrIoMNaFpJcqXGSBOuNzb1fjw/zarw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735795540; c=relaxed/simple;
	bh=Q//K6I4nzjNGxPD97emwJD2ctUE9Xa4kN8p9z0uID4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7lgOPSC0TzI7VyJAP7Qg3/qfN4lOYZ1UDU7uL8NtWl0GHS+FdfU6wpElo2PgaJs1iQQgnun7tKyjWEiJmKo8Nsaha2whxd/rH+zw1gF4BBhuoqJQvK+rU2HfbFCwBeJcDeoHWF08FDunBojcrmFOzS3l9AAf4fypM78hR52RQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKaTAGMo; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e39f43344c5so13619437276.1;
        Wed, 01 Jan 2025 21:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735795538; x=1736400338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhBBFXFHI0KOxJH7yHdQXw7rf9jQtRYxyRgMxQ8lPqg=;
        b=QKaTAGMowVIwqrpu/3UlscpUBpVhBVf12z9SPIhdbY2AVnNa2BCCoWQDDUypMrFh4b
         zchI/zqBbZh+zmZcm5qF+RaAS4GdezKQCelTM4eqQa4Z7oSE2F/A9ltNbQC8qljERxSI
         Su79iAHLT7Ww442ps0qKH2sdNsCns538ymYGWfZVb/zwFiyHs4kyN++vzsPw7bghssFh
         Xf9iX8S8CBBKsxLBmAzdxoQJofafpfDXxire75xHfZDJYognAEz7SWW/XOJWX7zPYUyJ
         B4CQlXiJGtLkDa4q30KB7njVAfagi9iPZWx4FfyiXa86zpICan8iMoCu+S07uQEWKKFe
         sKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735795538; x=1736400338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhBBFXFHI0KOxJH7yHdQXw7rf9jQtRYxyRgMxQ8lPqg=;
        b=vVVrlxquVPksmfv9zN0J5UdH7h3stKOha4bU01ipbL63qv4P4jSkl4e/kQXvRD1dUX
         kJoAjpOp46pi2ob81V0+MQ2vQDbU5IZGbsrLK37i5qDmwbOP5Q9z4qamLV7DUxa3azum
         VewbE/JOXXB+jnFluHqY0ra0g3lFs7n/LikFyr1DdXfthoiSvr9qKr4leWpX+WqUKVZ8
         UKWunOcuM0WCvA/6asQmVTl/CxzhFdbRRO0qX7Q8wHe5NWhyBKiG4bcdV3fUtpCR5W6I
         aDN/mboJBBGk8UMXwkg+0ph595Vhbqa2eTudUU11l+1zJfe5En7oL8Atf+tmu3DQgg3e
         6H4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCdkoxBeRLhE5tKmssaSAdgI8c71sD4Sda5ay8igGCRWkHXaK6QKkp0VP3x4iRMHrjYe+6U16XV9RZKg==@vger.kernel.org, AJvYcCULxBdhuVMZERRIHS+1rsUSffXmI7SA3+6iOnFalNc1cKicK2iy8H2W+71d/lb6CpvFIGmlSOdgnqVW@vger.kernel.org, AJvYcCVh6TpRfmLBrHvV4kT0gRa6R7+ojc+jLWuXsnoyPgqkRrUFeaQrdFyqE3Zc9JYj4KJdSnRpTZbCpg/W@vger.kernel.org, AJvYcCVk9Kx3TjauuQwTJ6R8Ym2plrSTHphzTz6ms2fFYuePr92jH+ix0S212BNIbsPFu0B8qCpDHHwWkMM=@vger.kernel.org, AJvYcCWc43sM2/al97YNfJE7saH/1BdkUG5+t2t4CBwKvnf11lc1zJkuDrSt1KjXuHiC9XvgupD76V0X1XISJ81sAlA=@vger.kernel.org, AJvYcCWsXWNxJx1IPs06UuOrIQNs7AW6i7I2j9XuwxCWLNbeZm+qANXbY88qivoUR2Qo410qtK0w1IP8@vger.kernel.org, AJvYcCXiCB2r3k1Cy/Ot6z0u8aT9eyj88N1PKlpwxbS33jddYLkwz+4/iGZ5YmyXnKT777CuoE4To7y9SvJU458=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlL+I1i0k6ndsHj72e4PMDIasRJaYQs7YlVZlVZPEysJS7pMh8
	T44bl+M9liGle65kX8Tmn9RQqtWnTNZ+rIBBztohLSvvpy73vN7XgrCjv6q2h6QltjxqTH0LbSF
	dahTEzx/LrkLfCa6WfRE3rwGmJgM=
X-Gm-Gg: ASbGncuYnHH1hA80ApkBAtRPkyhUNseHoWMuoUIQ/0XdXpD6IRSMlYA+fl0cl0Q6NQP
	PCGT9sdHbX+5Ot8TFo5N4VWb/E0UQe8h/9YXV/mZLT5R2pEOmqjZA9sZYZxDgBDtVHUc6yMfd
X-Google-Smtp-Source: AGHT+IHyaJPa9I6OK/q4UXT+geYapq2hPHXI5a5QZlIeSO9e/MEMKuiOWPqbgXQhPr74iHp0oMtLA4AFUQqi4/IZ2H8=
X-Received: by 2002:a05:690c:6a83:b0:6ee:66d2:e738 with SMTP id
 00721157ae682-6f3f80cda17mr371878997b3.2.1735795537923; Wed, 01 Jan 2025
 21:25:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-5-a0282524688@gmail.com> <a25ea362-142f-4e27-8194-787d9829f607@wanadoo.fr>
In-Reply-To: <a25ea362-142f-4e27-8194-787d9829f607@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 2 Jan 2025 13:25:27 +0800
Message-ID: <CAOoeyxW7=mLCcthVcQKnf7ikxEdQ09SzmOT5puD-AuhgpRHLkQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] can: Add Nuvoton NCT6694 CAN support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for your comments,

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B412=E6=
=9C=8827=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:59=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> > +
> > +struct __packed nct6694_can_event_channel {
> > +     u8 err;
> > +     u8 status;
> > +     u8 tx_evt;
> > +     u8 rx_evt;
> > +     u8 rec;
> > +     u8 tec;
> > +     u8 reserved[2];
> > +};
> > +
> > +struct __packed nct6694_can_event {
> > +     struct nct6694_can_event_channel evt_ch[2];
> > +};
>
> Remove this intermediate struct...
>
> > +struct __packed nct6694_can_frame {
> > +     u8 tag;
> > +     u8 flag;
> > +     u8 reserved;
> > +     u8 length;
> > +     __le32 id;
> > +     u8 data[64];
> > +};
> > +
> > +union nct6694_can_tx {
> > +     struct nct6694_can_frame frame;
> > +     struct nct6694_can_setting setting;
> > +};
> > +
> > +union nct6694_can_rx {
> > +     struct nct6694_can_event event;
>
> ... and instead, dircectly declare the array here:
>
>         struct nct6694_can_event event[2];
>

Okay! Fix it in v5.

> > +     struct nct6694_can_frame frame;
> > +     struct nct6694_can_information info;
> > +};
> > +
> > +struct nct6694_can_priv {
> > +     struct can_priv can;    /* must be the first member */
> > +     struct can_rx_offload offload;
> > +     struct net_device *ndev;
> > +     struct nct6694 *nct6694;
> > +     struct mutex lock;
> > +     struct sk_buff *tx_skb;
> > +     struct workqueue_struct *wq;
> > +     struct work_struct tx_work;
> > +     union nct6694_can_tx *tx;
> > +     union nct6694_can_rx *rx;
> > +     unsigned char can_idx;
> > +     bool tx_busy;
>
> tx_busy is only set when the network queue is stopped, right? Isn't it
> possible to use netif_tx_queue_stopped() instead of tx_busy?
>

Yes, I'll make the modification in v5.

> > +};
> > +
...
> > +static void nct6694_can_handle_state_change(struct net_device *ndev,
> > +                                         u8 status)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     enum can_state new_state =3D priv->can.state;
> > +     enum can_state rx_state, tx_state;
> > +     struct can_berr_counter bec;
> > +     struct can_frame *cf;
> > +     struct sk_buff *skb;
> > +
> > +     nct6694_can_get_berr_counter(ndev, &bec);
> > +     can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
> > +
> > +     if (status & NCT6694_CAN_EVT_STS_BUS_OFF)
> > +             new_state =3D CAN_STATE_BUS_OFF;
> > +     else if (status & NCT6694_CAN_EVT_STS_ERROR_PASSIVE)
> > +             new_state =3D CAN_STATE_ERROR_PASSIVE;
> > +     else if (status & NCT6694_CAN_EVT_STS_WARNING)
> > +             new_state =3D CAN_STATE_ERROR_WARNING;

The procedure for handling state changes is incorrect. I'll fix it in
the next patch.
(e.g.)
switch (status) {
case NCT6694_CAN_EVT_STS_BUS_OFF):
    new_state =3D CAN_STATE_BUS_OFFF;
    break;
...
}

> > +
> > +     /* state hasn't changed */
> > +     if (new_state =3D=3D priv->can.state)
> > +             return;
> > +
> > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > +
> > +     tx_state =3D bec.txerr >=3D bec.rxerr ? new_state : 0;
> > +     rx_state =3D bec.txerr <=3D bec.rxerr ? new_state : 0;
> > +     can_change_state(ndev, cf, tx_state, rx_state);
> > +
> > +     if (new_state =3D=3D CAN_STATE_BUS_OFF) {
> > +             can_bus_off(ndev);
> > +     } else if (skb) {
> > +             cf->can_id |=3D CAN_ERR_CNT;
> > +             cf->data[6] =3D bec.txerr;
> > +             cf->data[7] =3D bec.rxerr;
> > +     }
> > +
> > +     nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static void nct6694_handle_bus_err(struct net_device *ndev, u8 bus_err=
)
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
>
> Aren't you missing something here? You are populating a can frame but
> you are returning without using it.
>

Sorry for forgetting to process rx offload function, I'll add
nct6694_can_rx_offload() here in the v5.

> > +}
> > +
...
> > +static void nct6694_can_tx(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_frame *frame =3D &priv->tx->frame;
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +     struct sk_buff *skb =3D priv->tx_skb;
> > +     struct canfd_frame *cfd;
> > +     struct can_frame *cf;
> > +     u32 txid;
> > +     int err;
> > +
> > +     memset(frame, 0, sizeof(*frame));
> > +
> > +     if (priv->can_idx =3D=3D 0)
> > +             frame->tag =3D NCT6694_CAN_FRAME_TAG_CAN0;
> > +     else
> > +             frame->tag =3D NCT6694_CAN_FRAME_TAG_CAN1;
> > +
> > +     if (can_is_canfd_skb(skb)) {
> > +             cfd =3D (struct canfd_frame *)priv->tx_skb->data;
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
> > +             cf =3D (struct can_frame *)priv->tx_skb->data;
> > +
> > +             if (cf->can_id & CAN_RTR_FLAG)
> > +                     frame->flag |=3D NCT6694_CAN_FRAME_FLAG_RTR;
> > +
> > +             if (cf->can_id & CAN_EFF_FLAG) {
> > +                     txid =3D cf->can_id & CAN_EFF_MASK;
> > +                     frame->flag |=3D NCT6694_CAN_FRAME_FLAG_EFF;
> > +             } else {
> > +                     txid =3D cf->can_id & CAN_SFF_MASK;
> > +             }
> > +             frame->id =3D cpu_to_le32(txid);
> > +             frame->length =3D cf->len;
> > +
> > +             memcpy(frame->data, cf->data, cf->len);
>
> Don't copy the payload if the frame is a remote frame.
>

Fix it in the v5.

> > +             }
>         ^^^^^^^^
>
> Bad indentation. Did you run script/checkpatch.pl before sending?
>

I already ran the script, but I'm not sure why it didn't report this error.
I'll fix it in the next patch.

> > +     err =3D nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                             NCT6694_CAN_DELIVER(1),
> > +                             sizeof(*frame),
> > +                             frame);
> > +     if (err) {
> > +             netdev_err(ndev, "%s: Tx FIFO full!\n", __func__);
> > +             can_free_echo_skb(ndev, 0, NULL);
> > +             stats->tx_dropped++;
> > +             stats->tx_errors++;
> > +             netif_wake_queue(ndev);
> > +     }
> > +}
> > +
...
> > +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode=
 mode)
> > +{
> > +     switch (mode) {
> > +     case CAN_MODE_START:
> > +             nct6694_can_clean(ndev);
> > +             nct6694_can_start(ndev);
> > +             netif_wake_queue(ndev);
> > +             break;
>
> Nitpick: here, directly return 0...
>
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
>
> ... and then remove that line.
>

Fix it in v5.

> > +}
> > +

Best regards,
Ming

