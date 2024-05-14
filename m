Return-Path: <linux-i2c+bounces-3489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4D8C56B7
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2024 15:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7861BB217A4
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2024 13:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95B614430E;
	Tue, 14 May 2024 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZnqWVaoX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A3455C36;
	Tue, 14 May 2024 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715692542; cv=none; b=eQz6maV0HJlOgVtSC2/Li9NPbE+cLkDRVnTiT8fqe4dajDH5V4/UGWaaILcb2QFN7r+syqVWomWU5R6vepar1h5bW5NjNkONr0qdwTRTjdTs4QhP3KmjIben1sH0UDjM0l7awIx3Jg6TQdwj0aIKBPPMoKL3Lj4cZuz4ZoBdC4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715692542; c=relaxed/simple;
	bh=DKXSl2fJUbIXFw2H4Ort5sM2RiJbkna9cmj1WYKqJtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjADsDCklrmfZWIUpbcY95MguD8jnX2hgVXSvuCN7BrYRC8sOZ8XOgvWy4SAAbkiyGwrhSMMk8hc9N0hxBGo1hjELi3ryxGN5wfLTnrEwelWEygyD94lIaXjMZQLpCI+SPCWFyAKC55ShHOHZAeAiCwfLTRFmOqxm1xW4PYLx/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZnqWVaoX; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46AEF1BF210;
	Tue, 14 May 2024 13:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715692537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pc/gRfiTuzZ5RPyjwYBjvgMJyRnkMP8vwPGwGwzIh8Y=;
	b=ZnqWVaoXCMXFIbdg04aEVwpQG9lCPWSBd/cUpysvbjOO6qSMVxcdWn9y8U3ll9Aw2lEaLb
	lxnOh12VLederDvkZgQGlxfRdCTpLux3/c7rCnxXPU+eEq/wk5kA4jF+/E7UoOCRFWoLkW
	Z285enE+GdIoP9DYsWUUnX49bSzhifHAK285WsVkwDk6Rovxcg9fYXFT2MlrqQO0bJR5B0
	QuAQvLN8XL4IpgP28nIwy3MGPYBXW80M+pvGZB6bxJImGXS2cg9x8HLYbwzJG5o9if0HgS
	oiWrRcXZvmq+VmYUUeCva144eM8jwi+nKiFrP6bT4Mj9xuLqGj96mee3Ey4a3A==
Message-ID: <56b2bbcb-7181-4640-93b3-0cf3e2029367@bootlin.com>
Date: Tue, 14 May 2024 15:15:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] PCI: cadence: Extract link setup sequence from
 cdns_pcie_host_setup()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
 <20240102-j7200-pcie-s2r-v5-5-4b8c46711ded@bootlin.com>
 <111df2a5-7e05-480c-a5a5-57cf8d83c0d0@moroto.mountain>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <111df2a5-7e05-480c-a5a5-57cf8d83c0d0@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 4/16/24 16:16, Dan Carpenter wrote:
> On Tue, Apr 16, 2024 at 03:29:54PM +0200, Thomas Richard wrote:
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
>> index 5b14f7ee3c79..93d9922730af 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
>> @@ -497,6 +497,30 @@ static int cdns_pcie_host_init(struct device *dev,
>>  	return cdns_pcie_host_init_address_translation(rc);
>>  }
>>  
>> +int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>> +{
>> +	struct cdns_pcie *pcie = &rc->pcie;
>> +	struct device *dev = rc->pcie.dev;
>> +	int ret;
>> +
>> +	if (rc->quirk_detect_quiet_flag)
>> +		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
>> +
>> +	cdns_pcie_host_enable_ptm_response(pcie);
>> +
>> +	ret = cdns_pcie_start_link(pcie);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to start link\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = cdns_pcie_host_start_link(rc);
>> +	if (ret)
>> +		dev_dbg(dev, "PCIe link never came up\n");
> 
> If we're going to ignore this error the message should be a dev_err()
> at least.

Hello Dan,

In fact it could not be really an error.
If you physically don't have a device on the PCIe bus,
cdns_pcie_host_start_link() will not return 0.

So if we use dev_err(), we will always have the error if there is no
device on the PCIe bus.

Regards,

Thomas

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


