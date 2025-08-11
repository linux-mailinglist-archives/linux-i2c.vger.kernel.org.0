Return-Path: <linux-i2c+bounces-12239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B5B207DF
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 13:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6BC427D42
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EF02D373D;
	Mon, 11 Aug 2025 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBJYPqC3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A92D29C2
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911666; cv=none; b=PTfWwoeUOg0GwBw8bA3LBXo/Y6AnrmVd1LZEpOLfaPifZwMUj1X8wPxiqU86+9W5/F4BI1ksw+LizaMjaxIf0A8PGXOSoOoqSknCpbC0RoJJnX296MLu3GLC/zEb+Bd40nY4gRu9RrUTjMZ/iz4uO3sCA1olNSvhpd/zPTKgxLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911666; c=relaxed/simple;
	bh=U+J+XLR+6ekPSZrj8pxsuPqEj3REqQNGk7AxDkssPmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3YsYnvaOXZM+hHVxOpZlmEyYZeRAWEOavvlvS2Q0YUXrtLj2qXvguLVBow4ODatnGRn53pgAWmJRR4hmB2h1T2W/i47Ws3dV+y2cqLqovyz81xAddhjpuXXSQZ6BoukMtF4YqfhZ20jDxAosGrrFSA2GEMOBbYkX0FJTyrgp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBJYPqC3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dLMv013542
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fyLS4N2oFmF2UHiHGCjHJxCE38PIq/B8p4f+c32zQI=; b=WBJYPqC37sqXjgTJ
	zJ2c/zO11jThleKKz5jYA4agRwC/ZU0Tgghvp7SHMuvN7Efc7lulsqxe3VtarRrJ
	PjBdm3FfZ60ydGoEs647Qa/pFM76G8mebyFEvZYOfOijWb1JrUfQGqPiHw8KjenH
	/cARw3yK+w5B6PGtHf0d+7RRh0KWLqJl1eMRZvO3p+on49umkL3jPlZLbfVk56UA
	JmCzkTWcS0BiM2LgpWxDXBRzie1j2ulGdqXb3sEp6/leZNX6+ZnZ0XN3ojFCLTMk
	kqJDrcl/XNQPL4HBL+yz6mZJDLilsixIQdbmK1RITcUWlKBRcJpVo+unXVUMyMs+
	JtBFVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmmbju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:27:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0938f0dabso11615961cf.1
        for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 04:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911663; x=1755516463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fyLS4N2oFmF2UHiHGCjHJxCE38PIq/B8p4f+c32zQI=;
        b=AbmP1ak/Ze3HzZ/KBmaKPqoPHN1C9dnvWkkIt2V7zsbuSo5Id28ibMboypjJgRiFmo
         qdeIQ5Q4tuaNxSPQWDJraybZRX98UD8veCucspiZY83XlW2QDxY9LEanNqVDB+3Eq2I3
         4xlN6jncWKuNJFGVZDNoOJz80Cwhv5Kqg7ehyWm4a2sQpoK05tifmlEWBguqLM/3pwtz
         ozHZtNU7+GwkST81ZHRFOAaUoVkAoV4R84rFAsO0sLyMrAZWV7qq1hsARLEILEo4IypH
         UqSXKQ6qRkI7eOlmJmDEArQzhFCHu4yDszJtwODs/qGBqTKoTSDm5UiwNG4UTl1aoXXG
         KNVg==
X-Forwarded-Encrypted: i=1; AJvYcCXDsbRYw1a73hcK31LXvTp+ieYHxCqnrkaqVmTaQpQS3cJIv8DPjMFzk3xH4ZMMZarHYJ6mUUdQLyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTQwGoeJkFq7Dw+viHZSfS0os/3cEp72W0fWt/GomXpIa+orZ
	jxFcladVuYKq/Sz4ED6UB91nK8WssfxLbaIMrPpkw/vjo7FOQW4In+Y+40Dd0+JBeLze8CZj+uN
	ieZrGSGTXxndyIDusfT8dqJUhRRYWQhxL+itZYQZvZltZ2GgslHxib/EEqmsemDo=
X-Gm-Gg: ASbGnct61qZNP9APFsz+OUHZx9lPXTORDKWYlc3E8X+esRakmH+SKG8kBbu80Aca/bl
	RdHcCXtQg73HifmC/E8syjXdrkWSUnVd7qqRie93yzEJRkkv2ApC09ugwe3YiXIgzNm3LzMtY9+
	aJCKoi8eOf86j76YnULTCTMMSMylshoQLKab7E+nQ9jgqZFrNwWVqnK7tb7TejHC+4v+XNfAXJG
	wEC5bPXY2hZkv9kGg1otPiK+uMSoG/nZvZ0WeMeZentiIYBaEQb0IFab9KlCYXvHsvKwy+fvhVD
	Bs7WavRtgMNqVBMvfbZMgTm52/NKRAJJx6YaEcE12isXggEF+daj0tJGAOaNw8zQ8GB7HHTlZ1R
	YXfxxvPEOqAJjPTMpFg==
X-Received: by 2002:a05:622a:44e:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b0c18ff1b3mr53726901cf.2.1754911663317;
        Mon, 11 Aug 2025 04:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJgFSDOS5fEjCuyG5NolkHlckR1ubFRcXPAOC/JGl654XR7C52OV8G/dlGBHR8wLM6zvgBnw==
X-Received: by 2002:a05:622a:44e:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b0c18ff1b3mr53726531cf.2.1754911662717;
        Mon, 11 Aug 2025 04:27:42 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af93d62bc97sm1729893366b.80.2025.08.11.04.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:27:42 -0700 (PDT)
Message-ID: <bc5c66f5-2f75-4371-bfc0-452d69bc16e9@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI
 and add EEPROM
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-7-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-7-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899d3b0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=RAyH1-HTb1k6rVK9-NMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: DZL1fRl7c_4gKj627YkUIMDvM-Xeki6c
X-Proofpoint-ORIG-GUID: DZL1fRl7c_4gKj627YkUIMDvM-Xeki6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX+XgrGTY117hL
 dLqaOYQktnSPAkPBw1gQnl5L0OkaMiWbK/98xxL7UDTLe0x6eR63IDbqaeXokpGP/qBCOYK7BgO
 cw6D1bRC5t4fapDNw2ViFyU6brRR7T68eQy/VtrN3118F768d6iAs2TGYfbHBO8BpqX+MuBF4ll
 dEDdPMbf0Z6nr2WtiAtzLRgL2cJqUaKgyx4uWsc5pajSs3hNBy3ETtJQw7zYV/aKTYnKOShHH8r
 Csof/6yeYcYufZLBlEaaldjrU+I0Phuo3iux94tKAA3l7hnQB6A+tH1h6uX0fvhwCGH+d3db4BP
 zPNyUpSZGjteUBfhmPnBS1SFd8keHs1jdTYxexC7e+klwuIA5NT3P6Ms2/CRs3Qhl3wdq27XMK2
 PpZXjaRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Enable the CCI where the camera modules are connected to, and add a node
> for the EEPROM found next to the IMX363 rear camera.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

