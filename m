Return-Path: <linux-i2c+bounces-484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ACB7FAE21
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 00:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 404F21C20BDB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 23:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5B148CF4;
	Mon, 27 Nov 2023 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GcF5S01D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B47019D;
	Mon, 27 Nov 2023 15:00:12 -0800 (PST)
Received: from [192.168.68.112] (ppp118-210-131-38.adl-adc-lon-bras33.tpg.internode.on.net [118.210.131.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DC2FB200EF;
	Tue, 28 Nov 2023 07:00:02 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701126006;
	bh=jeaVBZ61hYUULmiG4P1ndu1Q2m319cZm4MzoynyxVlQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GcF5S01D0K9OrzUP0huZxWEqVkzKv+ALVQNJLjU286ml3+TWPtHI2Zc8t6o8wULQk
	 KqmZkOUx0cGc5393b6urtjElVwWj3lGCg4obKPoov+MkKuHgNZZMKJV/ofccGs7cFX
	 RFwEHtRS1QEG1fEyjt7aZe/h33NCJjvIcqSNRTRoHy2/N4rEquFYON9Y1iqm0rzJEv
	 C5nfRoagxZnIgxEWBCdb1IL9THFhXkg6oGh70riVnXa5jPtyduaH/9GenlWyUlxYKi
	 kIKcmX/4E5/YnNDHVydkF6JAVm+AICdzgHsd4IY2w2/68iom6sRDaqwziTv7BzQsrw
	 JBe2POQtO3KnA==
Message-ID: <d0773df55a6fe8a5c9b1a3d7c8dd2e1343643272.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in
 SLAVE_READ_PROCESSED
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Cosmo Chou
 <chou.cosmo@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, jae.hyun.yoo@linux.intel.com, 
 andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org,  linux-kernel@vger.kernel.org, wsa@kernel.org,
 brendan.higgins@linux.dev,  cosmo.chou@quantatw.com, joel@jms.id.au,
 linux@roeck-us.net,  linux-i2c@vger.kernel.org
Date: Tue, 28 Nov 2023 09:30:01 +1030
In-Reply-To: <854762fb-1767-4208-a7fc-10580730c1f3@os.amperecomputing.com>
References: <20231120091746.2866232-1-chou.cosmo@gmail.com>
	 <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
	 <CAOeEDyumVdi-3O3apMUFJ695V3YcZqZQ7wvzYL2YfU88XJ3Dxw@mail.gmail.com>
	 <854762fb-1767-4208-a7fc-10580730c1f3@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-11-27 at 15:08 +0700, Quan Nguyen wrote:
>=20
> On 27/11/2023 14:04, Cosmo Chou wrote:
> > Andrew Jeffery <andrew@codeconstruct.com.au> wrote on Mon, 2023-11-27
> > at 11:23 AM:
> > >=20
> > > On Mon, 2023-11-20 at 17:17 +0800, Cosmo Chou wrote:
> > > > commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts earl=
y
> > > > in interrupt handler") moved most interrupt acknowledgments to the
> > > > start of the interrupt handler to avoid race conditions. However,
> > > > slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSE=
D
> > > > is handled.
> > > >=20
> > > > Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fi=
x
> > > > the problem that the next byte is not sent correctly.
> > >=20
> > > What does this mean in practice? Can you provide more details? It
> > > sounds like you've seen concrete problems and it would be nice to
> > > capture what it was that occurred.
> > >=20
> > > Andrew
> >=20
> > For a normal slave transaction, a master attempts to read out N bytes
> > from BMC: (BMC addr: 0x20)
> > [S] [21] [A] [1st_B] [1_ack] [2nd_B] [2_ack] ... [Nth_B] [N] [P]
> >=20
> > T1: when [21] [A]: Both INTR_SLAVE_MATCH and INTR_RX_DONE rise,
> > INTR_RX_DONE is not cleared until BMC is ready to send the 1st_B:
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-as=
peed.c#L294
> > That is, BMC stretches the SCL until ready to send the 1st_B.
> >=20
> > T2: when [1_ack]: INTR_TX_ACK rises, but it's cleared at the start of
> > the ISR, so that BMC does not stretch the SCL, the master continues
> > to read 2nd_B before BMC is ready to send the 2nd_B.
> >=20
> > To fix this, do not clear INTR_TX_ACK until BMC is ready to send data:
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-as=
peed.c#L302
> >=20
>=20
> This looks like the same issue, but we chose to ack them late. Same with=
=20
> INTR_RX_DONE.
>=20
> https://lore.kernel.org/all/20210616031046.2317-3-quan@os.amperecomputing=
.com/

From a brief inspection I prefer the descriptions in your series Quan.
Looks like we dropped the ball a bit there though on the review - can
you resend your series based on 6.7-rc1 or so and Cc Cosmo?

Cheers,

Andrew

