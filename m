Return-Path: <linux-i2c+bounces-11214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4584ACD008
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 00:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73CE0175D4D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 22:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109272528FD;
	Tue,  3 Jun 2025 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mrVR7gin"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F402C3253;
	Tue,  3 Jun 2025 22:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991041; cv=none; b=O9Z7VHP/A6oQ9ddg2RllgEl3rytkc36HYK/bwjruuyyClirjHks4Xy3YFeJQuixLRhJMogz1iNhorqWLoXQgohJ1BGIztzjSd30gmlrw8noxsjUo9+PlTXSKCRr8vHkTfuR9wj3Srn/YK9BhXOg/A+7IxmXjsgRoZObeMhubsXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991041; c=relaxed/simple;
	bh=JrGe4uBJahLz5YeQ0/N5/IVdiMkVsz+GX9RKuQgN51U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaTYJaoatbb6ZgdU96nfAAeJzoIl3kPbiY6gDT5ssgxEisNRh40C6jfI1VBBLWLpVsMBmge9UPucPGPWNhjGtCc43CispZ7q+FOBxONhq/ZZ0yghP0xt5TDr9A3Pvo2Hq66rCdE6YCeJY6jeoWS9aGBqrWyKFnFu3QncB01f7DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mrVR7gin; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=CZKj2AIR+080trTPaitatfhGvrcRO8PhQFCCLir9byA=; b=mrVR7ginH1lcP1LaUS+6BdevXX
	q1KhEnPSOMWVxU7QeIQZqxtpYFEflkQKmz+yQII5RFIpsoS6GXe8g9PF0xdt/f7ZC9CLqNjdeMrwX
	IZ6/Yy41LI3IfCmeeaYJiP8SHGsRtb8Td2X+QrHh8t9DbRsMNdPAeWMwmL9RJ+aVLPVYUpUmqgMEP
	qyHZ7H3aj/iz+V6ciQLfJUo2Vehvn+uBJmd4iCQEV7ulfbCizVkw2HcZb+ezs6FvfavM6k89MK2br
	HMhk+QXyPmr8DDhdij+uLFuZf5Ccz3v/RN21Fr9EvdiHcxbsz8jYEnlNdTRWp5RZb74yYxokJBLC6
	M9AiKREQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMaSm-00000002VyY-2lMY;
	Tue, 03 Jun 2025 22:50:33 +0000
Message-ID: <0993ec4e-c0cd-4e63-a0b3-3b9db0082279@infradead.org>
Date: Tue, 3 Jun 2025 15:50:28 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] i2c: designware: Initialize adapter name only when
 not set
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
 <20250603214611.3039787-2-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250603214611.3039787-2-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/25 2:40 PM, Pratap Nirujogi wrote:
> Check if the adapter name is already set in the driver prior
> to initializing with generic name in i2c_dw_probe_master().

That explains what but not why. Commits should also explain
why they are doing something.

> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


> ---
>  drivers/i2c/busses/i2c-designware-master.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c5394229b77f..9d7d9e47564a 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -1042,8 +1042,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  	if (ret)
>  		return ret;
>  
> -	snprintf(adap->name, sizeof(adap->name),
> -		 "Synopsys DesignWare I2C adapter");
> +	if (!adap->name[0])
> +		scnprintf(adap->name, sizeof(adap->name),
> +			  "Synopsys DesignWare I2C adapter");
>  	adap->retries = 3;
>  	adap->algo = &i2c_dw_algo;
>  	adap->quirks = &i2c_dw_quirks;

-- 
~Randy

