Return-Path: <linux-i2c+bounces-9373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D3A31C6D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 03:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BDEE3A6E9F
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 02:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715431D7E4C;
	Wed, 12 Feb 2025 02:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYaBA3Sf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5751D47AD;
	Wed, 12 Feb 2025 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739329097; cv=none; b=uMi2jNaVNia4hq0IZm42dhYBd79zipAE/at5vkUfc2H2SimS40ApG7Tpex8xVvnpZCGL/wq9Am2FYvJboOlN3y3O3/6EMmyjMS3mkRUk7bPZZ65Cy3BCtqz+A9kXSsB/khbBjbdivULZ++zfqpfeIjFD+d1nqQJNcnPtLgVOlGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739329097; c=relaxed/simple;
	bh=dpHXdTTTzOTlYDNw+0rMw4yjpufMEd7BmBsMD427saM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0Nf6qSF1WvW4cnsJVt5TwA9W7SlJr1HRelRd7yU3zD2As7ICGxv8/iGoxsgH8k/og9/uJkBhFJVPoQCzs6ITGdWxzG0vJr2hWQzaXFAnlWtRyTFNsVKlyuu6DI+IFzAJeinJt8pR5kyq9uJTxY2EdUWPnBZLAvkaXcJuIDrWjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYaBA3Sf; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6fb0de4ecd4so14699287b3.3;
        Tue, 11 Feb 2025 18:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739329094; x=1739933894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghF3Hq1lteYIWO1zRuLq/VRrfWBkqaOQHyBkZfebU1k=;
        b=bYaBA3SfNjtGL9gkcmrtv4CBpdXg1cI0fIqfp30Hb2qo3q56P0TL1ZBigaza352i4d
         W9zfdilbqrRgsUP01tUO97Vai0d0kIw/z48KYqXQg0ACrlBBG97YbOw7u4GQBMAIWSWz
         hdRZ2yDNojYagyFp3q4l6FgF1c36pz6fcfEEOgK7fDFtUT+S9OnJUmHabtyG/U2NCVmh
         vtTprTFqDyGg2xumfxYYkuN12YAjFRaT0AIea+PiYW7h1kobPjdQLLzM2P85+7Wzm/vd
         mxZJjl9cgVlBuE8nkyurZ2aYIhACLiGw3LDS1HuGvH3lsqd9JjcWKCAtiOfqaeUaduXH
         E8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739329094; x=1739933894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghF3Hq1lteYIWO1zRuLq/VRrfWBkqaOQHyBkZfebU1k=;
        b=DYpX0gQ/JVeBjWj3ex1qvJbgVYkfvNLjxn5LvtYHnD+KJNrh6XN+Ix9QH8qJK1Ga1o
         DOQ2uOZD83lu23+LHRsENIDXrrmYxpsDEJBM7dC9LdoMn8JEMTSfdQpeon4OoMRwYZ8W
         lfPFIAFm02R6Iuwdwj/QbU7rDjpJNXIeeDgikoweygNSQC7lmG5lP8skP3P4rEubwsSb
         JX0fnqnnExSFbYdD+LtUdtESqV+7VGZ8cnBSiKJmKFB1uQs3RAO0i/NvpiCqPtXSSVBl
         utgWLdZsP+AoUF2MFYhad6vT+fJ3zucQMxewBeioNq1kNWPmZjUm/EpX91cgojb2MR6U
         avrg==
