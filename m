Return-Path: <linux-i2c+bounces-13664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A0DBEFFD6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 10:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A950A4E92D6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 08:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D792EBBB4;
	Mon, 20 Oct 2025 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AJcLGXnz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EAE2EC0A0
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949443; cv=pass; b=erHCGEU2K729hzASjjpB65r0j7bvDWWLKpaiNTP7ew7yfTFAYZS1vHzCVECvk4xYDVIJeACSYY+E9KdJEy1zCbveFZmOtyJurCv+rZJUbh6b5ky/i7F+vj9kvvxaxkJc+2T79p/q6SF9UZGLroWuNZ/20dczIcYXv7kMECr1ntA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949443; c=relaxed/simple;
	bh=hiN3AVIwQ7ASrylksDJkYWnhjnlcFgbG0cResmPOMqA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JAfQZeHfceA5sdcegrPNdZori33O15e5O3mD4Lz7ww7vTKK0vzIgs0ijZKnW6f4G3eoBiezd+AL3NyWE2dN6oRsd2QxXpf3ZLLBKwj4Fng1wUhZ76uKwVEz8UB3ZxfURG9RIQUeAaefeMTKQ579rqzByrfQzjw1X9MtBVVbmxW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AJcLGXnz; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=bTJve/afpJuaKd7XKA6kkj7fLwHslT2EeDKl1982FAY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760949430;
 b=Fjmz3WNUAPqJpl4AnCvktscs37+niv8JTlsqQjdgMum9gLIsYcI+hW8gDFtns6/vofU/Ncir
 z6vl0TChAR9mHuUwMfHLLD/UiMuoNqj+prfjRHYOKuaMdKK3gA5aeL6JQFlzAmOvWA8ZPwQdKdb
 TK5/a2cpDX07leKkQ2tDOu4xMa4T/JjUgIpMHqJklzdVF0msAPhNod2D8PCuT0ow0LpY+SqWl/x
 KGyhyqeGfO9Li8TFDlTh5J18rnR4qVoboXHR38Ri7L0mtc42+Ce+JpWbLL9cIOu8w0dw3NBK0Yz
 2yvgkrvxA3OzVuQ1xq2+2yCAxVsFUSuV+TQVzTZHRVRkw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760949430;
 b=TLEh6jGpFU0Atnoavdkn9x5oAIARBZD27zZOvdBF5BqJ9pu5x4dQ1kJMrjZ9RrQtX5wsmpCR
 0sudl86E6d+g9irCABs8OBG7ASpQXPiWa7mrkAprTwAiLjDSU5gj3xAozuJEe4E/FM+Kvl7FYtA
 QN8fGJN+l73XMQoR1uLuhm5GK5ZJxyxzyjxmFIJCi1wj4nxRntYo5UAvf6mmvRO0S7EUQX59QSA
 5mGxnnEfFvJbWo26IwqJYLExGTees8BQzUi1hxaJvYa56GM7KjG+0ukly/Ih8rwr+xf888D7Krc
 KeKmLnFzWskMplbFVnt9NfY+oPOnwzKW5eD5B6ERx8OGA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Mon, 20 Oct 2025 10:37:10 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 75D825A0C52;
	Mon, 20 Oct 2025 10:37:01 +0200 (CEST)
Message-ID: <9a438ecd4ac48d9546d76058e615419bb0942b42.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/4] i2c: machxo2: new driver
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lee Jones <lee@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Date: Mon, 20 Oct 2025 10:37:00 +0200
In-Reply-To: <wsbevkqszimjkww3qihxbghtw3yaxaooagwrgv2prhldeutybh@vh5nmdx5hiha>
References: 
	<5855f15ad83617d3a71b40d89d61273722c6e15f.1760601899.git.matthias.schiffer@ew.tq-group.com>
	 <wsbevkqszimjkww3qihxbghtw3yaxaooagwrgv2prhldeutybh@vh5nmdx5hiha>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:linux-i2c@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4cqpgx6gXKz1kNh4D
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:5ba4ae6453ff635a7b9006afcfd7c665
X-cloud-security:scantime:2.075
DKIM-Signature: a=rsa-sha256;
 bh=bTJve/afpJuaKd7XKA6kkj7fLwHslT2EeDKl1982FAY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760949430; v=1;
 b=AJcLGXnzq0DfAqt2wiLHRaxOvPjXLzlrwXqJSKqb1Xao450K+jB6bvIn/1EmJ6OMEhfC/YQs
 zPSaeVeDjHTKNAPJscEzKsqpExedh6NeRo1tq94zKcfjhiRTuP/QlDZTzks06VoWYoWUZsvcPOA
 f0nBP/NSlWA6JWtvmAI6+gbHBNJG0oSrpMfcX964npMqOmfTXDk9U49fGeKgAcoTD9/XHdScnAi
 XHxfeS83of/W1aHv/DxZYOeNi/Jy6kFmZL+Iv61ttNWGUb/uzywyQka1sGrtIlhyKH+oPjrv3/8
 AN0JTJCLVDR0C8JMp4kpORWhlaaTDuwSbHwvHzi9KXHFA==

