Return-Path: <linux-i2c+bounces-6674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD023977A69
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14AB21C24CFC
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4691BD008;
	Fri, 13 Sep 2024 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FMtRYG/N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MY+rZsBR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCC013F42F;
	Fri, 13 Sep 2024 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214398; cv=none; b=QjhfyIxX6KCTxDTBLvtpPyKaJS/Fbav/Q1v3Q74X3VkarBqJnhg00gTW2bKf7iDP8rpWo4YN1r+mytZmPA61AC35sahNGw1DF7D1lBieSPzOWd2mGCxm0WOWcSWgdIJ1zNxbfO11qfXGm6N/Od474oLajQATA/4sUXpm9ZQB0a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214398; c=relaxed/simple;
	bh=djHV2/XNK5IPdhYmsv3PbBq94apMRd0hB5/K/LMOyS4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nNMdQOeZicJDst2L4biae23MO3Fd3zsysb0ZXJRGIVQoIKJPiHpOHRfj7b7ZWKrJikKX7TuMQrbzslr6RZe2PF/De3DIxR+PDvjfiMP6bYBKjL1tPG33W6GAyWgmpMvKetzm3VjSdiGZHbrwomjfqbqu4WaFe4fvCGJ+DqEPuQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FMtRYG/N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MY+rZsBR; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 31A40138048D;
	Fri, 13 Sep 2024 03:59:56 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 03:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726214396;
	 x=1726300796; bh=4CzBYefCbC8etZ+AyFpSOC775tw2tVhYGtceXnzwH1U=; b=
	FMtRYG/NxCbpPWzUbeUcs2kSWrmne3N2oB9HDtAZjdnxZV08DTuPG8XRVB1msUvz
	AQeDI18TYIq7dCx4eVRf8X6lkvhpqBUnlV+I1rCjFv9ksVoFh3jqU+c5d0lxpG+n
	aSBpj/NFtraf1gvGeakqK0rP7MiVcLry5Qwv01vQ+wSw7XKlLsBmguda+Mgpjm/t
	cAENj5nzkA4DIYMhedjdVHqnb799lYFL43cvgFxuTW9oz9ZH4eMDcPFk5HMzQ1Cl
	kekNu+GokziTe2U44vqbnCQSJ1VpET4YW1Pxf3Y0XhHv/vhFrDVo+9R+DVNK1l4+
	F79VUWZkl8zvlGloD2WwCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726214396; x=
	1726300796; bh=4CzBYefCbC8etZ+AyFpSOC775tw2tVhYGtceXnzwH1U=; b=M
	Y+rZsBRmkwECMX2ef/FHDEDwdJ0FSRMwahs2wE2rxPXJFINXJJlQ4W1L8vGPI8/5
	8WD+7VCrVlig4QR+xLjvbVBK7b4sKJlbfwOI4G0M+aT18qI+b77Nl053UwFB9SdZ
	QhBKvXUvjIbuPNyDAKymd/fDn+dvDCN/CRHQT4FXZ7uXawtpUswQIF+BxXwtVJ+V
	fjN+9m974ZhzBJe+RA+JTVB//NWwTxzR6UPLmHAyAKwAmZrCDQIfRXhrmZk9bzaK
	SjzxCAUbdjsNVkS0727EnF0nFmIL3/Ied61XkHmaPyTTCtvXCllIhFPMhb+BDIfE
	9+be7x29ms3+D3KqErtfA==
X-ME-Sender: <xms:-_DjZix3uZ1bTOC819TBR2gu3SGKbIcQ6TZK7SlJ0mOG0ArjGlxyDg>
    <xme:-_DjZuRhjxU1eZyOw_CYIwoLQF7CpSFxu8AgunrcBJtwhhIwtUPqOIm4sefrCPiUt
    7Bhl5eJad9jrRdM5Lk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehuthhsrghvrdgrghgrrhifrghlse
    grnhgrlhhoghdrtghomhdprhgtphhtthhopegrughsphdqlhhinhhugiesrghnrghlohhg
    rdgtohhmpdhrtghpthhtoheprghrthhurhhsrdgrrhhtrghmohhnohhvshesrghnrghloh
    hgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtgho
    mhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhguihdrshhhhiht
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-_DjZkXej-3t-hSZeNoBGJ2QVkW__okQTLkon2codkGGIgd8WKSXhQ>
    <xmx:-_DjZogNc2pOim6rNdUR2H5GlbH6pcDQr0o0FOi4tUs_nCeq7YMXSg>
    <xmx:-_DjZkC3yFY0Ff8IKQQZI1WXdx8VI0scP9zqwlS-oHwEHj-02WU6Bg>
    <xmx:-_DjZpIiADhKvmG7AaDzFsl928yQWgUf0HbXrU5GYdQbohN1yhUhfQ>
    <xmx:_PDjZlgAsUJJWHPsU6dZVfnHlrhYp8x8wNDEgX8AQIG2jnoKRekVhedK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6C8EC222006F; Fri, 13 Sep 2024 03:59:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 07:59:34 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: arturs.artamonovs@analog.com, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Greg Malysa" <greg.malysa@timesys.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Utsav Agarwal" <Utsav.Agarwal@analog.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 adsp-linux@analog.com,
 "Nathan Barrett-Morrison" <nathan.morrison@timesys.com>
