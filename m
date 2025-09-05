Return-Path: <linux-i2c+bounces-12684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2375EB4574B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 14:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DDE16FE06
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 12:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4263234AAE0;
	Fri,  5 Sep 2025 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGexhjM5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C035275841
	for <linux-i2c@vger.kernel.org>; Fri,  5 Sep 2025 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074185; cv=none; b=kwgEhTUM1kspP5fSErfQE4IvInHbg3GExECaIzr8Ev9gbRoOK313Ner6LXn7IH1oJ2p1QkzHJEMzPm+nAIA9/ZGhnTMblND6G9ghOwXG8+LGvCeG0JEGPsDkrKAHpD1elPtJLPIgyTrTywdVfTO4dg1zwhhZwPGDX2EqZ1yrmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074185; c=relaxed/simple;
	bh=YHBkz0h0Rvf+QBxHBQvEoOTPIUgICyaTi8a6q5BhBOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWprGsmdKdefzwAhfFZTVUTqmyA4OBU3sHsUAr5vrSHy+v/A0/e01vk2o5xD1R/807ngW7SwizN9w9Iwf8k5/p1DCjr13XIBsD/w3o2zhaD45wgRxMxItTioGNuPS7G8VsRXLwJsc8ismSL0nNq4++quSdLj/bBlFUGavSNQPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGexhjM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856j5nN008129
	for <linux-i2c@vger.kernel.org>; Fri, 5 Sep 2025 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V7ghSLZ7heKhs650IbAjk8nclyw1JeB2lIG1BpFKJVs=; b=IGexhjM5a/NcGRFU
	RYU2LhDskGj2CGBjAOpoBE0WjJRvqGwcGd2HzwHJbT7lk/0b5e8IGJrStHqnXJJn
	Kj6KfdUhKsTXhjQPJh9XmCSMIMoA12C0IzKMBzYZOHgkqjxvCwVz+3v4U7rbH34J
	8JMl34fntONWURRhf8MNHMJamDzuyllkoZLkxqyO+VMTLasqm+ni005ReUrcXCen
	PA/V25XUuD3HXfZcgNK41y8SR611oZfu7dQfjk3L1S4e9j3gO7kypAWy7GuJI2hp
	izI+QLtxPgP1DHkK/TP3F0OKajz65ckUuGYaDNOQbTuB388QUE7FSdzwgm5G5JCV
	UX3hQw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmju0td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 12:09:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-71be0557385so665626d6.1
        for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 05:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074181; x=1757678981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7ghSLZ7heKhs650IbAjk8nclyw1JeB2lIG1BpFKJVs=;
        b=MvVE2OQ3MvVeCYFmVUbStF+/qwhz0TZPGINfzSj3MhGAAQEEPFiCdYBokUgSW5QAXz
         EpIBXShCId1YSgtevllMN4oTLBjM96eB1d3C/sHOa2t2eP98ZQLWLv4iUC3gI/y1ceRo
         HdlQoEuMuTcbUAxlOIw4X3/gZfws1Z8XK5SS7ynLqcCbzop6u8+ft5U39p5mZAlvyi+W
         x1U0bvHmH5t8CiMLAU8+yM3MiQurt7SZo9BOfgiRVfDf0Skab9W8ZulD3H9jxgRfHXeA
         r9mXlLOCOwJ9GBWftmllLNCOlgBEpRUfiDDbfmReQxvar1Hilfcm7eaoeO/mnLr1LffN
         myxw==
X-Forwarded-Encrypted: i=1; AJvYcCU9qVg0s/Bb2tNNAt/HdXqHaZiZV9UtgUqKzPy8L34FsCPCsHahFEF23YHdQ8KCtdyC3y7clqx11Mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5T6Uu9VtCPIqXN4suNg5yTo1CPatSKiHoXewwCIxHp9CheUv
	YvOewsqNVp8qkt51/HbbeOU/6Kh2JqGy9ih8TITQT2iyOeADgIPHal6MxPmWF/sM0PlY/AP2vjQ
	QwCd+/poeRbEU3co4KmAILCnjX/oPSLl6RbqwJ/rQa9/DRb1XJNDFEtgyMDlwwdw=
X-Gm-Gg: ASbGnct/Yw9KUn74JxrcfG1Z3TWOf1xlCYo1UMaQTq9vTvtV3C03bNeuqUIpwpdTuQf
	HXD375fjq2isKcJNpSRCZe+lh66dnyWEaanEdeAvMnp+gctwGsay6u3V9L2LV+VyFqsYDrkIhaN
	j3cxCFJRPCyzq7mYKnemnE5fUBnLQI5PASmkiwqAKvf9P2fdbqcWeJlDtc3yUUeXB9GRIdZ4HzR
	eBRd5YSEG8F1XtXwt5ZZBCnpUUwW9u3rZUglTXP2r36+zwz2cE+ozqZxS/2FOuiT5UDM64RqPja
	OYvRPbnj0ENxa3rtJIzyFYFeTAZqyiRTzrh4v8EinasxOqAhw6scdAWiCk5aSs7gUPsV+1668XF
	v2cLWg5SB4CtEWGDvLQGHtA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60014511cf.2.1757074181538;
        Fri, 05 Sep 2025 05:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/PGqXh2InjZaarOb7O9uqOEso5Jemelf0KIpqlrqz5P8qaKxyNGfd6p3aVvjCmjCOCb3Hsw==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60014111cf.2.1757074180997;
        Fri, 05 Sep 2025 05:09:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040a410817sm1487836266b.101.2025.09.05.05.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:09:40 -0700 (PDT)
Message-ID: <9694f896-e1f8-427f-bdbf-225706338b7a@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:09:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] arm64: dts: qcom: lemans-evk: Enable SDHCI for
 SD Card
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-11-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-11-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bad306 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=3hZAb_iNorm4NPqi49MA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: m2qa5wXEDwb0kU3_PGaKhWAf-R8IHH2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXwVpc6J3gdF/S
 3WH5sCMXY+bc/79lFfF+p/H8WgT5EAPzsgjEAWHOrM+ElxSVBobVwkoUrrxqRyuCkfBCV8wR+g9
 RXnx+WXlPhqhtGxTowWdR8rv4l3RF9KkuNpp50Nv+sZzY3j10dXWQ5NZ6W556BdZmKcEbnsJ8wz
 yF31F5766phK7T8JrlNPIdrxRXIdMRfYOG4wzSfxoT6JeuzUBD3vDb8429HbHXFEwHWxvwJpsKj
 +DmQ2A3YKzXN6sYYpHlz8rtyrRO6cN/ZrsnviQaZgS5nuNHfBOvLHTyrBJ7Qah+R5O1y2WjgRlO
 UqQ0wH8iU6Yv3OzsyxcEMC7RNs+AYU/JvfF0W5dATFyhq33jPv3jj3djVWrAClQPHffu8xPZWjY
 VLJgNpei
X-Proofpoint-ORIG-GUID: m2qa5wXEDwb0kU3_PGaKhWAf-R8IHH2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
> to support SD card for storage. Also add the corresponding regulators.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

