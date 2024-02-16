Return-Path: <linux-i2c+bounces-1831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAFD857B5C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 12:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 262D4285035
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 11:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D276859B55;
	Fri, 16 Feb 2024 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xnjqB70R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B459B42;
	Fri, 16 Feb 2024 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708082230; cv=none; b=pr/N3PyBtvZnZBungHjeMgIsuQNT/lWMvrGhxeekkVGfGa1Uq0N3bdh3Wn1AIgjA4q2aM9OgAo4JNq+A/9bPGtlpJQS+xmzRVdvHrOLu5uDbE3D7ucXxYuKBmCYOZphMW4YKeMaF3dZkdQPqhYjtO5ns++Kwdvlr4W1ZGhFnEyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708082230; c=relaxed/simple;
	bh=/WroAcfP5qG7Ht8rBeZ30Rehc+ZEdMafXSdz1qut0Qk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K45RLyH1aOHxLhEI3GguC9frUSpT2AauTdgysZCp/kJsV48ZTLr+U5tmJnNeVLiJkYglOjHCsUe08xfRHgA7J6ZGpmEn7MY21l5bMs/1KmCkHqiGvu8r7F0LeWHNSG6tazkZMku5TC+Yg4I6ayylO6Z122fksb6igt8zC2zhXTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xnjqB70R; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41GBGYwO083346;
	Fri, 16 Feb 2024 05:16:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708082194;
	bh=nDk2WfWJt2aWSEBbueJOkQd7RmDzKK1+hpo9/zydDDU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xnjqB70RZei0K4O+rcT6eO2ST3qLKTEhl14fwgXrQ/PjR0cJd047YBlktyZiFMTxN
	 kaE6WnDRU2uoAy6LBBf/cW5JbWMlYDuJH/sXEI9mWo/1w5XolypGO7ih9/EjTw5e3d
	 lmijIfCRv+JCRF+uEubu2vehX1u8irFGHmRiYRwA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41GBGYBh004264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Feb 2024 05:16:34 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 05:16:34 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 05:16:34 -0600
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41GBGXf7110209;
	Fri, 16 Feb 2024 05:16:33 -0600
Date: Fri, 16 Feb 2024 16:46:32 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Thomas Richard
	<thomas.richard@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
        Tony
 Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz
 Krzysztofik <jmkrzyszt@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>, Peter
 Rosin <peda@axentia.se>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham
 I <kishon@kernel.org>,
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
        <thomas.petazzoni@bootlin.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH v3 18/18] PCI: j721e: add suspend and resume support
Message-ID: <8d47e1d0-69a3-475e-8dd8-64514872e026@ti.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-18-5c2e4a3fac1f@bootlin.com>
 <aa791703-81d8-420c-ba35-c8fd08bc3f07@ti.com>
 <CZ6GG6OQUJTX.2OM5TC9YLOAXV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CZ6GG6OQUJTX.2OM5TC9YLOAXV@bootlin.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 24/02/16 12:09PM, Théo Lebrun wrote:
> Hello,
> 
> On Fri Feb 16, 2024 at 11:48 AM CET, Siddharth Vadapalli wrote:
> > On 24/02/15 04:18PM, Thomas Richard wrote:
> > > From: Théo Lebrun <theo.lebrun@bootlin.com>
> > > 
> > > Add suspend and resume support. Only the rc mode is supported.
> > > 
> > > During the suspend stage PERST# is asserted, then deasserted during the
> > > resume stage.
> >
> > Wouldn't this imply that the Endpoint device will be reset and therefore
> > lose context? Or is it expected that the driver corresponding to the
> > Endpoint Function in Linux will restore the state on resume, post reset?
> 
> This does imply exactly that. Endpoint driver must be able to restore
> context anyway, as system-wide suspend could mean lost power to PCI RC
> controller (eg suspend-to-RAM) or PCI rails (dependent on hardware).

Thank you for confirming.

Regards,
Siddharth.

