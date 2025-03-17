Return-Path: <linux-i2c+bounces-9841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9CA63B77
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 03:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D965188E417
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 02:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039BB1531E1;
	Mon, 17 Mar 2025 02:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWTIF7A1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFBE41C71;
	Mon, 17 Mar 2025 02:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742178265; cv=none; b=DlMU23+HQGK4dNxlyEXR/+6TBEDBWDFMUg8/WHUcki+IwRUAFG8lbnqsv0mb8ppZDa4xpbY1wLEsd2EGf1CDkNZFRAMps4KSdt7vSdDW1mRMHn5eILZds26pC6bqFGW8qwZhXGPtlrdSJk2Nce2hX4Yk0HPS7YcuR+sy5BGgWdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742178265; c=relaxed/simple;
	bh=GfwazyRGvf6/MS6LTtOghkcA/g/JqM022rTNo8ZliO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/7ccN0qPXQTvvmhiDVyhaLjKNkeT5GYpY8n4fVPvkfMMmmT/YDcWh3ltESyAOr4t2sks+1LKa4FZgmQMj1Wk8Z6Q/8XV6SyoiTldTJF6UAkbrmt5zdAcde/6AW3lBFpK6H1OnshIEMAuo0xGTDZEeYgSCTnEjS94dTju39ON80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWTIF7A1; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e60b75f87aaso2970795276.2;
        Sun, 16 Mar 2025 19:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742178262; x=1742783062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plLzbgZIgA5R46u3z1qzZAXnycpQ3RuSU3nBYrPKdM4=;
        b=TWTIF7A1e2OaOt/r3eQmjbwt7BynlsDJX3EsnE9wbNZSL21p2MwJif42Kd0c9T+MId
         85cnNI/sh6KxbeHmTTuWEpWw6yP+QnerG45BNsN7Guz7pYvqkompD2Pkvm9jCIRuHAGW
         f3O2gmqRZgZde3yird93fS4Rvdzdft+YSrBNrmvD6apB2cFoOUdfDx+X4wHAludubiE/
         EkKCNWS1Gm3l4TQinWSvq4l/Lkk1u8rGYUJqrExFNxAuaQQCUE9lGq0aA2EwfYihT1Xs
         gz1SK+lMQHikrp8NkXgX1tAg1ufhjg+HNJG71q8kqu70ljyGGEdZNO9lm6l0ZCXPsEOS
         z0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742178262; x=1742783062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plLzbgZIgA5R46u3z1qzZAXnycpQ3RuSU3nBYrPKdM4=;
        b=iUut4DB8FcCuhsEwzkRdO0d69lRqWkRdLC7H706kc3w12A7OFsGZbryg+cxVSCL2D/
         MLL47zTx6CCQvGWKqPOQ457ENKM0AirHxqrs+WLgjDH5Q8iFd4/022ikXRraGlLa57IP
         3Rdyd/zIKW+ChOrHBv92ntjANFdraHqMsCWU6PTotNIvx4vMTnYEqhYQrgmogD1bIRKq
         5U06HH2S2hsWdIY5dx2QurIALJOP5yeUnsPi5wn6ikT6Qkw3yR2XtuLHvcRPQAuRcjDy
         GnuT0vg3Wd+66+h94xvoOuAZjb7hCr823jvbMIgWIip54r8c7aA2/LNlvGEUqh07ITdS
         OWlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6y8bP2+dXJ9NcmQnXUVpqOZ++F4Voc9JmHaJ12Wf62d5PonK5n2YNXjgYSzxZQjI0mw3nAasN6cG7pSm8@vger.kernel.org, AJvYcCUn3k1zPAZFAWkbtKjwM5iXkQYP2uxqFToR7CAgoJpdKFR9wgSxt0Igc6Lo8JMOhhIxpTAjSQvAvkg=@vger.kernel.org, AJvYcCUuW28nHPA8WkI2C55EBPzbRtzttlJbdMYNZX1E3g86K2ebEBxBi21xedO5cfxQe+3dRyQEVhLM/yaPWg==@vger.kernel.org, AJvYcCW13TI2QUL+kE4PM1F4JGCUzPzuWt4C7B0tF/kePoFPJnIu3QDCmpJLTHV6L/X+6t1MSWd66IwEiKAyxbcaDw0=@vger.kernel.org, AJvYcCWSft64H9FWZNF3k6TpQUVxpx1IkAHRxJ+l89yVU2ywX2XkK9lvtjtdlw1C3kfSZ7bkOmmbfc+s@vger.kernel.org, AJvYcCWWWWqu5I4BcguEcWNFECWS5h1AVYZTj3AOO1C+xONRZp8dlkESHpb4fW9lZY3qE4UGNohypZdFRGnO@vger.kernel.org, AJvYcCWdc/dNeAjoMEUCmqi2gdGNQoucmWA0IhTST2afNtaVN3Dow0XQw9idr77VQkDEMWviLdyPZtZSLP+2jNg=@vger.kernel.org, AJvYcCXPONIzO8+/vH0b3LTTlDffkC+XSU/v5S6lQOZjQVnShZBmLsJctuRWz/jk+IdZnjHEmsYom1GeN2Lr@vger.kernel.org, AJvYcCXaWgPi/oVbUZIR1gAbbuAgj/rt+BaF+BST7pU8VMkIewDprNhzqDE4t4QF8dKI2CRMV9/vXB82dhLM@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoJWdxgQM1vighrdvme/tGhrdtBo8AnYGP7hSsl0KwglR6K3g
	wWjjwItQDTlmfNM2GlcfSKIe3V9soxt57N+iaquRueWC6CZcQ3W247iiNOF+ZLZ+PKu/QgEtDVn
	M2f90X71rUqSXTmvYxtpwwhhPgYg=
