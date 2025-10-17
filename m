Return-Path: <linux-i2c+bounces-13620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27059BEBFDC
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 01:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54223B7363
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 23:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A820354AE7;
	Fri, 17 Oct 2025 23:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMqcP1t6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544352494F0;
	Fri, 17 Oct 2025 23:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760743453; cv=none; b=FhpiFB6gMgEtcoV6NZ/kywIv2uMvGcJPSzQF5+ig0QV7JVc9QZN84smUUW8lUIEamQDuH6Zz0jumWATFVIZ+LkqXV/3Yf0uw56e9Q0dVHId5Llnid79ndZwfDFK3t9W3qzAwW+TmcUT17L1RIVYW0wcoDEGEaODJU/9OuRpO4bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760743453; c=relaxed/simple;
	bh=b2FhtzErySqAmgl5KJgWEkxSWNfA+bUNJBItniuUnS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sten5QfCtD5yNiqRA2n3+Ev6AB/0GrBRlKOzgHIam+hUMewzBYLMVFLLAq+nUuTf2edVV/3E4x96hsWwpN38F8js6OxI46kQIPKMB7d5O6cmZCotondI8jJtaHrmgzhpklJ9SyAl/t4kqIhemMAynMwhDMIG+cinSwzImc+YQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMqcP1t6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE235C4CEE7;
	Fri, 17 Oct 2025 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760743452;
	bh=b2FhtzErySqAmgl5KJgWEkxSWNfA+bUNJBItniuUnS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMqcP1t6M2e6zxfqTm5GMS4152+TI95ZM4Pg9s50eBawVVE1QJrP/o4mqdvuf3U+D
	 k/aiqbMiIAQk6Mr9DCMp6yEIBhXoX5ULsAA6UskIUEX5odUpmZ275+qmyEnxZIdltf
	 eOBH+3vlq4++gfqUpydOFf514Qyf24Mi2Yx6f4kajRTXNNv/Td6sC1qXH6CNeFTNUa
	 oo0K4NwcbUirx/+9yMn0L7AkPhZ1oolsLyVnAwO9saUtpv/E4MpvIsXyxQSq1A8qcF
	 OHzL+Tgjg2EySwGTghDh69j05MGCjxdIudL+V+qrxuJHzXrpQ8GbpYdMGJDLgmiX8P
	 8IHf4LhMKcFdQ==
Date: Sat, 18 Oct 2025 01:24:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Lee Jones <lee@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/4] i2c: machxo2: new driver
Message-ID: <wsbevkqszimjkww3qihxbghtw3yaxaooagwrgv2prhldeutybh@vh5nmdx5hiha>
References: <5855f15ad83617d3a71b40d89d61273722c6e15f.1760601899.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5855f15ad83617d3a71b40d89d61273722c6e15f.1760601899.git.matthias.schiffer@ew.tq-group.com>

Hi Matthias,

...

> +enum machxo2_i2c_state {
> +	STATE_DONE,
> +	STATE_START,
> +	STATE_WRITE,
> +	STATE_READ_WAIT_SRW,
> +	STATE_READ,

Can you please use a prefix for these enums?

> +};

...

> +/* Registers */
> +#define I2C_CR			0 /* Control, RW */
> +#define  I2C_CR_I2CEN		0x80 /* Enable I2C */
> +
> +#define I2C_CMDR		1 /* Command, RW */
> +#define  I2C_CMDR_STA		0x80 /* Start */
> +#define  I2C_CMDR_STO		0x40 /* Stop */
> +#define  I2C_CMDR_RD		0x20 /* Read */
> +#define  I2C_CMDR_WR		0x10 /* Write */
> +#define  I2C_CMDR_ACK		0x08 /* Send NACK if the bit is set */
> +#define  I2C_CMDR_CKSDIS	0x04 /* Clock stretch disable */
> +
> +#define I2C_BR0			2 /* Clock Pre-scale, RW */
> +#define I2C_BR1			3 /* Clock Pre-scale, RW */
> +#define I2C_TXDR		4 /* Transmit Data, WO */
> +#define I2C_SR			5 /* Status, RO */
> +#define  I2C_SR_TIP		0x80 /* Transmit In Progress */
> +#define  I2C_SR_BUSY		0x40 /* Bus Busy */
> +#define  I2C_SR_RARC		0x20 /* Received ACK (if unset) */
> +#define  I2C_SR_SRW		0x10 /* Slave Read/Write */
> +#define  I2C_SR_ARBL		0x08 /* Arbitration Lost */
> +#define  I2C_SR_TRRDY		0x04 /* Transmitter/Receiver Ready */
> +#define  I2C_SR_TROE		0x02 /* Transmitter/Receiver Overrun Error */
> +#define  I2C_SR_HGC		0x01 /* Hardware General Call Received */
> +#define I2C_RXDR		7 /* Receive Data, RO */
> +#define I2C_IRQ			8 /* IRQ, RW */
> +#define I2C_IRQEN		9 /* IRQ Enable, RW */
> +#define  I2C_IRQ_ARBL		0x08 /* Arbitration Lost */
> +#define  I2C_IRQ_TRRDY		0x04 /* Transmitter/Receiver Ready */
> +#define  I2C_IRQ_TROE		0x02 /* Transmitter/Receiver Overrun Error */
> +#define  I2C_IRQ_HGC		0x01 /* Hardware General Call Received */
> +#define  I2C_IRQ_MASK		(I2C_IRQ_ARBL | I2C_IRQ_TRRDY | I2C_IRQ_TROE)

