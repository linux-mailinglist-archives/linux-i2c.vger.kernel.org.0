Return-Path: <linux-i2c+bounces-3325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E468B67D1
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 04:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C51F1C21B03
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 02:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961028C10;
	Tue, 30 Apr 2024 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pz0xd5nm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108838BE0;
	Tue, 30 Apr 2024 02:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714443041; cv=none; b=DiQS+U8ER584UnkzEy3x4iyPy+p833DhliWUT4HoSiWHaOMyc6zN5ebbjQmDcPsYBL3J1rPyvOlCiOPtr04A4VXzg6JfzZ/e+xevbglkDOQZM+zkQawOcAgj4BR9yv2+vYwYm8A+VV87/APg39+lsBUxXTj/SFcQHVQOHYiVL60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714443041; c=relaxed/simple;
	bh=dvVt9mbg5Q83WZTxwUjAQKXP4dhJpQF20wwvz/KIFAU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCibO5/dOovQNd3m+bT9/6GgpqpkeCdueio3Uu+GfocEKm6F0S0uEl40coi771xg09gjJOsBNuO8RLYfRh4J/OubQeSijZSd/s6kxH5VeZBBh9/2APWgwLWPk3Vr6qWmzIVjC+DtCrplAigcl1ngi3nMJ5daHACP1FGppY+6I6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pz0xd5nm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U212PZ014147;
	Tue, 30 Apr 2024 02:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=AXHgkuMeUpBVRyhQ1R+VL
	aiFPquzwwH6d+cvmTbZBbc=; b=pz0xd5nmBLFTDi9AkswiutbQDBi6/FwkXxXtF
	taIr1YQFRJWs3eH/ocNv0I2+m8O3o6DlqMDxTzjIXu0tOus6yF5Vz763rxXK/bDQ
	cQ9fmPJGHkVWw6EVzPf06sPELIRxXSuIoOBNaAPNPmYjg9yubnsbXkgN6ZlhzdsK
	lFuk2AnFtJmFijQeZaLjJ6AjfCzY9y2Rd2HKfLc4Vj1F8nnv9IaEF9Usxm4TGL+V
	e6cjYI9GyesZUyMtFe2FjcvjrVgpfHpMTsLql4Evx1GSR7oQGMkMt8pgXT695AAf
	/PyB1/uFUzoFhSQYqVWxEXwsqhRMejS72lauOaLuq8APIetXw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtaf2m2xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 02:10:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U2AWaU026156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 02:10:32 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 19:10:31 -0700
Date: Mon, 29 Apr 2024 19:10:30 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-i2c@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 12/15] i2c: qcom-geni: use 'time_left' variable with
 wait_for_completion_timeout()
Message-ID: <ZjBTFo1Jm23gkWvf@hu-bjorande-lv.qualcomm.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
 <20240427203611.3750-13-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240427203611.3750-13-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dGr2oXP3QIeFPEBxurCEMtbCT_E8oMHk
X-Proofpoint-GUID: dGr2oXP3QIeFPEBxurCEMtbCT_E8oMHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_22,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1011 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300015

On Sat, Apr 27, 2024 at 10:36:04PM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 090b4846ed62..0a8b95ce35f7 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -586,7 +586,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  {
>  	struct dma_slave_config config = {};
>  	struct gpi_i2c_config peripheral = {};
> -	int i, ret = 0, timeout;
> +	int i, ret = 0;
> +	unsigned long time_left;
>  	dma_addr_t tx_addr, rx_addr;
>  	void *tx_buf = NULL, *rx_buf = NULL;
>  	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> @@ -629,8 +630,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  
>  		dma_async_issue_pending(gi2c->tx_c);
>  
> -		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!timeout)
> +		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +		if (!time_left)
>  			gi2c->err = -ETIMEDOUT;
>  
>  		if (gi2c->err) {
> -- 
> 2.43.0
> 