X-Forwarded-Encrypted: i=1; AJvYcCUEnkqKcPZ/N7yVEuQ+BNBfKu8QHpqdUnrQpcM/2uydJ6c5GuciVjEJLeinRQLsCNd6NzfYQbF3fkE=@vger.kernel.org, AJvYcCUyyQS/62mVfRls6sDQEIfyRxBIlMHljLeKI4gGflMMR0qLkql5YRfa/aCwj93cV1/jE5NBhzh2TMGLP8g=@vger.kernel.org, AJvYcCV4t6hW0RhRKFoV+bD4ri5oY3xsXVyaAeScqBAZRu9VfZwHopWgWkSOBeHPzQ1ZjXDh48xDBqCwVuUC@vger.kernel.org, AJvYcCVo57m2V7pmaEuhUIwqGWH+zVfmE1ixZxTkd5n5LaIWJvrDCypJo99c85/HM0pz6L8FzNLvhtfBGYt2@vger.kernel.org, AJvYcCVzy9RE4ltqfxzw7AbCOFAoBCmp2ssFeN2zRZtePhOKhdMk3bLona2jJHKwbF2Q6g6XninIUuBo0NxW@vger.kernel.org, AJvYcCWL0wYwokgjebxTwdRyXcIDAIYPIh08dfhXMfXdVZREFWl2uTx7fyH09jFHi94Ne1zw21fdAa8Yi4A7PK9f@vger.kernel.org, AJvYcCWs+sAsShu0dZnWBW9lwte2zKkvqYGiJwjhBtsju+waW3YrHX751yRcnvEW8Qg4zI43cRmVbrtxHZhoNw==@vger.kernel.org, AJvYcCX1vcRxBZdoj377Ct+t3DdQU/iNgN/4P8HYyTv0X6XF0i2YkfuIjl4Cm8PjlF/No0cTcAUVsJoHITPAts/+nLs=@vger.kernel.org, AJvYcCXG0O1emb2i9wsyoo8CzHLaefzT3K1DuEQqmcl5ArtSAx6CFg2e8lVtaee0nUF9mlIl2d8U4sGM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe0WMxqoAgdtlo3+VCCO6rvbxwyW6t1Y3ljTtUXug9/Et+GK6b
	1wRa4j9vpudkKdqY2wDb87feFayyod6e3PTCY3kH+bTAvKkjuUs+4/07M5n6zkG5pkcWmBwSzD+
	eP5IkFmZPJH2fj6RWef+TbCKrhkE=
X-Gm-Gg: ASbGnctdB/qLYFGbrcVAXjw3hfl5EgTxvMWFwAvBmQFCOfnmPuazzwNHwdRf0ahZwvf
	j6/aJq5AoreWZYwPxyxFp3JVFZsqAhAFWQvMGnTYO2a29B63cJWf4WszJljFmtT9VXO9xniWe2c
	AmmAhqdEXQpLMBYWGzM/2Ba1dAEdg+Z5E=
X-Google-Smtp-Source: AGHT+IFKY9my2Mv2OyawicWmvsTiPPrg1FpdmnOOVsezjy/oHTQdlNbpQ9V/afgOZCXiHY1UWHQDp4ZlhYp2zbadPiA=
X-Received: by 2002:a05:690c:892:b0:6ef:7370:96ee with SMTP id
 00721157ae682-6fb21b00513mr11775887b3.12.1739329094572; Tue, 11 Feb 2025
 18:58:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com> <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
 <9a3f1242-794e-41f1-80a5-bc6d18ff6641@wanadoo.fr>
In-Reply-To: <9a3f1242-794e-41f1-80a5-bc6d18ff6641@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 12 Feb 2025 10:58:02 +0800
X-Gm-Features: AWEUYZl54-xZLEN8OeOBxenzu1HA2sNuQj1p9av_bN6w1NsNLHVF_aDMJX4KeNI
Message-ID: <CAOoeyxWF-B90NyinEQVzpU1hqGewGR-29+Q+1ADe_W8r7y5oQw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for reviewing,
this part is as Marc mentioned.


Best regards,
Ming

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B42=E6=9C=
=887=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:01=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On 07/02/2025 at 21:15, Marc Kleine-Budde wrote:
> > On 07.02.2025 15:44:59, Ming Yu wrote:
>
> (...)
>
> >> +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> >> +                                      struct net_device *ndev)
> >> +{
> >> +    struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> >> +
> >> +    if (can_dev_dropped_skb(ndev, skb))
> >> +            return NETDEV_TX_OK;
> >> +
> >> +    netif_stop_queue(ndev);
> >> +    can_put_echo_skb(skb, ndev, 0, 0);
> >> +    queue_work(priv->wq, &priv->tx_work);
>
> What is the reason to use a work queue here? xmit() is not a hard IRQ.
> Also, the other USB CAN devices just directly send the USB message in
> their xmit() without the need to rely on such worker.
>
> Sorry if this was discussed in the past, I can not remember if this
> question has already been raised.
>
> >> +    return NETDEV_TX_OK;
> >> +}
>
> (...)
>
> Yours sincerely,
> Vincent Mailhol
>