Can you please use a prefix for all these defines?

...

> +/* Delay by a number of SCL cycles */
> +static inline void machxo2_delay(const struct machxo2_i2c *i2c,
> +				 unsigned int cycles)
> +{
> +	udelay(machxo2_cycles_to_usecs(i2c, cycles));

can we use fsleep here?

> +}

...

> +static enum machxo2_i2c_state
> +machxo2_write(struct machxo2_i2c *i2c, u8 stat)
> +{
> +	struct i2c_msg *msg = i2c->msg;
> +
> +	if (stat & I2C_SR_TRRDY) {

if you do

	if (!(stat & I2C_SR_TRRDY))
		return STATE_WRITE;

you can save a level of indentation.

> +		bool eom = (i2c->pos == msg->len);
> +
> +		if (eom) {
> +			machxo2_delay(i2c, 1);
> +			stat = machxo2_get(i2c, I2C_SR);
> +		}
> +
> +		if ((i2c->pos > 0 || eom) && (stat & I2C_SR_RARC)) {
> +			dev_dbg(&i2c->adap.dev, "No ACK at %d\n", i2c->pos);
> +			return machxo2_error(i2c, -ENXIO);
> +		}
> +
> +		if (eom)
> +			return machxo2_end_of_message(i2c);
> +
> +		machxo2_set(i2c, I2C_TXDR, msg->buf[i2c->pos++]);
> +		machxo2_set(i2c, I2C_CMDR, I2C_CMDR_WR);
> +
> +		machxo2_reset_timer_wait(i2c);
> +	}
> +
> +	return STATE_WRITE;
> +}

...

> +static irqreturn_t machxo2_isr(int irq, void *dev_id)
> +{
> +	struct machxo2_i2c *i2c = dev_id;
> +	u8 irq_stat = machxo2_get(i2c, I2C_IRQ);
> +
> +	if (!(irq_stat & I2C_IRQ_MASK))
> +		return IRQ_NONE;
> +
> +	/*
> +	 * Due to a race condition in the I2C controller, no edge on the IRQ
> +	 * line may be generated if an event comes in right at the moment when
> +	 * the IRQs are cleared. Loop to ensure that IRQs are actually cleared.
> +	 */
> +	do {
> +		machxo2_set(i2c, I2C_IRQ, I2C_IRQ_MASK);
> +		irq_stat = machxo2_get(i2c, I2C_IRQ);
> +	} while (irq_stat & I2C_IRQ_MASK);
> +
> +	spin_lock(&i2c->lock);
> +	hrtimer_start(&i2c->timer, 0, HRTIMER_MODE_REL);
> +	spin_unlock(&i2c->lock);

why do we need spin_locks here?

> +	return IRQ_HANDLED;
> +}

...

