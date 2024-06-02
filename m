Return-Path: <linux-i2c+bounces-3745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCD58D77AD
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 21:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 764C5B20F80
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 19:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371ED6F301;
	Sun,  2 Jun 2024 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="ixfDvuMW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08lb.world4you.com (mx08lb.world4you.com [81.19.149.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF716BFD5
	for <linux-i2c@vger.kernel.org>; Sun,  2 Jun 2024 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717358147; cv=none; b=UjcfgtKf/BAa4L9MIxdvjtKlf1J9xoOnKjUis4j9yVs+ARLiSBfnBSa7NdW19Qld2XF5w/FFt8D6HUD7Vz76l4lFt3V63EOiyjzjL1oXvYf2KVW3Auuok3dnvUwsUU22QebZTqThNa++Nzk1CgzSFRa/4psmxKqh7tEeoH9NNXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717358147; c=relaxed/simple;
	bh=8BiuaRrNCGS1HhO2l7i0UYCpBme5DuuM7YwmtEtfaak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNh+S1nlGlTQOCBv4op7orCD0hnduNdMOtm6knxCUVuXIDqNQG6kr//o8bAmuuMvjz3zb1P4ITbiB4I086H4w/fr2/8ZN14Y2bv0Iqdb/jYacybpgiE3s8RHlcHyAUwUNuTLjTSpRUcPddlx3eQUTgJoJuvydN2xHKkju++RXQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=ixfDvuMW; arc=none smtp.client-ip=81.19.149.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8cnVcEB1DcRNE8avQbQtDILDsY3DcMo5NSitp/huAyo=; b=ixfDvuMWqUWtekpoeGp8+1UYlX
	HwFTpjQwEmSE2mjV2yGgwmtIXaSlIC3w9fY/WrbWN95unL77NPqK5VWni0Yfinr2Uy27LN7exGpwa
	r+gZJcxqlupbxft7zpxjwMfEWFv/uNGhz094VoPg3/l7Nv5w8fgQ7k3ubTFSLtOJLi5A=;
Received: from [88.117.63.44] (helo=[10.0.0.160])
	by mx08lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sDqQI-0000SF-1H;
	Sun, 02 Jun 2024 20:59:18 +0200
Message-ID: <147b3d46-3c01-4e73-8e9e-59f5b61fd54a@engleder-embedded.com>
Date: Sun, 2 Jun 2024 20:59:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] misc: keba: Add basic KEBA CP500 system FPGA support
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-i2c@vger.kernel.org, andi.shyti@kernel.org, arnd@arndb.de,
 Gerhard Engleder <eg@keba.com>
References: <20240601192846.68146-1-gerhard@engleder-embedded.com>
 <20240601192846.68146-3-gerhard@engleder-embedded.com>
 <2024060203-impeding-curing-e6cd@gregkh>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <2024060203-impeding-curing-e6cd@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 02.06.24 09:19, Greg KH wrote:
> On Sat, Jun 01, 2024 at 09:28:46PM +0200, Gerhard Engleder wrote:
>> From: Gerhard Engleder <eg@keba.com>
>>
>> The KEBA CP500 system FPGA is a PCIe device, which consists of multiple
>> IP cores. Every IP core has its own platform driver. The cp500 driver
>> registers a platform device for each device and the corresponding
>> drivers are loaded by the Linux driver infrastructure.
> 
> Please use the aux bus code for this, not the platform driver code.
> That's what the aux bus is explicitly for, platform devices are NOT
> meant to hang off of a PCIe device at all.

Thank you for that advice! I was not aware of aux bus, but it seems to
be a good fit.

>> Currently 3 variants of this device exists. Every variant has its own
>> PCI device ID, which is used to determine the list of available IP
>> cores. In this first version only the platform device for the I2C
>> controller is registered.
>>
>> Besides the platform device registration some other basic functions of
>> the FPGA are implemented; e.g, FPGA version sysfs file, keep FPGA
>> configuration on reset sysfs file, error message for errors on the
>> internal AXI bus of the FPGA.
>>
>> Signed-off-by: Gerhard Engleder <eg@keba.com>
>> ---
>>   drivers/misc/Kconfig       |   1 +
>>   drivers/misc/Makefile      |   1 +
>>   drivers/misc/keba/Kconfig  |  12 +
>>   drivers/misc/keba/Makefile |   3 +
>>   drivers/misc/keba/cp500.c  | 433 +++++++++++++++++++++++++++++++++++++
>>   5 files changed, 450 insertions(+)
>>   create mode 100644 drivers/misc/keba/Kconfig
>>   create mode 100644 drivers/misc/keba/Makefile
>>   create mode 100644 drivers/misc/keba/cp500.c
> 
> You create sysfs files for this driver, yet there is no
> Documentation/ABI/ entries for it?  Please do so in your next version of
> this series.

I will do so.
>> +static ssize_t keep_cfg_show(struct device *dev, struct device_attribute *attr,
>> +			     char *buf)
>> +{
>> +	struct cp500 *cp500 = dev_get_drvdata(dev);
>> +	unsigned long keep_cfg = 1;
>> +
>> +	/* FPGA configuration stream is kept during reset when RECONFIG bit is
>> +	 * zero
>> +	 */
>> +	if (ioread8(cp500->system_startup_addr + CP500_RECONFIG_REG) &
>> +		CP500_RECFG_REQ)
>> +		keep_cfg = 0;
>> +
>> +	return sprintf(buf, "%lu\n", keep_cfg);
> 
> sysfs_emit() for all sysfs show functions please.

sysfs_emit() will be used.


Thank you for your feedback!

gerhard

