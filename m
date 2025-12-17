Return-Path: <linux-i2c+bounces-14633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A623CC9763
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 21:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64C2F3022F11
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 20:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4F72FDC5E;
	Wed, 17 Dec 2025 20:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2uLDuH3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EDD28DB76
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 20:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766002307; cv=none; b=akz8/LQ4lyAq36gi4bJb1rFxK+GMyH7Akzn43uJzSD8/jdhhnxhnMDag/KsJrr0hiIaRzJa3hyPsOwIjZVThk7Z49wmAKl9M+uPiyCOOzi7Ai9K53s3PfUVemYMrMHAjyPaKu8eg4rUgflzuuff2pkw/I9WIZR7jXSe9j+A2TRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766002307; c=relaxed/simple;
	bh=1wqbLrmTsqabNBh3vicn4GMNQDBBlE5lOizlvcD0qhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9lLwmtmVxaryy8DaD9H2/XjGZ3CANnpoyls3nZCS9VZ7WSFsdwVl0iik5Wa2wj4bL7m0TBK7B38RazKKE7vmvZrq7r2CZcETHOmBlccWHIgRtfuuNcLIr59w1Vo5QPX7hRdGyhJoCPOhQiQEOtZe8SavlwrsJvwmEu8rtP12Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2uLDuH3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6498850d3f6so7955747a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 12:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766002304; x=1766607104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjMTRFXSIIwwu0CfvU8Gn+sD387060ylgnfIqVwMb2A=;
        b=U2uLDuH3zz/3Qef/1pTYJa9uAP7VWWNXBsgxnV8Zoruh5+jRcdYYS7JRuEEBHYAmc4
         umCsaGIySRD/w2U42ZAx4PzbusxAzbM6+9aKtQgUlltV+UHk7G/Oe4BJG8pMDYZ9SbiB
         mGHW1Qgm1310fGaJIDA54mU76hIXg7sXwCjeRc9mqzU2LDl0daYxzSlSlV14E1k5+V9a
         3emTWpmQfGwA+X185fwfUz002B3nc0TgwioKbO/hSjXxEIibNTzeJLDfmkq0G+PuyIya
         9heQ0fTs+QKFiwHzIGpUUdCPoJ3EyUs7FOhSN8hS+Md+tjb2pyy+B+DjrJgqeX6QSOVu
         O8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766002304; x=1766607104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CjMTRFXSIIwwu0CfvU8Gn+sD387060ylgnfIqVwMb2A=;
        b=cFpDAK7jXZM6nkld8hMStFFJnLIi5BysvKPQUeiFmcorN5mNuoCyC9cilHVkUlf/++
         WjUJLnJXNvtMAC1djVu87TQTaYOZQJ+KiGTgpU57aUePG/VTYlpcH30VxfLTZA6S4WjA
         eFW2pZFVY2k+uUSJ/ykC+oQRXY5LlvG7aiwkJRRvK9TrTQRVUOMTQgSt0oASRRcQxPLW
         AKmp1NEtLAICH9jLBKmaja8Go6fdgUQqeTPV8MHXJfuSY38DQaWOYO/pxmZ12jl/Qz0J
         M1ZaB9mBqdeKGDZ/mP1ydD+W2JEvTIJPSEKoAs/PS750MUCLg95zkV9O/nnwjzyF4naE
         WPbA==
X-Gm-Message-State: AOJu0YxCrSVQ/WqjJs2IOOGEW9TsPmj0OrPkvnyjPlrkkHHmXQX4v/e/
	G3nQVJ18tNPM5PhqV/1afgw5DQbwyngnjSjRgtaDDN6Lw94FJBMKFA37h844njmmMb+7heg5jDp
	1Kx0Xze3HEMrg2uH5cLf9Jtpl5fQDass=
X-Gm-Gg: AY/fxX5pvlEIpexm1yd/e32X6Y8gxcHViwRB5yuKeZd11on70x2CQ2rf9UXyN6CeG07
	LmLzZRxvKf93nsa90dVAcNrUOAYMsoREP5BSrFFTO6oac2N1S8M0mV7x5Nx4s6h4ziKSyBs+CiC
	jwFaPueuV+4F3wE2T+TZQN3Y3JpJtsIk3qNb1rGKc4SM2lVyCu6NYW74h83Mc8yy73RBieN4jHg
	0j7dSJrWKGt0heitLpqWN6fwGt6u0UFbkyh6c5wnFWIKoda+zvpHnwrV+k8Dazc1A522RTku3m2
	QunAUMXf
