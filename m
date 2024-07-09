Return-Path: <linux-i2c+bounces-4792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676292B855
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 13:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 015B02827E0
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 11:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CD7157A6C;
	Tue,  9 Jul 2024 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="r15hD5H3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73255E4C;
	Tue,  9 Jul 2024 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720524792; cv=none; b=SgG2vyJya8PNgFPThZaE8nKCIPhbv9T9cg4Zrn4MgUdMAzo7P+ZirNos4V98JbTUg+IUv9KDRhKN+bpXYSrN1nyMDKuPIKkY5bNP6X70sE4pf3M9pifAb1ctIlaXQRsn94iv8Kc3ta51zDpiqpGsE22s4ZGCoRpsxKjsOq8q96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720524792; c=relaxed/simple;
	bh=lBtZOkfJyPcpzXO8Qc1kG/ymRCLuDT5d0JAGRrfTtQ4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAbapoWDQG3a1/qy0dnrE8wKWK8n2qgQCgyGJFHoq1CRj5kEHbVkHh6sH6+BGpTPg+wGwnzQjtGl3seRtVa7Yp/bHTdTsfOULt0NQw486JIgJlqtc2Qsz1VU8ga5hGw/iNMi1X19G0hhCsn/izjAcd9HSaOf6XcUmtotcqwsWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=r15hD5H3; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4696pDix011130;
	Tue, 9 Jul 2024 13:32:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=/S6wJW9F8VTUvVvLuJOhhpUi
	VKNmEzWE/It5IEUxaQk=; b=r15hD5H30b3XfB5p1l9PU/nofzObR3/VQv8Xf5S5
	r145yX84W9UzW6RRWdm0IRTdpKXMh60Fcq0CpAkQFv2/xTGdgvdLv+Ml/n5L2wyN
	otO509vQwl31nSe3ZvC+p4TJSY3G1qc0bNwFOMkZBkHdcCfGRdBZC+AVEInsa5W+
	Wwa/0zakjeWHvwwpFTpJ72L3NYDN8yAllaZxwpL/qR4XhRM+EIfqUUd0YNrw9t+p
	+irDdr8BU6xz7dmhZ0Zt4JJJRM3XQJU8T8p9vlSoLcvZ0c/Ae5SHCUMr9RomwJ59
	2cc7LEdhnmgGfylfWoJf5DGH5ztT0xgJVn5nvljRRRCSjg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 407gvhs407-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:32:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E0FA40045;
	Tue,  9 Jul 2024 13:32:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36ABF21ED54;
	Tue,  9 Jul 2024 13:32:22 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jul
 2024 13:32:21 +0200
Date: Tue, 9 Jul 2024 13:32:16 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 47/60] i2c: stm32f4: reword according to newest
 specification
Message-ID: <20240709113216.GA57449@gnbcxd0016.gnb.st.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-48-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-48-wsa+renesas@sang-engineering.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-08_01,2024-05-17_01

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:47PM +0200, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index f8b12be6ef55..230fff0c0bf9 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -95,7 +95,7 @@
>  
>  /**
>   * struct stm32f4_i2c_msg - client specific data
> - * @addr: 8-bit slave addr, including r/w bit
> + * @addr: 8-bit target addr, including r/w bit
>   * @count: number of bytes to be transferred
>   * @buf: data buffer
>   * @result: result of the transfer
> @@ -480,7 +480,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>  
>  /**
>   * stm32f4_i2c_handle_rx_addr() - Handle address matched interrupt in case of
> - * master receiver
> + * controller receiver
>   * @i2c_dev: Controller's private data
>   */
>  static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
> @@ -643,7 +643,7 @@ static irqreturn_t stm32f4_i2c_isr_error(int irq, void *data)
>  
>  	/*
>  	 * Acknowledge failure:
> -	 * In master transmitter mode a Stop must be generated by software
> +	 * In controller transmitter mode a Stop must be generated by software
>  	 */
>  	if (status & STM32F4_I2C_SR1_AF) {
>  		if (!(msg->addr & I2C_M_RD)) {
> @@ -749,7 +749,7 @@ static u32 stm32f4_i2c_func(struct i2c_adapter *adap)
>  }
>  
>  static const struct i2c_algorithm stm32f4_i2c_algo = {
> -	.master_xfer = stm32f4_i2c_xfer,
> +	.xfer = stm32f4_i2c_xfer,
>  	.functionality = stm32f4_i2c_func,
>  };
>  
> -- 
> 2.43.0
> 

