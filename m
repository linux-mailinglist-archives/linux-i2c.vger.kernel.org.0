Return-Path: <linux-i2c+bounces-6206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696B96C619
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 20:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13C48282581
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5802F1E201E;
	Wed,  4 Sep 2024 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UJbmmr0Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71C86E619;
	Wed,  4 Sep 2024 18:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473589; cv=none; b=CW9cg+6QgZxoc/P+N8Yps9uAUf96qcm9h2q1PAl6Ryx0A253B+xSWBkMNn6j6NtYKPGTVuxTIvZwBKzQU4Xyx/vWBa1St/BYWc6ERHc0E+OMwVqNB+/tnoIaUzFLNutsgnFDEuFmAgd61plUFWA//GtjL5cPeeLer6BuGwCEgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473589; c=relaxed/simple;
	bh=rHtbIlgyGyqNdQpH3imYtDeJTnU75u4U2HDBSuCkC3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CHVz9k/jzCOgIbKLFphOsnBxtBg9aIKwhHw1Yh6H29MqdI0xl6oTVpcd43rSKlGYvvJ2tUBg6yeR4zv3uPzgq+enpPkrNtxY0BGvftoQDb2NlCi4mXYs4GvJwjqKAL4cNs6IMRL9ZBdNwCtcf2H/I6B3vL/26lWaF7jnModQBZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UJbmmr0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484EtSDT010354;
	Wed, 4 Sep 2024 18:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ywIBFZtb4XBMuyLKC/8EUy48zyo5O67wRFiOIhuNg9E=; b=UJbmmr0Qdlo4wQ3a
	Y37m4/8kVkvaClpVHXp+Cl2/Xj0c5W62AU4/fZ0+ZDzaVhXJI+qOYrH3m6/usZNU
	+/lV4CASzpSjb3hIIZqE+CLGjmU2+S8exML+G1GdrpuWVbKcSXX0qRIPM1/8sE3r
	LomOa5TKxM1xyUmzFCTnykygUABJKn4oKepqvMFqWvcO81UlkiTrzSNPEDwmRvVx
	lPxr4ckDnvi4/MrHLZbOKu2EdVmvCewiMv8uOCpc57xD5FMUkWvmtzDy1MjPTZT8
	Eh0zUH+h7BljhQQa3MiuiNBHLp0dV0L4yMNCkmh3RWk5HxIYr0XADmlui39y8pZV
	+atkFQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrj36v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 18:13:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484ID31B018195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 18:13:03 GMT
Received: from [10.216.2.237] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 11:13:00 -0700
Message-ID: <2a7228c2-d827-45b4-bbf2-c128cc653d85@quicinc.com>
Date: Wed, 4 Sep 2024 23:42:59 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] soc: qcom: geni-se: Export function
 geni_se_clks_off()
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-4-quic_msavaliy@quicinc.com>
 <45298600-beaf-438f-979a-3cb9e207a32e@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <45298600-beaf-438f-979a-3cb9e207a32e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3M3T8dnObnwnGNi6fqzkFaEvavuMTq8P
X-Proofpoint-ORIG-GUID: 3M3T8dnObnwnGNi6fqzkFaEvavuMTq8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_16,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=829 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040137



On 8/29/2024 3:49 PM, Bryan O'Donoghue wrote:
> Suggest:
> 
> Currently the driver provides a function called 
> geni_serial_resources_off() to turn off resources like clocks and 
> pinctrl. We don't have a function to control clocks separately hence, 
> export the function geni_se_clks_off() to turn off clocks separately 
> without disturbing GPIO.
> 
> Client drivers like I2C require this function for use-cases where the 
> I2C SE is shared between two subsystems.
ACKed.

