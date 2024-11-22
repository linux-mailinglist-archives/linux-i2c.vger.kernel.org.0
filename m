Return-Path: <linux-i2c+bounces-8139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F105E9D5AF3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 09:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67070B24032
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F19718BC0D;
	Fri, 22 Nov 2024 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PCcJjQLh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8349618308A;
	Fri, 22 Nov 2024 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732263513; cv=none; b=rKGI++CgooA5SFgVYlIr6h81la+t4DWGw205W+QDGJTug0ekaxQHEvExaWkxBc0dlyVDHo0Jh6bnrRQ0eh09CPoWA2XPnjC7aVm8Es/9ViQKZOHxQDqFG7+z2Y8JlEaG+G99Yq9Kc4wmIJP2R8fGLXBuY/5PGzRB27YekCUTbsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732263513; c=relaxed/simple;
	bh=0QjR7exsqEfryrKCGOHz0ypMg6tYTPC5iGlX0JssUpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueIAFpwqw+DlXcWav3+gXiWdanmqx6wVL0Sk/CjIYR7++Lz39EpmAQbVoFCmn4dhuI8CGOv6lffERn26sBjf628FGJMJu6DD5ly9oJKCXo+5pUtyuzCWoA6jJhazDexAQjdkuvl+MOnQ+c6It6eRxX0V7IR4bWvVC+tO32jYOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PCcJjQLh; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by smtp.orange.fr with ESMTPSA
	id EOrttRWAg51TuEOrutgU8W; Fri, 22 Nov 2024 09:18:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1732263502;
	bh=bkksmYHd3DOLy+GhB0etWEn8hsqAz4V+x3nuZS3Vdn4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=PCcJjQLhU01KdNSZl2OVQGRQDrZ1U7m8y4Q/zL+B23lRln0e6jyTcV2F4HFe7oBQj
	 WEo61DYgw8q01ZPbvXJQck+HXlqKUVQTK0nxsi1/oYs+CjJEr4Ppmrkwj+AvpZissV
	 ZwAtBE2/g7pAAr28WDMYDfoCI4l+Pm5jko9d6PkY83CntCDkjzdCxlEYCgZz9Fuq1X
	 Q8U/6VpowxuU4kW/IXJtGrjjkm9OY9AurB+vhw7MN2sy7kyKgl1RYkO4rBdWIB4uXu
	 qaovh4wDcqLILKayEo90FSwhBiu7t5M6i4otjJt7y0Q4gxkQ9HjHFfouujvISXS6lV
	 ivCJwndNBzK3Q==
X-ME-Helo: mail-ej1-f44.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 22 Nov 2024 09:18:22 +0100
X-ME-IP: 209.85.218.44
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa3a79d4d59so275643166b.3;
        Fri, 22 Nov 2024 00:18:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUARR9dq3tZmaZpEIm+bFZJ1SNQe04OGCxGYIYX2rMNgDFd8Qmt6MHdDGaWfqJuoGCYwN5nlXY7X6SIQw==@vger.kernel.org, AJvYcCV0VcQap653sfkdDzUAyRBWAx/6t2IFvSzOCR3bQDbigyW3rlhokueYgiqQ6XSIpN2JZC+sr4hTQbseBaGD@vger.kernel.org, AJvYcCVPq82jKDkWqGIBdNshG27Ma0fbfg5D8FQKWn1cYe2LDqZ13gQJAEaOUQ5lJDRyIrIZg5XrxtqmC3VTxzVcNcY=@vger.kernel.org, AJvYcCVX9vElPgrKGC6hkwjH3Sm/HPafh50I8IdTtxzQB5VdTlv1YINom4weLEswgAnNk82WL4xW9IFcgGvOHvA=@vger.kernel.org, AJvYcCVtlCcKZ6M2cZNdDBEseeQBI+W4Gr9LWfElMUaqdh3idOK8f2G0dpO8U7ZVU2fegWCP25oWqA4N@vger.kernel.org, AJvYcCWcGYmS7ak2WQQQSXDs9aafAuQtS1w0dmAY1YOC1Cddt3wvwVgrSc78k1Ffvm1OCAK611jiz4sjyQRo@vger.kernel.org, AJvYcCWdqc8WhYzPCSPMQJ9kib3NOdDlqUl5/N28nWdTiLBwvQmFQDaA4nd1MyRwjDldrh9/c1XLep/c1MCI@vger.kernel.org, AJvYcCXY12hv5zOWAu2ERHZz8SCXX07gB+uWkae7FlQet2qbYEcGRuXFIh50y+PtYDNCEhBop2P37wEsJlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzYa2aVawYyKKY0vPZFaX0tVSFjif8FJusKW7qjJz9kDWv+V0W
	tuQWOXxsD7AXq+qBWam1HA4FmvbX0nXSLmDFp4UIiCppwVi+2PXMKgMtMtXIFdZA2IVm3fIpgw6
	UUMZEK7muG2NUtC9e307mTRI4VX4=
