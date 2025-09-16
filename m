Return-Path: <linux-i2c+bounces-12977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90711B594BF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 13:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A42027A404B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 11:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B71E2C11C7;
	Tue, 16 Sep 2025 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlMnqi8U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755722C028E
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020758; cv=none; b=he0KwaKAwtzLPUCNr3zqBnSBbwYxf6dm282TDc3+lDM8wCnQ6sJrhNpxm/8avFC5r78S6Kfa4xLIlfIFqrk3f3uqnhmaS8KPVgXoY+l3PC8/R7PapQFcr4gC0NGnm6GN/r9kthZaLS7BcTg9nlgZzmzKZHKQooccQVX+YKf3QS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020758; c=relaxed/simple;
	bh=Or3sS/huFAjjeAedfhopVNlc2SuDocesMGLsvA4ovd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiiBkWYaV8ORXobfH4y6V1akcPHuDIxE7f0FWnPiGHS8MeYOhBotg97/histsC/dIOoqaG85iiwzC0c5lmZKrdfgFfabNzQ/yKCe07PDQkZO2y844HD71nyBT0sFGjC9UWkQY7fgUUOUpx+MotBz6732DfDfNKlsxfxaus5UuHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlMnqi8U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GACm7k003651
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViaUWXz7piwPDVzZe4GL/ffGnLLhDpYLwoddXmEXM0M=; b=dlMnqi8U2RnOWLuX
	aUoo0GYh4eO3jt2D79hq2zvH/s22QZ4in9+ugovXj7b8YuuCsexG8YKjLFdc9SHO
	3dmhpbPf7JzY92hJpDvqvOOhjThlIrGQjPJqJ1FVmzJK3fuGGwo/QmXm0Ojg9vPM
	H+t51KcT923S/64eW6v5izajWnen1tdA/1NWXt95CZifKbvu14UrOlRaVJRVbHUP
	iF7ePXDwHTyu5u3U7MfQLSmjlurJjO1XF5NB8I/M2cxz7DeHYanVxei9CsUhdLq3
	gjVsUtEMeI6knYUh5ShX0fuTR57RqRy4G3HoB/uOwhJy1sqvr+8bFLxoQAk7nUYU
	t8WfQg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr8w3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:05:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-780e20b83b3so8229196d6.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 04:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020756; x=1758625556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViaUWXz7piwPDVzZe4GL/ffGnLLhDpYLwoddXmEXM0M=;
        b=jbPK0g7BBViMg7Ht7IdxVlV6TZbax76ixp6vRomhL3RygUmGAsdTj58m8ouACl20t9
         8TgJr+uSkwkgIVjgCmNfszurEWMS9hE7Vh/ncqnPA7Y2Xu0QrDFw0czt6FYii3U21da0
         6Pi8Nb+6awNqKeVrIi6z3FxGKmHXr7k6+WseQhFaoqPyD4G3Zw3GBjOmIN88P349GF+z
         4BhwLAjbHEdvwOZz03Qd+rywvygRaC2EQJXM6B1iE8G6926yzBiaXyVZqe9zDIAf+8aU
         n3OuxSu2h/1vcLGqkwPsO7KJ9dHqYgjsOPQ7+CUSUIlVx9bdaYTF+pmQx7LVfKyuzJwW
         yP6w==
X-Forwarded-Encrypted: i=1; AJvYcCVl7I7RUy/YikeYCds6y6GkLjpotqxtE8aCUjh+rYzEk//eFnvWlJL22igJ7RWQDB3WJcz85nKLjtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC4GzupJuVicNC4vs5vBUY9GGOtoN7+3a+3/P0zqv68IVAb/Vn
	PXpnuubqxv7nA1nFn1CkGKFn7FvdqhInaY36mgbAM3SUjhLDHHKfdb2X/mkPyhEvQ1XkL4Bsjum
	zAi0Crjo4nIW0iVQsUvritOieC+RgPb6of4RCBQAoDDiaTRpGArcne44fE4YS3jI=
X-Gm-Gg: ASbGncvAaVIeNBdD2pQKSv1U+Q/US+Klj5ZPx4JfnLKMXTDJUXXU5Ym+LOLdhZiWD5M
	EhSGhWtYzlSRdM8wUKYBXdBkhZF3kzNwGtMEZWRsKq7+TOg+1cdcxHruBqySRaJo+KRXxdFXmDQ
	zanzHvC0gHehtviELQ22Ed1XakcLRVRJ0IYVhuZ52QR0IISISa8LMEYadeQna8auMhkQVX1h326
	J9pbBM4t6LunIKGdOTC4fkV+blEHo4p9BETR3eanfahD64tfG2qXlVXuo1IFQw0mMcEDjGG+X6T
	LlibQ01/jJdb/Woj5quVG8cXYPGB3tZmUMXmPaL1T8WtvoKykLYDrtY+Eo0KpcEOraPvcMxMuxE
	VimLaS6iszNzDpJMhfIzqzA==
X-Received: by 2002:a05:622a:143:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4b77cfeb0a8mr138162001cf.4.1758020755593;
        Tue, 16 Sep 2025 04:05:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwsWlh/wMA1kgn62I3osn9yA6YaFnlN+94SeqOOqPpYtWKmcu0OzDbrZ+IaTwxiRXlalQ7pQ==
X-Received: by 2002:a05:622a:143:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4b77cfeb0a8mr138161411cf.4.1758020754944;
        Tue, 16 Sep 2025 04:05:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31287cesm1146190666b.30.2025.09.16.04.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 04:05:54 -0700 (PDT)
Message-ID: <cd6d164e-a6bc-457b-97d3-503b897fbd62@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 13:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] arm64: dts: qcom: lemans-evk: Enable PCIe
 support
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
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-5-53d7d206669d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v5-5-53d7d206669d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: evPhBKfmKywFYltlAGEXuaEsVDuOdBcn
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c94494 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=lLTZtybaiap_q6JmIOoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX+CW830blmZxy
 2blp+OMjKXFz6B8Wz3sv9IbN9ighQV4OB6pyiO05RU7z1GCKnnUrmiFogh28xuWQ8Xg5iQ+Z1DN
 R6/1G2zG5xdm+nMHtzd+5hm7ySrbgMiCl2++GgGIty/VfHfDdbQ5oAAVAm6Zjewf9TcTWQJMF5I
 4rDZW3il4XJRjNWYhw7/1r1Wn565NphqGlsqyCcLFfGJNFX5J9VXMful+rIED6riYkARl6VD35B
 i2LfGZM+Cj691ROicM/VALCR/g1fjPW6sgcLyZ4/H5Vs0YRZoxe0UJCtxOx4n/7Ol45+Mq+v+XC
 On6m2Y9zA8Nq20t0kjoth9pOsc7g3IM6gp/VcWMGeSM+eApyXeDQCh+KIJccbIaGRHus9CgKLX4
 iICl+Zt5
X-Proofpoint-GUID: evPhBKfmKywFYltlAGEXuaEsVDuOdBcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On 9/16/25 12:46 PM, Wasim Nazir wrote:
> From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> 
> Enable PCIe0 and PCIe1 along with the respective phy-nodes.
> 
> PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> 
> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

