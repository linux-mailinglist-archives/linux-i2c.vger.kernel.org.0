Return-Path: <linux-i2c+bounces-9120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C16DA13328
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 07:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6087B167676
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 06:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE52A18FDD5;
	Thu, 16 Jan 2025 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhYcbo2/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3024A7E8;
	Thu, 16 Jan 2025 06:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737009294; cv=none; b=FPseENzbTnfZ9aTGihYUaNzWxGnpw0TKf3iqQPqzoQ6qwI0APwrkwbQ3ccG8ZViTx8zrMz9pB+i1y6onVqkt9ZzYML/MXsofDbG5CXK7mfiSS7cxBQiwx+LSaXOLFW7lFh35G0F3eFuCu1Q/QyAj2HWdGwR88cCqA/SkUiS6O5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737009294; c=relaxed/simple;
	bh=c4bb3EMGsgMUrTeDTt/1IawO6xWVcbipTrw2VtmyAng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPSSwH4W1U7Z4ir91fKJDY8D5scjvJlG0uSI0hSbh0PI446VQFTpmUZNcnhwmM4nXPULb1DiSnOHXZ81C6iocGG899kkiq2jZlBEthjEme4xGizqRBw3pF3vdoP7T9ppEGsh5VnCBjmgQqJeoKlyLz5aGoaqscY2SCE9D6eVeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhYcbo2/; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e54bd61e793so1095830276.2;
        Wed, 15 Jan 2025 22:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737009292; x=1737614092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUMl2lV37NeEyUYQ+8hv4yRX1yZLm9fZeIJWVyQAT9A=;
        b=FhYcbo2/BMbsjW7hmwyRbRc+edN+6c80zj7EVm+qPUuaziTQtJGz/jgbavNrg9qbXf
         5Ku3U6+qStP21J2qr0DSG4hi7VkoLpAC3uY7Fi/A2NzdiE8xSF9IBuLxZ3prYQdj5a+R
         QIy0f03tEBWLn1HEgQrQI+reAFruvukm5ryCXTsN4+qACkbPwAjkitxxHibjzGPmKBeC
         hJiGSTGWaQDO4qgYIxKBi94Uy1YTPP//KM+OcQLrS7LlnpjP977+Jqd7xPzZJbLK8WzN
         BYyvkSqZw69E6Ndu5YWe9gBm7uYs25yvkEHBiG4CUIg8yJ25B8IoB4C45rqEdBELo91a
         TKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737009292; x=1737614092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUMl2lV37NeEyUYQ+8hv4yRX1yZLm9fZeIJWVyQAT9A=;
        b=NW0sY/CS6nzXrNicZg7T6Q2wsVWEISOADkywNqOl3WBuzm1PoTahXRZ0Dps25op8ou
         eHD1UiB1cTHdnGeU8McFXDoBteDS0hrHCRdEfAFExwMGfCTAPJCzYJ4Q/5GJfdcHJCw1
         emr15p0Ij/RjExyW7rhtJ9ye2YJiu/LwUvEBrXsawiWELYbkk9th47CWklWaA+GEGz0w
         ftdxvFrjAEm6KBXG1ye3bb0HOB0wFWmpIYLGqbRqv0/7+dipaSoQBwUoIqgmFFSaELnd
         495dgMOtzGE3ZOGO3Im/mqORobF+ZHY4n1gWUu6lvplOaJr/TKjprIdgTLMEa07pkdEY
         K9jA==
X-Forwarded-Encrypted: i=1; AJvYcCUCQt2kY1urPyRk/h9tN70EUmBq7HYgpNY3lr5R6W+HLKlowYou3RrfvMDKgL02rHxyvVmPNLgqsGNG@vger.kernel.org, AJvYcCUEZsIHdopj7ddkKiKANjCKry2fv6NmmNEkW3nvvRfsT5uVEOF5gL1ZqOmkca1TjsOlPvMvRmEvPtwl@vger.kernel.org, AJvYcCUosTDjI7JCMZWoq+SPv0o1iRtZEmudsbp1ciylKAwa6S8TFnv9ePfIlvrK1ztVuH9JO65KHjQKrAiK@vger.kernel.org, AJvYcCUq0GBEvra3eaRi/vl2xbsLHK7dEDH5Tdw/QeuyC4iIpArzWWe2kIMDysgWFmkOAvVqvhI6wQK2ZqU=@vger.kernel.org, AJvYcCVCiVUNKukvLrhziF0x8PGJJSo9aEfbRxhQF8Nbhvr/sbZDoCuVih4830cqT8TKg/l/hjShAWEdRr0JAw==@vger.kernel.org, AJvYcCWEFNsrcwhFSVz+Mt26vlcLljmhnpLUT9OMeL/7YfZhIm1rgtz5y9V8MGICQcUGav9YTMXkIb4B@vger.kernel.org, AJvYcCWOx8hin3A5cMdedhNkFj/BrNdBHHNXRiSXw4pve0adFrradrnTtM8RC9jX4dm9WNfXxllPAVl3+rTjIbP7Qbo=@vger.kernel.org, AJvYcCXFL62vzL6qVxVzQntc5yJbzL5VXBuxysQzbHUs1YxWRqT/z1dIGTZebZgd8i+ft1K8vXivM8GOE0YFIj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5kdDOdklx4LobLPhpxK8sHYyircAL0JFMdI6AmqXwRzJ86YY
	qBmclXnxFSBtu4b8tU963WFTXQSm+zuJIc3auMAA5p/kkRrx2h4NHQlEgqD6W9k96jovi2qqe4C
	i5pmgl1xqbu9A7GzS0NDin0Z7wj8=
