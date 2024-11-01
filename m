Return-Path: <linux-i2c+bounces-7705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C09B8A9C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 06:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D034B21067
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 05:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1F6158868;
	Fri,  1 Nov 2024 05:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IspYIP4N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D414B94B;
	Fri,  1 Nov 2024 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439142; cv=none; b=ukQp0uuZVzZ7QvrkilnoKkQjAJ/k5VdGWTZFiecFIFduZFAmOyhe0Ylzp6+zkahBIsQulu64gmZ4vLvQ8mDuVzLa78RUuOhVvGGofeghmPr+M62WOh7sCHYZ62BFDQ8X+KnGVKwxtP8MwnDiuw2HqvW6zvnk+i1M66uTJu3tIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439142; c=relaxed/simple;
	bh=4aAyyocih2k/v7oUgWnbTIIg7cQfGgg8B0Ac9WSuUvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BknQQQxnyWQ2Uuhv5Rx0zpZjxkDIYJOR2gRKLRU7n2qPR0U+VDUebJV0weATw7IQKoQ4Tvk72E/7jKHBuENO6uEY5YyMdnWBlBc352cB71PIh/TNmb37m9lpqDEHP5IIlqYB2eqhh9UkZy8W8jN9WpOhWjFLLX4QaYmYW0TZ9cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IspYIP4N; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e2974743675so1560247276.1;
        Thu, 31 Oct 2024 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730439139; x=1731043939; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HjeS6maIJCTCxAPSzZqa/CeRCDmBTB48qyHYUQsBRoY=;
        b=IspYIP4Nj9YOp8XU10NtMe94LEMm2hIxu3aVfiZF7FoBw48tq3md+LSNzD6RE9w1nx
         7C9RmG2YTsQHCOd+Ha/wFDHUGsOs0RMsVTl8nLrXq9IgahRmrgkYeVTnNUD3GgPpuBED
         s+69QEeW02vx8Yst8mipRiTVY6yC/dPHX7UQwHgfKTfE3BRqrBtXvIftNlfplt6W2NHv
         iEsVDz+VWrwLjDwtrdaequc8Tu8ouzU5vZILQrx+HscwCsZZrQqR5diTSB+CY6AP5mn4
         IIzY3ISQNPGYoIg+/jykNbuXj/nKWS7Oq0IyWGBWjfjYyIPvfnRe6cZk+oXY+/nalbRT
         HYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439139; x=1731043939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjeS6maIJCTCxAPSzZqa/CeRCDmBTB48qyHYUQsBRoY=;
        b=q8NuO034WAw3g7T+4YoROX0XWBVbN/EqjWbiHZaRSb6QGwrXbhzHHY0jWz/rtT/T8C
         cUQSLO7kmcrpfpTQ9PuG3d+o2SA4awHKyd1/G8nATn8vSZKy+3Mak+oSRUKZeoqoQigf
         RbNbYw1JJcIOn/gtEVRskjXCmp4sOAixLZ59mqQHmLoNliD8HGxxsg3sb434Xp6xasoz
         +uPV1AAxG7P5zdIUYjOliCEnz7kR1fi5x509+il6K/eO78ECbOC4KwYpDDT0+iTgt046
         nDJhRoNlBlLewctEZd7S36bSvLiFzopnZfWiwqd7MgwhTVU7mglJ4ujfVJdbqAc9wb5N
         du1g==
X-Forwarded-Encrypted: i=1; AJvYcCU0SoQUuSQRLcpn3f3vV7+n68I9w2H6KIx33rsy0d4CAkmjZYyCOzken62ZSJiPT1E7oZGucb6L+2uViBaL2EA=@vger.kernel.org, AJvYcCUDC5XurtT7/QaT3SBpZExV9LlKXttNFtF60UWj2ObzK+qDy1+ySeb+IbLyZsbmqdRUymZwTcK/MbWK@vger.kernel.org, AJvYcCVQnnEZPuum5hcBRPJxIFElLnKZLity6c+ZnEE2SUT7m+Ab6XLAkyJutDnYh4CPSfLLwHx9fQ2P+IP9@vger.kernel.org, AJvYcCVUsyhtFSphrD1ncGxZ0YaCZPXGN1mor6AHc/svN8Ej05mR1VJLJKn56y9HY6wMagKzdzkuvE2OteNB@vger.kernel.org, AJvYcCVz9uvlJTAgqwv1p42Aq/QDJJjJsfj03swDJT2hqME1sOwNDa34QX3I3Sh8OVU1/+ZG/LzImFfBI1AM@vger.kernel.org, AJvYcCVzula36NluBvsS0kwG1wKrMod5es9+0lEI+axXKjN+usskaZ/Hnta6InKdbyJ6ZXVTtyy7P7jqQRFZwRM=@vger.kernel.org, AJvYcCW2WjA1rfQes/ri2FvIWoj4hTKfSATTwMbtUh0SVVnwB9nAbng99PRjJ7AnGUn5I+4Lmx/iKzU5@vger.kernel.org, AJvYcCW7a9Vruyf5+f00aUcpKmfsRWnlNYP5uueeEkYKfahGku0mrqkJOUHz63wo0iXl4E/qQ9uiJ92Jq5A=@vger.kernel.org, AJvYcCWk5+Qg/donvw7EJk3hO08WXgOPc2DDbCU2wjgVEcLhAzPdrnUpstexfPwxTo3KzXdzx4c7iCSa4wilyA==@vger.kernel.org, AJvYcCXluWRM8Q2tEYFNzZmFsi2hsV+j4afcCXFI
 Qyr06HtpFr3rU3GAMb5YxfXUzVEQ+mIjtfW1olaYRBFVHqQ5@vger.kernel.org