X-Gm-Gg: ASbGncvsvVr+ca4SqEgO5ic87oe0SRE1e0ZV+gNVPKd0okwMvKL0pZ+lKInDHr3vXUU
	jByLMpk9tKfsqbuvix0kLqcuVqhn3Q5q4o3nelkZctNNykzPPRZr05XRfV5viQCUDQ7wupWyyGJ
	MW+/OpyBDpSwRkxLJUGVq7Hi/iBwbQkckJ3RoeOwOy5Oda/v9qgcYqZd5enKs1
X-Google-Smtp-Source: AGHT+IFutVd0ve5vIoAHtAZPQrwbvPitUA7WmH1G2z2GwmtczKueZE9mo2UuY4+iKucRCxC4hc0oK4czSHqwKkHDrtI=
X-Received: by 2002:a05:6902:2381:b0:e63:7555:7a8 with SMTP id
 3f1490d57ef6-e63f64d7504mr13187014276.5.1742178262193; Sun, 16 Mar 2025
 19:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com> <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
In-Reply-To: <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 17 Mar 2025 10:24:11 +0800
X-Gm-Features: AQ5f1JpSRq-ZbR2rB8zfHse5QeMulV6iZ54MhHuHlQC4YU4drXBEu8nEXC5SyKQ
Message-ID: <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com>
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

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B42=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:44=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > +static void nct6694_can_handle_lost_msg(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +     struct can_frame *cf;
> > +     struct sk_buff *skb;
> > +
> > +     netdev_err(ndev, "RX FIFO overflow, message(s) lost.\n");
>
> Please make it a netdev_dbg()
>

Fix it in v9.

> > +
> > +     stats->rx_errors++;
> > +     stats->rx_over_errors++;
> > +
> > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > +     if (!skb)
> > +             return;
> > +
> > +     cf->can_id |=3D CAN_ERR_CRTL;
> > +     cf->data[1] =3D CAN_ERR_CRTL_RX_OVERFLOW;
> > +
> > +     nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static void nct6694_can_rx(struct net_device *ndev, u8 rx_evt)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_frame *frame =3D &priv->rx;
> > +     const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_RECEIVE,
> > +             .sel =3D NCT6694_CAN_RECEIVE_SEL(ndev->dev_port, 1),
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
>
> stats->rx_dropped++;
>

Add it in v9.

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
>
> stats->rx_dropped++;
>

Add it in v9.

> > +                     return;
> > +
> > +             cf->can_id =3D le32_to_cpu(frame->id);
> > +             cf->len =3D can_cc_dlc2len(frame->length);
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
>
> I just replied to one of your questions of the last series:
>
> | https://lore.kernel.org/20250228-magic-seahorse-of-abracadabra-f2a402-m=
kl@pengutronix.de
>

Understood, I will make the modifications in the next patch.

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
>
> no need for can_free_echo_skb() and netif_stop_queue()
>

Fix these in v9.

> > +             can_free_echo_skb(ndev, 0, NULL);
> > +             netif_stop_queue(ndev);
>
> > +             can_bus_off(ndev);
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
>
> if (skb)
>

Add it in v9.

> > +     nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static void nct6694_can_handle_state_errors(struct net_device *ndev, u=
8 status)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
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
>
> make it: "if (cf)" instead of "if (skb)" then interacting with the "cf".
>

Fix it in v9.

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
> > +     if (skb)
> > +             nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static void nct6694_can_tx_irq(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +
> > +     stats->tx_bytes +=3D can_rx_offload_get_echo_skb_queue_tail(&priv=
->offload,
> > +                                                               0, NULL=
);
> > +     stats->tx_packets++;
> > +     netif_wake_queue(ndev);
> > +}
> > +
> > +static irqreturn_t nct6694_can_irq(int irq, void *data)
> > +{
> > +     struct net_device *ndev =3D data;
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_event *event =3D &priv->event[ndev->dev_port];
> > +     const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_EVENT,
> > +             .sel =3D NCT6694_CAN_EVENT_SEL(ndev->dev_port, NCT6694_CA=
N_EVENT_MASK),
> > +             .len =3D cpu_to_le16(sizeof(priv->event))
> > +     };
> > +     irqreturn_t handled =3D IRQ_NONE;
> > +     int ret;
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, priv->event);
> > +     if (ret < 0)
> > +             return handled;
> > +
> > +     if (event->rx_evt & NCT6694_CAN_EVT_RX_DATA_IN) {
> > +             nct6694_can_rx(ndev, event->rx_evt);
>
> just for symmetry name rename nct6694_can_rx() to nct6694_can_handle_rx()
>

Fix it in v9.

> > +             handled =3D IRQ_HANDLED;
> > +     }
> > +
> > +     if (event->rx_evt & NCT6694_CAN_EVT_RX_DATA_LOST) {
> > +             nct6694_can_handle_lost_msg(ndev);
> > +             handled =3D IRQ_HANDLED;
> > +     }
> > +
> > +     if (event->status) {
> > +             nct6694_can_handle_state_errors(ndev, event->status);
>
> I think you should call nct6694_can_handle_state_change() directly and
> get rid of the code on nct6694_can_handle_state_errors().
>

Fix it in v9.

> > +             handled =3D IRQ_HANDLED;
> > +     }
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING) {
> > +             nct6694_can_handle_bus_err(ndev, event->err);
> > +             handled =3D IRQ_HANDLED;
> > +     }
>
> The logic needs to be refined. If there was an IRQ you must say you've
> handled it, event if user space doesn't care for bus errors.
>
> The better solution is to disabled event->err related IRQs in the
> hardware, if CAN_CTRLMODE_BERR_REPORTING is disabled, so you don't get
> an IRQ in the first place.
>
>         if (event->err !=3D NCT6694_CAN_EVT_ERR_NO_ERROR) {
>                 if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING)
>                         nct6694_can_handle_bus_err(ndev, event->err);
>                 handled =3D IRQ_HANDLED;
>         }
>