On Sat, 2025-10-18 at 01:24 +0200, Andi Shyti wrote:
> Hi Matthias,
>=20
> ...
>=20
> > +enum machxo2_i2c_state {
> > +	STATE_DONE,
> > +	STATE_START,
> > +	STATE_WRITE,
> > +	STATE_READ_WAIT_SRW,
> > +	STATE_READ,
>=20
> Can you please use a prefix for these enums?
>=20
> > +};
>=20
> ...
>=20
> > +/* Registers */
> > +#define I2C_CR			0 /* Control, RW */
> > +#define  I2C_CR_I2CEN		0x80 /* Enable I2C */
> > +
> > +#define I2C_CMDR		1 /* Command, RW */
> > +#define  I2C_CMDR_STA		0x80 /* Start */
> > +#define  I2C_CMDR_STO		0x40 /* Stop */
> > +#define  I2C_CMDR_RD		0x20 /* Read */
> > +#define  I2C_CMDR_WR		0x10 /* Write */
> > +#define  I2C_CMDR_ACK		0x08 /* Send NACK if the bit is set */
> > +#define  I2C_CMDR_CKSDIS	0x04 /* Clock stretch disable */
> > +
> > +#define I2C_BR0			2 /* Clock Pre-scale, RW */
> > +#define I2C_BR1			3 /* Clock Pre-scale, RW */
> > +#define I2C_TXDR		4 /* Transmit Data, WO */
> > +#define I2C_SR			5 /* Status, RO */
> > +#define  I2C_SR_TIP		0x80 /* Transmit In Progress */
> > +#define  I2C_SR_BUSY		0x40 /* Bus Busy */
> > +#define  I2C_SR_RARC		0x20 /* Received ACK (if unset) */
> > +#define  I2C_SR_SRW		0x10 /* Slave Read/Write */
> > +#define  I2C_SR_ARBL		0x08 /* Arbitration Lost */
> > +#define  I2C_SR_TRRDY		0x04 /* Transmitter/Receiver Ready */
> > +#define  I2C_SR_TROE		0x02 /* Transmitter/Receiver Overrun Error */
> > +#define  I2C_SR_HGC		0x01 /* Hardware General Call Received */
> > +#define I2C_RXDR		7 /* Receive Data, RO */
> > +#define I2C_IRQ			8 /* IRQ, RW */
> > +#define I2C_IRQEN		9 /* IRQ Enable, RW */
> > +#define  I2C_IRQ_ARBL		0x08 /* Arbitration Lost */
> > +#define  I2C_IRQ_TRRDY		0x04 /* Transmitter/Receiver Ready */
> > +#define  I2C_IRQ_TROE		0x02 /* Transmitter/Receiver Overrun Error */
> > +#define  I2C_IRQ_HGC		0x01 /* Hardware General Call Received */
> > +#define  I2C_IRQ_MASK		(I2C_IRQ_ARBL | I2C_IRQ_TRRDY | I2C_IRQ_TROE)
>=20
> Can you please use a prefix for all these defines?
>=20
> ...
>=20
> > +/* Delay by a number of SCL cycles */
> > +static inline void machxo2_delay(const struct machxo2_i2c *i2c,
> > +				 unsigned int cycles)
> > +{
> > +	udelay(machxo2_cycles_to_usecs(i2c, cycles));
>=20
> can we use fsleep here?

Outside of machxo2_recover, this is only run from the hrtimer handler, whic=
h is
softirq context, right? In any case, the MachXO2 I2C controller has some
unfortunate timing-related fragility, so waiting longer than expected could=
 be
bad.

Switching to fsleep just for machxo2_recover would be an option, which is a=
lso
the only place where a machxo2_delay() with cycles > 2 happens.

>=20
> > +}
>=20
> ...
>=20
> > +static enum machxo2_i2c_state
> > +machxo2_write(struct machxo2_i2c *i2c, u8 stat)
> > +{
> > +	struct i2c_msg *msg =3D i2c->msg;
> > +
> > +	if (stat & I2C_SR_TRRDY) {
>=20
> if you do
>=20
> 	if (!(stat & I2C_SR_TRRDY))
> 		return STATE_WRITE;
>=20
> you can save a level of indentation.
>=20
> > +		bool eom =3D (i2c->pos =3D=3D msg->len);
> > +
> > +		if (eom) {
> > +			machxo2_delay(i2c, 1);
> > +			stat =3D machxo2_get(i2c, I2C_SR);
> > +		}
> > +
> > +		if ((i2c->pos > 0 || eom) && (stat & I2C_SR_RARC)) {
> > +			dev_dbg(&i2c->adap.dev, "No ACK at %d\n", i2c->pos);
> > +			return machxo2_error(i2c, -ENXIO);
> > +		}
> > +
> > +		if (eom)
> > +			return machxo2_end_of_message(i2c);
> > +
> > +		machxo2_set(i2c, I2C_TXDR, msg->buf[i2c->pos++]);
> > +		machxo2_set(i2c, I2C_CMDR, I2C_CMDR_WR);
> > +
> > +		machxo2_reset_timer_wait(i2c);
> > +	}
> > +
> > +	return STATE_WRITE;
> > +}
>=20
> ...
>=20
> > +static irqreturn_t machxo2_isr(int irq, void *dev_id)
> > +{
> > +	struct machxo2_i2c *i2c =3D dev_id;
> > +	u8 irq_stat =3D machxo2_get(i2c, I2C_IRQ);
> > +
> > +	if (!(irq_stat & I2C_IRQ_MASK))
> > +		return IRQ_NONE;
> > +
> > +	/*
> > +	 * Due to a race condition in the I2C controller, no edge on the IRQ
> > +	 * line may be generated if an event comes in right at the moment whe=
n
> > +	 * the IRQs are cleared. Loop to ensure that IRQs are actually cleare=
d.
> > +	 */
> > +	do {
> > +		machxo2_set(i2c, I2C_IRQ, I2C_IRQ_MASK);
> > +		irq_stat =3D machxo2_get(i2c, I2C_IRQ);
> > +	} while (irq_stat & I2C_IRQ_MASK);
> > +
> > +	spin_lock(&i2c->lock);
> > +	hrtimer_start(&i2c->timer, 0, HRTIMER_MODE_REL);
> > +	spin_unlock(&i2c->lock);
>=20
> why do we need spin_locks here?

This prevents a race against the following code in machxo2_restart_timer():

	if (!hrtimer_is_queued(&i2c->timer))
		hrtimer_forward_now(&i2c->timer, i2c->timer_wait);

We do not want to hrtimer_forward_now() if the timer is already queued, so =
we
never lengthen the time until the next expiry.


>=20
> > +	return IRQ_HANDLED;
> > +}
>=20
> ...
>=20
> > +static int machxo2_init(struct machxo2_i2c *i2c)
> > +{
> > +	unsigned int prescale;
> > +
> > +	/* Make sure the device is disabled */
> > +	machxo2_set(i2c, I2C_CR, 0);
> > +
> > +	/* I2C bus frequencies officially supported by MachXO2 are 400, 100 a=
nd 50 kHz */
> > +	if (i2c->bus_khz >=3D 400)
> > +		i2c->bus_khz =3D 400;
> > +	else if (i2c->bus_khz >=3D 100)
> > +		i2c->bus_khz =3D 100;
> > +	else
> > +		i2c->bus_khz =3D 50;
> > +
> > +	prescale =3D DIV_ROUND_UP(i2c->clock_khz, 4 * i2c->bus_khz);
> > +	if (prescale > 0x3ff) {
>=20
> can you please explain this check?

The register field is 10 bits wide, making 0x3ff its maximum value. Should =
I add
a comment?


>=20
> > +		dev_err(&i2c->adap.dev, "unsupported prescale: %d\n",
> > +			prescale);
> > +		return -EINVAL;
> > +	}
> > +
> > +	machxo2_set(i2c, I2C_BR0, prescale & 0xff);
> > +	machxo2_set(i2c, I2C_BR1, prescale >> 8);
> > +
> > +	machxo2_set(i2c, I2C_IRQEN, 0);
> > +	machxo2_set(i2c, I2C_CR, I2C_CR_I2CEN);
> > +
> > +	return 0;
> > +}
>=20
> ...
>=20
> > +static int machxo2_i2c_probe(struct platform_device *pdev)
> > +{
> > +	struct machxo2_i2c_platform_data *pdata;
> > +	struct machxo2_i2c *i2c;
> > +	struct resource *res;
> > +	void __iomem *regs;
> > +	int ret;
> > +
> > +	i2c =3D devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> > +	if (!i2c)
> > +		return -ENOMEM;
> > +
> > +	pdata =3D dev_get_platdata(&pdev->dev);
> > +	if (!pdata || !pdata->clock_khz)
> > +		return -EINVAL;
> > +
> > +	i2c->clock_khz =3D pdata->clock_khz;
> > +	i2c->bus_khz =3D pdata->bus_khz;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
> > +	if (IS_ERR(res))
> > +		return PTR_ERR(res);
> > +
> > +	if (!devm_request_region(&pdev->dev, res->start, resource_size(res),
> > +				 pdev->name)) {
> > +		dev_err(&pdev->dev, "Can't get I/O resource.\n");
> > +		return -EBUSY;
>=20
> please, use dev_err_probe() here.
>=20
> > +	}
> > +
> > +	regs =3D devm_ioport_map(&pdev->dev, res->start, resource_size(res));
> > +	if (!regs) {
> > +		dev_err(&pdev->dev, "Can't map I/O resource.\n");
> > +		return -EBUSY;
> > +	}
> > +
> > +	i2c->regmap =3D devm_regmap_init_mmio(&pdev->dev, regs, &machxo2_regm=
ap_config);
> > +	if (IS_ERR(i2c->regmap))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->regmap),
> > +				     "Unable to initialize register map\n");
> > +
> > +	i2c->irq =3D platform_get_irq_optional(pdev, 0);
> > +	if (i2c->irq < 0 && i2c->irq !=3D -ENXIO)
> > +		return i2c->irq;
> > +
> > +	ret =3D machxo2_init(i2c);
> > +	if (ret)
> > +		return ret;
> > +
> > +	init_waitqueue_head(&i2c->wait);
> > +	spin_lock_init(&i2c->lock);
> > +	hrtimer_setup(&i2c->timer, machxo2_handle, CLOCK_MONOTONIC, HRTIMER_M=
ODE_REL);
> > +
> > +	if (i2c->irq > 0) {
> > +		ret =3D devm_request_irq(&pdev->dev, i2c->irq, machxo2_isr, 0,
> > +				       pdev->name, i2c);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "Cannot claim IRQ\n");
> > +			machxo2_set(i2c, I2C_CR, 0);
> > +			return ret;
>=20
> Do we need to write '0' to I2C_CR here?


