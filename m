Return-Path: <linux-i2c+bounces-13764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD0C02AD3
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 19:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A16EC585142
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 17:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3AD3446CD;
	Thu, 23 Oct 2025 17:03:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7F233DEFF;
	Thu, 23 Oct 2025 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239028; cv=none; b=GMMlYWD92qAuLH4jNAp0B1kM0L593G2MduIkoksTBVijuO5dDHpwyzCXCfLczRqg6+uZotvNYSvhJGx/kIeXD4GFKVGqqzHtmIZPCC9OjSDhmZYsc/YwxdsDW+XSF6f4IOy+yEdjLx2xJky8d6hg7e83X1eJZH7RLZ+dkMYSLHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239028; c=relaxed/simple;
	bh=nxTUBjHrTQSW+359MSp0LTYbt0Gb5eQbxn246r4LBZQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JB7Xg+ClrWTPrJuwkjZTK4RHhNt9ZMteaRaLB0tCxCdvmVHK7Kn6+LJPtvdiU9TQIKpRGPIqPZv/CUifsd/BZUtBIo/sniJe6E49yhx6gkXmQQEJ+nb/Ktw3/XBVCwbyJCy0U6QRLoC0pWoWg7nZ3NuAdMQAw3OOE6+XAUe+0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cssjR1QSNz6HJjd;
	Fri, 24 Oct 2025 01:00:27 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 226131402FB;
	Fri, 24 Oct 2025 01:03:43 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Oct
 2025 18:03:40 +0100
Date: Thu, 23 Oct 2025 18:03:39 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>, Xu Yilun
	<yilun.xu@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck
	<linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron
	<jic23@kernel.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, Georgi
 Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joerg
 Roedel <joro@8bytes.org>, "Jassi Brar" <jassisinghbrar@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	"Vignesh Raghavendra" <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	"Jakub Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Johannes
 Berg <johannes@sipsolutions.net>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?=
	<ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Olivia
 Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-fpga@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<iommu@lists.linux.dev>, <linux-media@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <20251023180339.0000525e@huawei.com>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
References: <20251023143957.2899600-1-robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Thu, 23 Oct 2025 09:37:56 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

