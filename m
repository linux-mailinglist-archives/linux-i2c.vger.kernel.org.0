Return-Path: <linux-i2c+bounces-10919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC0AB2077
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 02:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B05097B505F
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 00:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F7C3594C;
	Sat, 10 May 2025 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NrnMwztr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37251D6AA;
	Sat, 10 May 2025 00:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746836337; cv=none; b=i6Ll6UWYWsr3JE1Ebo6Cz4veubXJ1KUEb9CfUY4VPcgTi9gSPKEtcbIoDO/XWNsTUUfp2+NsR1fFtOf+/Nosz16gy7A22/mUW/iufFRahcIh2LAFFjDuQUNtHTKGwzwlwqA5MGc0E1HnfeE3245Ov1A48ID3K0p93MkJjngX+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746836337; c=relaxed/simple;
	bh=lsLtnFSVphBZGRaEOpHYnW/43K3L3GszCrMpsXdOAAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cb3/FtmR3dpfSKCxfba0XQ8KSCGSS5YfeI4mrTpze4G06IfuZbaaS53RqYGF4dlCwppvKDi12VnCBnfEDn1yR7FtjOFt/5FHgaTcc2Dj5XGfq8HjI8EbQMIyaN7itTL/+reyJURhgJUyPa/izRZrq//9cgeyVsHDW4qFOMvLFoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NrnMwztr; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JxEjBAQahXn7jOCRVGcyOqQ96R/5yhjHGXWRQR573Kg=; b=NrnMwztrylTNvdmJfJ9q0Qh+I6
	K8qZyCmISUX3nEEtgcOFP1QVwEkkU7Vn3JE5kkZvfjsSlYFUtC3rZrbwhmD7AkH+FFenzHL8sfF+y
	hdHgK/hqqNxe+pLxAaSXg0g5i5XI5DhKGudPqXbfQ2pLuG1Ed7rYl8AKWdc6vgiSzeZT5H6fMtXLg
	74mAF3AbRGaZsXoVPKK1tP4v9ADylxl3mcO1b7DJqP6VKQoIDpfAZy4vUt7NA1f2CIDomqVT2ssK9
	MuuhwTXyWAtics6zMrlC27a9SF/y1896pKxCbh3OMohIp+f7e7llOWbcs+Lwc3eK1D+Ku30oATR5A
	nZptyVvw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDXvU-0000000GO9z-0NBe;
	Sat, 10 May 2025 00:18:48 +0000
Message-ID: <a4e821f9-9daa-4a65-b41a-200a6da85191@infradead.org>
Date: Fri, 9 May 2025 17:18:40 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 9 (i2c/busses/i2c-mlxbf.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 linux-i2c@vger.kernel.org
References: <20250509195816.7f0a67a3@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250509195816.7f0a67a3@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/25 2:58 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250508:
> 

on i386:

ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_set_timings':
i2c-mlxbf.c:(.text+0x67): undefined reference to `__udivdi3'
ld: i2c-mlxbf.c:(.text+0x8a): undefined reference to `__udivdi3'
ld: i2c-mlxbf.c:(.text+0xc7): undefined reference to `__udivdi3'
ld: i2c-mlxbf.c:(.text+0xeb): undefined reference to `__udivdi3'
ld: i2c-mlxbf.c:(.text+0x112): undefined reference to `__udivdi3'

ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_calculate_freq_from_tyu':
i2c-mlxbf.c:(.text+0x194): undefined reference to `__udivdi3'
ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_calculate_freq_from_yu':
i2c-mlxbf.c:(.text+0x1e0): undefined reference to `__udivdi3'

These come fromm using '/' instead of one of the kernel's DIV macros when using
u64 or ULL  data types.

in mlxbf_i2c_get_ticks():

	ticks = (nanoseconds * frequency) / MLXBF_I2C_FREQUENCY_1GHZ;

in mlxbf_i2c_calculate_freq_from_yu():

	corepll_frequency = (MLXBF_I2C_PLL_IN_FREQ * core_f) / MLNXBF_I2C_COREPLL_CONST;
	corepll_frequency /= (++core_r) * (++core_od);

in mlxbf_i2c_calculate_freq_from_tyu():

	core_frequency /= (++core_r) * (++core_od);


commit 37f071ec327b0 ("i2c: mlxbf: Fix frequency calculation")


-- 
~Randy


