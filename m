Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815DB1E9D9D
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jun 2020 07:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgFAF46 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jun 2020 01:56:58 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51314 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726070AbgFAF45 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Jun 2020 01:56:57 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0515lTN1000727;
        Mon, 1 Jun 2020 07:56:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=jm4u4MsVV598+LB742qzZN+QkL1OoKxYIMw9eBswBXo=;
 b=XQFqfptkVoAsWGN64ok/XB/t6VmuQpg9AsBWjOxwzPObPxHYGXjpYm7gYMDIwVE+GHPk
 ZCsV3va/ZzOWG3gtgV+wkGR11XM4n+c4MRuX0OxH7Vs4EqmyCyhoG/MswcbmEV4EZBpJ
 sh1Jk5qKu7SimGKJKugWU1v+j0TdS9JrPKYBUQrcA4RDGdh0V199eiVgvnzd3cMpf2Rb
 1vEfaQw9rJNZcwmTAmpPpsTQsGGMX8eXeCEbKnY5/cY+QHepaLn5Kd2N9vVwiYIRr6SF
 K1oULjbDMd+rBxgn5QKJuaSWHqlyH5PnwreTDSRHkjvEGkAIy8tzRwqkMQyWAiKmSoMR xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31becfqhgf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 01 Jun 2020 07:56:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30CF310002A;
        Mon,  1 Jun 2020 07:56:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A87E2074B0;
        Mon,  1 Jun 2020 07:56:36 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 1 Jun
 2020 07:56:35 +0200
Date:   Mon, 1 Jun 2020 07:56:34 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
CC:     "kjlu@umn.edu" <kjlu@umn.edu>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [v2] i2c: stm32f7: Fix runtime PM imbalance on error
Message-ID: <20200601055634.GB17269@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "kjlu@umn.edu" <kjlu@umn.edu>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200527013853.30252-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527013853.30252-1-dinghao.liu@zju.edu.cn>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-01_01:2020-05-28,2020-06-01 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Reviewed-by: Alain Volmat <alain.volmat@st.com>

Thanks,
Alain

On Wed, May 27, 2020 at 01:38:53AM +0000, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
> 
> Changelog:
> 
> v2: - Use pm_runtime_put_noidle() instead of
>       pm_runtime_put_autosuspend(). Fix 5 more
>       similar cases within this dirver.
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 330ffed011e0..822fd1f5b5ae 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1620,8 +1620,10 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>  	f7_msg->smbus = false;
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(i2c_dev->dev);
>  		return ret;
> +	}
>  
>  	ret = stm32f7_i2c_wait_free_bus(i2c_dev);
>  	if (ret)
> @@ -1666,8 +1668,10 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  	f7_msg->smbus = true;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dev);
>  		return ret;
> +	}
>  
>  	ret = stm32f7_i2c_wait_free_bus(i2c_dev);
>  	if (ret)
> @@ -1767,8 +1771,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  		return ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dev);
>  		return ret;
> +	}
>  
>  	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
>  		stm32f7_i2c_enable_wakeup(i2c_dev, true);
> @@ -1837,8 +1843,10 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
>  	WARN_ON(!i2c_dev->slave[id]);
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(i2c_dev->dev);
>  		return ret;
> +	}
>  
>  	if (id == 0) {
>  		mask = STM32F7_I2C_OAR1_OA1EN;
> @@ -2182,8 +2190,10 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>  	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(i2c_dev->dev);
>  		return ret;
> +	}
>  
>  	backup_regs->cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
>  	backup_regs->cr2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR2);
> @@ -2204,8 +2214,10 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
>  	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(i2c_dev->dev);
>  		return ret;
> +	}
>  
>  	cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
>  	if (cr1 & STM32F7_I2C_CR1_PE)
> -- 
> 2.17.1
> 
