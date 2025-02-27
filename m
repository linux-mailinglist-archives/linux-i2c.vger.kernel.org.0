Return-Path: <linux-i2c+bounces-9603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DDAA475CA
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 07:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0759165318
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 06:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516EB21930E;
	Thu, 27 Feb 2025 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJEY7UlC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BAA2E403;
	Thu, 27 Feb 2025 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740636216; cv=none; b=GLVtlWAjgavgDtdMgn97ow/xsf3n7PIFPKv71m2xpd1gJHJ3wnplG5j7rcQwceoA4Cx1qN4fJm8O+daiEiWdxKGFjRAGguY14WMhnsi6IAH0zBe1+0EuvJ4MDrMirbq50td9Wg5aje3DrX2895vYRDD7UkI+UjZVl9RtSjH769k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740636216; c=relaxed/simple;
	bh=5bQCSUlFL3cNMzqJxwc4JWiUDzaWUIigVUibvHYYM8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7SInUxPaGpd2jQFdRtBR+mvuLdJ8quUbMU4EccYQf87GYQZpNK/BE9Y59v5Cofzcy4nESetdhPSFi9rX2Hq1jdMOzSMqP27wFV0BAlX4syV1K/TrMCSCDOLM2jnfzimqL0g2sRtOPOZ7CoI09LfOktqsiw3S3BTKQUGrRNBqeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJEY7UlC; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f77b9e0a34so4445677b3.2;
        Wed, 26 Feb 2025 22:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740636213; x=1741241013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtYpkd2jzucIGjS+RbAQ8XkHU/fTQAGMdmomglbM5kM=;
        b=BJEY7UlCawcICN9hVZhAMc9HiM/0JQxlBPGTwH08R0Ww+FNqclbWPmcOTE4RRPhF0u
         LED6rA0XaiNmrLspCLhzl1S84RR8jK6xsy0RQ/ZxbP9O1AeArYrPdA5Jlpzf3gICQSf8
         Rd+4H+slRTWLe7gllg/9kgyOLJcZiRr52484ppJzArcXVq2MZaza5D4+RTz9NpLAEPNQ
         wkL6NPkfSbr2H0wa1AiW/TeZnVTRawDEtwBbghIximLZIco3yZNrhcakoJ254xHgPE5K
         PsmmE65dU37D32EuAx8jJKrvWIfTwG5hf+bsh0aEHW8S08DIZLvau89c2AHhPR0iK2e2
         kXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636213; x=1741241013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtYpkd2jzucIGjS+RbAQ8XkHU/fTQAGMdmomglbM5kM=;
        b=D+XUxTE5cI9ICx5WE1Qt2w7+v+PuPlLdKVSNJxyw88qU25y2qcbulPwFaJHPv+1jHN
         Zn9Y7AkGwlUTZ/nQkjDPLmah0+n8NhVeJlUrcjL/2S3mdjn5/vJTjMLANL9+LWg9eL6b
         4GnU2Dt7SbCC15q0Pshoe+ulCa6ydSOnNIBI+KWy4mySxYcny+DtljtmIhW5kpcqNAxo
         +hMrGNuqFgFJ07GhaUajGSwH1khseK5kZquDxKMepSlq7UE2sfEfjs1iupVv34KyWWJ/
         fYN89odGWZ9k9FyE8OOockziLdYZz+P6YK4DtM6qt99kIu8KEqCHDv42L+F0+jul734r
         PZgw==
X-Forwarded-Encrypted: i=1; AJvYcCUCtpnbkPZqSSB90WJefVbF3UVGQg1vuOoULWpks/KSegecs4RbzDBqo4T73nJ7bE92vogJQLHLbgBU@vger.kernel.org, AJvYcCV+j6l6tZuN9AVBB7ZlkSkMNcE5O/CXnV5eKhgAO9Pq4lpf7sgm+f0aYWhuTD3hg5yyYggNuz6Tx8Y=@vger.kernel.org, AJvYcCVH0DJ55Mp9tfAwnGUegXwh0FcCxpffMTN24DubxzEukfS1QhEy2zPyGOE0yO7gLiARd4rcydKx@vger.kernel.org, AJvYcCVzFgwizoGpVPBuhgS78hyO9DE4onasxNiQHnO5ZlV8KQUj2f1dW4k0YwPdJT/kD2Qb9bfJ5FfcD8iSOA==@vger.kernel.org, AJvYcCW+hu2Rtr8Ks6A7o7TXB/zuHSlhpca7YR5yRR9jrRPsTqOvPXXxaHC+eSMSdrNHiP9eYw24zNmb89B5GobPy/8=@vger.kernel.org, AJvYcCW6bShUpiRSE8tdp+f3gVzDs6zQw6FvQxLjKRpdTx4u8HkZLVd3RvPJZce77guIDcc4A/8W05nbM7N8@vger.kernel.org, AJvYcCWIMyWYsWWOplUd4GM/tDE6eB40P19p9cj9vLKsf0eKyBPHZ9U3sdWEEjKFloTIU3TzPUdECCQQ9wdB@vger.kernel.org, AJvYcCWirC+hJdMP1c9kTaWzdyg9ETkQ6G6UbLWkF30DZH9ORqKlIUmBb45NhAsuiU/BKaA3LN9PBFVS31RPABY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SxDqufp/AVuD3yLIvceMmgVIdlll+a1ycvLteY1quqaKQUvg
	KIee2VS+LdVq3/+StNizNzxeWUWD+sGoGVe7JjerUKSzf4KGjP0rp3/T4+fE8yz22Hvd3LaMlJs
	Kq3d0zlXXdZ732+sQgMAvTg2kKQgx42Pl
