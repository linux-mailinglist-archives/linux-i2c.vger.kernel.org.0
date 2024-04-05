Return-Path: <linux-i2c+bounces-2768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD38993A1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 05:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A26351F21DDA
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 03:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81C81CA87;
	Fri,  5 Apr 2024 03:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d1htlnf7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AAC19BA3;
	Fri,  5 Apr 2024 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712286618; cv=none; b=lIf1uoE3wcSu3jeendwlnLU11SJ3UO0LZ6x2NgA3VjUWPpCL2bbEI/aKsSYxfXqjwLp62tMoTGACNtEddDShRWVUX+Xg7wF3+6t1S7dPUvy6zA58N/R9WVY0EvAD/MC5W0YKhbml/vz92xwrUv1uO/CKMQQ3GayeOyUUlt1aFV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712286618; c=relaxed/simple;
	bh=KWWBQ08VODAOhMyjMRdcyPczB+IEntiJaxSX/ak527E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpF07e80Qgz7IfekTCzaxvPUjy0CVe30Q6ixp3NWrq6XlbCYF+fa7hcROS6MfAQyCFN+bEdqJQBmmgl3imMgCLFdpFxhYuGG6+hMd0OruCvOQoVWqh9NDZ8F1by2s9FK1R6/S+H8EQtZnwYeE3G5hPSpU9GRIsJh1Lco+ch9Kyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d1htlnf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43529N6Y006324;
	Fri, 5 Apr 2024 03:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=qf+DBFrEUIKhL8lJQtpAo
	lspJCGYhfK0MSCB6JJUp+Q=; b=d1htlnf7o8Ae/LgVHvJrR0T8LytLKcMGBpYP7
	BIOv6zjm3jSffl6ejbA95y3n6Pk2EniE6Amde0BcYd/GIFjAhTmVNI2jBmN1tD8w
	2GzAnxxNlpGSH04GOUUnzCLZ+Lo5feC16pxn8/OYrqCIZWEFXJqpDFifdYcFOg3W
	KX5xXB0XjybHiUn4DqbZGiPUFsNVo9hkm3pvicH4n4UloIW+UHMOW45q7ktcXyll
	i1Lt0iW5naYvhxASBTIfJrad31SisF/IftE5Bz/wraG1PsXqIpoyN2mBVqsa8jAB
	+NAvNKAyGtRK1H9w7KiYkb14JH+PgxghjQ3XxbmKGph5X3rTQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x9t341wu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 03:10:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4353AB0P022000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 03:10:11 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 4 Apr 2024 20:10:11 -0700
Date: Thu, 4 Apr 2024 20:10:09 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_vdadhani@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Serve transfer during early
 resume stage
Message-ID: <Zg9rkXddNC+G36O8@hu-bjorande-lv.qualcomm.com>
References: <20240328123743.1713696-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240328123743.1713696-1-quic_msavaliy@quicinc.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mSPnw4w0ZWgZCAxyyXiSag041vv_hqX4
X-Proofpoint-ORIG-GUID: mSPnw4w0ZWgZCAxyyXiSag041vv_hqX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_02,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050022

On Thu, Mar 28, 2024 at 06:07:43PM +0530, Mukesh Kumar Savaliya wrote:
> pm_runtime_get_sync() function fails during PM early resume and returning
> -EACCES because runtime PM for the device is disabled at the early stage
> causing i2c transfer to fail. Make changes to serve transfer with force
> resume.
> 
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
>  drivers/i2c/busses/i2c-qcom-geni.c | 55 ++++++++++++++++++++++++------
>  1 file changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index da94df466e83..ed8201983a03 100644
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

"error turning"? How about "Failed to enable SE resources: %d\n"?

> +		pm_runtime_put_noidle(dev);
> +		pm_runtime_set_suspended(dev);

These two where the error-handling for pm_runtime_get_sync() failing, in
one case below you get here after pm_runtime_get_sync() failed in the
other you have not attempted to call that function.

Do you really get through this with things balanced?

> +		return ret;
> +	}
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_active(dev);
> +	return ret;

ret is 0.

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
> +		dev_dbg(gi2c->se.dev, "RT_PM disabled, Do force resume, usage_count:%d\n",

"RT_PM" is not a widely used abbreviation for this...

> +			atomic_read(&dev->power.usage_count));
> +		ret = geni_i2c_force_resume(gi2c);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = pm_runtime_get_sync(dev);
> +		if (ret == -EACCES && gi2c->suspended) {
> +			dev_dbg(gi2c->se.dev, "PM get_sync() failed-%d, force resume\n", ret);

Different abbreviation, different formatting of error value in log
line...

> +			ret = geni_i2c_force_resume(gi2c);
> +			if (ret)
> +				return ret;

This chunk looks identical to the chunk above, can this somehow be
restructured to avoid the duplication?

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

I'm not sure I follow this part, please add a comment here for the
future reader.

> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
> +		pm_runtime_put_noidle(dev);
> +		pm_runtime_set_suspended(dev);
> +		gi2c->suspended = 0;

Why alter suspended flag in xfer()?

Regards,
Bjorn

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

