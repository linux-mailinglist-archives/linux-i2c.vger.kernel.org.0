Return-Path: <linux-i2c+bounces-3732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE818D6776
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 18:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D071C2434C
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 16:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744D4171E4A;
	Fri, 31 May 2024 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jCTyzD5S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38D45381A;
	Fri, 31 May 2024 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717174518; cv=none; b=DyGbV6HQgssJacOIWTpyyuOD0YlYAIGOzKS0KyVaRM35QspJdWkgw2x1g/bVz3BryKftJ+hUEj4PknLxLJFC4Dvi3IzchyYOPeEt5c6+qG2T/pC6Rm6T/ZA1lfwO8BHvXL05RiEgdaUHtBDiOQNKU7oEekWySlSfmfLJvZaiiKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717174518; c=relaxed/simple;
	bh=wwDkFQlCmYaBWNt+sIQJ30LdSolr6sdRGekCzcglKQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7XVvZQkyZ4opPLwjFVWGNleCeQOUewe4BM7v8f+vpjuNvYdZkn9Go+ZLP/cJbijicQPm2aJYW1uFwR8UDLa12OwChLrZSIFbW/I6iAkM0q9YtyhGQWKckS51tkMRxmXYcizNQi555mg3a+7wXBNjFzGjtMBQEhiuloEseJ3m3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jCTyzD5S; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0525240002;
	Fri, 31 May 2024 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717174508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCyP3NsB6+TrwW+rJ92fdE1KqnkQyffJu7CwUmKcvjg=;
	b=jCTyzD5S5jiQ2h1XLSSXcBzegACpsb4kPK6kpHDjYa3qU4eZXeg/54l25IVRE9oH5iXokx
	mBXTvWrErcaFW9G+iqcTxPIxuxLLnBXFa8JPa76Ge+gtinBsSlpDKZWseUHYKIJX/3x2y5
	PrztJFUE32LBoRTF7QLK4TZhci2PHa3kMydGuloEO0PBk/23fyGmGN8bfWqF/htKXPwGU2
	8e2SbyVWMa/e3BPdfSKC4VitKht+H8g+8nQEg0cGFEYDM+BACQT3TUK00wrwR/IwPP1rsT
	+qpW4eTTnAGSW5LeBvBsy7BXdEZvQ2EirMdjJusqh5+TAk8lVffyuhd+Zc/IPw==
Message-ID: <42affba4-4600-4c44-ad88-926597cc2225@bootlin.com>
Date: Fri, 31 May 2024 18:55:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] Add suspend to ram support for PCIe on J7200
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com,
 thomas.petazzoni@bootlin.com, u-kumar1@ti.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 5/15/24 12:01, Thomas Richard wrote:
> This adds suspend to ram support for the PCIe (RC mode) on J7200 platform.
> 

Hello,

Gentle ping.
No merge conflict with 6.10-rc1.
I know the patch for the gpio-pca953x driver causes a regression for one
other platform.
But most of the patches could be applied.

Best Regards,

Thomas

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


