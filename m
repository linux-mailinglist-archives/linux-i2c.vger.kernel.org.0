Return-Path: <linux-i2c+bounces-2979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954E8A70CE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 18:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6143B25394
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 16:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F031C131BDD;
	Tue, 16 Apr 2024 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hxAl+vKX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C213119E;
	Tue, 16 Apr 2024 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713283314; cv=none; b=HWgjU4pspXf1kFToRMjYClCfGVjuYPiX6JUlPu2u2ZLFJxxMxjz48ncNj8dYyX3ngEBwBpOtepyN3yiOnY8iVBqG+GjBBIpopMzYjbVi0VVz8/AFfFTBpxYhQQpCND8VuYGisYcT3pRDlnznoKfw5FIBzdCvU1VVQLpq1TbJvts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713283314; c=relaxed/simple;
	bh=CIIWnHafYS85G8cd9e60rj7Vkph8QEAZkp+usIKi/X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQhvUCUROgCZ2iqGMsyopKKx7ywpFylGgmEBpw/VXzoPSEZv9M3RDRGZG66zDHgVORilaLZj3lY501qSO90g2/zpIVXSMOkAMtQXsbcR67NkPRTdgplzs6KY9SpqGRT4SdaOAUJd9ZYNEoyN50gJlyElj+9nfaZO+JXCjgESHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hxAl+vKX; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A265C0008;
	Tue, 16 Apr 2024 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713283303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7lcnqaRazFwJFVK5/WHOD289rB7ddonTK7K7dl1R7o=;
	b=hxAl+vKX+Mf28jmCLqp3EiKVxs99qWvy6NWTthAfL/1rQYtCSESgYzQEgIcs9JNjpuyKag
	cgtHErhGAkaYL237+kfmsg1uL1hzBndwQT6uMSnnFHEAXzLfXg0Rjqh4Afm+iKRTPKDZPq
	if3ChBmix4sTpHn2V5XYpZa0lCIGhLOgnwjCyKWlpu2E4PBgu50gjLbDYD3/5/W0Su88cO
	rzfckWPAUlM+xsXn6dBgX34WOOFUm3dd4PnZ7+780r/AZu4gbz/Rf/hz1zDQZHQxpQOFf5
	CXQ1lFvZNiUf3xCdT7bRFM7WkpkM3Fgb2RSq88sn8cnTOfMbv+he40GgOokbkQ==
Message-ID: <fcd7b616-07e0-45a3-b14a-d0c194d58a86@bootlin.com>
Date: Tue, 16 Apr 2024 18:01:38 +0200
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

In fact we already ignore this error [1]
I only moved the hardware configuration part of cdns_pcie_host_setup()
into a new function cdns_pcie_host_link_setup().

But I can use this patch to switch to dev_err() if needed.

[1]
https://elixir.bootlin.com/linux/v6.9-rc4/source/drivers/pci/controller/cadence/pcie-cadence-host.c#L549

Regards,

Thomas


