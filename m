Return-Path: <linux-i2c+bounces-12804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89618B4AAA8
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 12:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5476188BED2
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8436231A57D;
	Tue,  9 Sep 2025 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SukDWI+I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB41C2D5C95
	for <linux-i2c@vger.kernel.org>; Tue,  9 Sep 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413784; cv=none; b=Mz2NvD/uMoO+WZhj7NFCyOffGartA1qsgzbQ+wkizqfMvSzRrypT1Emn8CrakVqKlr1t3/j5fjBPjMIO9OXB7KhOVGkEg3/YtvPukhUqSL7cxL2HNCv8+yppAIUA95duc6PA4llpH6BH1TXMZWlRhT4lT1B3wj7uQUmcGpnyK74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413784; c=relaxed/simple;
	bh=usm4FdHvUrxmd9nPz9vE9Y9h2MKo8F0CD0Pm4gdOM3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcGbmO73fmdoqxRwb4GliMzX/qdogC9b/n/uMLQCLhQ4bSB6E5KANbcxDM9Hoft/ebniMCu0Hf7JQRiEjy73AyZiu5lSd25t5Ydjdd5rf0T1Vs/cjEhq769Es3wxrhLpZx42EBYbl/IV1E/xL2u9qnZyjtlhdhIlA4DFvLl0XRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SukDWI+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M31a002332
	for <linux-i2c@vger.kernel.org>; Tue, 9 Sep 2025 10:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBy0MaLLwIMy5hmNCuvVLXpeZyI8/Mf8yaQGjy4D3lc=; b=SukDWI+IENYQRmB+
	xT7tyR+V4I6m4SBnnD/qDnJ/Z620L6GTS4HdZ9XgNEvbyRJiyt8BiWgD9gR40NL0
	wPrTBSLmwtESTV03ElCQuHf7obWaq28R5zgAB4dfl1c6ve3YJ524SrKYvkZvudCW
	F5nDBejDSJDjjosiOjB9+qWxDR/QBFQ9ehpjBOKLYR2ftE0hDFu++JcFUB+uq6do
	zl8krcaI+BKXSMCrjMjbu8a8avZeX69+pVhT01Il5nzkS4vEuO8KajynhzsApbgQ
	6hsY+DJNLsEn5p5etv9zgFI+QXDmvhIGXjGgjTsWg5e7E9O3qqxVxy4G/EbGpeJg
	vpmr4A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfyqv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 09 Sep 2025 10:29:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5eb710c8eso10559761cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Sep 2025 03:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413780; x=1758018580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBy0MaLLwIMy5hmNCuvVLXpeZyI8/Mf8yaQGjy4D3lc=;
        b=EPOPbk0BnewfocGVOkASAT/I+ExvgGHEF6a9od8YmGHqqAHQ+vMKt9iaZVcwf1Bo2w
         wGFtDMSaYZ0wYDMRq2G0GN/TD5H6FOE+GCcHn0KBDW5j1JntEY4LR2EPx6paRnhYi5fm
         RrB43K5gdeC7NrnhUHd8ynX7t5qSOExtGc0nB+NNnsXTfcP2Izu4GfurmKP+Rov3gkAl
         6JYrlxfi90FSkl0/oB3ss9q1LVTQRdYp+WLKBvtxH0ynkW0+26v5qqqJqSrxIMvImIEq
         tpRkH16bxCkspmgJcSbDNeizHWyLeplNifaL9n6ZWNvVCmk/Z8wIW9vxQuGwwgAmIR7E
         e1Ew==
X-Gm-Message-State: AOJu0Yxi+A173CzguB1OlPcOQyN94HSUmaVkamyomsO+Mpx4d4zgmfLj
	m5NlGxG999DhxpSLsK1n/8cO//2wNLKfe2p0LeOnXbof+uahB8Hd0ALFFDH0u2vmRaArPj//RPC
	+U3Z1Hqsci6dBFo9oppeLBK9egE0peEp5gTiNjNpJbBcHgiaekpUqI1Nl3d9P+iY=
X-Gm-Gg: ASbGncteNI7n1kG7RZKgPhjgYGKHIQxS6TwPOWpsoxJpju53RG3sAN5K7MEoSlLW3X8
	DW1EcoC4ADO2dkirvBeY17wR8n92xbzdRkTv2lKKV4PZ0nCh2LQByCbUQmhReqmTE1ksWjS46TX
	m193xXc3As2YThOaijpzu6GoCrRepjG1zAqh/Bd7YFidv1lUihkNDMI5UaB/22t/XcoMBATwM6F
	y+yl+BcVC8aY8A3/LIxHPXfAiivMjUYBvaS0yi6iOXd8dwjprJBRyeFC1d9rwg8VuCh8OtZgA6t
	cQTW36YDfK6T0GFeg6cFC4acpsDSYhLXiiQJcINwM29fZ6iZYbdVLu8fxqSkui7/59g0T2E+JRM
	Ry5mCj5mZj1zjzX72ifiBbg==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b5f847af12mr82535081cf.6.1757413780353;
        Tue, 09 Sep 2025 03:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnb22PJ9048ALlRoPQ81RK5NwZI6keVm8Xomf4IIFy3Ah/BDXmg4UM7UmfQqnov5lleFpFMQ==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b5f847af12mr82534891cf.6.1757413779810;
        Tue, 09 Sep 2025 03:29:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0470f11088sm1406697166b.111.2025.09.09.03.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 03:29:39 -0700 (PDT)
Message-ID: <df9d2328-8d4e-49f6-a8d8-a3385fd3f017@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 12:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, vladimir.zapolskiy@linaro.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com>
 <20250909-camss_rb8-v3-3-c7c8df385f9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-camss_rb8-v3-3-c7c8df385f9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tohWntU1yLzujcC_TPvnVPCHGsm2NQgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX/DFM6mX9dmgE
 V8HjhHvT8M+oU1mdkop0Abkn80a8ynuwI365s7K0PxEVnwjUDlG8PSsT4mcl5l3dz+iGtO08fQp
 8dW4JIa1VxprdGgHI8W4ssvI62rtA7Cr+GBCk8iIqu5UeVVT9HsGwZns7p/2slnzfe3DMTcUzD+
 lsWtmZTH6mdIIu73lz6UI+nWwyx7rJtftc4kmw2HNdhfYEPXyvnOHu3GNvxrRk7/JhBcXE0F23W
 Ilijq8ZP+F9+418v2UA/l8g3fUuyT4WLQOK/zSg5fB7GAhfFNKyJiSIEykD+rcETxfj+tbcGOnD
 1YZqTsMSzQVkcllFByOKyCBQosZtYUy2M3hQ88RkBZvcAD6YU+pBbioLPJfOKeNhbkAttpXTf58
 GhXvgyme
X-Proofpoint-GUID: tohWntU1yLzujcC_TPvnVPCHGsm2NQgY
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c00196 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4WODJ3-QYr2a6mbQJ8wA:9 a=QEXdDO2ut3YA:10 a=1SaFWpeTM14A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On 9/9/25 12:21 PM, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on LeMans EVK Core Kit.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

