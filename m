Return-Path: <linux-i2c+bounces-8698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D639FABCF
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 10:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DF4C1884A0C
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 09:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A421922E6;
	Mon, 23 Dec 2024 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT4PRoe3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D41118950A;
	Mon, 23 Dec 2024 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734944653; cv=none; b=HII0dfkku5i169n12RgIBu0U+eDr+CXdF3A6rylOyXxeimti7mBi5ILsLVeAcYcHlJK+EoRM8ZY5AvIBC8fuPzIaijB3rmFQNZqR3+6fLyQ6xZd4xG1uGrZ1NkBL5GkR6KxKs8Lc3La/ltIZ8E+2I/SEFk/ihdbwzB80tloBRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734944653; c=relaxed/simple;
	bh=O8wD3Um4Rq87PZuK0ffEziOikVzIFxJc41GKBYfZ2lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yee6UFVpYa9CXhHxH1MRFLfdWVdMOcT5ZHfRDURy6KeJhRorqQro4lHS+PYQMgmLHlwLbU07Rf1qvCT+TG6ISwgi3HfpX5TrZvtHkv1DXiV3rR3YduEFim4OUxNSZD8b19T5ToZ9nGONzDsL59lF2OT8/L6Byl6X32DlRApC+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT4PRoe3; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f14626c5d3so29760707b3.3;
        Mon, 23 Dec 2024 01:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734944650; x=1735549450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EOCdczfcwfJolwdEhCyR3CLTmdjr+EsD/xGAKqAgJ1M=;
        b=JT4PRoe3fB4sNS4YBjs+8/7OPTkgVB/EOz7PlqoWUJHgYdJQePxsw67lJbWiDXYDcg
         2tZhoN5xyBmWS3F1wblp7maQmIUxjXVz2s8qxwCHwu9f8PEeqhgDUsEqWJJcMUJVFKLq
         cpC9L3DhFkqNc++Ck9m04Y2NpbbK7QvudbRxIuXsGGVJuWOXHpAffWb+NrS9BZVGeqN+
         oW+Y9XtITr9ko7LIoFDVImYW57evIbbCJJjebFSapEjb7oewEMVQ3fjtecOSdsnMqRFt
         dn0k4HcUAkhX+rq+cN/aC9J92MbUZh6+KdzR1/Dbt8bE6/JyuTYXmYKrLZPRC2Z55eAs
         ZnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734944650; x=1735549450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOCdczfcwfJolwdEhCyR3CLTmdjr+EsD/xGAKqAgJ1M=;
        b=Cs8i7dTpgknMuVeGn26fK3uAVvSgoqs39blAykhA5fYFBQMenrWTD+R0LI/gHNta+T
         AGN1U15+FLaREeE1A4jxTXIbgFxxK9zQa8qQI8FfquZzVMGu1liOKZ79x7jOH0JTl2Pf
         cHeCROGHceyK+dta/xny4ccUWmTQL39mVOHffEpp7rnwROM0sADwBRHPjCYKyPtYf0j6
         AuEB429ebQ2RjgN9H8UsplCsnlt8UKLa3wiMALt+bdEG/Ww3rLtOxYGuQ++tJASH717F
         VBxKGq2g3GyOzOAm4gF5m32hukFvjrQvKHnPc6VtJ2SmhCZdKCFOPNdhWuRYEyXWJaMG
         2DPw==
