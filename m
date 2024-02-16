Return-Path: <linux-i2c+bounces-1817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E9857872
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5132428596E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 09:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6AA1B818;
	Fri, 16 Feb 2024 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ga1ELh13"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30581BC20;
	Fri, 16 Feb 2024 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708074323; cv=none; b=I5gD+qJL6fl+jJRUt9k2S+qedBhIwiTVAGPyxgJxsuLtE8ea3aNFFD1IFmD6OctpvDupAildxquIKmAJ37uJ9YIul4ni14YF8Xri/iBesfpIxIWHUqd51CGuRCX6V2JirYKMh+MCwMkTysMuZmqEqblBxTlXrTELXXUyKyRhWEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708074323; c=relaxed/simple;
	bh=KKzuGXf/3m5GUFN2wQqWlaT/zKCh0DST4P6XXk09AyE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksqHlq7h6Xxt0mb7UGXirK3SvBBldlQtAO/cjw/xqnN0Eq8cK34LTjY/yQ1jbp2RDIjXDvhFkSWYJ2CKiwNUPLrQd4cBlE26iX7RD7HoqnDGQFEMGeT87jWwF7zsnfeprsXS/52PHAz19S7LRtLBbKSQ6XRFkqijBahdX5YcEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ga1ELh13; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G94eJE042556;
	Fri, 16 Feb 2024 03:04:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708074280;
	bh=qKnEBzEkahRZQGyLlG5caVJAX0ujkHEkHCnhmcHnJss=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ga1ELh13Fmc4SCWCtqOcJOvkxzdlZcoRb+2I2ZtdsBOn+CHXoQZBCTZqXQO27M3GE
	 m+QAAFnGAOnJiRL3AGE3v/YrTKt/Tddb7d18CVJad8VrRKNSSCBFxqe1xJTGhfaXX1
	 N+K101UbOoQH2ziHXxgx59QU6QLKo1rC7coWs7q8=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G94ecD023131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Feb 2024 03:04:40 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 03:04:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 03:04:40 -0600
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G94drM059981;
	Fri, 16 Feb 2024 03:04:40 -0600
Date: Fri, 16 Feb 2024 14:34:39 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>,
        Thomas Richard
	<thomas.richard@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Vignesh R <vigneshr@ti.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
        Kishon
 Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-pci@vger.kernel.org>, <gregory.clement@bootlin.com>,
        <theo.lebrun@bootlin.com>, <thomas.petazzoni@bootlin.com>,
        <u-kumar1@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 08/18] phy: ti: phy-j721e-wiz: split wiz_clock_init()
 function
Message-ID: <14429802-b4d8-4a3e-88ea-a9fc55d2251c@ti.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-8-5c2e4a3fac1f@bootlin.com>
 <Zc4xJtLl3zo_YrBC@smile.fi.intel.com>
 <Zc76d4B4hjTC3xum@matsya>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zc76d4B4hjTC3xum@matsya>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 24/02/16 11:32AM, Vinod Koul wrote:
> On 15-02-24, 17:43, Andy Shevchenko wrote:
> > On Thu, Feb 15, 2024 at 04:17:53PM +0100, Thomas Richard wrote:
> > > The wiz_clock_init() function mixes probe and hardware configuration.
> > > Rename the wiz_clock_init() to wiz_clock_probe() and move the hardware
> > > configuration part in a new function named wiz_clock_init().
> > > 
> > > This hardware configuration sequence must be called during the resume
> > > stage of the driver.
> > 
> > ...
> > 
> > (Side note, as this can be done later)
> > 
> > >  	if (rate >= 100000000)
> > 
> > > +		if (rate >= 100000000)
> > 
> > > +	if (rate >= 100000000)
> > 
> > I would make local definition and use it, we may get the global one as there
> > are users.
> > 
> > #define HZ_PER_GHZ	1000000000UL
> 
> Better to define as:
> #define HZ_PER_GHZ 1 * GIGA

The variable "rate" is being compared against 100 MHz and not 1 GHz.
The driver already has the following macros defined:
#define REF_CLK_19_2MHZ         19200000
#define REF_CLK_25MHZ           25000000
#define REF_CLK_100MHZ          100000000
#define REF_CLK_156_25MHZ       156250000

So would it be acceptable to change it to:
	if (rate >= REF_CLK_100MHZ)
instead?

Regards,
Siddharth.