X-Gm-Gg: ASbGnctx+olhuQtj5eanz+KcTeYbh7l5aFoFP/oH1x8eRwxTUPIV53UKdOi/lj74w3V
	Okjr4+Hb3n9n4ZQjP2vDWyHgEwEOy1n3gb7XjxSHmJMTewv0OX3Da/41v8f5juKh+99VlsUyUmw
	7Gfj1c11NLltB6RprIDauce9hbc/7eV+oqQqI1m8HqIA==
X-Google-Smtp-Source: AGHT+IHhW5RmOkI7gkOjlnGO69YlG3Snu/7w3uKIK+tMNwqUqsl2+cEq6+/+Jh1ycoF05KXQ4giGB5nQbc+/Fln9Lv8=
X-Received: by 2002:a05:690c:6402:b0:6fd:359a:8fd2 with SMTP id
 00721157ae682-6fd359aa0f1mr37893927b3.26.1740636213413; Wed, 26 Feb 2025
 22:03:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com> <a32b4ca1-0bcf-48e4-87ab-61fbd077a3c3@wanadoo.fr>
In-Reply-To: <a32b4ca1-0bcf-48e4-87ab-61fbd077a3c3@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 27 Feb 2025 14:03:22 +0800
X-Gm-Features: AQ5f1JqT0RaRfdM1W6C9qCDjKis5nvigOw3vz5qmtqucCho9jlDXbeZ2UgpSNeA
Message-ID: <CAOoeyxXax83oNg1MpC7N4B6TrLMeg8z53SaHGqsej8ZDMP1SLA@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, tmyu0@nuvoton.com, 
	lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for reviewing,

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B42=E6=9C=
=8827=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:09=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
...
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
> > +             priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > +             if (cf)
>
> Set the CAN_ER_CRTL flag:
>
>                 if (cf) {
>                         cf->can_id |=3D CAN_ERR_CRTL;
>                         cf->data[1] |=3D CAN_ERR_CRTL_ACTIVE;
>                 }
>

Fix it in the v9.

> > +                     cf->data[1] |=3D CAN_ERR_CRTL_ACTIVE;
> > +             break;
> > +     case CAN_STATE_ERROR_WARNING:
> > +             priv->can.can_stats.error_warning++;
> > +             priv->can.state =3D CAN_STATE_ERROR_WARNING;
> > +             if (cf) {
> > +                     cf->can_id |=3D CAN_ERR_CRTL;
>
> Set the CAN_ERR_CNT flag when you populate cf->data[6] and cf->data[7]:
>
>                         cf->can_id |=3D CAN_ERR_CRTL | CAN_ERR_CNT;
>

Fix it in the v9.

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
>
> Set the CAN_ERR_CNT flag when you populate cf->data[6] and cf->data[7]:
>
>                         cf->can_id |=3D CAN_ERR_CRTL | CAN_ERR_CNT;
>

Fix it in the v9.

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
> > +             netif_stop_queue(ndev);> +              can_bus_off(ndev)=
;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
...
> > +static int nct6694_can_stop(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     priv->can.ctrlmode =3D CAN_CTRLMODE_LISTENONLY;
>
> Hmmm, when Marc asked you to put the device in listen only mode, I think
> he meant that you set it on the device side (i.e. flag
> NCT6694_CAN_SETTING_CTRL1_MON) and not on the driver side. If you set
> CAN_CTRLMODE_LISTENONLY flag, that will be reported in the netlink
> interface. So you should not change that flag.
>
> But before that, did you check the datasheet? Don't you have a device
> flag to actually turn the device off (e.g. sleep mode)?
>

Our firmware currently does not provide an interface to turn the
device off, I will put the device in listen-only mode as an
alternative.

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
> Marc asked you to remove this line during the v7 review.
>

Sorry, drop it in the v9.

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


Best regards,
Ming

