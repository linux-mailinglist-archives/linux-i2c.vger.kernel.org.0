Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37271397398
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 14:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbhFAMxS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 08:53:18 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22124 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232965AbhFAMxS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 08:53:18 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151CktPD021929;
        Tue, 1 Jun 2021 14:51:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jqYpN/UNu3odHWLK+8p7H6TTeD/AucvmO3pBsH3xEGk=;
 b=dcu7aBTpLB8gfc/6zSSIreMCIE4wNpje96Qm7bcjrqpKv98z+V0GfkZfTXot/Z0rTeDD
 Vky3EopOpjCng3tSjdPWwYoj6cGathGfAgIlAmd7IZa5KCbsJjBae7x0hQSjjTIEYN4/
 KFlK6Xq+DcgtkjOdKYEr/V1/kBRsRmkvhnn3efI7mocG+qzdOC3AaN/6m3OWpMTu58vs
 LITHPNCy6Z6JWQex7TSKWDkyJ5v5/qB7cLE27qUIfc3yROcLUKOvK+rMFdAkaDkrXFpW
 j3jbSjetSVMmb/+G2ihjY5lF3euzI7ANsz3D1MVPk7cK2QjXv31P16oVlS56OnV0GC6v 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38w0y7nbbp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Jun 2021 14:51:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B97210002A;
        Tue,  1 Jun 2021 14:51:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 127BA221775;
        Tue,  1 Jun 2021 14:51:22 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 14:51:20 +0200
Subject: Re: [PATCH 4/4] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after kernel startup
To:     <dillon.minfei@gmail.com>, <pierre-yves.mordret@foss.st.com>,
        <alain.volmat@foss.st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-clk@vger.kernel.org>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
 <1620990152-19255-5-git-send-email-dillon.minfei@gmail.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6915fa2a-e211-476f-8317-6825e280c322@foss.st.com>
Date:   Tue, 1 Jun 2021 14:51:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620990152-19255-5-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-01_06:2021-05-31,2021-06-01 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dillon

On 5/14/21 1:02 PM, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> stm32's clk driver register two ltdc gate clk to clk core by
> clk_hw_register_gate() and clk_hw_register_composite()
> 
> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
> 
> both of them point to the same offset of stm32's RCC register. after
> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
> 
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> ---
>  drivers/clk/clk-stm32f4.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 42ca2dd86aea..f4156a8a6041 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
>  };
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
