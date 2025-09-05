Return-Path: <linux-i2c+bounces-12681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9818EB45736
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 14:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A8CF7C16CC
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 12:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AF034A32D;
	Fri,  5 Sep 2025 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+az5kPI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD4334A329
	for <linux-i2c@vger.kernel.org>; Fri,  5 Sep 2025 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073972; cv=none; b=tYgUjFpxABPSezn7lJf1xMMMh5eFsWTeWnUQMXotR9+XtRrN1k0uJoasyclkYT4egpxb9nFxxmd1rNmd2Qrsqs36VmaGI8oE0oUP9NBRP9VWPRs7dDlTkjzoxKo4aIQNCBm19p8l7XSH6UR8tFIx/WV0rWgOgjccWX3oK3gYXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073972; c=relaxed/simple;
	bh=ldlxiteVjgDeP8xEo3N2AmqNAbePsfuqyTzaH+6MAcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj3toRqIp3oI53YflODPgeCgOBX54EMMMJ6IJcQ9ovRJU0p3UHM4PapqoqaoT0f/C03VMapm2CrjIGqvniAw5hjZ57bNepXr3GG64YRWbVc2IxE4yndKubGmSWv1z7wjzC7thSdAaSNMzHYYJJbyz3bezrNsMxwFAraEGC/Zi4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+az5kPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857TM0U031754
	for <linux-i2c@vger.kernel.org>; Fri, 5 Sep 2025 12:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIUWCEcqZtXBeXsUMytwaz17zqmex3UoROOIhHg+zWE=; b=g+az5kPI9X9pasaF
	y1g7Irqn9G/L3wLDcrG63AV1iuDyN+JhWgRrtSfkhZiT2mlDD0PTQ6TQxbFi7DKD
	n5xCwc6vd5QRrdgaX3bcYJzUc0+lNd98YxzUQKkHDzTSYxvJflEAeTE7WBMRb/nq
	FOwMtQTPsxCBQCohxjSlWQa7R4qSbJdRRpu+Y+IYBt1+KhQvu8vLD5T5XN0r2ckJ
	QfirlxHrePqRSDKVfzhFh04+XPymQE9jpDyOKg6T2NpbCKDkRv1jPmURDb7AdW9z
	YsPl/d8Ltuhv/xVl6XPf5886DHagCrHUsam//vdc7g5sGkhoPE3mYgWnOhsBzMZU
	XF6tsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0b451-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 12:06:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b307e1bef2so5818291cf.0
        for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 05:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073968; x=1757678768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIUWCEcqZtXBeXsUMytwaz17zqmex3UoROOIhHg+zWE=;
        b=pgTLt+ToI6/j7rUnxU6PM4PmnawbuL5jvjdQGXC7O4O9kPTP+G2jD/o4+1p4S8zS3B
         jRgYkw1u7qD/mwCAsD0BMRc+kkHBq1Wp4rQvjZEvUbUKO84LzVcVu5NgTjwjfajy6qpu
         UnMG9OW0HPfhlUmM58pPRToNpjCgPKt0ET69okS/sB0e+Wyr+F/8WSj8/0vZPLw9bJF5
         oJIh+Dq7JEOU42rP2Po6N+fm4Lkfn4QGE+AIUiHxeD0/3MIZ83ynr4z+xsRFTx1WT5nO
         pL7Kv24OrkbpfjCQO58TmJF+/uvZgYDptAAVeXsO174MiIIB/TZmHAgT2Q9s+adoHtxA
         ELGA==
X-Forwarded-Encrypted: i=1; AJvYcCV66FR1731iJ0VCrkZmqd5IrtZ7F78uEc6EkZNu2RlYZbfnu5+9MSSL3f+2bD1WhV7+65PcIuDEGjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+2iDWRPITV9QvGYWhwkLUSsOmKxd+06qv+I6ry7CbBE+US8G
	x+Q4vlZc9pEcyjJ49ClfaxCrvbqjVMKd3bhZvL5w7YrcaKi0jup8cz9PdFaorzN6H8P/c2HRHsl
	IcuMd/ZIER5/ziM/t2Fr57PCIROHz6jBfCZRrMhXY0WEmaX/bEm3G3ghY46Rsskk=
X-Gm-Gg: ASbGnctiMEP71dtdbIGB/NMif7j67YkoPorc2NaxJ5ii/ix5mNVM/aP/a6yE6uEnGz6
	+0AcHy7YGl26+9pNoP3/I/Kmnmraqp8cxgDDwuoN/LoInPVHEgpmAa09lvmw9DSJobPJNxz3u1T
	kseejnMc3JbS9CSRrwJwcB5KVPFE4rcVOOImEGRndDL8nll2bMpbFiarCnO1/Td61kE6LhzZ6DG
	maw3Xe1uPDuLpITARGSTf9RBShRUt83wwp8du386YIGAPxxkssRmzTK7/pVbLmMqnv8LQyrCP31
	FXddYCKaYl3GQYbfZZoPCieIRMzLUCvf3dpOocOaEXfKMlaJZLolr3SkXff8Tu2RfliiNqzDCle
	TUZbzUSVe+pZtnWRStvOshQ==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr59876861cf.2.1757073967366;
        Fri, 05 Sep 2025 05:06:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbClop9hg8atD+aWFohh2CZ/t3jFlq5ci05mjat29SqiFLYOqxeot/a8+aYFeKlmRNuQXfyQ==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr59874841cf.2.1757073966067;
        Fri, 05 Sep 2025 05:06:06 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b045e576edbsm785026566b.75.2025.09.05.05.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:06:05 -0700 (PDT)
Message-ID: <b7d1985f-3c3f-4776-9990-42a343661c51@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:06:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-4-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-4-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zrn6Qd2EDI6TtEegbOKlLh0cNPga4VGX
X-Proofpoint-ORIG-GUID: Zrn6Qd2EDI6TtEegbOKlLh0cNPga4VGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX9IrkI1GL0zlg
 7DwyawHS0EBgHZQ/jVsZNtS25+QLfr4RiGFA3qu5trHWisZnThcnfvL+LFhLMHIRQzfcOg7db3d
 /FF+8lArpJYmptBFZQVIaK/XfrN91ZUI18wyrLvK1SC+nmJQhb9FTZRCvKdqj+etCrG/k0lrt2J
 jO88ekWzDzlcqE4rp0zsZYbRiUq27KB2kJZKv3dgC1gwuur0idpl+QN5XXqeE+jsw1CS+LQJFHh
 0hTJ6B7aSqpYewrWRB3vBYYxLOS+zfqs2xzOBWFJ+AsLbl5dZazwmf/HM2TCC4wqoYaXzuWUD24
 j8oD4RkbcBzDquOAprFsG4sghFIVGdt+W7iMCg+K1UUYIKCxCwHuD2hEe5Cf/8ExSKz7kamFCPH
 FhXDsMsP
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bad230 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=TqwOrElcE3fYHNaCTFUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> 
> Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> GPIO lines for extended I/O functionality.
> 
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