X-Gm-Message-State: AOJu0YztvRlJrDnw9iYm99okRtW4OmzSABtTi2929+nLPWRbeBAGc9kG
	8VTpwJGbt4KnY/tD6ontFpWdHKRrDzPj9/tz/XpSyCw8T3LTGazGaF4JdLelHVTAV6Rq3YKh+FL
	VJbfO5E4Set3IoWnGLi8nR+KStoY=
X-Google-Smtp-Source: AGHT+IFrX7ZQ1PSCrF9xu/5ZXB9zjQzg3rpK/nqnOEhybp3hid1x3ZT2YTGScjbWf8iKwn7wGqaHF7VXKXNEuiUepLE=
X-Received: by 2002:a05:6902:300f:b0:e28:e4bd:13f3 with SMTP id
 3f1490d57ef6-e30e5ae08d4mr5292451276.23.1730439138819; Thu, 31 Oct 2024
 22:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-5-tmyu0@nuvoton.com>
 <20241024-majestic-chowchow-from-wonderland-096eb4-mkl@pengutronix.de> <20241024-marvellous-brainy-anteater-f61302-mkl@pengutronix.de>
In-Reply-To: <20241024-marvellous-brainy-anteater-f61302-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 1 Nov 2024 13:32:07 +0800
Message-ID: <CAOoeyxXRMhkRhi20tctcs3Htg4wug4wPd+n_f_NZcVBtV-GuXA@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > > +static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
> > > +                                       struct net_device *ndev)
> > > +{
> > > +   struct nct6694_canfd_priv *priv = netdev_priv(ndev);
> > > +   struct nct6694 *nct6694 = priv->nct6694;
> > > +   struct canfd_frame *cf = (struct canfd_frame *)skb->data;
> > > +   struct net_device_stats *stats = &ndev->stats;
> > > +   int can_idx = priv->can_idx;
> > > +   u32 txid = 0;
> > > +   int i;
> > > +   unsigned int echo_byte;
> > > +   u8 data_buf[REQUEST_CAN_CMD10_LEN] = {0};
> > > +
> > > +   if (can_dropped_invalid_skb(ndev, skb))
> > > +           return NETDEV_TX_OK;
> > > +
> > > +   /*
> > > +    * No check for NCT66794 because the TX bit is read-clear
> > > +    * and may be read-cleared by other function
> > > +    * Just check the result of tx command.
> > > +    */
> >
> > Where do you check the result of the TX command?
> >
> > > +   /* Check if the TX buffer is full */
> >
> > Where's the check if the TX buffer is full?
> >

Sorry for the missing code. It will be checked in tx_work().
If nct6694_write_msg() for CMD10 returns an error related to CAN_Deliver,
I will add error handling in the next patch.

> > > +   netif_stop_queue(ndev);
> > > +
> > > +   if (can_idx == 0)
> > > +           data_buf[CAN_TAG_IDX] = CAN_TAG_CAN0;
> > > +   else
> > > +           data_buf[CAN_TAG_IDX] = CAN_TAG_CAN1;
> > > +
> > > +   if (cf->can_id & CAN_EFF_FLAG) {
> > > +           txid = cf->can_id & CAN_EFF_MASK;
> > > +           /*
> > > +            * In case the Extended ID frame is transmitted, the
> > > +            * standard and extended part of the ID are swapped
> > > +            * in the register, so swap them back to send the
> > > +            * correct ID.
> > > +            */
> > > +           data_buf[CAN_FLAG_IDX] |= CAN_FLAG_EFF;
> > > +   } else {
> > > +           txid = cf->can_id & CAN_SFF_MASK;
> > > +   }
> > > +
> > > +   set_buf32(&data_buf[CAN_ID_IDX], txid);
> > > +
> > > +   data_buf[CAN_DLC_IDX] = cf->len;
> > > +
> > > +   if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) && can_is_canfd_skb(skb)) {
> > > +           data_buf[CAN_FLAG_IDX] |= CAN_FLAG_FD;
> > > +           if (cf->flags & CANFD_BRS)
> > > +                   data_buf[CAN_FLAG_IDX] |= CAN_FLAG_BRS;
> > > +   }
> > > +
> > > +   if (cf->can_id & CAN_RTR_FLAG)
> > > +           data_buf[CAN_FLAG_IDX] |= CAN_FLAG_RTR;
> > > +
> > > +   /* set data to buf */
> > > +   for (i = 0; i < cf->len; i++)
> > > +           data_buf[CAN_DATA_IDX + i] = *(u8 *)(cf->data + i);
> > > +
> > > +   can_put_echo_skb(skb, ndev, 0, 0);
> > > +
> > > +   memcpy(priv->data_buf, data_buf, REQUEST_CAN_CMD10_LEN);
> > > +   queue_work(nct6694->async_workqueue, &priv->tx_work);
> > > +
> > > +   stats->tx_bytes += cf->len;
> > > +   stats->tx_packets++;
> > > +   echo_byte = can_get_echo_skb(ndev, 0, NULL);
> > > +
> > > +   netif_wake_queue(ndev);
> >
> > How do you make sure that the tx_work has finished?
> > Once you wake the queue, the xmit function can be called again. If your
> > tx_work has not finished, you'll overwrite the priv->data_buf.
>
> Do you get a CAN TX complete message/IRQ from your device?
>

I will move the code that needs to confirm the completion of TX transmission
to tx_work().

In tx_work(), CMD2 CAN_Event's TX_EVT will first confirm TX_FIFO_EMPTY,
ensuring transmission is complete.


Best regards,
Ming

