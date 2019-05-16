Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC7E20063
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 09:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfEPHfh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 03:35:37 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:45853 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726277AbfEPHfh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 May 2019 03:35:37 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4G7VXud003310;
        Thu, 16 May 2019 09:35:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=NeStz9nXNfTLRVan7mg48d/XzpugTtixbD8rWuY85vw=;
 b=htadwuFh2qSEgL9mc4tUg+WlP00M72TUJamH3X68lmPshmg4OTm1PrNUPzq9jpwqL+wQ
 b0zui4LlvyeYwWzbxI3a4SSmkgYrj3g6WTL8aRRvmlphmSmvPbCCn9zokgQqobqRT1SH
 J1gfhIxTlXcmyawgIVjWY1ee1Hg/rA4DAVnPxtNZX2d9rytQ4DmXfnTL5nqi1p/vfNjU
 Kz5jg6gfUh6OHzZGSRtmTPatA6bpLxXPY7CHGtIzcDa8FZZlBH4fiXrsRUlPFekv9kxD
 gXxFY7cE5mmMNMwcHzXavLd2wy3uBnFVsrZ3cVckA8jDG0uq9E5OhDFVvfoiowVfP8Z4 HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sg0anb94y-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 16 May 2019 09:35:25 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D39FA38;
        Thu, 16 May 2019 07:35:24 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF09312F6;
        Thu, 16 May 2019 07:35:24 +0000 (GMT)
Received: from [10.48.1.93] (10.75.127.49) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 16 May
 2019 09:35:23 +0200
Subject: Re: [PATCH] i2c: i2c-stm32f7: fix the get_irq error cases
To:     Fabrice Gasnier <fabrice.gasnier@st.com>, <wsa@the-dreams.de>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <1557932949-15912-1-git-send-email-fabrice.gasnier@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <f0f4f7cd-b151-87d4-e1e1-44969a0ba33b@st.com>
Date:   Thu, 16 May 2019 09:35:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557932949-15912-1-git-send-email-fabrice.gasnier@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-16_06:,,
 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks
Regards

On 5/15/19 5:09 PM, Fabrice Gasnier wrote:
> During probe, return the "get_irq" error value instead of -EINVAL which
> allows the driver to be deferred probed if needed.
> Fix also the case where of_irq_get() returns a negative value.
> Note :
> On failure of_irq_get() returns 0 or a negative value while
> platform_get_irq() returns a negative value.
> 
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 4284fc9..14fb105 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -25,7 +25,6 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pinctrl/consumer.h>
> @@ -1812,15 +1811,14 @@ static struct i2c_algorithm stm32f7_i2c_algo = {
>  
>  static int stm32f7_i2c_probe(struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
>  	struct stm32f7_i2c_dev *i2c_dev;
>  	const struct stm32f7_i2c_setup *setup;
>  	struct resource *res;
> -	u32 irq_error, irq_event, clk_rate, rise_time, fall_time;
> +	u32 clk_rate, rise_time, fall_time;
>  	struct i2c_adapter *adap;
>  	struct reset_control *rst;
>  	dma_addr_t phy_addr;
> -	int ret;
> +	int irq_error, irq_event, ret;
>  
>  	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
>  	if (!i2c_dev)
> @@ -1832,16 +1830,20 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(i2c_dev->base);
>  	phy_addr = (dma_addr_t)res->start;
>  
> -	irq_event = irq_of_parse_and_map(np, 0);
> -	if (!irq_event) {
> -		dev_err(&pdev->dev, "IRQ event missing or invalid\n");
> -		return -EINVAL;
> +	irq_event = platform_get_irq(pdev, 0);
> +	if (irq_event < 0) {
> +		if (irq_event != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to get IRQ event: %d\n",
> +				irq_event);
> +		return irq_event;
>  	}
>  
> -	irq_error = irq_of_parse_and_map(np, 1);
> -	if (!irq_error) {
> -		dev_err(&pdev->dev, "IRQ error missing or invalid\n");
> -		return -EINVAL;
> +	irq_error = platform_get_irq(pdev, 1);
> +	if (irq_error < 0) {
> +		if (irq_error != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to get IRQ error: %d\n",
> +				irq_error);
> +		return irq_error;
>  	}
>  
>  	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
> 
