Return-Path: <linux-i2c+bounces-11680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A36AEC719
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 14:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD8DF17E03F
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 12:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E7624729F;
	Sat, 28 Jun 2025 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="VV/HQj/O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC139855;
	Sat, 28 Jun 2025 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751113870; cv=none; b=bXCliI1oLOnJpXU/PJhC4G2rwNmWmuCKGt3x0+PjZF1rgcPMWCyHosUGU6itHztcnAJZQl0IvF2lzgpBLGoMPA2fxvgENDy+c04G3G0DQi1CkCyPBevdiK84efYo02lxdOuR3WSbYJA1MZCReTvJEwsh6f+83gr3yT0QsfJLtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751113870; c=relaxed/simple;
	bh=GuHOq+CbdP3Dl1cSzwH/wbg08DUJMROIFu5pK37Vl78=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=LWyf+7QTSGLKJ5sqPwz1pz8IAJdtUXAPgX/rmz16xJ/j/MXpO/mSrQq4updLjqcCRsuq5dFJtLixi5Iqh8h/fufc9+t6UWro5mQ5Q+Ex0bzAagT/FV5hPJKUQoaR51BCOSvmll28hf/MTjQnquC6RZ9NSM91Sb8riINEI4Co6jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VV/HQj/O; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1751113830; x=1751718630; i=markus.elfring@web.de;
	bh=9dvPgfxBni1dCb8wk5xV/eYN0Q/Wf+q8ejkIbyh5sxc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VV/HQj/O/TZI18JKc09uqN9Ka+v9zaAkTRctmxSuu1pIpyPG694I3jG1MNLQA3Nq
	 E4ipZl1QzgCn8F08XMZALYXxSyY/Htyy+wce5hX8Q16f6A+hDQGSy06hJC3iNako+
	 J74KrQPxl24vrG2TvRPHXVxrxXqIkp1Xp3IDVfdqpX8AsbgAI8ZEiJhfzQUpaoy8n
	 IjNUm8pfGQ4FyVAfB/+evf6KoxLwUgWUNh4RC6f9gphEXhjeGhJGOnGZ87iwOEBO3
	 fnG4H3aNG2wNDM+YPd1KaYjALQKIQQNlUY4uRKivWGMN2rQiRlQUHfwrc51cOdlIk
	 yBoLKFg6MN6h4tr64g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.176]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLAVc-1uDHKG1Nj8-00TXkk; Sat, 28
 Jun 2025 14:30:30 +0200
Message-ID: <76f34610-6792-4be6-a5d6-622fba7d85da@web.de>
Date: Sat, 28 Jun 2025 14:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ming Yu <a0282524688@gmail.com>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 netdev@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
 Jakub Kicinski <kuba@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Ming Yu <tmyu0@nuvoton.com>, LKML <linux-kernel@vger.kernel.org>
References: <20250627102730.71222-2-a0282524688@gmail.com>
Subject: Re: [PATCH v13 1/7] mfd: Add core driver for Nuvoton NCT6694
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250627102730.71222-2-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GARg2unvR393v0ddrdFf+gCoE5GBk7DkTlawIl6DtqhxD5KbjS4
 XwhEnClEhPUjptkfwCX0vZRNAJUHgoZkMd7Z1r0rvpp+F8YsxTy0Q4r2IW1f7ahFswzYTl3
 T/qL292DDL+KBIEbtSr7M895enORtm8y5FMPxW7oc9VLnOsjowYtP32Iiqb8ruCjpGSgnq5
 V9VNSdLblBEeHmR/+40SA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rzNGavO/eAM=;eLzsOP7ZRUA9Ll8EVS5QMxBRvGt
 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
 zRhhE+zhiUQ==

=E2=80=A6
> +++ b/drivers/mfd/nct6694.c
> @@ -0,0 +1,390 @@
=E2=80=A6
> static void nct6694_irq_enable(struct irq_data *data)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&nct6694->irq_lock, flags);
> +	nct6694->irq_enable |=3D BIT(hwirq);
> +	spin_unlock_irqrestore(&nct6694->irq_lock, flags);
> +}
=E2=80=A6

Will development interests grow to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&nct6694->irq_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.16-rc3/source/include/linux/spinlock.h=
#L585-L588

Regards,
Markus

