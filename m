Return-Path: <linux-i2c+bounces-10811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AD3AABEED
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 11:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B70385213AF
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 09:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E23626B2B1;
	Tue,  6 May 2025 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OGyt8rjK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE339269830;
	Tue,  6 May 2025 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522970; cv=none; b=ga+ClPI/DY8HhahOqlFzFGXgcg1hvBJ22XcOOiIz4XWnwVGM9iyJBYhOy8cdzAZU7XRixIFDUhiRIqw3JZbHxC9AF24ob02iNEiL9q/5JIu9EZYAiBDeG2SX/T8t67xOPNwtwU6Y6E69E6EPRFCQYmJdy4PSeBMk9ps++FgfHhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522970; c=relaxed/simple;
	bh=S7/3VLDA1RIND7UxaCcCDA0lsvj7M51DW3YboxGIO4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j8C0PwVdbgiatvCvvTp8CgIIr4art93rHHBtitNeC9ITe6tskR+1UGhAP5cH1vV1VjZTqUasHQ8OgXMcHZdvW2xnn3q1Vt7yzOUuATxuJCEdMep4k2pEYGbiFJXEAZ7byBc2A22mEQkVKxUGSGgWprwANVJc7AwfqW1cg8pQGpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OGyt8rjK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54689Mo2016421;
	Tue, 6 May 2025 09:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+i9i8ImRxA46EYRIDvhu1IXJYbczbMrTh8b7hdd0O4=; b=OGyt8rjKAgYVEwMZ
	E370siuhcmjKECxUgkbiu6BKm2wl+T1Zef8XzHSZYCJ8W/53W8CBxPNkM8zltwld
	SgY6LIe5C0c+YjFPCCn0WfwE9HnfaCUZT+uMFQVs2IR0HhzLhBHrLMroMvxDReC0
	iAY5xTQK8m4WUv265wnpJp5j7Km+flVKjfMdj/rBLIN7n4vKH+8LosgxRxmwBike
	lhmJFKWUnuoS/WgAifFSyjiJqG+HSBW9NtODme+IPBuKgd5698fEwrpAiCwb9CKk
	yEifYqXXAnhDB+GaGzwgU+wsXaiLcu/kiEz17EJwPhOLyLR84VQf+kX/nQ1Dn32V
	uGCsPw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xswh2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 09:16:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5469G1WU004379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 09:16:01 GMT
Received: from [10.216.1.69] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 02:15:55 -0700
Message-ID: <a7d84f8b-84c7-43db-9771-643ebec3edc1@quicinc.com>
Date: Tue, 6 May 2025 14:45:52 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add support to load QUP SE firmware from
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
 <64268903-fec1-4418-95ac-665738435366@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <64268903-fec1-4418-95ac-665738435366@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZvaWsEvcUWVpURK_FQfOeIwb63Ezxn6Y
X-Proofpoint-ORIG-GUID: ZvaWsEvcUWVpURK_FQfOeIwb63Ezxn6Y
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=6819d353 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=_d-tbIjX12GQMK_ZyKIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA4OCBTYWx0ZWRfX9J2E3+4KW4hg
 3jEEpUDjnJjtp1/2Fi/oKP7luW4zapQThO3SJtG+tnvyg5rINKlDWeZo2B2t/b5xt5GKp2Efcj+
 TgkE9+cghTl0rWDLXkegq2005Ko/pqFm1dYxYfgWrQalHJLQfqkkWzErycAZF5PxpHn5Ou9+7BB
 qDfhB+PDPV3+7jf3cvkLm5b6KOcQn8HI7CbJn0diT/Wk+wyQjjAC0sqqUOkMbhHq+vK/1lDbvyo
 SJ4kyddwpB/E2xYQGSMpLpl+oAeP4ZCbvNdDoqwKoMANo8w/vfRGKrrD8sd3yxSgIeEBL7aB7II
 tWlHwl+NfdNvEErS+VWWi0if40Z1/wAtRB4TfMhAvWxoPRa0UyiaU4V/TX7i/cnbtMvPS4czrJM
 rAxHGFol0PfKWBrAGeVhqHuJkMUxA5Lb9vD7vuKpKbF6CocrFysF4mxKNQEFIqWWxwMVwBd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060088



On 5/3/2025 4:50 PM, Konrad Dybcio wrote:
> On 5/3/25 1:10 PM, Viken Dadhaniya wrote:
> 
> You sent this series at 1:10 PM and replied to review comments on the
> previous revision at 1:11 PM - please refrain from doing that, as
> you're effectively stalling your submission because of lingering
> unsolved problems that ultimately still need to be solved before
> the patches are merged.
> 
> Konrad

Sure, I will take care of it in future patches.

