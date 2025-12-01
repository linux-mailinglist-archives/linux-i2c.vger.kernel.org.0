Return-Path: <linux-i2c+bounces-14348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC2C97E66
	for <lists+linux-i2c@lfdr.de>; Mon, 01 Dec 2025 15:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E035343429
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Dec 2025 14:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D144931A7F4;
	Mon,  1 Dec 2025 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oItxlAsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="id38owrX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA400302152
	for <linux-i2c@vger.kernel.org>; Mon,  1 Dec 2025 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764600510; cv=none; b=qS3Y5AjC6+iz6+b3N8/FFj/UjRU/8iFtah9MaFjFBSHa81k9hsmJIZkG9SSQZSERKCKd8B500jzng31MBmdU2gGIZyOrLnloLCp2ScwhlfwIx4tVz/ae8Jj4RXvQdxTTxsMii/WIwkhYzKhlUBtNfKF7FxzA37e6GQ6xVzIKuJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764600510; c=relaxed/simple;
	bh=kJo2bPDBUuIc6a4dhKxiT2Prq+nttBS2G4R9n3nrBtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frn1h0l7o8q0eqFaEPoexredZ8fjDFkhXDq2AN+417pNpVScjRgogz76twfbsQED00l0ZcE1ivviu2+CBVJ+0/iGpjAHWlTxj27In503Yp5yIeDg50gEHLGjhkz8qeQ28QN7x35ntmSGpeWja7oKa7vYpSF3UySnQAOTL+uPde0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oItxlAsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=id38owrX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B63hr397475
	for <linux-i2c@vger.kernel.org>; Mon, 1 Dec 2025 14:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFUShCKTFzpAAcU4dG8e5ZvFplYdFS4xxKvgwSWJN+s=; b=oItxlAsK2BV3kjXi
	nihVMfCfIzwRhsA14y3Ff3M9fmYF6U4Wf7ccnHYBFcbYTfI2wPLxEjiRNDr67q1I
	m0jxVlw5flUkeT48ngbMZpxp0fG+CCLPPuuVakskih2HjL6QOdqYXi/vPg5YyL7J
	fAy6Lab2GOkGyLBx2pwEMRQykYcbwul/Iu8t5ixAS1pRNybEldGhrktchMMGcnSU
	1sVXzdYpBFZhJU47igxkwioemHhy28yiVrzRNGN9CUt6MXCe/I86FglTsYOa1UNb
	pDgGUfS67+dlIsldp5dsQhkGw6vGXbWnCb5oS8pxNtkLiTwTXCBd+aBi49j+TmuQ
	KTzGww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug0kea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 14:48:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ba92341f38so4140411b3a.0
        for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 06:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764600502; x=1765205302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFUShCKTFzpAAcU4dG8e5ZvFplYdFS4xxKvgwSWJN+s=;
        b=id38owrXCuCdIFQ/VcqDukZ6Bd6GVC04Nrmo6RMatOg3M+LIYQ6lH7Xh/kgig6WwkX
         c18YdK6laWM6KYmil8IeFdqYVXEAXoFD93Hq7VFKCKufepqgQvWoF1ymemBTgKYHjNRB
         6fcy5Rcje3le3EY6j0wCDpdOuJJ4voY3ULBrYpNWLfAA+V8yl8MfzKToY3NaJaLT7ibZ
         aOpSxXvWIdY4iOjnfNjXnADtaaUih78A0CsV68yD7LfySmf7Uvg6GrJeTGTNjqSrIh8i
         l8i/o3qUqsFeDeID1MQVP9ZCL4iNq8V/WWFaJGfzp5zrdIUZ/qrV7S6ooY0ko6s/fj5u
         sLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764600502; x=1765205302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFUShCKTFzpAAcU4dG8e5ZvFplYdFS4xxKvgwSWJN+s=;
        b=Tum1f767ykgvmANOjdXezCkUhh4Zk1R5VCbLn0kThJmEZYBDSCpXOSk7GqduhEXaK8
         QEKQ+mCVXuYXnjL+GXcsBLhjl7Bf8xOZjymIQe8sTv6CA7HQhdNr+IsEFGzaiK5eSSCy
         24t9jbrpfP/z9Id6W+IL2kBjOQdRB+ZzXrblZ8m/daiatKHhZwede81wK3zI/2NnZ+fS
         Wk9FJzOlOZN7yAOD6YD0Tr7OWPZmVjyWMQOyHjYE4ZEnFtcnkisq5BcqiNXFBlbHcJcu
         IXtL+ub0LjaHPTNlds97M44HkKvGyHY/yBmA8aj4r/D91qHeVVtnw02tsFtWCib4TsMx
         N4bg==
