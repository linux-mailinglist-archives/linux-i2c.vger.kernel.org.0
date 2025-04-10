Return-Path: <linux-i2c+bounces-10244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE2A836A9
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 04:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E23446EE4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 02:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77AF1E521E;
	Thu, 10 Apr 2025 02:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ep0VsQTf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C01E285A;
	Thu, 10 Apr 2025 02:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744252848; cv=none; b=KjMWkFOWHwwza7b/Dcy+x6KJfgVzMs7XMMKZVsvXSN/9eTAk+n1O4W3OM5aSqnthQYgssSFXeTxjCliOAXZzUiwTHW101D48d0TxH2VciNLmwTO60b7knii8tGVH1pGmtOzIpGSQnrXYvPhRIksQ1hgTPEmccsOIKSecoipZg8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744252848; c=relaxed/simple;
	bh=3/tfsE5WqQ4jsxy0JOcV1bgcuEhi9GuIovCCra7x0/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkGTpujUKNo+MCc1M6Qri/+WoGuoExfrJUiEqZmfnTHMdLwn5ILvoTWFDQE3k4sbhW+JTDspJBCuGVyLUzRNKSLj/4YnjdDX7YWld9UwHtpRDEoXzG8G5I9BEibjLbMrpWavPDuJXxYLE7MqmnW8tAbE47oJCCvjM1zxuIl+sjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ep0VsQTf; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e6dee579f38so243005276.0;
        Wed, 09 Apr 2025 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744252846; x=1744857646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcuOTVyHU6jhzBy0xZ293tFvt3BaYYRswaEJVrukAHE=;
        b=Ep0VsQTf5v+ZELQRtqkzYH1/5DRHxxQ7gVeHZZm8UGBURjtGsxEnpFFhn7ePBIwDDL
         v6hcMA6CgADw5yrJ/GjhoOGOYxdpqpSl43oQyk9wQxDmOyEzNZJc+odEmA3gtEojxS+D
         OfiGzdUd/9pXUFfTOJDdfWcRdYEeWb29wW/ruVbVtuHjHFmhA8BrsZfarbnZaxSrjUaa
         knQM3UMtZZ8WjaDbJt4+XctOxuwy2cKbIYFzlhHx1KlM85DqTbg4+URg/ohTx09c3ahL
         elXao5WpDk2vG5nUneDiMtodRJzAUl0/nG5gS6gjyNuuY+ubdotV7Gko7RFlLzYz0zR1
         ebxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744252846; x=1744857646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcuOTVyHU6jhzBy0xZ293tFvt3BaYYRswaEJVrukAHE=;
        b=h8tMtq5rnnHdhOGbQBoSkvUbbyd5M1R+L9JrC/9030IDqKo3w7sfd0D00lOLv1oQzf
         GGk3pjQSrtSk3TU/ECS9VA53rndRSVR98qwNodH3WHH53CByim47WnB3vcZP24CVwSni
         fuWNJBiSviN0KHq29t/qcOIcU7ISIGE3zd58CRgyL+HSbhw4Gx0OSE0ZEhpbNsAjS7Oi
         t25g7WiipkrA229BIA2LQ3ZlMx/UpP2bXT78ck8pJxyBomd4TIJWkr+JXEZhdYKKBuF/
         GZ1eEo1ukX5P40akrr9P3+kZtmbxwonvidL9LD2gs6HxxezXpI6YhRIvKBiP89lASuQS
         J9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKAqzRv/TCfnZSzQAk0asjIuuEAcomNxNFNQWAWLph3tWh9j9amoWecIcjZbuQbkM4DC8LLhmIQnJV@vger.kernel.org, AJvYcCUX/lL3I2k4hWFy4WBySQ2q8Z+KlOyaeysfpVvE3U2GoqzFTMFcoIisXawrdZ4jG+FcB/h/bHh7FUA=@vger.kernel.org, AJvYcCVPE+AW2wGJybhPvGOteNXTYA8v9Jwq5C7eAAvkHubY3csjd8VBlhArqzSSvZZgvjFIvuhDQ7No0Gj8voGEZ/4=@vger.kernel.org, AJvYcCVWvLo0tRWLyhCLa5+zfkUO+0gHQoO0kCPaAdzPbP/0I7zMzFezhWTurSTAqWKUFMRw2ovJPKjsbyl1ZQ==@vger.kernel.org, AJvYcCWF2sivcCMa7hDhWF0cJvWPKvLDse0ktPWCadLWU9KC0Gk3EAUTskxHGrv8r/mBgkd18IAV0r+EAfhJ+Kjl@vger.kernel.org, AJvYcCWKaQtfSZVOVbTGZqYeOJmocKAU7Hn+U6c5R0ODGbhJBQ2bIRnyVeT/8VkqT5U4kb5miraUNVbAcHMLtr0=@vger.kernel.org, AJvYcCWOW21NxHoYlEdaS5zIiQrrJfIt+d5hlfMYX5RS7R8WiPa3woE0LlEXqagDhxIa6sG4uHHk9v2l@vger.kernel.org, AJvYcCXbINYZP7Hl7NA5/cotrHn07tD0uGLpE5+3DhGNAP7z3jtZa1q0IvQAfo2Y1J7PDUnEOJ1DujKndV4H@vger.kernel.org, AJvYcCXqkHV9/RgtBZVlDYXRELfjF+olewpO9rnVcUpYLV6EDTT4w9u6G7E7FYoe5LPZMzAcceTdKLbV8x1z@vger.kernel.org
