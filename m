Return-Path: <linux-i2c+bounces-1829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F83857AA2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 11:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8F11C21FC4
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F52537E8;
	Fri, 16 Feb 2024 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H7s8TSq/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E110535BB;
	Fri, 16 Feb 2024 10:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708080538; cv=none; b=ACttQBqHmJ6C2pobJUj1JeHe7ug+yXTYFr2qS1jBUEDouXzYzK8/ZWqDgEa8H00qZpnn4JqpB6VZM2wpko9LBo6boMlnZqTL0ct+mH6cUwC4hbftgci/Z584MxTC5TOuRPDHNEYdGIWUDx3fYP4s6uTGB0q3qAWmOm0TRHTiGT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708080538; c=relaxed/simple;
	bh=bSQjI5oIAeosqTym3AFvRxCY5213clKyJoH9whfcyjk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfOqjfmwcfHQlZbm52OZvR3GtDyb2nXGBtvhcXOtJ3EnN0cG7bn6Cv8iUrCfpLCx5DqUjxBBb0yHFVa5cafUldfRfkeEjIbz/fVn5NVFqmZebgz2IihN8laxKpu2hG5xjKM3ZYP9mBMres7BsZaHbnpZZFuYiVmKnwSYKywQsP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=H7s8TSq/; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41GAmR9B056970;
	Fri, 16 Feb 2024 04:48:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708080507;
	bh=wBeXLUFC5b4/8RGzmyvF89yYPd110y8htQLDdX2WYTc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=H7s8TSq/72OiEAd3rL2BUZa9KNNyAB7Wr+7vrd0Mo1gM6SSozbZDMkhsVVnB649xU
	 AQ1kVHY38XBAREf1YPaI6jqt0jNuzg1bIqCtGX7rJo3Mr9eLWMGUPDmgecIYB6MLES
	 Sz0EVyu19IuvkIeSFdvq3ht/39IJUFW8kOKph+kU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41GAmR5L129001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Feb 2024 04:48:27 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 04:48:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 04:48:27 -0600
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41GAmQcT020589;
	Fri, 16 Feb 2024 04:48:27 -0600
Date: Fri, 16 Feb 2024 16:18:26 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Thomas Richard <thomas.richard@bootlin.com>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, Tony Lindgren
	<tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Vignesh R
	<vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik
	<jmkrzyszt@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>, Peter Rosin
	<peda@axentia.se>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lorenzo
 Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-pci@vger.kernel.org>, <gregory.clement@bootlin.com>,
        <theo.lebrun@bootlin.com>, <thomas.petazzoni@bootlin.com>,
        <u-kumar1@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 18/18] PCI: j721e: add suspend and resume support
Message-ID: <aa791703-81d8-420c-ba35-c8fd08bc3f07@ti.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-18-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v3-18-5c2e4a3fac1f@bootlin.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 24/02/15 04:18PM, Thomas Richard wrote:
> From: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Add suspend and resume support. Only the rc mode is supported.
> 
> During the suspend stage PERST# is asserted, then deasserted during the
> resume stage.

Wouldn't this imply that the Endpoint device will be reset and therefore
lose context? Or is it expected that the driver corresponding to the
Endpoint Function in Linux will restore the state on resume, post reset?

Regards,
Siddharth.

