Return-Path: <linux-i2c+bounces-3895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CD48FF756
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 23:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72C3C1C21A62
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 21:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D10113A89E;
	Thu,  6 Jun 2024 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BITZ4XXL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29A04594A;
	Thu,  6 Jun 2024 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717711146; cv=none; b=okFdeg9J3hSq9eQWydKsg9ZTWvIvn8QpgpAmeP7P8+nFq1TAjtfLgFBovgDrjLpLMwRUsnXyYLiNoEFF6irhG87QQuPBSz6kdySyRos6lAmTeyckC++Minjfrwq+NvZJ8KOj/9x0zncv/325wKZeYHn1kBM8KqWYsvU6DvXDpSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717711146; c=relaxed/simple;
	bh=jrAom1zZLijYtG6B0O71SabgAbFkOyYZqhjtSxs9wmI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YsNd1SUvpI27ksnd/d0qmBKiROFoACPjztRqXYoYA7A0lJbgo2GD040L664ycMh6zkeyA123JtxH/5Lqj9uB7/7i8h6TO4Jy0IvxxDz1yzVgT5ah5P48dW/Vgv7XuzMTN9Ncd0slDIoX8YXbB7n6UMhtt8wuJE5xyMcSh3qLMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BITZ4XXL; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 456Lt8Qt028379;
	Thu, 6 Jun 2024 21:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=cMLJJuPScRuoSTRlqrKeZ0I0MMXCsv/JDEiYPjCFWXI=;
 b=BITZ4XXLeNaVIbXIymCiBslgk+mW65reBC56XbDlViSts/+T4JQQi7h2GCkeDjrC86w5
 tCMDC2mr5IvbFnVsZHc99ds0WN6MOcd/gpmdkq2raWUcb2GMLlcDjTgMGzWQBQltFgfg
 c5kY/jrNDBW5+HjTMjjOb7ChwzQ1NnL0YS6P76MgAkFi9qFIabpKcNa9sZTaDH0kzK5m
 WpAth1o7HeHuKRyd8VKRnWIhIOGYtEB/c6YOS5dQDPZgLzROA2nxLekFsiY5V1+8rF5m
 nU+kAkBxLSj2h2UAcTNKTTvyqehSG5EkMyDKnZzH3NLt4+7wvC/zvtknzGHyQKmrSX/g YA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ykm5w08yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 21:58:47 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 456LeGwD008479;
	Thu, 6 Jun 2024 21:58:42 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec15747-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 21:58:42 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 456Lweov7209622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jun 2024 21:58:42 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EA635805E;
	Thu,  6 Jun 2024 21:58:40 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B25A258045;
	Thu,  6 Jun 2024 21:58:39 +0000 (GMT)
Received: from [9.61.121.242] (unknown [9.61.121.242])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jun 2024 21:58:39 +0000 (GMT)
Message-ID: <a8f8aefa-9013-4ede-adce-0f585d3e528f@linux.ibm.com>
Date: Thu, 6 Jun 2024 16:58:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: muxes: pca954x: Allow sharing reset GPIO
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, peda@axentia.se,
        p.zabel@pengutronix.de, krzysztof.kozlowski@linaro.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240311041412.3858710-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240311041412.3858710-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _2EhWoFSDw-odVGyo3NfFBRKu2fsohFo
X-Proofpoint-ORIG-GUID: _2EhWoFSDw-odVGyo3NfFBRKu2fsohFo
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_18,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406060152


On 3/10/24 23:14, Chris Packham wrote:
> Some hardware designs with multiple PCA954x devices use a reset GPIO
> connected to all the muxes. Support this configuration by making use of
> the reset controller framework which can deal with the shared reset
> GPIOs. Fall back to the old GPIO descriptor method if the reset
> controller framework is not enabled.


Hello Chris, Krzysztof,


This change makes it so that the reset subsystem reset doesn't behave in 
the same way as the fallback gpio reset. The gpio, as part of acquiring 
it, gets set high, and then set low in the mux driver. So, the device 
reset is toggled. In the case of the reset subsystem option, the reset 
is only de-asserted (so the device is taken out of reset).


I'm interested in preserving the previous behavior but with the shared 
reset line. This can't be done just by doing "assert" first because the 
shared reset subsystem doesn't allow that. So the reset-gpio driver 
would have to implement the reset operation - no problem. However, how 
to specify the wait time for the reset-gpio driver here? Something like 
the simple reset driver maybe? Or a function call from the reset 
consumer driver to specify the wait time for that reset?


Thanks,

Eddie


>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>      This patch goes on top of Krzysztof's series adding the GPIO based reset
>      controller[1] which will be in linux-6.9. With this I'm able to
>      correctly describe my hardware platform in the DTS and have the resets
>      appropriately controlled.
>      
>      [1] - https://lore.kernel.org/all/20240129115216.96479-1-krzysztof.kozlowski@linaro.org/
>
>   drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++-----
>   1 file changed, 38 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index f5dfc33b97c0..c3f4ff08ac38 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -49,6 +49,7 @@
>   #include <linux/pm.h>
>   #include <linux/property.h>
>   #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <dt-bindings/mux/mux.h>
> @@ -116,6 +117,9 @@ struct pca954x {
>   	unsigned int irq_mask;
>   	raw_spinlock_t lock;
>   	struct regulator *supply;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct reset_control *reset_cont;
>   };
>   
>   /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
> @@ -518,6 +522,35 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>   	return ret;
>   }
>   
> +static int pca954x_get_reset(struct device *dev, struct pca954x *data)
> +{
> +	data->reset_cont = devm_reset_control_get_optional_shared(dev, NULL);
> +	if (IS_ERR(data->reset_cont))
> +		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
> +				     "Failed to get reset\n");
> +	else if (data->reset_cont)
> +		return 0;
> +
> +	/*
> +	 * fallback to legacy reset-gpios
> +	 */
> +	data->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(data->reset_gpio)) {
> +		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
> +				     "Failed to get reset gpio");
> +	}
> +
> +	return 0;
> +}
> +
> +static void pca954x_reset_deassert(struct pca954x *data)
> +{
> +	if (data->reset_cont)
> +		reset_control_deassert(data->reset_cont);
> +	else
> +		gpiod_set_value_cansleep(data->reset_gpio, 0);
> +}
> +
>   /*
>    * I2C init/probing/exit functions
>    */
> @@ -526,7 +559,6 @@ static int pca954x_probe(struct i2c_client *client)
>   	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>   	struct i2c_adapter *adap = client->adapter;
>   	struct device *dev = &client->dev;
> -	struct gpio_desc *gpio;
>   	struct i2c_mux_core *muxc;
>   	struct pca954x *data;
>   	int num;
> @@ -554,15 +586,13 @@ static int pca954x_probe(struct i2c_client *client)
>   		return dev_err_probe(dev, ret,
>   				     "Failed to enable vdd supply\n");
>   
> -	/* Reset the mux if a reset GPIO is specified. */
> -	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio)) {
> -		ret = PTR_ERR(gpio);
> +	ret = pca954x_get_reset(dev, data);
> +	if (ret)
>   		goto fail_cleanup;
> -	}
> -	if (gpio) {
> +
> +	if (data->reset_cont || data->reset_gpio) {
>   		udelay(1);
> -		gpiod_set_value_cansleep(gpio, 0);
> +		pca954x_reset_deassert(data);
>   		/* Give the chip some time to recover. */
>   		udelay(1);
>   	}