X-Google-Smtp-Source: AGHT+IHo8p3aJC8H2lJqwNXZrwCesauwRST/cl6nQuObKpl7dr5JAOOMHwAP1daH7lSvbZjZKoimQS5u37D/VsUd9Ko=
X-Received: by 2002:a05:6402:40ce:b0:64b:4624:779c with SMTP id
 4fb4d7f45d1cf-64b462479e3mr2125449a12.26.1766002303779; Wed, 17 Dec 2025
 12:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217063027.37987-1-rosenp@gmail.com> <20251217063027.37987-3-rosenp@gmail.com>
 <e3276f37-a7e0-46f5-8f64-fa9e5919b5d8@alliedtelesis.co.nz>
In-Reply-To: <e3276f37-a7e0-46f5-8f64-fa9e5919b5d8@alliedtelesis.co.nz>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 17 Dec 2025 12:11:32 -0800
X-Gm-Features: AQt7F2oLiQIz2msKPEv9cFRF4CDRJPOAb79TxK9KZHVPiTP-z27580ditzAYkgQ
Message-ID: <CAKxU2N_Z_HdHCtcG3B7i0zEn-XPnb+-LTuFL3nG=nt0k8O6DxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: rtl9300: use of instead of fwnode
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 11:43=E2=80=AFAM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
> Hi Rosen,
>
> On 17/12/2025 19:30, Rosen Penev wrote:
> > Avoids having to use to_of_node and just assign directly. This is an OF
> > only driver anyway.
> >
> > Use _scoped for the for each loop to avoid refcount leaks.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> I thought the trend was to move to the more generic device properties
> rather than using of_ specific APIs which is why I wrote the driver
> using them. I agree that this driver is unlikely to be used on any
> platform that doesn't use a device tree so if Andi is happy with this
> I'm fine with the change.
I've gotten the opposite advice on netdev before.
>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> > ---
> >   drivers/i2c/busses/i2c-rtl9300.c | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-=
rtl9300.c
> > index f2aa341a7cdd..672cb978066d 100644
> > --- a/drivers/i2c/busses/i2c-rtl9300.c
> > +++ b/drivers/i2c/busses/i2c-rtl9300.c
> > @@ -371,7 +371,6 @@ static int rtl9300_i2c_probe(struct platform_device=
 *pdev)
> >   {
> >       struct device *dev =3D &pdev->dev;
> >       struct rtl9300_i2c *i2c;
> > -     struct fwnode_handle *child;
> >       const struct rtl9300_i2c_drv_data *drv_data;
> >       struct reg_field fields[F_NUM_FIELDS];
> >       u32 clock_freq, scl_num, sda_num;
> > @@ -415,15 +414,15 @@ static int rtl9300_i2c_probe(struct platform_devi=
ce *pdev)
> >               return ret;
> >
> >       i =3D 0;
> > -     device_for_each_child_node(dev, child) {
> > +     for_each_child_of_node_scoped(dev->of_node, child) {
> >               struct rtl9300_i2c_chan *chan =3D &i2c->chans[i];
> >               struct i2c_adapter *adap =3D &chan->adap;
> >
> > -             ret =3D fwnode_property_read_u32(child, "reg", &sda_num);
> > +             ret =3D of_property_read_u32(child, "reg", &sda_num);
> >               if (ret)
> >                       return ret;
> >
> > -             ret =3D fwnode_property_read_u32(child, "clock-frequency"=
, &clock_freq);
> > +             ret =3D of_property_read_u32(child, "clock-frequency", &c=
lock_freq);
> >               if (ret)
> >                       clock_freq =3D I2C_MAX_STANDARD_MODE_FREQ;
> >
> > @@ -449,7 +448,7 @@ static int rtl9300_i2c_probe(struct platform_device=
 *pdev)
> >               adap->retries =3D 3;
> >               adap->dev.parent =3D dev;
> >               i2c_set_adapdata(adap, chan);
> > -             adap->dev.of_node =3D to_of_node(child);
> > +             adap->dev.of_node =3D child;
> >               snprintf(adap->name, sizeof(adap->name), "%s SDA%d\n", de=
v_name(dev), sda_num);
> >               i++;
> >

