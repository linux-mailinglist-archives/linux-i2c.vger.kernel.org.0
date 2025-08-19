Return-Path: <linux-i2c+bounces-12335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5151B2B773
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 05:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 683B01B28784
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 03:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95A82D248D;
	Tue, 19 Aug 2025 03:13:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85B2D248A
	for <linux-i2c@vger.kernel.org>; Tue, 19 Aug 2025 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755573220; cv=none; b=B5L51Y/m2qyYhwHE/HJcqJWkuxA78WscPVRqJwauZkG7Y3+9+IKdtrAbCRpLWvvaEusOaLMlFknwWfyJ49CYZw0ZiAJbPzUU+PlIVxD+D5szCZZKCIUzVI9hkZE1qhMORQScQa+98HqVLmxGtCKVDnjGEHA9HX45MAApIFw4Eso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755573220; c=relaxed/simple;
	bh=AhqEGoHRSke4sM4TJfS6cuBwp9/MCi+cBr1hDMWpLRM=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tKKe1UA+ztrJKpI9bqh8b2uob2Wmdr1aeJsoQfsmy64RG7VjUOBuCCV4QbJUQSsYZ6dDaATeey/cBJBA5KxtqR7kgy6DLYR5EK2bEx8TMIQvPL3Yr3lqCVMPSxGPGQuSdoJG8+c5X5/sT0OV98AgoGjn71k8OzaTxN190+fHY7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c5ZN05jHhz2gKsV;
	Tue, 19 Aug 2025 11:10:40 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 56B6B1A0190;
	Tue, 19 Aug 2025 11:13:33 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 11:13:31 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 11:13:31 +0800
CC: <yangyicong@hisilicon.com>, <linux-i2c@vger.kernel.org>,
	<prime.zeng@huawei.com>, <liuyonglong@huawei.com>, <kangfenglong@huawei.com>,
	<lujunhua7@h-partners.com>, <huyihua4@huawei.com>,
	<jonathan.cameron@huawei.com>
Subject: Re: [PATCH] i2c: MAINTAINERS: Update i2c_hisi entry
To: Devyn Liu <liudingyuan@h-partners.com>, <andi.shyti@kernel.org>
References: <20250819020349.4027842-1-liudingyuan@h-partners.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <d6d52e70-836b-35e6-69d7-96362239d059@huawei.com>
Date: Tue, 19 Aug 2025 11:13:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250819020349.4027842-1-liudingyuan@h-partners.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200018.china.huawei.com (7.202.195.108)

On 2025/8/19 10:03, Devyn Liu wrote:
> Because Yicong Yang will no longer work on
> i2c_hisi driver, update the maintainer
> information for i2c_hisi.
> 
> Signed-off-by: Devyn Liu <liudingyuan@h-partners.com>

Acked-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1b57dd4fcf01..26c8b8d60195 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11013,7 +11013,7 @@ F:	Documentation/admin-guide/perf/hns3-pmu.rst
>  F:	drivers/perf/hisilicon/hns3_pmu.c
>  
>  HISILICON I2C CONTROLLER DRIVER
> -M:	Yicong Yang <yangyicong@hisilicon.com>
> +M:	Devyn Liu <liudingyuan@h-partners.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  W:	https://www.hisilicon.com
> 

