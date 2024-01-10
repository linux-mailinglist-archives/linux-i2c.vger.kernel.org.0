Return-Path: <linux-i2c+bounces-1253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A33982963A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 10:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FDFF1C218EB
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 09:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867BB3E472;
	Wed, 10 Jan 2024 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="l5z728/b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67020210B;
	Wed, 10 Jan 2024 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [46.242.8.170])
	by mail.ispras.ru (Postfix) with ESMTPSA id 51F7740F1DF6;
	Wed, 10 Jan 2024 09:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 51F7740F1DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1704878610;
	bh=fnpR3T7RIMq+i4kpDaWxriwBNNBqwi1jzsXS3sBDB88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5z728/bshdC1sRpZN1hz4gEfTbYS7CO8lJ873fFixp9AMKe7b72BtugFEPL36z9j
	 A66zPVLlEeEqdi2cfWVXm0QUZFojFg5OkdXVvvG1sajPNfpn+JPYlZzMiNylB3JGiv
	 eAbqv1A1QN15kY159O/C16PKpVk3pacaFS5fsfgc=
Date: Wed, 10 Jan 2024 12:23:30 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Tali Perry <tali.perry1@gmail.com>
Cc: Rand Deeb <rand.sec96@gmail.com>, lvc-project@linuxtesting.org, 
	voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, 
	Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Nancy Yuen <yuenn@google.com>, linux-i2c@vger.kernel.org, 
	deeb.rand@confident.ru, Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference in
 npcm_i2c_reg_slave
Message-ID: <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru>
References: <20240109145121.8850-1-rand.sec96@gmail.com>
 <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>

On 24/01/10 10:43AM, Tali Perry wrote:
> On Tue, Jan 9, 2024 at 4:52 PM Rand Deeb <rand.sec96@gmail.com> wrote:
> >
> > In the npcm_i2c_reg_slave function, a potential NULL pointer dereference
> > issue occurs when 'client' is NULL. This patch adds a proper NULL check for
> > 'client' at the beginning of the function to prevent undefined behavior.
> >
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > index c1b679737240..cfabfb50211d 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1243,13 +1243,14 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
> >  static int npcm_i2c_reg_slave(struct i2c_client *client)
> >  {
> >         unsigned long lock_flags;
> > -       struct npcm_i2c *bus = i2c_get_adapdata(client->adapter);
> > -
> > -       bus->slave = client;
> > +       struct npcm_i2c *bus;
> >
> > -       if (!bus->slave)
> > +       if (!client)
> >                 return -EINVAL;
> >
> > +       bus = i2c_get_adapdata(client->adapter);
> > +       bus->slave = client;
> > +
> >         if (client->flags & I2C_CLIENT_TEN)
> >                 return -EAFNOSUPPORT;
> >
> > --
> > 2.34.1
> >
> 
> 
> Thanks for the patch!
> 
> Reviewed-by:tali.perry1@gmail.com

If I'm not missing something, npcm_i2c_reg_slave() is called via a
function pointer ->reg_slave here [1]. And seems `client` can't be NULL
there. Other drivers implementing ->reg_slave function don't check its
argument.

Maybe we should just drop `if (!bus->slave)` check?

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-slave.c#L48

