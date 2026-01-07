Return-Path: <linux-i2c+bounces-14966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83861CFD834
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 12:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CA29303FE19
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 11:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E171D3128CB;
	Wed,  7 Jan 2026 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlhpDtCa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiZfBA3q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E8312801
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 11:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786710; cv=none; b=t05xcy2YNTt0vRceR9AHF59mmGkGu5YblIwnJN6zvZ3iWsJCXOfG1kNS8Un0zdrs6+xWiDSJAES+a7WeVQsyucP5L5+xYfItjpzqW9GgARiLOBV+l306VbKMuz/5o4ragrnd8OJ7nHOB+A3cLze4ZD/wryCav1Ho1pnezoCOflE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786710; c=relaxed/simple;
	bh=omrmxgZfe5lFu9nOJSJgRLGEBohCtAf5W0pVtFMiTt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cejyu3EbhgwCfp4GoSv1wurcqRCId7wRrOvJwM3SBBU8OPVDALv5ISIcCKUcC2QNJ8mfHmHEiWkrUNM+uGp9bFQPuFk7xIVsMFyWSfBpG1w5NGehYmAqAVtjqFG+mY6TNpLcnY0VKbHQpGglZt0kTYjVWAVx4f0q3W9blvVuF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlhpDtCa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiZfBA3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607B6iV73888927
	for <linux-i2c@vger.kernel.org>; Wed, 7 Jan 2026 11:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ggDNMN0dkYQ6rb2tRP/VG8PVN0A8oDWibi+yTaND32c=; b=SlhpDtCa/pY6GAsJ
	QzFcpJMdlhHPHa07AX49IklB22FTC6vVsPkVaP8WrUHyPEbDvXoBJRTe2dgue+PS
	CrTOHUZm5E7hpIWnlrLNtVExYcwDeo0l6zgG9NDCyu+6dFV3EzGq1pPITph3L5ea
	0IVcMWQs37+d0Q2Zma7smJZ1rMRzRrGuI9FEtiypJcs9NUcqkxDB8QmRfRXgzBcY
	9T8sqow6ssLtkOOesihxqDRJd+mKx0h4ftlIhlKXolgexiaQt/Hflr7lUvgzQhLZ
	0rjHqPcPkJoMxPzfP9C2kK3RFIX4hgCiiV4N/QAJvWA5cBVeOwfLhjZFWAsxdXFt
	Kfkvtg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0k681-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 11:51:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f357ab5757so6460071cf.0
        for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 03:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767786707; x=1768391507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggDNMN0dkYQ6rb2tRP/VG8PVN0A8oDWibi+yTaND32c=;
        b=PiZfBA3qNPg9RhD2vF7ghYRJaWxF/nG02FhJMCoF5/aqK/lufALI47ktq0YcgzbJ/d
         cAIt+k8xKJX59AI+RtodtZqvj+z3rpAHn5/w08n88Uw0CbNFSG0Bk7DkWi/29A/2sDLV
         2g1xyRafEknQFkbg+16Da2tEdlx1JLCLeZnxQwt0nxbCCPZ/9UOE+rmQfOS5tAQnlaHp
         AE0j4KhM4cybOKMFbGDUwkIMQGnt+WFsdX6CTGzNGGAcDRSf3fTtQ9FM8xP4I83uoCHe
         nNnWIT56tKT57QbwGPTTdkE5QfvbNyIbqQrKJnwo+HCFt8tVeEhCW5oeByQP2Mdh52/z
         6FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786707; x=1768391507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggDNMN0dkYQ6rb2tRP/VG8PVN0A8oDWibi+yTaND32c=;
        b=Iu56hXnRU51oe7K/CChKdJc0LxQ2U1eJgGtpopGRrvCW16tIyGSWeeJ/MGWSeqIagu
         Y0Q1aF3NPjTxP53V5VR7+1lqc0Q4QUMK0DznxcCYN+V3hGEkD7MdLWR3dHG97sMZOLIc
         FE0nfuNiH1kg/g9rChr+j/tWZtREp5zk85HosYZRVKqt9K05z4bz9RTvozjjcVUVKIaY
         eIEIYl201EvbQMWJZgvVacJn2TRd60iiSEEtE+Ef5SKt89mk22DKPb+Tx5XQgaeSWXgY
         nhHYF+XZzSQuysZdE/5UjW4sjlX2whthzL1q/AaMGnvzbqSp+kStONZSItlfTLuepqVC
         JDCA==