machxo2_init() would have set I2C_CR_I2CEN here already; this resets it to =
0. I
will check if moving the machxo2_set(i2c, I2C_CR, I2C_CR_I2CEN) to a later =
point
in the probe is possible.

Best,
Matthias




>=20
> Thanks,
> Andi
>=20
> > +		}
> > +
> > +		machxo2_set(i2c, I2C_IRQEN, I2C_IRQ_MASK);
> > +
> > +		dev_info(&pdev->dev,
> > +			 "Using IRQ %d, bus speed %dKHz, clock %dKHz.\n",
> > +			 i2c->irq, i2c->bus_khz, i2c->clock_khz);
> > +	} else {
> > +		dev_info(&pdev->dev,
> > +			 "Running in polling mode, bus speed %dKHz, clock %dKHz.\n",
> > +			 i2c->bus_khz, i2c->clock_khz);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, i2c);
> > +
> > +	strscpy(i2c->adap.name, "i2c-machxo2", sizeof(i2c->adap.name));
> > +	i2c->adap.algo =3D &machxo2_algorithm;
> > +	i2c->adap.dev.parent =3D &pdev->dev;
> > +	i2c->adap.nr =3D pdev->id;
> > +	i2c->adap.owner =3D THIS_MODULE;
> > +	i2c_set_adapdata(&i2c->adap, i2c);
> > +
> > +	ret =3D i2c_add_adapter(&i2c->adap);
> > +	if (ret) {
> > +		machxo2_set(i2c, I2C_CR, 0);
> > +		machxo2_set(i2c, I2C_IRQEN, 0);
> > +
> > +		if (i2c->irq > 0)
> > +			disable_irq(i2c->irq);
> > +		hrtimer_cancel(&i2c->timer);
> > +
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