Message-Id: <c1bdcf44-ce2f-4350-b9d9-053c4d99875e@app.fastmail.com>
In-Reply-To: <20240912-test-v1-15-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-15-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 15/21] i2c: Add driver for ADI ADSP-SC5xx platforms
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:25, Arturs Artamonovs via B4 Relay wrote:
> +
> +config I2C_ADI_TWI_CLK_KHZ
> +    int "ADI TWI I2C clock (kHz)"
> +    depends on I2C_ADI_TWI
> +    range 21 400
> +    default 50
> +    help
> +      The unit of the TWI clock is kHz.

This does not look like something that should be a compile-time
option, the kernel needs to be able to run on different
configurations.

> +
> +static void adi_twi_handle_interrupt(struct adi_twi_iface *iface,
> +					unsigned short twi_int_status,
> +					bool polling)
> +{
> +	u16 writeValue;
> +	unsigned short mast_stat = ioread16(&iface->regs_base->master_stat);

It's a bit unusual to use ioread16()/iowrite16() instead of the
normal readw()/writew().

> +			} else if (iface->cur_mode == TWI_I2C_MODE_REPEAT &&
> +				   iface->cur_msg + 1 < iface->msg_num) {
> +
> +				if (iface->pmsg[iface->cur_msg + 1].flags & I2C_M_RD) {
> +					writeValue = ioread16(&iface->regs_base->master_ctl)
> +							      | MDIR;
> +					iowrite16(writeValue, &iface->regs_base->master_ctl);
> +				} else {
> +					writeValue = ioread16(&iface->regs_base->master_ctl)
> +							      & ~MDIR;
> +					iowrite16(writeValue, &iface->regs_base->master_ctl);

The use of a structure instead of register offset macros makes
these lines rather long, especially at five levels of indentation.
Maybe this can be restructured for readability.

> +		if (ioread16(&iface->regs_base->master_stat) & SDASEN) {
> +			int cnt = 9;
> +
> +			do {
> +				iowrite16(SCLOVR, &iface->regs_base->master_ctl);
> +				udelay(6);
> +				iowrite16(0, &iface->regs_base->master_ctl);
> +				udelay(6);
> +			} while ((ioread16(&iface->regs_base->master_stat) & SDASEN)

Since writes on device mappings are posted, the delay between
the two iowrite16() is not really meaningful, unless you add
another ioread16() or readw() before the delay. Mapping these
with ioremap_np() should also work.

> +			iowrite16(SDAOVR | SCLOVR, &iface->regs_base->master_ctl);
> +			udelay(6);
> +			iowrite16(SDAOVR, &iface->regs_base->master_ctl);
> +			udelay(6);
> +			iowrite16(0, &iface->regs_base->master_ctl);
> +		}

Same here.

> +/* Interrupt handler */
> +static irqreturn_t adi_twi_handle_all_interrupts(struct adi_twi_iface 
> *iface,
> +						 bool polling)
> +{
> +	irqreturn_t handled = IRQ_NONE;
> +	unsigned short twi_int_status;
> +
> +	while (1) {
> +		twi_int_status = ioread16(&iface->regs_base->int_stat);
> +		if (!twi_int_status)
> +			return handled;
> +		/* Clear interrupt status */
> +		iowrite16(twi_int_status, &iface->regs_base->int_stat);
> +		adi_twi_handle_interrupt(iface, twi_int_status, polling);
> +		handled = IRQ_HANDLED;
> +	}
> +}
> +
> +static irqreturn_t adi_twi_interrupt_entry(int irq, void *dev_id)
> +{
> +	struct adi_twi_iface *iface = dev_id;
> +	unsigned long flags;
> +	irqreturn_t handled;
> +
> +	spin_lock_irqsave(&iface->lock, flags);
> +	handled = adi_twi_handle_all_interrupts(iface, false);
> +	spin_unlock_irqrestore(&iface->lock, flags);
> +	return handled;
> +}

Interrupt handlers are called with IRQs disabled, so no
need to turn them off again.

> +static SIMPLE_DEV_PM_OPS(i2c_adi_twi_pm,
> +			 i2c_adi_twi_suspend, i2c_adi_twi_resume);
> +#define I2C_ADI_TWI_PM_OPS	(&i2c_adi_twi_pm)
> +#else
> +#define I2C_ADI_TWI_PM_OPS	NULL
> +#endif

Please convert to DEFINE_SIMPLE_DEV_PM_OPS() and remove the
#ifdef.

> +#ifdef CONFIG_OF
> +static const struct of_device_id adi_twi_of_match[] = {
> +	{
> +		.compatible = "adi,twi",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, adi_twi_of_match);
> +#endif

No need to optimize for non-CONFIG_OF builds, we don't
support traditional board files on arm64.

> +	match = of_match_device(of_match_ptr(adi_twi_of_match), &pdev->dev);

This of_match_ptr() and the second one later should also
get removed then.

> \ No newline at end of file
>

Whitespace damage.

      Arnd

