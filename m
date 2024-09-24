Return-Path: <linux-i2c+bounces-6962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32FF984C62
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 22:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6617B282B9F
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 20:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7E312D1EA;
	Tue, 24 Sep 2024 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NRXSNY5b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2267F460;
	Tue, 24 Sep 2024 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727210744; cv=none; b=c8zeWD5hw2DSv0OcTqgwUjj4lxMYhzfmftm9hwcR/+JRewn6EWeXzk538akJWtoMkw8IgxAyTC3wZrxus9qrwMlQRooMGi3BkKdTuS5X0kaC58e3vIbxFmdOcOKW142wd3/NQEQyX5NMrTjjDeOoj2sKQqAR5qdOZLQ4mQ2HREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727210744; c=relaxed/simple;
	bh=DpBOXJPHj5DADz4W54y6K8iRFUTOoV1fHS7qxdqclOk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLndTcsGu3MMQo8FA6Ak04aMx3t6VpvRQT//mPcDAVSYEUVOc8cBNgxdHx4nSFnmauIj/T20lqSscFiH83a5CPduw+zNCkToyzXFrhMEjcyICGB8qaj2L6TcAImOy7jWq2iyoAD46mNElW0RirVvIcn985ePhWOcelmh+WSp9Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NRXSNY5b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OH0VeX016306;
	Tue, 24 Sep 2024 20:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uWpGuPZMMGW0w0fXt6h7IJ2P
	V2DkLtbbQEf2FPozRGM=; b=NRXSNY5bAaqWHo2a4ToxIKGQmw78EnW3vtmujvMo
	J0pd9aiuZgbD5pPmgZN9o/0YTrVnukuNjgsery9E8g3JlwJf4XS27o9vHfJ83bpt
	1Og6IG3YUkpai8PoOvTJSydq2VCT746pZtGm9h5DFgyneNUaPruY8kPK9Hq+3rUX
	f+9djBmnfmyWADk2qRzMtP2MKDDPCGwLRCNoOxMeJPppBaTbsUNKv84L3dObI7iq
	tnomWnTa0GybGTsFdLNC/i+Au0he1brVYqvU0rQF1XAptoqoX3uvk6WjkF18Cqju
	hKLwsiTqFZN3Wu8fcaTH+mUbuXJLAlFZjcxhN8WrUdMdlQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2ssf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 20:45:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OKjdHH025569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 20:45:39 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 13:45:38 -0700
Date: Tue, 24 Sep 2024 13:45:37 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
CC: <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: Re: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for
 IPQ5424
Message-ID: <ZvMk8T0dK+heMLer@hu-bjorande-lv.qualcomm.com>
References: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wBVK7pAv62SDtFCPlu39eJ9b-M-KBWKP
X-Proofpoint-ORIG-GUID: wBVK7pAv62SDtFCPlu39eJ9b-M-KBWKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240144

On Tue, Sep 24, 2024 at 12:20:20PM +0530, Manikanta Mylavarapu wrote:

Subject gives a clear indication that this is specific to IPQ5424, which
it isn't. So, please drop that wording from the subject.

Perhaps:
"i2c: qcom-geni: Support systems with 32MHz SE clock"

> The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
> existing map table is based on 19.2MHz, this patch incorporate the
> clock map table to derive the SCL clock from the 32MHz SE clock.

Then here you're doing the right thing of introducing the IPQ5424, so
this looks good to me.

> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 212336f724a6..bbd9ecf09f4b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -71,6 +71,7 @@ enum geni_i2c_err_code {
>  
>  #define I2C_AUTO_SUSPEND_DELAY	250
>  #define KHZ(freq)		(1000 * freq)
> +#define MHZ(freq)		(1000000 * freq)
>  #define PACKING_BYTES_PW	4
>  
>  #define ABORT_TIMEOUT		HZ
> @@ -152,11 +153,21 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>  	{KHZ(1000), 1, 3,  9, 18},
>  };
>  
> +/* source_clock = 32 MHz */
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32M[] = {

I'd prefer that you s/32M/32mhz/, and that you rename geni_i2c_clk_map
to geni_i2c_clk_map_19p2mhz[].

> +	{KHZ(100), 7, 14, 18, 40},
> +	{KHZ(400), 4,  3, 11, 20},
> +	{KHZ(1000), 4, 3,  6, 15},
> +};
> +
>  static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>  {
>  	int i;
>  	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
>  
> +	if (clk_get_rate(gi2c->se.clk) == MHZ(32))
> +		itr = geni_i2c_clk_map_32M;

Leave itr uninitialized above and add an else here with the assignment,
to make it clearer that it's one or the other case. (Compared to "It's
always 19.2MHz and then in some cases we override that with 32MHz")


PS. I wouldn't mind you dropping the addition of the MHZ macro and just
compare clk_get_rate() with 32000000 and 19200000. But that's a matter
of taste.

Regards,
Bjorn

> +
>  	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
>  		if (itr->clk_freq_out == gi2c->clk_freq_out) {
>  			gi2c->clk_fld = itr;
> -- 
> 2.34.1
> 