X-Google-Smtp-Source: AGHT+IGjU0Ifb4iseWJWvWQesHEv6Ktx1cnDwwP3WxvPpn1YSLbPy8AcJJePd1GJu60EJ+MGHbckXIVPwFDtaFz2354=
X-Received: by 2002:a17:906:31c5:b0:aa5:21f7:4304 with SMTP id
 a640c23a62f3a-aa521f7433dmr5945266b.30.1732263501649; Fri, 22 Nov 2024
 00:18:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121064046.3724726-1-tmyu0@nuvoton.com> <20241121064046.3724726-5-tmyu0@nuvoton.com>
 <08a91d47-ad78-4f7d-896f-b75d7418be1e@wanadoo.fr> <CAOoeyxVjBsmOr=-14iq7pQamJ90j_PBMhQK0Lo=xmvPyqqseGQ@mail.gmail.com>
In-Reply-To: <CAOoeyxVjBsmOr=-14iq7pQamJ90j_PBMhQK0Lo=xmvPyqqseGQ@mail.gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 22 Nov 2024 17:18:09 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+WePVM2aSk2HzXoa-t+ZE97yeqS6bndpGXUh+NuiM8sg@mail.gmail.com>
Message-ID: <CAMZ6Rq+WePVM2aSk2HzXoa-t+ZE97yeqS6bndpGXUh+NuiM8sg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
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