X-Gm-Message-State: AOJu0YyKUB5s6Wr4l6SWDCkzuINxAbocCiRmiP03PmubQQzijCeLYf2e
	nIQMeBZd1s8Xi5GOCUVLEDZS3TszCM+z+OcAZc1eRkqzo8K0O4JW/0wH6n5KdMTOn1MWt6yJ0Rs
	jofdciy1UTTm4MV4i5cvY/ZEkUpg2o6nSRtVrZOalFNKYP4I0GxNMgKN0ZMEyJjE=
X-Gm-Gg: AY/fxX4EcVmmdjiZ5hv//OlD4becW9flul4q/gJDRcGiPNGvxbiq+cPkyLYStQCmtAf
	wv5GJkPJ4ca8ouzfoYBN4AGfSfX29Ka9p84dfIYTIyFQJX7foG/owCiyDgk5I0/GPGgbf2VCOvv
	iSOs2k9xKoTEA1nCHUw3DxiTvaNhc/uP3JcAhnyy1wdAtOuBuGK+M580Bq7xQ3dycYhbNP1ZFhU
	dhTEbVJzXhBev/pi4XPBMDzyRj+OnuVuStUPMPepUKk9ItpDLLWPj73W3LBJbmzioy07Q2hO7LK
	IkVDbPYrKltSwQfKjec+zOm3NXkZIvTAmWn9V3zPPvcvayTMpb5SYUw2eo5S4HYpGwib6I6E2F8
	0Cp77R+VcsoGrCv0OjsMN3uGVk3H5cDwfASBvfeIELkcMBs+QGRCa9luwyt72Nmy4eg4=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr22415611cf.4.1767786707652;
        Wed, 07 Jan 2026 03:51:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4QHfOzO5e2H8yXxP1/FA25p8oojTsuXKqYhEkzq4egd/vbvBMFKsstwG87mx8vOHkZVuqSQ==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr22415401cf.4.1767786707244;
        Wed, 07 Jan 2026 03:51:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3113sm484555866b.43.2026.01.07.03.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:51:46 -0800 (PST)
Message-ID: <61f3c476-6304-477a-970d-9d77f4f2b32c@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 12:51:44 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xJt40CFl_vGyzxaew18nD_woMSTL1Uae
X-Proofpoint-GUID: xJt40CFl_vGyzxaew18nD_woMSTL1Uae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MyBTYWx0ZWRfX8OkrpxTa3bn6
 Qp8866RjOARfm27jxbqH9WyTG8rgToQQ1xy/5GokZaZB+t3H07NGHOlGmf3UHMj8LW8A7d4KDOM
 c9Loj1pwF1nqIKXSxjqCrS9JlZR/NqlXfXq3T0x4hdll5Hu60qrCy0MIAcSrpYc2FFHui0BHe4k
 6UGGTXV3yv8DL1QrNSEc0P32oHW2GPk2VBRj/oXHX6hoqq7cSs9a7KjvPmMeozSYdi/m8xeC26k
 CPZdBJR5i62up58Vmk//7Kfbixnw3rtkvPq8bAvE/8h7NNd5EXB+6nktc69Skk5fz0GIsu4W9YE
 t/vCz6ybwBe8gZRaM1+0/Pl9wfdolmoES6bHVS38kAtFOH+2yWj/d9lOeRt+eEg9BYtm0oh+nZf
 OxeDwvc82+2bI02GYt5s5QYaVzUs9AL2nX/Kf2dWMCM9Nmxb8E25Lm07Tfu1YK7WjoDhYkDz3+B
 BpgHnVWp7G91Sm3+CoA==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695e48d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OD7J8LUZfBhgY_nOwAcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070093

On 1/6/26 10:39 AM, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on Talos.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