> +static int machxo2_init(struct machxo2_i2c *i2c)
> +{
> +	unsigned int prescale;
> +
> +	/* Make sure the device is disabled */
> +	machxo2_set(i2c, I2C_CR, 0);
> +
> +	/* I2C bus frequencies officially supported by MachXO2 are 400, 100 and 50 kHz */
> +	if (i2c->bus_khz >= 400)
> +		i2c->bus_khz = 400;
> +	else if (i2c->bus_khz >= 100)
> +		i2c->bus_khz = 100;
> +	else
> +		i2c->bus_khz = 50;
> +
> +	prescale = DIV_ROUND_UP(i2c->clock_khz, 4 * i2c->bus_khz);
> +	if (prescale > 0x3ff) {

can you please explain this check?

> +		dev_err(&i2c->adap.dev, "unsupported prescale: %d\n",
> +			prescale);
> +		return -EINVAL;
> +	}
> +
> +	machxo2_set(i2c, I2C_BR0, prescale & 0xff);
> +	machxo2_set(i2c, I2C_BR1, prescale >> 8);
> +
> +	machxo2_set(i2c, I2C_IRQEN, 0);
> +	machxo2_set(i2c, I2C_CR, I2C_CR_I2CEN);
> +
> +	return 0;
> +}

...

> +static int machxo2_i2c_probe(struct platform_device *pdev)
> +{
> +	struct machxo2_i2c_platform_data *pdata;
> +	struct machxo2_i2c *i2c;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int ret;
> +
> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	pdata = dev_get_platdata(&pdev->dev);
> +	if (!pdata || !pdata->clock_khz)
> +		return -EINVAL;
> +
> +	i2c->clock_khz = pdata->clock_khz;
> +	i2c->bus_khz = pdata->bus_khz;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (IS_ERR(res))
> +		return PTR_ERR(res);
> +
> +	if (!devm_request_region(&pdev->dev, res->start, resource_size(res),
> +				 pdev->name)) {
> +		dev_err(&pdev->dev, "Can't get I/O resource.\n");
> +		return -EBUSY;

please, use dev_err_probe() here.

> +	}
> +
> +	regs = devm_ioport_map(&pdev->dev, res->start, resource_size(res));
> +	if (!regs) {
> +		dev_err(&pdev->dev, "Can't map I/O resource.\n");
> +		return -EBUSY;
> +	}
> +
> +	i2c->regmap = devm_regmap_init_mmio(&pdev->dev, regs, &machxo2_regmap_config);
> +	if (IS_ERR(i2c->regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->regmap),
> +				     "Unable to initialize register map\n");
> +
> +	i2c->irq = platform_get_irq_optional(pdev, 0);
> +	if (i2c->irq < 0 && i2c->irq != -ENXIO)
> +		return i2c->irq;
> +
> +	ret = machxo2_init(i2c);
> +	if (ret)
> +		return ret;
> +
> +	init_waitqueue_head(&i2c->wait);
> +	spin_lock_init(&i2c->lock);
> +	hrtimer_setup(&i2c->timer, machxo2_handle, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +
> +	if (i2c->irq > 0) {
> +		ret = devm_request_irq(&pdev->dev, i2c->irq, machxo2_isr, 0,
> +				       pdev->name, i2c);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Cannot claim IRQ\n");
> +			machxo2_set(i2c, I2C_CR, 0);
> +			return ret;

Do we need to write '0' to I2C_CR here?

Thanks,
Andi

> +		}
> +
> +		machxo2_set(i2c, I2C_IRQEN, I2C_IRQ_MASK);
> +
> +		dev_info(&pdev->dev,
> +			 "Using IRQ %d, bus speed %dKHz, clock %dKHz.\n",
> +			 i2c->irq, i2c->bus_khz, i2c->clock_khz);
> +	} else {
> +		dev_info(&pdev->dev,
> +			 "Running in polling mode, bus speed %dKHz, clock %dKHz.\n",
> +			 i2c->bus_khz, i2c->clock_khz);
> +	}
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	strscpy(i2c->adap.name, "i2c-machxo2", sizeof(i2c->adap.name));
> +	i2c->adap.algo = &machxo2_algorithm;
> +	i2c->adap.dev.parent = &pdev->dev;
> +	i2c->adap.nr = pdev->id;
> +	i2c->adap.owner = THIS_MODULE;
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	ret = i2c_add_adapter(&i2c->adap);
> +	if (ret) {
> +		machxo2_set(i2c, I2C_CR, 0);
> +		machxo2_set(i2c, I2C_IRQEN, 0);
> +
> +		if (i2c->irq > 0)
> +			disable_irq(i2c->irq);
> +		hrtimer_cancel(&i2c->timer);
> +
> +		return ret;
> +	}
> +
> +	return 0;
> +}