X-Gm-Message-State: AOJu0Ywce3tt6toB6L5V+B5UQtDqtAJrmXJs8R2FTE/5GbqqTHjercfH
	Bvwc3onWbDFbHpXd2ihXmxP6Q84S3JDIh4Sxg8URYe/RKzoPJ7KnpjRFOs2QKDim2A+qFdLRi5j
	k1DwSi28XmvWYvJFly170bKkhqJwLdw+s/x2w9QsRMWMKBD4DpkpYNXfAi4ZqE30=
X-Gm-Gg: ASbGncupcl4Ct46UYkY4dFKPMFYVHJTTWcWJ20UtmfyvNLs5a4aWUt4+6+Ssj9iQwWj
	XnJMxTMNMnLwYO3naN6cI3Lr3Z/ZFHoBL90avafEBldjzNafjq2n4PpoNcoCMawO6z/Hks8Lg4d
	qXHjY8H+NrjlcllF7Ww0dxUYcg2GyVZbn6Qyud16zbE+5hSAU8nKfvh+Y9fCfF2yWaITTUM3meS
	sl+CqBXVL7bZUMcbQigN63T+H2Xet3dnseh5QeZbN6Ri4/d1QUPjZFMiSoY1WgVOAXuCjUIrz4u
	LKVEtCnKPbxw3LZILyvz5Sh+23imzdNrK2uYgBkQTyxrdhoN2WBRayR2m/fYtCu2637wJ9wLqKE
	k6Vnmdo3vJZUUVScW0+MZw9jyBviU81n/9jLiZ8fu
X-Received: by 2002:a05:6a20:430e:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-3637e0b9b1bmr27693927637.47.1764600501602;
        Mon, 01 Dec 2025 06:48:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOjiaXyFZ9x9qVZy8TQ6zSjZu3ioOiZuPu5UeevNwykKCCX1DIHrzfM9MFUHb+3rHvjLPDqw==
X-Received: by 2002:a05:6a20:430e:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-3637e0b9b1bmr27693862637.47.1764600501001;
        Mon, 01 Dec 2025 06:48:21 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f175f15sm13729699b3a.53.2025.12.01.06.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 06:48:20 -0800 (PST)
Message-ID: <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 06:48:18 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
 <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyMCBTYWx0ZWRfX9RYFbfrJUXsD
 zTF5qf/tLtq5HnOcaQvxrqjMYjH5gLTmfJWsm1mgR6OU9JUMJp2qpGet+DD7E7seDYdhoIhw66s
 JIwVQ75aRKcop2aL/WQsBSDPlMVUzLCKUGgmXv/yToKSps7Sn0627z0uDiqMjtUEU9HR5SoMieK
 9H3IbqgGHb2TXJbV1koRp0fMtFthvFUVD0hoIgObOyUUQ25IYffzeGR3rgPIfVPb9WKFscABM0B
 1SXirHkUbRJ7/3MzmuK7BjGnvJaaDI78K6iCbeTSB6oaZfsZO7t6X54BkrmKncbW3hAZ2ZgRwPQ
 H432PmNGbs8DzNLrLouYO+1b6nTuHqkkvLagPZWFytY40SU39GjWHegBS4bpQ8eQXoHeRPgUcKL
 SJRXL9tciJbyVk1NGrLdb4BuzaYVDg==
X-Proofpoint-GUID: wsh5ub21KMjfpw1eL7dMaZDFvJ-ZQaKh
X-Proofpoint-ORIG-GUID: wsh5ub21KMjfpw1eL7dMaZDFvJ-ZQaKh
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692daab6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Wn5s78lpapD4s7JFFjsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010120


On 12/1/2025 4:20 AM, Konrad Dybcio wrote:
> On 12/1/25 7:25 AM, Hangxiang Ma wrote:
>> The current value of '0xb0' that represents the offset to the status
>> registers within the common registers of the CSIPHY has been changed on
>> the newer SOCs and it requires generalizing the macro using a new
>> variable 'common_status_offset'. This variable is initialized in the
>> csiphy_init() function.
> "offset" + "common_status_offset" is confusing
>
> Let's maybe add some platform data where we store the actual offset of
> the registers in question and pass a csiphy ptr as an argument
>
> Konrad
Hi Konrad, may be I didn't follow correctly. This is consistent with the 
way we maintain the other SOC specific reg offsets / data in the CSIPHY 
driver, in csiphy_device_regs, isn't it? I seem to think it's clearer 
this way for the reader to see all the offsets at one place. No? Thanks.