X-Gm-Gg: ASbGnctD8yoHXYqv8thkC4s6CRPB5tznyMNj9eKye+kThTNcLJQloh79iXWsj9PJIfy
	SJOsgRExrNBKcQN98pFsk5CFC9/oNIfJS1npyRfVWb2qFvUxAQJFbP1/K0iqE5l5MLphjNgr8
X-Google-Smtp-Source: AGHT+IEBjbrPYm9uZ4tkDJz8bKIImgmSbE3fPZUiZeCgys3yex7NZywUBcf/cb/InNa/yBzsGp+ThfaTGo+an3nLKdc=
X-Received: by 2002:a05:6902:f84:b0:e38:8a2e:e3bc with SMTP id
 3f1490d57ef6-e54fca4021cmr25184463276.5.1737009291859; Wed, 15 Jan 2025
 22:34:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-5-a0282524688@gmail.com> <cef1b9bf-59f6-484d-861e-82b405653ca1@wanadoo.fr>
In-Reply-To: <cef1b9bf-59f6-484d-861e-82b405653ca1@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 16 Jan 2025 14:34:40 +0800
X-Gm-Features: AbW1kvYJI-ZlyxfzNTVWRJivNQwAAI1rVA1G13z7pWoyr3_f28bZHldijS45J6Y
Message-ID: <CAOoeyxVK=iBmj3BDX=D8a9=GFBkE158jbq3Rnq-RuoA5HxMi7g@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] can: Add Nuvoton NCT6694 CAN support
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

Hi Vincent,

I will remove priv->tx_skb in the next patch, but it seems that
can_flush_echo_skb() has not been EXPORT_SYMBOL_GPL().

I would like to know if nct6694_can_clean() requires modification.

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B41=E6=9C=
=8816=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:45=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > +static void nct6694_can_clean(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     if (priv->tx_skb || netif_queue_stopped(ndev))
> > +             ndev->stats.tx_errors++;
> > +     dev_kfree_skb(priv->tx_skb);
>
> Use:
>
>         can_flush_echo_skb(ndev);
>
> (related to the following comments).
>
> > +     priv->tx_skb =3D NULL;
> > +}
>
> (...)
>
> > +static void nct6694_can_tx_work(struct work_struct *work)
> > +{
> > +     struct nct6694_can_priv *priv =3D container_of(work,
> > +                                                  struct nct6694_can_p=
riv,
> > +                                                  tx_work);
> > +     struct net_device *ndev =3D priv->ndev;
> > +
> > +     guard(mutex)(&priv->lock);
> > +
> > +     if (priv->tx_skb) {
> > +             if (priv->can.state =3D=3D CAN_STATE_BUS_OFF) {
>
> Just stop the queue when the can bus is off so that you do not have do
> check the bus status each time a frame is sent.
>
> > +                     nct6694_can_clean(ndev);
> > +             } else {
> > +                     nct6694_can_tx(ndev);
> > +                     can_put_echo_skb(priv->tx_skb, ndev, 0, 0);
> > +                     priv->tx_skb =3D NULL;
> > +             }
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
> > +     if (priv->tx_skb) {
> > +             netdev_err(ndev, "hard_xmit called while tx busy\n");
> > +             return NETDEV_TX_BUSY;
> > +     }
> > +
> > +     netif_stop_queue(ndev);
> > +     priv->tx_skb =3D skb;
>
> Here, you can directly do:
>
>         can_put_echo_skb(skb, ndev, 0, 0);
>
> The skb remains accessible under priv->can.echo_skb[0]. With this, you
> can remove the priv->tx_skb field.
>
> > +     queue_work(priv->wq, &priv->tx_work);
> > +
> > +     return NETDEV_TX_OK;
> > +}
>

Thanks,
Ming