On Fri. 22 Nov. 2024 at 17:05, Ming Yu <a0282524688@gmail.com> wrote:
> Dear Vincent,
>
> Thank you for your comments,
>
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B411=E6=
=9C=8821=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:47=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > +
> > > +struct __packed nct6694_can_cmd0 {
> >
> > Give more meaningfull names to your structures. For example:
> >
> >   /* cmd1 */
> >   struct __packed nct6694_can_bittiming
> >
>
> Understood. I will make the modifications in v3.
>
> > > +     u32 nbr;
> > > +     u32 dbr;
> > > +     u32 active:8;
> > > +     u32 reserved:24;
> > > +     u16 ctrl1;
> > > +     u16 ctrl2;
> > > +     u32 nbtp;
> > > +     u32 dbtp;
> > > +};
> > Always use the specific endianess types in the structures that you are
> > sending to the device. e.g. replace u32 by __le32 (assuming little endi=
an).
> >
>
> Okay, I'll fix it in v3.
>
> > > +struct __packed nct6694_can_cmd1 {
> ...
> > > +
> > > +struct nct6694_canfd_priv {
> >
> > Be consistent in your name space. Sometime you prefix your names with
> > nct6694_can and sometimes with nct6694_canfd for no apparent reasons.
> >
>
> Understood. I will make the modifications in v3.
>
> > > +     struct can_priv can;    /* must be the first member */
> ...
> > > +     } else {
> > > +             if (buf->flag & NCT6694_CAN_FLAG_BRS)
> > > +                     cf->flags |=3D CANFD_BRS;
> > > +
> > > +             for (i =3D 0; i < cf->len; i++)
> > > +                     cf->data[i] =3D buf->data[i];
> >
> > Use memcpy().
> >
>
> Okay, I'll fix it in v3.
>
> > > +     }
> > > +
> > > +     /* Remove the packet from FIFO */
> > > +     stats->rx_packets++;
> > > +     stats->rx_bytes +=3D cf->len;
> >
> > Do not increment the rx_bytes if the frame is RTR.
> >
>
> Okay, I'll fix it in v3.
>
> > > +     netif_receive_skb(skb);
> ...
> > > +
> > > +     switch (new_state) {
> > > +     case CAN_STATE_ERROR_WARNING:
> > > +             /* error warning state */
> >
> > Such comment can be removed. Here you are just paraphrasing the macro. =
I
> > can already see that CAN_STATE_ERROR_WARNING means the "error warning
> > state". The comments should add information.
> >
>
> Okay, I will drop them in v3.
>
> > > +             cf->can_id |=3D CAN_ERR_CRTL;
> > > +             cf->data[1] =3D (bec.txerr > bec.rxerr) ? CAN_ERR_CRTL_=
TX_WARNING :
> > > +                                                     CAN_ERR_CRTL_RX=
_WARNING;
> ...
> > > +static int nct6694_canfd_start(struct net_device *ndev)
> > > +{
> > > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > > +     struct nct6694_can_cmd0 *buf =3D (struct nct6694_can_cmd0 *)pri=
v->tx_buf;
> >
> > Give a more memorable name to buf, for example: bittiming_cmd.
> >
>
> Got it. So, every buf that uses a command must be renamed similarly, righ=
t?

Yes. Note that you can use different names if you have a better idea.
It is just that generic names like "buf" or "cmd1" do not tell me what
this variable actually is. On the contrary, bittiming_cmd tells me
that this variable holds the payload for the command to set the device
bittiming. This way, suddenly, the code becomes easier to read and
understand. As long as your naming conveys this kind of information,
then I am fine with whatever you choose, just avoid the "buf" or
"cmd1" names.

> > > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > > +     int ret;
> > > +
> > > +     guard(mutex)(&priv->lock);
> > > +
> > > +     memset(priv->tx_buf, 0, NCT6694_CAN_CMD0_LEN);
> >
> > Remove those CMD*_LEN macros, instead, use sizeof() of your structures.
> >
> >   memset(buf, 0, sizeof(*buf));
> >
>
> Understood. I will make the modifications in v3.
>
> > > +     buf->nbr =3D n_bt->bitrate;
> > > +     buf->dbr =3D d_bt->bitrate;
> ...
> > > +static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
> > > +                                         struct net_device *ndev)
> > > +{
> > > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > > +
> > > +     if (priv->tx_skb || priv->tx_busy) {
> > > +             netdev_err(ndev, "hard_xmit called while tx busy\n");
> > > +             return NETDEV_TX_BUSY;
> > > +     }
> > > +
> > > +     if (can_dev_dropped_skb(ndev, skb))
> > > +             return NETDEV_TX_OK;
> > > +
> > > +     netif_stop_queue(ndev);
> >
> > Here, you are inconditionally stopping the queue. Does it mean that you=
r
> > device is only able to manage one CAN frame at the time?
> >
>
> Yes, we designed it to manage a single CAN frame, so we stop the queue
> here until a TX event is received to wake queue.

Do you mean that the device is designed to manage only one single CAN
frame or is the driver designed to only manage one single CAN frame?
If the device is capable of handling several CAN frames, your driver
should take advantage of this. Else the driver will slow down the
communication a lot whenever packets start to accumulate in the TX
queue.

> But It seems I lost the error handling code for the tx command in
> nct6694_canfd_tx(), I will fix it in the next patch.
>
> > > +     priv->tx_skb =3D skb;
> > > +     queue_work(priv->wq, &priv->tx_work);
> > > +
> > > +     return NETDEV_TX_OK;
> > > +}
> > > +
> > > +static void nct6694_canfd_tx(struct net_device *ndev, struct canfd_f=
rame *cf)
> > > +{
> > > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > > +     struct nct6694_can_cmd10_11 *buf =3D (struct nct6694_can_cmd10_=
11 *)priv->tx_buf;
> > > +     u32 txid =3D 0;
> > > +     int i;
> ...
> > > +
> > > +     /* set data to buf */
> > > +     for (i =3D 0; i < cf->len; i++)
> > > +             buf->data[i] =3D cf->data[i];
> > > +
> > > +     nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> > > +                       NCT6694_CAN_CMD10_OFFSET(1),
> > > +                       NCT6694_CAN_CMD10_LEN,
> > > +                       buf);
>
> I will add the error handling to wake the queue in the next patch.
>
> > > +}
> > > +
> ...
> > > +static const struct net_device_ops nct6694_canfd_netdev_ops =3D {
> > > +     .ndo_open =3D nct6694_canfd_open,
> > > +     .ndo_stop =3D nct6694_canfd_stop,
> > > +     .ndo_start_xmit =3D nct6694_canfd_start_xmit,
> > > +     .ndo_change_mtu =3D can_change_mtu,
> > > +};
> >
> > Also add a struct ethtool_ops for the default timestamps:
> >
> >   static const struct ethtool_ops nct6694_ethtool_ops =3D {
> >           .get_ts_info =3D ethtool_op_get_ts_info,
> >   };
> >
> > This assumes that your device does not support hardware timestamps. If
> > you do have hardware timestamping support, please adjust accordingly.
> >
>
> Understood. I will make the modifications in v3.
>
> Best regards,
> Ming

