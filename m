Return-Path: <linux-i2c+bounces-11067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01652ABD68B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 13:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0D33A33E8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 11:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C471B21FF5A;
	Tue, 20 May 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iRFs209/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A01F153C;
	Tue, 20 May 2025 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739818; cv=none; b=lzzkMaeuKnDIWKSFADYYE8ALaskscSa2WpX1xFv6yUppTWsfi555BnUv9J0ig6k3h5bkR06OZ57SGwFYwU0MGxoKMOgWU8Okg637sCgGaqYbJvgk2PImsdsm1KFra8pyE87StM0lqepi/TvFQJ+QQyBLFWolvrdUTZkCoP4rHJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739818; c=relaxed/simple;
	bh=ePV7KS5ahxsc5XrKAwy1Zy/sOqAbGlQ1CwAuKzCICNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GRvcK8274R+s6Ec26WgsI+mami8YXJmj1pUACi8ms1gfDNR1Iq2eO3DqTKsL2ZF4oAPXrBVpEYceo6nz2i5aQEgH0z7oE0Bw6ulT7iJREw0nMNbS3oin5Cw0/nUWFKH39srzB3Y8WfcUkmYCbElj9AhohU6aJn7IvZSENIgEsj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iRFs209/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KBEVNU028704;
	Tue, 20 May 2025 11:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLY4lD5JEd+wrB3Pa6UJ01FZeLiuUjx1sm5mklY+w6g=; b=iRFs209/SaBWoM7d
	wZyO0K6SfrrPdlNb8nRYeihyqTHgW070eMq9kTbSbBUG93of76C8+k+jt4SxWXkU
	Wi3sOMgyyhqEDMsEm3IX7M4vV3JUTLlVYWw4vGIPaDFKD8/03q1bCgHswcPU1N8r
	xsS6CN1xj+QzbzF1udqSZrjz3FC/q+KnCo/eXdA1YWjFbfusnxdT4F7BRjdkqOvh
	BcRUJlrATzhIyOzzjCQhPW0UNEQt5p+ZwE4/Kd4ZlxEe3csEWKxuHJipHFwx6fK0
	g2PlP0iMhbxs+a5Fd1iyuFAANjfVGZATWn3WzGZ9vxJLzO4DbiVniugm/Di5bwIl
	rAig8A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7fh37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 11:16:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54KBGm3f019289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 11:16:48 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 04:16:46 -0700
Message-ID: <a2ff429f-cc49-403f-9f2d-6a6b6361044d@quicinc.com>
Date: Tue, 20 May 2025 16:46:43 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
To: Wentao Liang <vulab@iscas.ac.cn>, <andi.shyti@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20250519141918.2522-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250519141918.2522-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682c64a1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=xU49TFnZvl5CdPniB3sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: oYF8yg5dhM4ttH8eZw0FiJb0CC48uiwb
X-Proofpoint-GUID: oYF8yg5dhM4ttH8eZw0FiJb0CC48uiwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5MiBTYWx0ZWRfX+MIiIeyaVPCG
 Ptm7r4dVqeU1N+op2jnVFIU3az5IRtHtlEoz8zCpFVLGkE0pXImYStuIhbNLO9yqe7ypwV2Oron
 xjdq5v5x+t3xJQxhHMfYvepx/qpllu+rh4x/z0knAdUnP2747pKJgPYLs/J2TpphmofmYu2KSzJ
 BB5QZKaiQf3lexL6V/xxP1GRUy9B4wSLNzqcC6QXMNrhglnaMtzk8+DknK45/l+mLd+OmpP3+0j
 aWjxWetm4regCY19cXBdJaUlZrURfJFh169A5biIy33yNfiSYm263KIu0nOOJnBtHWUxtwjfDV2
 eH4nTtpPYizzVS3MW4nuTiRZzH/5LyH14rwR/s/8XOisoTQTCmSc1nciosIbKKPlfUCdzGvZkeU
 gGzGbS7MDBqvRmq6DgaRGGEo+89EgYDg9zeO3HNFv6zngBWUP+TLuLVU6MicRmkre0lB4u21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200092



On 5/19/2025 7:49 PM, Wentao Liang wrote:
> The qup_i2c_xfer_v2() calls the qup_i2c_change_state() but does
> not check its return value. A proper implementation can be
> found in qup_i2c_xfer().
> 
> Add error handling for qup_i2c_change_state(). If the function
> fails, return the error code.
> 
> Fixes: 7545c7dba169 ("i2c: qup: reorganization of driver code to remove polling for qup v2")
> Cc: stable@vger.kernel.org # v4.17
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/i2c/busses/i2c-qup.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index da20b4487c9a..2477f570fe86 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -1538,7 +1538,7 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
>   			   int num)
>   {
>   	struct qup_i2c_dev *qup = i2c_get_adapdata(adap);
> -	int ret, idx = 0;
> +	int ret, err, idx = 0;
>   
>   	qup->bus_err = 0;
>   	qup->qup_err = 0;
> @@ -1588,7 +1588,9 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
>   		ret = qup_i2c_bus_active(qup, ONE_BYTE);
>   
>   	if (!ret)
> -		qup_i2c_change_state(qup, QUP_RESET_STATE);
> +		err = qup_i2c_change_state(qup, QUP_RESET_STATE);
> +	if (err)
> +		return err;
Is there an error seen around this ? Expecting this to work as is.
After an error, what next ? Just return back to framework ?
>   
>   	if (ret == 0)
>   		ret = num;