X-Forwarded-Encrypted: i=1; AJvYcCVW21ezjtsCMWaeUWOFIZaCf9pIySl6bokKfOO5K+w5GaEgOeRRtMNaVE0csMwWIrNCXN8n1UZTx4a6w/P0oqc=@vger.kernel.org, AJvYcCVr17Q6K485o1FTpTkMn+7yAxdHFDFLB2SMfDX3BnFQCZ6t3W9i9m9qQ9hLEtkA3fHH0demf9Zzp8Y=@vger.kernel.org, AJvYcCWNIDL1Or4FpQYJA9PLVacVj7EAJ+jvHR5tf5VfLrc9PYlatFe2Zhwspsw0rFzbU5aLzu9a5vUD@vger.kernel.org, AJvYcCWefqVck0XzNDm2Y401HsAuqLk2sRw0HVF64QpdN5KN1JPo31tbj7MzpkUz/4fcTajrPYK68Vh2UhsO@vger.kernel.org, AJvYcCWzsDG0qKQz9IHLxgBWfDacQ2XHx5b+pKifLsmcEOx/Ln5FS/Gr5b+lxLx1HcVfyjSP+KhybyekxRme8Ocl@vger.kernel.org, AJvYcCX6ErLCpJ7n51tv1GYOzhaoZEYOaDsMT1fEDbkaZdg3QH6TpyLC2jllCnzLuTzAOmL6JSm5VsSTMT4b@vger.kernel.org, AJvYcCXT8ckoClgjOdgAFTwluENnA2EMPz21UpTX+nE9qoMip+LzRa1uHNCrqkwt31dpjyjxyiYbTR3KvThnwQ==@vger.kernel.org, AJvYcCXYy7Zik8dv/SKIeEAJz6MNILPVT2WJZJIExzef99kHbHktdyoQ1QtkHECW416949gufuaQO1vyz3FG18c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlYDNYefFvxMLgFWCbGqQ2ZqBuxzDq7W7QDk14vmh9BP360qpq
	SzNisZw9uDD1XTR9llRAYjrVm1GNGN8g67XrzvEe2APmn8aLIcIP6O2xtspu/2uzUUDa7Xx64GN
	M2PCbc97HSRcMtZTqIn+EN56NcoQ=
X-Gm-Gg: ASbGncvEzLBBRucU/cCFgpSC0SVWoI/xjVyetQ5Vs69A0EFqOCMoSOGXzMTO7Jik7F7
	wkVfP/2W9auCyuMc8I4PCTZapT4AjC6V4tENS
X-Google-Smtp-Source: AGHT+IH1fXad8EYFQA3WsDzmPg95cKrz6BrK2rvk0KyyoplTQma9CQVJLaWIzpfvkl9CDADHkPTuV/FAXZOpGY2ZGl4=
X-Received: by 2002:a05:690c:6213:b0:6f2:773b:dfab with SMTP id
 00721157ae682-6f3f81474d8mr92637987b3.22.1734944650429; Mon, 23 Dec 2024
 01:04:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-5-tmyu0@nuvoton.com>
 <20241211-taupe-leech-of-respect-4c325a-mkl@pengutronix.de> <CAOoeyxUj8EBWNr0Pi8O3+Tua=gBRWRmQQe4WbwwE=gq3CGO+4w@mail.gmail.com>
In-Reply-To: <CAOoeyxUj8EBWNr0Pi8O3+Tua=gBRWRmQQe4WbwwE=gq3CGO+4w@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 23 Dec 2024 17:03:59 +0800
Message-ID: <CAOoeyxWOD8=zosrHzhamG6RfFW=MzxEAa1hYXe1zXD1kBLkgrA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] can: Add Nuvoton NCT6694 CAN support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

> > > +struct nct6694_can_priv {
> > > +     struct can_priv can;    /* must be the first member */
> > > +     struct net_device *ndev;
> > > +     struct nct6694 *nct6694;
> > > +     struct mutex lock;
> >
> > What does lock protect?
> >
>
> The lock is used to protect tx_buf and rx_buf for each CAN device.
>
> > > +     struct sk_buff *tx_skb;
> > > +     struct workqueue_struct *wq;
> > > +     struct work_struct tx_work;
> > > +     unsigned char *tx_buf;
> > void *
> > > +     unsigned char *rx_buf;
> > void *
> > > +     unsigned char can_idx;
> > > +     bool tx_busy;
> >
> > IMHO it makes no sense to have tx_skb and tx_busy
> >
>
> Okay! I will revisit these to evaluate whether they are still necessary.
>
> > > +};
> > > +

I think there needs to be a tx_skb to record the skb passed by
start_xmit(), otherwise it can't handle the can_frame in tx_work. If
this is not necessary, could you please explain?
In addition, the tx flow is based on the implementation in
https://elixir.bootlin.com/linux/v6.12.6/source/drivers/net/can/spi/mcp251x.c

Thanks,
Ming