Fix it in v9.

> > +
> > +     if (event->tx_evt & NCT6694_CAN_EVT_TX_FIFO_EMPTY) {
> > +             nct6694_can_tx_irq(ndev);
>
> just for symmetry name rename nct6694_can_tx() to nct6694_can_handle_tx()
>

Fix it in v9.

> > +             handled =3D IRQ_HANDLED;
> > +     }
> > +
> > +     if (handled)
> > +             can_rx_offload_threaded_irq_finish(&priv->offload);
> > +
> > +     priv->bec.rxerr =3D event->rec;
> > +     priv->bec.txerr =3D event->tec;
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
> > +     frame->tag =3D NCT6694_CAN_FRAME_TAG(ndev->dev_port);
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
>
> frame->length =3D canfd_sanitize_len(cfd->len);
>

Fix it in v9.

> > +
> > +             memcpy(frame->data, cfd->data, cfd->len);
>
> memcpy(frame->data, cfd->data, frame->length);
>

Fix it in v9.

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
>
> The FIFO should not be full at this time. There also could be an USB
> error due to unlug or EMI. I think you should remove this error message.
>

Fix it in v9.

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
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1=
_MON);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1=
_NISO);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1=
_LBCK);
> > +
> > +     ret =3D nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_can_stop(struct net_device *ndev)
>
> static void
>

