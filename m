Return-Path: <linux-i2c+bounces-471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E07F9A76
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 08:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8DD71C2042B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 07:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAB9DF53;
	Mon, 27 Nov 2023 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFm27/He"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6358812F;
	Sun, 26 Nov 2023 23:05:04 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a02d12a2444so555255766b.3;
        Sun, 26 Nov 2023 23:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701068703; x=1701673503; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njKIqe2mNiRdX5LaAFqRQiCwPnpSDRZxDJdhCHqWXjY=;
        b=KFm27/HeZ/b7wqKHOFGTBZ8e7iHDHwJM9rf0n/IHFED/1pbnD0apQfIq1rAVm6tMtS
         fnXvbuS+7iCFXDy4vSZ85Hv7bN3B8y+OYDWUcnQ4aqoRQLBo3a7wTscQGDcXg8qHqovs
         IvadzjxQZu0S6qYMlZJ2flUrVrK0Az8RueP33cO73T1CkXkqeSet082MmEJqAgmXKHPk
         FSyCN5Jhk5DBnWF61Uydy5Ffv+VzrppzrxswLBaA/ajv4ndvKVTd2YS1KMkPP/Ga/Nld
         THZO+I0kHe1Kk2xT5z4QRsaSkvfZUJC4K1sraxwOpl7PELM3zaFVZloZCLdFHwmzY9T2
         RkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701068703; x=1701673503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njKIqe2mNiRdX5LaAFqRQiCwPnpSDRZxDJdhCHqWXjY=;
        b=ScOBy78w60cN6anybmCgct1ktnNLfI+9k5mLSyqKxqgEddBzqmqtHdwXafs/xUW1iM
         SSJqaMg5tjyEV4xRi7urzpgdrvuTgl0jG4AMmf49ZB+AHZnjFJt6nyHiKlhVFsoTceuj
         VAe0XPoVDAUohd65qimIcaQgaajL/hSA0ETfq03CDX+nC8IPbmjN5QcJcq/rF7e2Y8Iu
         5kYmcx3UmXYBboPSgZ2H57XTP42DL8akgEgr4KSGZSB3pR4YInZzEcOZvy2sqXTVT5aD
         Suo5syVvuiql6SufcsBZOB4i9b7eXP1VwvQ8YY/gXJRep7PImJhRP1oD3H09DXGI8stS
         94Sw==
X-Gm-Message-State: AOJu0YxxdmLbsjvBAc0JhcJC7CcjhW4vsjgylzihYeV50Qi+Sawi4Nlx
	qQGDnL01HU5YjI1qlJsjhpTHN1yllw+rTlcn6W/QO7CyptTdNg==
X-Google-Smtp-Source: AGHT+IGxqUO5X+l6WGxxe/nXpbFmqbv3pQHqKJ3PxzE2p4nS4DzebTb7Js9cjbYVIzm9Dcn6VgNxA/Er0b8cuJFP/4s=
X-Received: by 2002:a17:906:66c1:b0:9ff:77c2:e67f with SMTP id
 k1-20020a17090666c100b009ff77c2e67fmr7216953ejp.33.1701068702634; Sun, 26 Nov
 2023 23:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120091746.2866232-1-chou.cosmo@gmail.com> <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
In-Reply-To: <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Mon, 27 Nov 2023 15:04:51 +0800
Message-ID: <CAOeEDyumVdi-3O3apMUFJ695V3YcZqZQ7wvzYL2YfU88XJ3Dxw@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in SLAVE_READ_PROCESSED
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au, 
	andi.shyti@kernel.org, linux@roeck-us.net, wsa@kernel.org, 
	jae.hyun.yoo@linux.intel.com, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"

Andrew Jeffery <andrew@codeconstruct.com.au> wrote on Mon, 2023-11-27
at 11:23 AM:
>
> On Mon, 2023-11-20 at 17:17 +0800, Cosmo Chou wrote:
> > commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
> > in interrupt handler") moved most interrupt acknowledgments to the
> > start of the interrupt handler to avoid race conditions. However,
> > slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
> > is handled.
> >
> > Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
> > the problem that the next byte is not sent correctly.
>
> What does this mean in practice? Can you provide more details? It
> sounds like you've seen concrete problems and it would be nice to
> capture what it was that occurred.
>
> Andrew

For a normal slave transaction, a master attempts to read out N bytes
from BMC: (BMC addr: 0x20)
[S] [21] [A] [1st_B] [1_ack] [2nd_B] [2_ack] ... [Nth_B] [N] [P]

T1: when [21] [A]: Both INTR_SLAVE_MATCH and INTR_RX_DONE rise,
INTR_RX_DONE is not cleared until BMC is ready to send the 1st_B:
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-aspeed.c#L294
That is, BMC stretches the SCL until ready to send the 1st_B.

T2: when [1_ack]: INTR_TX_ACK rises, but it's cleared at the start of
the ISR, so that BMC does not stretch the SCL, the master continues
to read 2nd_B before BMC is ready to send the 2nd_B.

To fix this, do not clear INTR_TX_ACK until BMC is ready to send data:
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-aspeed.c#L302

Cosmo

