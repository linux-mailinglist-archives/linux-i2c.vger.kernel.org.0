Return-Path: <linux-i2c+bounces-12237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9326B207C2
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 13:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42A8F18C3375
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F148F2D3ED7;
	Mon, 11 Aug 2025 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcuDWubB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A46B2D3759
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911610; cv=none; b=dCGl/wT1Wgo95MltPca9wbFtIw4SADHqlSXcFABiRB/IL/CnJ8GHCct0NEvFINmB6TklQZzfsWgtJzVptc46caDiNv7i6hQwmKYMIER6dIIXnntOS3sYZkZZiv/2SqAMsaXRUIBFwvOqFXSY7ItGIjgIoqnN/S9X6p3ci4r5H5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911610; c=relaxed/simple;
	bh=SjIiRwkUuW69/oZGblmkKyoI/24xQdAns+MvUBljizU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0XZvPEnLTrKMcHcIk4LygGsqNGNhyjcr1WI3BYlyIwZ4MTLd9LgBsR3HZ3hlMGr27ndI0NGKN06eQNyrhsVRYnznii1FWtOiNGC6y9W0WgyVMcZVxVRhaXPiPQvTiAx+/M7YMRJj31DBtU0Y9SKslWSECNebG3uzLMixKGMscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcuDWubB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dLoS019268
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3MpL2rgvGRtzT3qycNG0CQC8CXqgfD3OIxhOY8bvSY=; b=YcuDWubBPQXZRXRs
	2mlcuWkYLTqabLlUE9PSRqp31qGmPvZjqCba5DZjJ0Dy+j3xi6PDMGn3DHRcKI+m
	RenByX2TmikuXUpqKqf+YBujkFj65lWZJQLH1KJZnKyev6DIsZg/9tUvAr1GngZt
	AFs9fCF9Mwh9dBssMCB9pqFhx0U25ec8+rcsCzNiXJ+pi1kdYjhI0DzGENXRZl8g
	2n292MVtixdPWU5eBm6aAXVSuLSX1zaR6Hl1abf5lyTPzNe8XKMferF5evURVCHd
	aEXb+fdYM6oidzxtoj8WWAF5VRxgAjJTPskHzYZVwavR/uswnoeGzxAHttp3kt/F
	uKClFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv6ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 11:26:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7074b13178eso13065396d6.0
        for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 04:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911606; x=1755516406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3MpL2rgvGRtzT3qycNG0CQC8CXqgfD3OIxhOY8bvSY=;
        b=DmlBX/ZjXPbiSNt+AkiKzdTh/eCLZD9Oie4i014oxLcaw8dcwNlxYF89XPhgyZUvpk
         SLqTMLLvD6YBIPfPwCqcYk3w8+OY+LLIp4vtd2Y7l5I/pPJClKz7ncjDTJcAPxoZGT1e
         wcilu4N7DWCpBmJuNWvrecuyIOSb9DIxqvIFlpitrU/XhYKBtp3KC2nBC6gTaCC4ZMft
         WHEMt4Pt2sQmQyms9Ii2nIVtqkQTO32e+ZvcUL9fUZI6DgkdKZQ6vRj4qqbyWDNoY4mG
         3WcPEF7PxHLL2CmDEHXUmHS+3cyMPNzl7bwTjvyqr6DvKArigBg7z/YSvVAx5gyRAO2H
         FmzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxGVV7UF+tqJXKdsAqK9OwPj/QcMkAUOWbKp064IZjE90atPeNUpydhSeSV0LbgYjY/dKAsCcb80A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqmp9uwsVWtyOBihYX8sGYLFggL5Vt7ixs3bMU+f3+i9OvDJFj
	V1VN8nV2gTlECxfTGhwLhWTK2V9NaL/kydAOPqAR4TXZwBPzbJ25q+ar8N8Yg480WodHOJd4rwm
	4sh/0PeYlah09XPY2zMbIse1FpMK4doNUR16BDuppuuHrpx3hv+96cERcf2GZgwc=
X-Gm-Gg: ASbGnctfCiXUrla15LXFmtNPxghJwpxym9BycMKBa7p3K8se8AECyN1mDMHex+k/WTm
	9wVbkPP0qUNw7fOeLRVE1N8Z0q9InM09d99eXk6JGXgOkEqyU2UL4uLUSlcLwe0OSnvxXeUz1Gl
	wmNexv7YpDRT0TnelLFZmWJEzeTGuY8uE0xpuA7BWhrwcJ4+FGtqwtpgSNze1ae1B5g0jBlgybj
	n/a87mTzXIt1TAPBqK/xhYMVUXM6eCyKZ05bReNV2JKNYvTsOi3J7kisq+m5QWDuoRWhg6O59xr
	FXt5HtarWlncPWeIjyB5Z82eah1b9geQhNu9pcQa6LZEvmcex5+WtdjXWN/EUH3g3Nh451a7FNU
	IZQVAk0TQav5YFCrd5A==
X-Received: by 2002:a05:620a:2596:b0:7e6:6ed8:be6e with SMTP id af79cd13be357-7e83b69fc23mr475556885a.2.1754911605917;
        Mon, 11 Aug 2025 04:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyjAl0KldBBqrP2dkmKQEiG85HhgslHvNvUuKaCDwmYjM+dyvf+iuE8pKHOehKA/6xP5UTMg==
X-Received: by 2002:a05:620a:2596:b0:7e6:6ed8:be6e with SMTP id af79cd13be357-7e83b69fc23mr475554885a.2.1754911605480;
        Mon, 11 Aug 2025 04:26:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c076sm1978002966b.102.2025.08.11.04.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:44 -0700 (PDT)
Message-ID: <23b8ef03-58ef-4cc1-a467-0fa0cccddf31@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:26:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl
 states
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
 <20250810-msm8953-cci-v1-4-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-4-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899d377 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=o2iUG9rTFtLDcKp-zFwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: Oxuo9TBSBItP3B7UEZA14vadW3U7fRPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX6c4yJ7rqfKgf
 YJbpRUYCloQP52gKv7ZkcBmmamyJ8UOK9J9qpaATCW83HwQPFD+Zeycj/LH8l7s9SgGBpEH74Qo
 EdUb6YpB1Bxu91l9YlQXd5m7H1epla6KCyXe9JJMOGf8tROdPV/Q14b6Pt/pPxxSOtK7xhvjjwF
 foC/al7fuoYVM8hn8A+icgOr24Ku2VuaPNQlH2eHZNRdaXtMVBcqioHS536uhpc/lEQbO7dC+Oc
 B0wUtnBUD2zhR1GBUyTx06mi6MbCmzfT4iV0jeA8IinPy1q7Bfktsp1vsXhAUqNgiVFQG2cUlTy
 DmWWpSUNFcOZft9N1CBX/jaPAH/pi5SwpNFrpzLjiIamSUpQINauIN3XHQSaqh7p/rcO/eQi4XX
 e+emcDJW
X-Proofpoint-GUID: Oxuo9TBSBItP3B7UEZA14vadW3U7fRPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Follow the Devicetree Sources Coding Style and sort the pinctrl nodes by
> the pins property. This makes it simpler to add new pinctrl states in
> the future.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

