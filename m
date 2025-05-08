Return-Path: <linux-i2c+bounces-10896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2FAAF900
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 13:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB3CD9E20C7
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 11:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B33223702;
	Thu,  8 May 2025 11:47:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099F35957;
	Thu,  8 May 2025 11:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704868; cv=none; b=fDvpRdrvyn0V/u8bgEtB7cUOzzhMSbFdL4N/vdAPBL9s93j/jCTZ+lg7TWXxDm9y7BPSWOuagrFjA5uUHixKbJ9EwY7JHyCCNqQ7uGDOaMgzo73TItM/LciFd/EJGVC0+a648PoTxeRm/A5Rn5KIejqilra9E86CXGXSMwF3cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704868; c=relaxed/simple;
	bh=wY2rXlF9lNnn5R10zAhDvzddR0b8o48odmpoov1tV7A=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBQRkGaEdl95YU9iIk04EqWnFgIgugW+DfHo4KQaZ3bo2/xSOsV6r2ryyrndRymbT2wCsHcakMz2DeG8AMwjZdZKrj4G744GFc4MvuNSKxGA+aXAGKKiDZfwHmad0vggMDNDYkQ4w7a8t1b57w7L+CbwV+ob/dvYaQycWKH2zbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZtVg63KzCz6L5VR;
	Thu,  8 May 2025 19:45:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 95D9C140121;
	Thu,  8 May 2025 19:47:36 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 8 May
 2025 13:47:34 +0200
Date: Thu, 8 May 2025 12:47:33 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, "Derek
 Kiernan" <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd
 Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, "Saravana Kannan"
	<saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, "Mark Brown"
	<broonie@kernel.org>, Len Brown <lenb@kernel.org>, Daniel Scally
	<djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-acpi@vger.kernel.org>, Allan Nielsen
	<allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-cxl@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang
	<dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, Vishal
 Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v2 09/26] cxl/test: Use device_set_node()
Message-ID: <20250508124733.00001208@huawei.com>
In-Reply-To: <aBt38JR-YGD5nnC4@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-10-herve.codina@bootlin.com>
	<aBt38JR-YGD5nnC4@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Wed, 7 May 2025 18:10:40 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, May 07, 2025 at 09:12:51AM +0200, Herve Codina wrote:
> > The code set directly dev->fwnode.
> > 
> > Use the dedicated helper to perform this operation.  
> 
> ...
> 
> > @@ -1046,7 +1046,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
> >  {
> >  	device_initialize(&adev->dev);
> >  	fwnode_init(&adev->fwnode, NULL);
> > -	dev->fwnode = &adev->fwnode;
> > +	device_set_node(dev, &adev->fwnode);
> >  	adev->fwnode.dev = dev;
> >  }  
> 
> This code is questionable to begin with. Can the original author explain what
> is the motivation behind this as the only callers of fwnode_init() are deep
> core pieces _and_ this only module. Why?!
> 

More likely to happen if CXL folk are +CC.  Added.

Dan, maybe one for you?

