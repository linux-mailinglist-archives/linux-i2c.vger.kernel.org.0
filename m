Return-Path: <linux-i2c+bounces-5835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E8961865
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 22:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 530E81F23E5B
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 20:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FD21D2F59;
	Tue, 27 Aug 2024 20:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="ruw6XIlc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx06lb.world4you.com (mx06lb.world4you.com [81.19.149.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5281CDA26
	for <linux-i2c@vger.kernel.org>; Tue, 27 Aug 2024 20:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724789611; cv=none; b=RW2K67q6A9JyrOwkY8GTRNtp4vViDqL03rse2MmXE/bKt8vxlWSErxrMdBhnVE9ruafOJp8mjT0qxZxrwY/WyHTjPWKPeJwzCpLjOjXBoRGSi5RplR+Gpak6srwa8kMR0DEtXLmSlr7lGsuxUGdL5dOeQTI7wN+QS1s8d0IWEYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724789611; c=relaxed/simple;
	bh=c3sg/ITqoP+errflPHrVGUED2QC3cZ2KUQCHR0cNhm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YhdjZs/ABKLPZ3M6cnFqUSFnpToVdphMqNp+c+zDNPd0ycfabNVR4zMHjVRIUjMrwRnuZr5QGjx+NzVjV8TJdtsJGaxWegSiLpN8ZyL9VQICt0m2AE9yuDGUoBVRsc/+iTdc92CzSqvmq00l16Tp7+YOqiCadwVDn+bdPTKLjeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=ruw6XIlc; arc=none smtp.client-ip=81.19.149.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2WfpdpVs9mhawt3eLD80e1S8mRDXsmJUOTYCPf871Os=; b=ruw6XIlcg9EmIJ7Sj73Qv1q6f+
	dVlB3KsvRs9Ru+C0cVC4ZQnfqxyPdbCqlXvlbakMOV50pbz5C0hvQo5mjWYDeyLTjzIinRV6bYyad
	fS3NatLFOenBn7/GoiJQ/g6xJZpmXsRdUzARSEN6JmeqBFHIe+pHHlgZqbHhptGMVfG8=;
Received: from [88.117.52.244] (helo=[10.0.0.160])
	by mx06lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sj0if-0005o3-0N;
	Tue, 27 Aug 2024 20:15:05 +0200
Message-ID: <d2fa7404-1269-4281-9e78-f8b780f0129f@engleder-embedded.com>
Date: Tue, 27 Aug 2024 20:15:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] I2C controller support for KEBA PLCs
Content-Language: en-US
To: linux-i2c@vger.kernel.org, andi.shyti@kernel.org
References: <20240809052303.4933-1-gerhard@engleder-embedded.com>
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <20240809052303.4933-1-gerhard@engleder-embedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 09.08.24 07:23, Gerhard Engleder wrote:
> KEBA PLCs use a PCIe FPGA to implement several functions in a common
> way. This is a first step to include basic support for this FPGA.
> 
> Under drivers/misc the cp500 PCI driver is added. This drivers creates
> auxiliary devices for every function inside the FPGA. As a first step it
> only creates auxiliary devices for the I2C controllers.
> 
> The I2C controller driver is added under drivers/i2c/busses like all the
> other I2C controller drivers.
> 
> This patches enable access to the EEPROMs and to the hardware monitoring
> chip of KEBA PLCs.
> 
> v5:
> - simplify (ret != 0) (Andi Shyti)
> - change KI2C_RECOVERY_CLK_CNT to (9 * 2) (Andi Shyti)
> - change KI2C_RECOVERY_NDELAY to KI2C_RECOVERY_UDELAY (Andi Shyti)
> - rework reset while loop to for loop (Andi Shyti)
> - use dev_err() for errors (Andi Shyti)
> - don't define int i within for loop (Andi Shyti)
> - use else if within read loop (Andi Shyti)
> - remove unnecessary parenthesis of (ret < 0) ? ... (Andi Shyti)
> - reduce ki2c->client_size in case of failed device registration (Andi Shyti)
> - don't use ',' after delimiters (Andi Shyti)
> - remove platform_data from comment
> 
> v4:
> - first patch removed because it is already merged and part of 6.11-rc1
> 
> v3:
> - first patch is already merged to char-misc-next by Greg KH
> - add AUXILIARY_BUS Kconfig dependency
> - don't declare int i within for loop (Andi Shyti)
> - enable I2C controller as late as possible (Andi Shyti)
> - use devm_i2c_add_adapter (Andi Shyti)
> - add KI2C_CONTROL_DISABLE (Andi Shyti)
> 
> v2:
> - use aux bus (Greg KH)
> - add Documentation/ABI/ entry for version and keep_cfg sysfs files (Greg KH)
> - use sysfs_emit (Greg KH)
> - add some information about I2C controller in commit message (Andi Shyti)
> - remove old copyright line (Andi Shyti)
> - sort header alphabetically (Andi Shyti)
> - rework register defines as suggested (Andi Shyti)
> - fix block comment style multiple times (Andi Shyti)
> - add comment that IN_USE bit is a semaphore (Andi Shyti)
> - add comment that IN_USE bit polling sleeps (Andi Shyti)
> - addr as first argument of ki2c_wait_for_bit() (Andi Shyti)
> - avoid compact style for register flag check (Andi Shyti)
> - move bus reset dev_err's to reset implementation (Andi Shyti)
> - use dev_err_probe() (Andi Shyti)
> - fix 'ki2c_devtype defined but not used' (kernel test robot)
> - fix 'WARNING comparing pointer to 0', twice (kernel test robot)
> - fix 'Using plain integer as NULL pointer' (kernel test robot)
> - fix 'symbol cp035_devices was not declared. Should it be static?', 3 times (kernel test robot)
> 
> Gerhard Engleder (1):
>    i2c: keba: Add KEBA I2C controller support
> 
>   drivers/i2c/busses/Kconfig    |  11 +
>   drivers/i2c/busses/Makefile   |   1 +
>   drivers/i2c/busses/i2c-keba.c | 598 ++++++++++++++++++++++++++++++++++
>   3 files changed, 610 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-keba.c
> 

Hello Andi,

are there any reasons why this patch does not make any progress?
Did I miss something? Or is it hanging just because of holiday season?

Thanks,
Gerhard

