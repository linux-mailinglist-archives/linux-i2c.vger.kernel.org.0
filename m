Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A715533DF
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 15:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350286AbiFUNlF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 09:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350556AbiFUNlE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 09:41:04 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A83FB6E;
        Tue, 21 Jun 2022 06:41:03 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LCNKhJ006621;
        Tue, 21 Jun 2022 15:40:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=94EDT3RWxV8N6CrVyf2YeNrI9uDWurb0jsl14sNSbNk=;
 b=Hwxa+bTKd2+bs4rbrB3U583e+0I3BB+696axDESxSTgKmUypfuiDdiis3yXuFPIV6BaU
 JmMj340Wnsa7/557TSu71eXrXr+ptRGP4QY+g5AsgyPaQW/4M8DgzpoGWx4ztfBu21QK
 UDrzcKSqlcQOciSB2NJDmkAP634+4Y7lH/Pd6PpxEAWZWjZn2woiONevTII2jOx5aGRB
 8wd3sC9s9wxSDq9seftHQX1wRPr04KNqeguFVDqIaAwMR4B9tSBvBLYIzJocCdy12gOQ
 69+vfCjnrn7gkYGqmrjMw//ieBqDTAADqiSQS6KuMyOeP9XoZjJvszM6ar4LXbTgCia9 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gua1n26fn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 15:40:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A401100034;
        Tue, 21 Jun 2022 15:40:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12CE52278A6;
        Tue, 21 Jun 2022 15:40:50 +0200 (CEST)
Received: from [10.48.0.19] (10.75.127.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 15:40:49 +0200
Message-ID: <6ca11af0-9c13-4e41-07fd-7fe90f202667@foss.st.com>
Date:   Tue, 21 Jun 2022 15:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/4] i2c: stm32: add support for the STM32MP13 soc
Content-Language: en-US
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-5-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20220620105405.145959-5-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_06,2022-06-21_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All

Look good to me.

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 6/20/22 12:54, Alain Volmat wrote:
> Add a new compatible for the stm32mp13.  Fast Mode Plus control
> register address differ from the one for STM32MP15.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index b29d8e476342..9946b330ddce 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -410,6 +410,12 @@ static const struct stm32f7_i2c_setup stm32mp15_setup = {
>  	.fmp_clr_offset = 0x40,
>  };
>  
> +static const struct stm32f7_i2c_setup stm32mp13_setup = {
> +	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
> +	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
> +	.fmp_clr_offset = 0x4,
> +};
> +
>  static inline void stm32f7_i2c_set_bits(void __iomem *reg, u32 mask)
>  {
>  	writel_relaxed(readl_relaxed(reg) | mask, reg);
> @@ -2469,6 +2475,7 @@ static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
>  static const struct of_device_id stm32f7_i2c_match[] = {
>  	{ .compatible = "st,stm32f7-i2c", .data = &stm32f7_setup},
>  	{ .compatible = "st,stm32mp15-i2c", .data = &stm32mp15_setup},
> +	{ .compatible = "st,stm32mp13-i2c", .data = &stm32mp13_setup},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32f7_i2c_match);

-- 
--
~ Py MORDRET
--