X-Gm-Message-State: AOJu0YyAM4Z5i3kEcp3hdZcLGcG0JdLhORFsUy9pryxhizVi8vi412cy
	mPlm4JlXY4aLpBn/QgUXro3mZ2XNbBCcu0i1GkKz4GQ1SYQHxKJVtLVm4zB27k9nfJPQatD8e9G
	44GSl50kEeaXIbnu76XuK89TpHKA=
X-Gm-Gg: ASbGncvXPDy0zgDGCJ75jBA1I3XIM957a7Jbf7IBoCP5RJFm0RLLLOkZ1IfnMtwt5vI
	HrL3VHism/4rsvyC6WbccSnQIODa6lhOgnbwuu5gc2QNEAtZfFbdqsNACo86JnnvBPG4siKS6RH
	4yKzASJhJJZt6oeoUd03CIvAzMGEnFNGxfw8tAAYXJW1eQQabPLIJ40YXc
X-Google-Smtp-Source: AGHT+IF3IaahFFEt95p88L2E+DMS5YlqS8f6R+jKEhaHG6PmdCAg0utj1GK9fsdr5gTPdjPGEMMC0Hqk+ak++gS3uUU=
X-Received: by 2002:a05:6902:981:b0:e6d:f0a6:4cc5 with SMTP id
 3f1490d57ef6-e703e0dce41mr1936544276.1.1744252845873; Wed, 09 Apr 2025
 19:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409082752.3697532-1-tmyu0@nuvoton.com> <20250409082752.3697532-5-tmyu0@nuvoton.com>
 <20250409-cooperative-elastic-pillbug-672a03-mkl@pengutronix.de>
In-Reply-To: <20250409-cooperative-elastic-pillbug-672a03-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 10 Apr 2025 10:40:34 +0800
X-Gm-Features: ATxdqUHWhDl-xyLqC0glS-YG8IxmYyFFtwBiJ5M-DMW7Jb2-OYIl3qY47lOEkyg
Message-ID: <CAOoeyxULns52vAwzsLoXB+BwT+CN+VGBwqrg61pjKJH8bTD5bw@mail.gmail.com>
Subject: Re: [PATCH v9 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Marc,

Thank you for reviewing.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B44=E6=9C=889=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:21=E5=AF=AB=E9=81=93=EF=BC=
=9A
...
> > +static void nct6694_canfd_handle_state_change(struct net_device *ndev,=
 u8 status)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +     enum can_state new_state, rx_state, tx_state;
> > +     struct can_berr_counter bec;
> > +     struct can_frame *cf;
> > +     struct sk_buff *skb;
> > +
> > +     nct6694_canfd_get_berr_counter(ndev, &bec);
> > +     can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
> > +
> > +     new_state =3D max(tx_state, rx_state);
> > +
> > +     /* state hasn't changed */
> > +     if (new_state =3D=3D priv->can.state)
> > +             return;
> > +
> > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > +
> > +     can_change_state(ndev, cf, tx_state, rx_state);
> > +
> > +     if (new_state =3D=3D CAN_STATE_BUS_OFF) {
> > +             can_bus_off(ndev);
>
> What does your device do when it goes into bus off? Does it recover itsel=
f?
>

No, the device does not support automatic bus-off recovery. It
requires an explicit CAN Setting and Initialization(CMD0) command to
re-initialize the controller after entering bus-off state.

> > +     } else if (cf) {
> > +             cf->can_id |=3D CAN_ERR_CNT;
> > +             cf->data[6] =3D bec.txerr;
> > +             cf->data[7] =3D bec.rxerr;
> > +     }
> > +
> > +     if (skb)
> > +             nct6694_canfd_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static void nct6694_canfd_handle_bus_err(struct net_device *ndev, u8 b=
us_err)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +     struct can_frame *cf;
> > +     struct sk_buff *skb;
> > +
> > +     if (bus_err =3D=3D NCT6694_CANFD_EVT_ERR_NO_ERROR)
> > +             return;
>
> I think this has already been checked nct6694_canfd_irq()
>

Drop it in v10.

> > +
...
> > +static int nct6694_canfd_start(struct net_device *ndev)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > +     struct nct6694_canfd_setting *setting __free(kfree) =3D NULL;
> > +     const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CANFD_MOD,
> > +             .cmd =3D NCT6694_CANFD_SETTING,
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
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTR=
L1_MON);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTR=
L1_NISO);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTR=
L1_LBCK);
> > +
> > +     setting->nbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_NB=
TP_NSJW,
> > +                                            n_bt->sjw - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NBTP=
_NBRP,
> > +                                            n_bt->brp - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NBTP=
_NTSEG2,
> > +                                            n_bt->phase_seg2 - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NBTP=
_NTSEG1,
> > +                                            n_bt->prop_seg + n_bt->pha=
se_seg1 - 1));
> > +
> > +     setting->dbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_DB=
TP_DSJW,
> > +                                            d_bt->sjw - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DBTP=
_DBRP,
> > +                                            d_bt->brp - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DBTP=
_DTSEG2,
> > +                                            d_bt->phase_seg2 - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DBTP=
_DTSEG1,
> > +                                            d_bt->prop_seg + d_bt->pha=
se_seg1 - 1));
>
> What does your device do, if you set the bitrates _and_ the bit timing
> parameters? They are redundant.
>

The firmware calculates the default bit timing parameters when it
receives the bitrates, and then overwrites them if it later receives
explicit bit timing parameters.

To avoid confusion and ensure consistent behavior, I will remove the
bitrate setting logic in next patch. Instead, the bit timing will be
determined solely based on the provided bit timing parameters.

> > +     setting->active =3D NCT6694_CANFD_SETTING_ACTIVE_CTRL1 |
> > +                       NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP;
> > +
> > +     ret =3D nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > +
> > +     return 0;
> > +}
>

Best regards,
Ming

