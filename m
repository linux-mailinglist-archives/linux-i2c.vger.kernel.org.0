Return-Path: <linux-i2c+bounces-1566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D48844F08
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 03:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9636EB28467
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 02:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7F92C681;
	Thu,  1 Feb 2024 02:12:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C6E288DB
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 02:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706753537; cv=none; b=etVyJiMZOiEOCdyDMaYjRxAw9wIH04F6hSwjQ0iosTRYWjZ9A1DWRwSAq/JN642rTUgEtdZ2h4ju701lPPNKu8JTnL4b1+o4YSvpqRAy/IYNmu/ahhtwARrgfoUC5NR/HtPJngokDIli8ZLczLHfOOlz8myQI/ijvJwkXHLakLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706753537; c=relaxed/simple;
	bh=JIal9OIS2u/MGiZKuSmGjtx5K7OWQ1+DwYLoFNoy4fg=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=K/PhuKzHLpTBldxk/Ibq7DO4qOOB9HIqQdDtlZL5G+K+xy03SpU4qoFSi0xsbnCrQkW2ASupDv7ZRruZigKlgdA0bzbqNzsCNRpTxL58JJEzDfycmUglbFamR4Ffo8U6xboZXb7gF56TLlEqO3giqLaQbxNEcCzaz/lovrt0wwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TQMpl6MvgzLnbC;
	Thu,  1 Feb 2024 10:11:43 +0800 (CST)
Received: from canpemm500009.china.huawei.com (unknown [7.192.105.203])
	by mail.maildlp.com (Postfix) with ESMTPS id 786CC18006A;
	Thu,  1 Feb 2024 10:12:10 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 10:12:10 +0800
CC: Devyn Liu <liudingyuan@huawei.com>, <yangyicong@hisilicon.com>,
	<f.fangjian@huawei.com>, <jonathan.cameron@huawei.com>,
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH]i2c: hisi: Clear the interrupt status and optimize writing
 limitation
To: Andi Shyti <andi.shyti@kernel.org>
References: <20240123080222.1512009-1-liudingyuan@huawei.com>
 <bcprziyqs7cze34j52z4uplxjdqtlvdgat32us347wgb4hv4gm@rtmqlz4c6ie2>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <2e0660cf-e4c7-d905-d5d6-edf0a0079d7a@huawei.com>
Date: Thu, 1 Feb 2024 10:12:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <bcprziyqs7cze34j52z4uplxjdqtlvdgat32us347wgb4hv4gm@rtmqlz4c6ie2>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)

On 2024/2/1 6:47, Andi Shyti wrote:
> On Tue, Jan 23, 2024 at 04:02:20PM +0800, Devyn Liu wrote:
>> Devyn Liu (2):
>>   i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth
>>     - 1
>>   i2c: hisi: Add clearing tx aempty interrupt operation
> 
> The series looks good to me.
> 
> Yicong, any thought?
> 

Sorry for finding this late. Generally looks good to me as well and just replied.

> Thanks,
> Andi
> 
>>
>>  drivers/i2c/busses/i2c-hisi.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.30.0
>>
> .
> 

