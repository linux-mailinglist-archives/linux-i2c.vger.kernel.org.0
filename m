Return-Path: <linux-i2c+bounces-13285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABFEBB0013
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 12:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14B883BFAE1
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 10:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E376277CA8;
	Wed,  1 Oct 2025 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFYnG04l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05029A31C
	for <linux-i2c@vger.kernel.org>; Wed,  1 Oct 2025 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759314402; cv=none; b=mlu7/Wb7YhBRbqRz5tIm7jb5EdVx3fGMHQkC/5R3uPQydiHSaFMcRScf1GjdgefhuYv6dBOpVf4478ggm/wWdG1pM8/3s6uZZ+pJukIEHv/c3zIuKJ27dIqSRUCJ2Od6xssY9RLxKzZl9IveSveuElIDaQUo0b3/VJRLo90h4CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759314402; c=relaxed/simple;
	bh=P9Fi1ljGmUThr+8jSoJFfTtVJvJR05niVpmpkyA/Ack=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzYWJElOD1UPIHwFoQtdP3D6BQCoK8AORgTAh1M/cCchjEzzdZPXYQ2CsIze73XS03ei8kvhYMktSRkUNx25k/WfU7YyG8n7kAyVUFRzGdbpFYFFnRia6m27cpc/opl7Ji61ljtz7bsEjyqfgVeQZ/3yYwSSh3fY1C6fOAuFFAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFYnG04l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMIT9X016964
	for <linux-i2c@vger.kernel.org>; Wed, 1 Oct 2025 10:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoYbUoPn5h4PTq/YMlb34TeBwVEHQG0ctNULUvqXlU4=; b=dFYnG04lUAn1n3pJ
	kr8Lw2MzF2HEuD3idQKToqoMGycgOC0qh/5s8xl8OtIEISCDnkGm5VF++zLZ9hCq
	TmOTmb9jZOg2qg9DVoxZG+CDxF9EnH/ZET9FKO3TMFUP6xYq7a/3TarviUNU+oaw
	DnPWz432ZOZ4haFZnglikO17pBSZIuGh3x7UHckGZ5jLjbJUc95au523eiaRJZFM
	/zelny9foSERCefZ98ZWPJjLqiLuS1j6Zv43G4QfA8uFZSmefmn5K7aD1Gsz+f8p
	KhgTiIEnvKCQD2D1BHyHEgPeDb+3ErQqinndDsPyAgFw0+n0FGzk3iag+k4HYXYE
	DVPc6w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hkvtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 01 Oct 2025 10:26:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso5743063b3a.2
        for <linux-i2c@vger.kernel.org>; Wed, 01 Oct 2025 03:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759314397; x=1759919197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoYbUoPn5h4PTq/YMlb34TeBwVEHQG0ctNULUvqXlU4=;
        b=hHlpIyg+Zm8RbxHAxdO4mdIBlGFwIIy2BrlP6mJAw3Au4CkIrsMGqrM5xMTHjzA0Yw
         TegH22Xehas2PHqkMhJkr8fRZazp0stFQejmU3pBxNRu2Vzdxw7qUcTPQQHbLAepC/9J
         JsYe0cAwsXdHFVetMyrFRYvCM9JUnJjnBu3xY7AX+K88P3GS81x42I0Z5anQ2h/AnteN
         BxtBwDLjWR6ycn8kQkgYD0xsinpi1Zgu3Bq3HXjog+SK7qB9JCOIRA8cQNF2ISvOARin
         yK832aBKP29h1T1Vo4xeT/rXlTTrP/Wb0b2wxqABCTRw/lhsMbpd/aQwfXEWV9D+eoOv
         POcA==
X-Forwarded-Encrypted: i=1; AJvYcCX+jsnruUZ5yNY8Q3rTyMDHoUCP5C+bd6QQirR4h9LjiClejSx2iAUya8OncTPwVdumxAro7Gi/q/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YweVKXCzfbAgQ966Cs4zAX2MBvwV0IWsPpAtiyfdKIGP5nWugr3
	J2sEU0XJtPTbuYP4Ta5SSJiTH8WhUi3ODysworYipxBWJUNJ2Lc8xrLytGtmdhybgYj8t01Xe7F
	NdqKnrlxAqeb6TYjrEY7f74DP0VuuyReGVlDP7aAw1G+I428jAyHylE7soR+sxPU=
X-Gm-Gg: ASbGncsXzrtU7zwUdIgVctXyNUnwHM+MUiLm28TLyLaP37eL9ApcXUSe72NVY0lN/5I
	+dlbrBR/PEoKJmCnaQsTEBVzS2SAv0rtWh3qG5hpTrj+1MZSZS0Hopa1Z8mnyp5IPCTaFxr2ZfV
	US6qxBfomoP22E/jrLynWSTJggOhcOESMHnM2PhSMaRF25f3ZjsuMn3YVjDiIFoifd7ptuRRgn7
	7Qbv2A8nGIm08BQ8v33JlECnrCruapYntc+4+RcltFYu2yAR1YyhLs9JivIawxqAGoer+kZWj5/
	ZXvWCN/AgfM6XoIAYmYSig73/J49SINX1g6iKy4o2Y9CcWs0o7ueOF0SvjvQZsUpu+rtupeW27m
	YDszI
X-Received: by 2002:a05:6a20:3946:b0:319:fc6f:8afd with SMTP id adf61e73a8af0-321d8b06ce0mr4302615637.6.1759314397528;
        Wed, 01 Oct 2025 03:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2JF9jYAQs7P21pVRc4kQw9xYk9dAr+RziIcU6cRwEF5tEhV4BHPHR4FxDdHvAHzFGnPlBNQ==
X-Received: by 2002:a05:6a20:3946:b0:319:fc6f:8afd with SMTP id adf61e73a8af0-321d8b06ce0mr4302582637.6.1759314397056;
        Wed, 01 Oct 2025 03:26:37 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c057ecsm15876881b3a.80.2025.10.01.03.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 03:26:36 -0700 (PDT)
Message-ID: <671c517f-c04c-4f07-aa65-a93e1e1dbce3@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 15:56:31 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX6KCd5HK5R2wg
 3QAKzjtHL4vlvvXaOmN8l2LbcpYXGqONWlAAXyNPkID1EvOLeY8QF3W//nssiCISINGbpXc/OEo
 /5l3g1RThE0uE42r5ImXnlH85IHY3BsiSrDR1HRe1g73nx07bCV4mzBVHW3bxOjD1jBj2xhaLHN
 vBdas67sgj1d3m4knzdS8Q5miAxD4MzbgjZwfXS7NCUjf1wX1IRsNRTF+GZ0rMXOfKg/BrVzvYS
 Wn2+MOtn2aOdsiFXd2humOryrAkBnGhIDC6zE7bo5IB7ggLgwNedHgwTj0aId+Jbws+Gf7fRo6Y
 Ll7TViJwZfdOawf74amnO7p3n7vdzgEeI+emP5dXOeDIUyEFMDZJTXGjk9AOg5QIi58CusVgwFa
 XVsxki+/bd6lbsKFzEJgS5izzdeMDQ==
X-Proofpoint-GUID: tzGzMcbz4f3AsWfWO_M6AwxFFnXw4vTW
X-Proofpoint-ORIG-GUID: tzGzMcbz4f3AsWfWO_M6AwxFFnXw4vTW
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dd01de cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fvgdV2PV7z-sFcuOFeoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041


On 9/25/2025 5:30 PM, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>