Fix it in v9.

> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     priv->can.ctrlmode =3D CAN_CTRLMODE_LISTENONLY;
>
> As Vincent already pointed out, bring you device into listen only mode.
> Please add a comment why you do it, because it cannot be stopped.
>

Okay! I will add the comment in the next patch.

> > +     netif_stop_queue(ndev);
> > +     free_irq(ndev->irq, ndev);
> > +     destroy_workqueue(priv->wq);
> > +     can_rx_offload_disable(&priv->offload);
> > +     priv->can.state =3D CAN_STATE_STOPPED;
> > +     close_candev(ndev);
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode=
 mode)
> > +{
> > +     int ret;
> > +
> > +     switch (mode) {
> > +     case CAN_MODE_START:
> > +             ret =3D nct6694_can_start(ndev);
>
> if (ret)
>         return ret;
>
> netif_wake_queue(ndev);
>

Fix it in v9.

> > +             if (!ret && netif_queue_stopped(ndev))
> > +                     netif_wake_queue(ndev);
> > +             break;
> > +
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int nct6694_can_open(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     int ret;
> > +
> > +     ret =3D open_candev(ndev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     can_rx_offload_enable(&priv->offload);
> > +
> > +     ret =3D request_threaded_irq(ndev->irq, NULL,
> > +                                nct6694_can_irq, IRQF_ONESHOT,
> > +                                "nct6694_can", ndev);
> > +     if (ret) {
> > +             netdev_err(ndev, "Failed to request IRQ\n");
> > +             goto close_candev;
> > +     }
> > +
> > +     priv->wq =3D alloc_ordered_workqueue("%s-nct6694_wq",
> > +                                        WQ_FREEZABLE | WQ_MEM_RECLAIM,
> > +                                        ndev->name);
> > +     if (!priv->wq) {
> > +             ret =3D -ENOMEM;
> > +             goto free_irq;
> > +     }
> > +
> > +     ret =3D nct6694_can_start(ndev);
> > +     if (ret)
> > +             goto destroy_wq;
> > +
> > +     netif_start_queue(ndev);
> > +
> > +     return 0;
> > +
> > +destroy_wq:
> > +     destroy_workqueue(priv->wq);
> > +free_irq:
> > +     free_irq(ndev->irq, ndev);
> > +close_candev:
> > +     can_rx_offload_disable(&priv->offload);
> > +     close_candev(ndev);
> > +     return ret;
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
> > +     struct nct6694_can_information *info __free(kfree) =3D NULL;
> > +     static const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_INFORMATION,
> > +             .sel =3D NCT6694_CAN_INFORMATION_SEL,
> > +             .len =3D cpu_to_le16(sizeof(*info))
> > +     };
> > +     int ret, can_clk;
> > +
> > +     info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, info);
> > +     if (ret)
> > +             return ret;
> > +
> > +     can_clk =3D le32_to_cpu(info->can_clk);
> > +
> > +     return can_clk;
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
> > +                              NCT6694_IRQ_CAN0 + cell->id);
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
> > +     priv->can.state =3D CAN_STATE_STOPPED;
>
> please remove CAN_STATE_STOPPED, it's not needed
>

Fix it in v9.

> > +     priv->can.clock.freq =3D can_clk;
> > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_nominal_cons=
t;
> > +     priv->can.data_bittiming_const =3D &nct6694_can_bittiming_data_co=
nst;
> > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > +     priv->can.do_get_berr_counter =3D nct6694_can_get_berr_counter;
> > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
> > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
>
> Does your device run in CAN-FD mode all the time? If so, please use
> can_set_static_ctrlmode() to set it after priv->can.ctrlmode_supported
> and remove CAN_CTRLMODE_FD from ctrlmode_supported.
>

Our device is designed to allow users to dynamically switch between
Classical CAN and CAN-FD mode via ip link set ... fd on/off.
Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_supported, and
can_set_static_ctrlmode() is not suitable in this case.
Please let me know if you have any concerns about this approach.

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
> > +             goto rx_offload_del;
> > +
> > +     return 0;
> > +
> > +rx_offload_del:
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
> > +     unregister_candev(priv->ndev);
> > +     can_rx_offload_del(&priv->offload);
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
>
> There should be no need for the module alias.
>

Remove it in v9.

Thanks,
Ming

