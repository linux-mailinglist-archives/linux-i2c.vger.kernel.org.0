Return-Path: <linux-i2c+bounces-11830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9710AF93BC
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0FCB16D101
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 13:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD442F9494;
	Fri,  4 Jul 2025 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NHe2yd9m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33ED2F85D1;
	Fri,  4 Jul 2025 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634589; cv=none; b=ZFoCEQz1MSOY7P+erlRz0xReTR0kNwZIvSRiJqtN2JyPePPvnBc9Rf6k9CoIpP3sxz5/7ui3mo4eAp9oznj4A/F7uOhxBvO/6XrJ5zUVh33Rqm7lQsNnAFrErVnh5NM9urBiDK5PLxjH2FC/w9f93tdeLI4tmQGMCBhtB3CTTC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634589; c=relaxed/simple;
	bh=vQnRujYKxlmzaQhMBbm5+UCxMR5wuiujeHB+FFYJW5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EcL3YsvdvXNycN0BWDzsgxD1v5P9vAfF5wcX6lEe5Goh9MiObBVTUTF3jd7k7cg0IYGeES9g9KN5OvLF0b0iS5lSg5mcpGJHKKgCF1BkQUlIFGaPOl+QYuR6kvjVt9Yrt+1JLqV/Dtx/9vsFmyF2BPdDKci8eJaBb4DN91nAN8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NHe2yd9m; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564CYv65012818;
	Fri, 4 Jul 2025 15:09:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	V4CgzvQiInbe8bc3VV3PcAVGmZbXimShPwMNviMcn6Q=; b=NHe2yd9m470sdg9H
	NHs26SleVaFuy/p54nAVaL9c8Ape8CbpgMEnrfV87HUKUirsnpaqxq5v8pkNVSka
	ZCvqnuh2rtJjKdlehg5NSsGb4Tcf0nauSz9MLoI2DapPVM/CBUVuZKulJ96ZOQp+
	yWgEAme1KP4HWewoxOUOlhYu4QdYybF0GidBYmU/IIGR5yc0PfV3O8RGxSQu+ioq
	OmiCZn1ihYllNwZrgB5Cq5hFM/FWIGXfrvrsWaiMAVIzePMTDrl7Pgs3DrcIkG4o
	zX63VhphJb8bU+fOUNXfiezDBgP1uIACdiD3fY1bdItdds44z5Zf1vQgCFsIwISq
	K/GG5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmnkws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 15:09:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0CD6840046;
	Fri,  4 Jul 2025 15:08:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9343B51B49;
	Fri,  4 Jul 2025 15:08:23 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 15:08:23 +0200
Message-ID: <304da1be-c0de-475e-92be-ef7a9727e281@foss.st.com>
Date: Fri, 4 Jul 2025 15:08:22 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: busses: Use min() to improve code
To: Qianfeng Rong <rongqianfeng@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <opensource.kernel@vivo.com>
References: <20250619142609.323082-1-rongqianfeng@vivo.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250619142609.323082-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01



On 6/19/25 16:26, Qianfeng Rong wrote:
> Use min() to reduce the code and improve its readability.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/i2c/busses/i2c-st.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 750fff3d2389..3373a828b5a0 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/minmax.h>
>  
>  /* SSC registers */
>  #define SSC_BRG				0x000
> @@ -422,10 +423,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = c->count;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
>  
>  	for (; i > 0; i--, c->count--, c->buf++)
>  		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
> @@ -452,10 +450,7 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = max;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
>  
>  	for (; i > 0; i--, c->xfered++)
>  		st_i2c_write_tx_fifo(i2c_dev, 0xff);


Hi Qianfeng

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

