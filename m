Return-Path: <linux-i2c+bounces-6748-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD0B97929C
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 19:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2846B281C74
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 17:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2127F1D12F5;
	Sat, 14 Sep 2024 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="TH/qJUv8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F8208DA;
	Sat, 14 Sep 2024 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726334153; cv=none; b=sJtATi0wZA4Hxf03zL4dos38EhcHNIL6ZMowtxPxmcHl1Cq1/QfEgjL1lnEfuIDpnnPqwGSgnUvVRAVGJ6JmwP1vQ7mR/9toF9jgcqBAdlBKmkF4wgipADKZ0FtfdutEwwWhWyaXbrX9n84A8zJxxTuQPaPUZvy1TNQDcGEFRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726334153; c=relaxed/simple;
	bh=EUWxZgcoFYYZNW8gfinlOzKVYhuSHdm+8B/zIAgs2QU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=chG8433fmmVhNNtz6dRYaZoF5SW6+9zRkXYZuv8zpAbZ0NXpzUtTMEOm/+W8SiQB8TFZtSoc/5CZuabdS20di7aFRL6ldW/s+HNd0MrneOctbCP//3g1LEUqHJqQ0yPrlNc+smEiXygA1LUNfxQKusHr7pjKCBDPNrr3gvLVniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=TH/qJUv8; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726334120; x=1726938920; i=markus.elfring@web.de;
	bh=+t3z0lY6Wi+QQz/YvzzBvM5zQR/hzCVK35DvfY6u49Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TH/qJUv8lAJ14MX+E2pXRcb1BUh3hlwtFZLXhV32TWTdJ7D+8uM5xYeUyxHs2bhQ
	 tlHklcZxZzNdAkXLs1G3U7g5ht+F55QTAfWmerg4lsuMGtxcYxz6ZygtMq68LQSYu
	 aYVJYu+cw/pX8rLWzjsvXKepiK3iwrQww+MV/eKe+f/8jEBQsuVYlqCFqm8PGXa7I
	 D4rHd+tvzjvbp9emltm0GzmnIb0hEznVvWKp1IPc2GiXnkXVCggtndXSt8TZIW4sN
	 oehA2YEHuyNyyqxlsP3Cq5aACKvUkOc4/8sWMXvhHy/RsxD6RM4522v5ebbxiXSRO
	 QIEY+d5ooXOnHL8gXQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MDMzC-1sgCh40IFy-0082Wi; Sat, 14
 Sep 2024 19:15:20 +0200
Message-ID: <b6af2603-7f72-47d7-98b9-6dc2761dfb74@web.de>
Date: Sat, 14 Sep 2024 19:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arturs Artamonovs <Arturs.Artamonovs@analog.com>,
 Greg Malysa <greg.malysa@timesys.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Utsav Agarwal <Utsav.Agarwal@analog.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, soc@kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Olof Johansson
 <olof@lixom.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, adsp-linux@analog.com
References: <20240912-test-v1-1-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 01/21] arm64: Add ADI ADSP-SC598 SoC
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240912-test-v1-1-458fa57c8ccf@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pV0uTKYfcGUMdOgO9MqJT1BRxvTzoHwr5Vt05L/dgQGDXgjMhkQ
 pN+/bQrdI/vRORvoUUSM59SmOZ0GwvJ4rTFRAe2GZND4ey7VoodFBr8goj1Q0BfJBY3hFzX
 eICHcTkByWsNPptIFinbcj9lNfn7FsAuDf967yNX0P9v31RBZN885aP1YeFm2IZxyD3Bemk
 1XQQN9Vdeu1OggOAxtuYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WR3H5j/uLjc=;Z3lo8gIY+Jv7jyzsqSgLVpi7AAD
 NUy/0l7boyOp4GUAXV0lTzdayMVEksKGX3YxME1Cn/Rxm2VRAEJtR/NiEq3NmX7cclzekYXnV
 /YPgqMyHrwIEd+1lBVxRbyXshXW1/TzslerwGXYG/SlnLGgIDMEqnzVn4kwQLZBVjjhRlTmSh
 SqzuC7r/VH4w0I/uTnpJOim3RD7OssNKnRk9qXwxTKNrjfWECCdJlG8rFd+IRDShlg8OGcVRS
 XUv8bLAl93Bceyc5Qg2svL54Akk6wH9AS+M5GgL+5w/7AMajN8p4CtKJo+Dtr6DP/fHUCLabP
 iV37/Z279FU9QcWQfEuBwRZJs3/uZHYcdb9MGu/r0/kptCPDpce3X92jImMITfbAqpiZmLqFN
 7zuA8Ox3XgmgZ/Y81/PwdemgweyJ7YdEXq8BbKNRxNxCiiMEjLj8Wh2sCD+XjyF4+/j2WdQ6m
 1fK/Vjehec4fHIYFR0gyteRqpW0yLjBdk/42QqsGrCwDu0nlry/VEiMO5CDBWu095Vg5S8NfB
 8ushY0UKPp7ZGv6dMPE1rG//7OJkh9FFHNnNItv8tfxgDD56MrbttOo7r7UsPPwQs14mFKhjo
 P0IT6pyL17kH6VF+wlCp+tfsOhwez6fkHauGXHfvjAPauiecoEk6Ww6wxekFSjMsf5QkmcG1T
 S51de4azvhLzYpG1895bZq8oJAlqyFyKkI5m0PvDQuDtzHvCbHqfsvqaxcdjDDNp/d5wduvbd
 4yhXFOpIYYhmnFM+OoyIjlVx7p4nESJnylU8oiUlNYGrM+xggceMQL47pv/xSMYbgg+67nGGQ
 wxEW3VdgLj1pzALYjwlXTOrw==

=E2=80=A6
> +++ b/drivers/soc/adi/system.c
> @@ -0,0 +1,257 @@
=E2=80=A6
> +static void adi_system_config_remove(struct platform_device *pdev)
+{
> +	struct adi_system_config *config =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&adi_system_config_lock, flags);
> +	list_del(&config->list);
> +	spin_unlock_irqrestore(&adi_system_config_lock, flags);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&adi_system_config_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc7/source/include/linux/spinlock.h=
#L572

Regards,
Markus

