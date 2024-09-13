Return-Path: <linux-i2c+bounces-6660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D61997771C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 04:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 724561C23D88
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 02:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3E71B12D9;
	Fri, 13 Sep 2024 02:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EhsoE+tZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E2240C03;
	Fri, 13 Sep 2024 02:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726196055; cv=none; b=VyOdScqrK+mSkBhmAQCzt9wRHKb8R+AYxa8XuzNKqRMKQnIPrK9cbQUk7KZtUdc3ZrIbwlYSeQEVkTX1wVMNGYOth2c39I7msVpND/+GhpmIsDjhrkGUdnGiEkU9VBVfEzky1k+E7ipXSbgtxecNOmEGwz6jodNIxeNkfOMWc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726196055; c=relaxed/simple;
	bh=9psTbLBrJGCQk9afMakQekIQCcIVB3knH6Al8URXRyU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGc6MOu2l40E0MDiM+25EL0Jmt/vMyP5WsYgfJ8EwqM1r7gafKgkL3Mao7EdL3qrujdxy9jHCSclDHFxPcSwI0m/EN1fxSVxx9wyFT5an1uk+T5yCaAgHrMP+W9w2whuJszJzqnlUxk+12idgYUqYXI8Lav3rcBJRWcPikuQrYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EhsoE+tZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMCQej021290;
	Fri, 13 Sep 2024 02:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=km2xoeUtb77wUtQvBe7PcHbY
	DzHOjfHMG4F0dL8toUk=; b=EhsoE+tZQ89xEg4XdxCFu4itnUMQFz0HkDdrfpbD
	1cIVq/F83ngNyMKilaZgmuWU/UTYH06tIA1JDfduxWtlbkQpmQpUXFyLOPPZEgZX
	qriPtZHl/WfcfrnAzBGMh7/0OIkVhM5HPPu8NnZIolyJa94eSEqBc2+9OHWkpAlM
	joApRg6BUzO5JJIHw0BMKNyP3iJbvxtzuJXR8nZozjR8WkgKKPrs8xF3z4LWHrkw
	b6blgDsBW1h0nCeMUTkR87HyZv3wqQlhvNl7ErhNAuPXVURXh5pDR17jhmzF570w
	iyhoXu04uGEhudhEz24QfaEQHlqx6d4V62bfQkyyTZ/H/A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5nydww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 02:54:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D2s8Bw029512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 02:54:08 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 19:54:08 -0700
Date: Thu, 12 Sep 2024 19:54:06 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_vdadhani@quicinc.com>, <vkoul@kernel.org>
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
Message-ID: <ZuOpTjumRYAZTSXj@hu-bjorande-lv.qualcomm.com>
References: <20240402102741.128424-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402102741.128424-1-quic_msavaliy@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DuFusNR4WS92vQHb9BWfkbDQIABV12-W
X-Proofpoint-ORIG-GUID: DuFusNR4WS92vQHb9BWfkbDQIABV12-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130021

On Tue, Apr 02, 2024 at 03:57:41PM +0530, Mukesh Kumar Savaliya wrote:
> pm_runtime_get_sync() function fails during PM early resume and returning
> -EACCES because runtime PM for the device is disabled at the early stage
> causing i2c transfer to fail. Make changes to serve transfer with force
> resume.
> 

I'm guessing that this is caused by some other driver that wants to
perform an I2C access during early resume? If so, can you describe what
that use case is?

Regards,
Bjorn

> 1. Register interrupt with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags
>    to avoid timeout of transfer when IRQ is not enabled during early stage.
> 2. Do force resume if pm_runtime_get_sync() is failing after system
>    suspend when runtime PM is not enabled.
> 3. Increment power usage count after forced resume to balance
>    it against regular runtime suspend.
> 
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> v1 -> v2:
> - Changed gi2c->se.dev to dev during dev_dbg() calls.
> - Addressed review comments from Andi.
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 55 ++++++++++++++++++++++++------
>  1 file changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index da94df466e83..30c335b02ac4 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -134,6 +134,8 @@ struct geni_i2c_clk_fld {
>  	u8	t_cycle_cnt;
>  };
>  
> +static int geni_i2c_runtime_resume(struct device *dev);
> +
>  /*
>   * Hardware uses the underlying formula to calculate time periods of
>   * SCL clock cycle. Firmware uses some additional cycles excluded from the
> @@ -677,22 +679,48 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
>  	return num;
>  }
>  
> +static int geni_i2c_force_resume(struct geni_i2c_dev *gi2c)
> +{
> +	struct device *dev = gi2c->se.dev;
> +	int ret;
> +
> +	ret = geni_i2c_runtime_resume(dev);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "Error turning SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(dev);
> +		pm_runtime_set_suspended(dev);
> +		return ret;
> +	}
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_active(dev);
> +	return ret;
> +}
> +
>  static int geni_i2c_xfer(struct i2c_adapter *adap,
>  			 struct i2c_msg msgs[],
>  			 int num)
>  {
>  	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> +	struct device *dev = gi2c->se.dev;
>  	int ret;
>  
>  	gi2c->err = 0;
>  	reinit_completion(&gi2c->done);
> -	ret = pm_runtime_get_sync(gi2c->se.dev);
> -	if (ret < 0) {
> -		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
> -		pm_runtime_put_noidle(gi2c->se.dev);
> -		/* Set device in suspended since resume failed */
> -		pm_runtime_set_suspended(gi2c->se.dev);
> -		return ret;
> +
> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
> +		dev_dbg(dev, "RT_PM disabled, Do force resume, pm_usage_count: %d\n",
> +			atomic_read(&dev->power.usage_count));
> +		ret = geni_i2c_force_resume(gi2c);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = pm_runtime_get_sync(dev);
> +		if (ret == -EACCES && gi2c->suspended) {
> +			dev_dbg(dev, "PM get_sync() failed-%d, force resume\n", ret);
> +			ret = geni_i2c_force_resume(gi2c);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	qcom_geni_i2c_conf(gi2c);
> @@ -702,8 +730,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	else
>  		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>  
> -	pm_runtime_mark_last_busy(gi2c->se.dev);
> -	pm_runtime_put_autosuspend(gi2c->se.dev);
> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
> +		pm_runtime_put_noidle(dev);
> +		pm_runtime_set_suspended(dev);
> +		gi2c->suspended = 0;
> +	} else {
> +		pm_runtime_mark_last_busy(gi2c->se.dev);
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +	}
> +
>  	gi2c->cur = NULL;
>  	gi2c->err = 0;
>  	return ret;
> @@ -820,7 +855,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
>  			       dev_name(dev), gi2c);
>  	if (ret) {
>  		dev_err(dev, "Request_irq failed:%d: err:%d\n",
> -- 
> 2.25.1
> 

