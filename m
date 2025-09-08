Return-Path: <linux-i2c+bounces-12781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F288B494CD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 18:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 784B1188D252
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 16:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB1130DEA7;
	Mon,  8 Sep 2025 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nc4WM7+r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C0235BE8
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347790; cv=none; b=U6QYF1ytGwynFwQhIdSyeuMKlj4p8wcvKAf1NmC0LJnlcViWATjeNkCBVYXkpVAAKyvNSJXKeNMQBARialdbj+6oXF8asEQtCcIUC9EabYyOU2RKJ1DnAP3MdblX5Fk71iPWagCty4bBYhB/6DNODjSkILptu1t3rvYM9L0fXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347790; c=relaxed/simple;
	bh=ubWdoPQHWOLDpJjgP9VamsCXUKRL6blwyUiqfCr+RMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McTClhxLCuUStqIT1qMPAKgyvvW5hsbkz1k1P32YFpH0vMuJjArnKQ32bjqNaqHTznZuaqVBIQqO5HsTaT30Ygv4QGWCkleaAZSPdn0gq7PS9gJbVyoTl+dIveEYqvp0kaGy+rgrcV/BLIYzDjO+5lsr3K2DOQFxIBtBTV9kXIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nc4WM7+r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588G1Wck030130
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 16:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CoUaDuOr0Aeqkj/4XHl1iuTrcEJpXOBDJljwriwNMQg=; b=Nc4WM7+r5YAV8P5n
	N32xQYxdol1iNduD+wLaVxRRACWnY9JFJ6LLHaQVciQKjk0WfkczXVAAzjVDrqET
	4nVoe3SR64EsEmXWPfnJ5H0jN4LN07anEG0rC4Y8npb6WnrmKyapzXPHxLA0Obny
	LQ4lKEmmjuJ0sqDh7dRNIzjvBIO/BixzdQtGfhwQK5+EjvkeEHRFzVonAJyM2rEI
	10U+A/rFJNwVtWm1ldOMW4azMiv8irhLapeQCFI5NwZSOqd+FFJ9n3XbwS8OCqi1
	J9N+h5GCRC9sZ9jPyeAjptssWM2TFVQjii2jhlaZtV9oT5UFCcPLZQapG0GWdWRP
	egMdnQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapdegm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 16:09:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b604c02383so8695181cf.2
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 09:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757347787; x=1757952587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoUaDuOr0Aeqkj/4XHl1iuTrcEJpXOBDJljwriwNMQg=;
        b=gVmK2cDd+9DPXSKkzNOmR8vjiW/ug4FFVRGdeTrNrpBw6i45FKcrK2r2j1FSwzTVuh
         lKTbBxgOb4mEhzggZiF/Zuu2zt4XbQG0xTqveel7fmvzwB4YNtABAvj1mn2Cn6nP4JCx
         N1kTbIJR6rF5/kVftRLL5sikaKkk8w5MffiHj/ZWv02/3QkvLwpMjj35WygB4LLRG2aH
         7k3zN5YTFk6vtbHZx4vRVhD3T8w6/zhnvFsmmsq2Jo6NdSA39dK2SqAaTv5paRuHhHHj
         naE5pZhPdzLDITQIjjvHHEBuMSVfhgc9YRQnBx6WsD4g5NGzSVFTlewFx+kVlDNwajEt
         a47Q==
X-Gm-Message-State: AOJu0Ywb09GowKJtWOeA82pIi45bVnu5Eb4sVU/MyxZXSoYN4wVpo4ik
	REsXtlZMkPh1fwUzLBgrzT//Gn/xISC8jxqEN41wzjN0j4ZMSx0kTKxYNb2A3cxodEv/zPISEH5
	vv7VfD+IHJe2OX82+59BxPJ/nI/YGNF8UCSfrQ2fpY941BqaMQHAIOZzIPa2RwKM=
X-Gm-Gg: ASbGncvCsUQdMH7Wm59DjW20KsVyWnEkGdxMS9h5rCbOwbLLE1qlO7cgCOpAWtB+ZNf
	6xrKuk3/Yd4RH3neP53ewO6oEmJn0iys3HKAD442DzKXTiOf8HEFZFF5/3lY9/V7csSbuLv4NK0
	v0ot6bqOwhQyBz1YHi1ooWfNpKW5qo3JG9RMprWRev7U304aikcVur6/n/JlYiTAsfUlUQ/vTuK
	LaMIEHPHeGRH2dgMVwdU/xVDxg3a4B7asaq6CBcUdOsBlN2LaE+tc0DJEEaOSwCk5kqZBwiI8jV
	wlP3wzv0oiBPzgudkZwTxoP9ISWwJ4EGxR/IxtBUpz6VWj8uLLiCy0RrAd02Eq6mskfwlHIarII
	qwhyWUX6600G07pc6IYDg9g==
X-Received: by 2002:a05:622a:587:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b5f837c266mr64567691cf.2.1757347786629;
        Mon, 08 Sep 2025 09:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKp0kzn+Vp02fMPwlJf0k2yNql13pFOExJFPIqquXqfbLcwld8IobIzG+7YJra//PBsHnvLQ==
X-Received: by 2002:a05:622a:587:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b5f837c266mr64567221cf.2.1757347786096;
        Mon, 08 Sep 2025 09:09:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc579ba9sm21968793a12.52.2025.09.08.09.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:09:45 -0700 (PDT)
Message-ID: <92123e16-d98d-42c4-9dcb-573dd7eb1973@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:09:42 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-2-6806242913ed@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250815-rb8_camera-v2-2-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68beffcb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Is5zltCUzCQjwDH9xFcA:9 a=QEXdDO2ut3YA:10 a=kxpXfmk2mFwA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: w58xSuZVl5l6RMqklOMGR_3Jf1byu3lO
X-Proofpoint-ORIG-GUID: w58xSuZVl5l6RMqklOMGR_3Jf1byu3lO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXyZQm1ljeGQHe
 5fitlcinNdoufae17lHSF10O1daDh/CjEAWTAhGMpr8w4OlTr3vzfQAfW9+2IRQbjLv44raJbBU
 Mbzo8ygzJlhFInrdwV6JCIsaH5Go4myGSV7swJszwDxdYdjMpqjuDbiMNeEfv9CvMcS7Yex6FJJ
 uCiW+6lwgnZJt/ndbvJIa1pDtb+13zy4+0G6q9dbRdRN76Mrn3rCZRogXshtL0KdoU5zHjVrTh/
 7FOYd/z5SbIc3/8UiAAavwM+8ZdMJLF1zG0tlKchwSK6A218MT++RpwQ5IarBwCC6WRw1xtwyNi
 Y1DGWW/Vqo8eMu/iZKtHyhvX1qb1pfNuKnXr977v+VcHsBb9fdijAOgWi5OZr3jjGx74ZH8GyCt
 MJ160TGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On 8/15/25 9:07 AM, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

