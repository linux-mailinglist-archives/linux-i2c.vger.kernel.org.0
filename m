Return-Path: <linux-i2c+bounces-13913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E87C22F3E
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 03:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 702EC34AB18
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 02:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF64026FD86;
	Fri, 31 Oct 2025 02:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piPIzdRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iuqt284A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76E826F2B7
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 02:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761876847; cv=none; b=HrHTT6nq67u8rcFjq4hiSHVVwypt+RRA8+LyybPAqKL4sk9I9S5j2t4TVI59qfo7rF5ukmbXvjzuKxbYnvZrfI0RfoGmUb5EFrSX3t5U6kFMu1MiwMbSDzHS4gmfFf3MKh6kPBfElirglQbhPEWsFhEZv5KJGsLvH9sX2Co9trw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761876847; c=relaxed/simple;
	bh=bb1WsmCBKUXoJQSd5UvHAq8IwyXTzo74AI0OYGP3IJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7omC61Ylvs+/nVJCkjIOeOirxRp5SCyfP/iHxAv4uDKU/f3NR9CxJP8GPIXMQyccWmiGVUsheSIc+qeJWsQ180yuPxSGYcFvFf95wqdQicoxLAcHrglkrXpVQiMr3XGKZxTnjTTqPreVh+muowDe9cvZkDVBpdyDPCOQb+ndcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piPIzdRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iuqt284A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULruT7899094
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 02:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLDl/vwxa7/bXeS2eNEcvqo1VN8+Lw1lvEYjWgjL4vc=; b=piPIzdRHlIALILmB
	uMlppKGjMDo0NohvpgzYvsbT6J/WfNNO1eI7Z6ITqdtFurqnvRjudJJLWE2CQ1XE
	hLPCcOnZQ5rwz7/f6Y7KM++76VNOHDmbnO0LqbTAVAqvPpCVVIRW0+SPmH8/oq1c
	k9dXHrQM4w+g9ojoxLag63J5gZ9cZABmLd+pCigbZ7XWxFL+dxohq/O8iz8YY/Al
	4mk6Ksvs8n6b5BZWWOM2VcFazqnb7o/WtPAZTKJnWZk51tZqpzx4V3EXUQxPf4XZ
	Obw8IsA14dv3N8urZ9oAnThhgxd9ylV6SHFWyqMRCiIUvo5Ohw0IYrKXT7eOrT32
	w/fDxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb20g0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 02:14:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5535902495so1183232a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 30 Oct 2025 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761876844; x=1762481644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLDl/vwxa7/bXeS2eNEcvqo1VN8+Lw1lvEYjWgjL4vc=;
        b=Iuqt284AUqYe3xKxh/74O3XLBBB6wEfIr1akyPkCxTJdCEEMQO/p27g8Mf+ta+/KUb
         l9T7iyxcm5E+RLbflWQsET8XKq+6Mc08gGOhkXXrd5+cquxa+d30+AC1OKd3VSnOPXqz
         d2ukr1KgB4szciDjqyx4Kuj7gbquVLxWsUaTBTp29oXXSAr3m4L9vmRkcchVF0ET8kAF
         vjgd3aKeSKQz1WLRxRugrznU4r31PgSGvW0Yf8FgFnKUdm3A/3KIGd7UxGrznzX8AFpH
         UGQcsr6D2xmGnJy6aALlQK1XhqmreipzsJ5/3FBlQmZIjc/zxJO0cGeYOW23+leDDcW5
         Rccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761876844; x=1762481644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLDl/vwxa7/bXeS2eNEcvqo1VN8+Lw1lvEYjWgjL4vc=;
        b=Bma2bH4ZRjvFzhtNYy2LkW/a4wcp13HO8EY3d1ycGjRaw7Wv39RclaLlJro6mFi6q3
         /5I+6agLXAnWk3gaK2MVwNis+aew3KNk6HefBr1lCt5F2F22sMyGLOSFtNhepJgzNBuX
         7mu4mX2pj/wLoyJ0RRVYW6m+9NPIVETqSgcO90aO4MJZx11kKwPaBhE2njISuvTdO5fw
         2DjPNnezLV6SEf/YRe+0zqy/gc8s3z1X+NECnhNWIDAwIEoeSKSefBpsw/Pxub1U2ECX
         dTE9PSkp6UFVWO2kjNRnGzLG7wVg5vjlK3AcIVDGZFBNhbNJ6n2H9D/AcYh5Y/qKE1Yu
         P7hg==
X-Forwarded-Encrypted: i=1; AJvYcCXf+6Pst/q4on9fHLML1h5tp4zqnDHeKgEqPxp5RklAudlOM0oCQyqvbzhW0zhsio4LF0/HzlJXcRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMejepSJa52Qdiwymsga03TPzn/JVC3oUVerCvnwkgg4ojCQkE
	1qsKB6WRu78TpROGY35RwWl5hC6Ql8JRxvrpi8Dkl3eKFXQclX+FFOP4MvGGTujF+n0qzVMGGeb
	1c9v/Si1kGa9rcpREMWLymruFFB41/ylS+zpo1PrQRlAZplerkEIa+ECqd1CCV0U=
X-Gm-Gg: ASbGncuLOgeK9W2L7ZcFh8h0CIjkBIGO5oHI9W91kHMAc6s1Nep0O95WX98cn5BnMpC
	C4dwp94W5+yOXe9M78uRg2j3z2gXViyYpqjvRkIWUIIlqxpX5CZurC788ffufS/1HUvV2WNkKnm
	mQedmXQb9s+SVU4lZpW51bJ5Bb9uWDZwc1Ew+nDXnp7ghblxVWy130f175FAAmE40uCjrkYy3Dr
	t+uLqPHWD4Xk7uUT0jje6h5o+Zfyb0lfMZEnF5h2Mg2Oi13/9xPXmADdy3VtZiSVbOZd3m0r0k3
	5ciFWn47lcKpCGRvIj6TvieM8NmJw2VTfB3nnCt1oo9ZQbEDXc+Gj51S4GtJ+8iqr5lZibefgs8
	0QIfSX0TnCFrAfooyAFuIBc/V4TZqS3IVpXZdGEbfN+eXkt1Fr/wh0Ac/1O7WLcqGLUEluQ==
X-Received: by 2002:a17:90b:55cc:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3408308a934mr1958060a91.36.1761876844312;
        Thu, 30 Oct 2025 19:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGleJTGgP6SyAWAnP4yfaeQUzaEzCu6tX14wOdVXnVJbSU7dIxeixQ/PO5TYg3LWWBTV7KQDg==
X-Received: by 2002:a17:90b:55cc:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3408308a934mr1958027a91.36.1761876843805;
        Thu, 30 Oct 2025 19:14:03 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93be5ed9e6sm293518a12.27.2025.10.30.19.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 19:14:03 -0700 (PDT)
Message-ID: <71373bff-93a8-4682-8137-c733c8875dcd@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:13:55 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] media: dt-bindings: Add CAMSS device for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
 <20251028-add-support-for-camss-on-kaanapali-v4-2-7eb484c89585@oss.qualcomm.com>
 <20251030-elastic-chupacabra-of-downpour-dbecfb@kuoka>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20251030-elastic-chupacabra-of-downpour-dbecfb@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=69041b6d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=9EXZDvy5A2aIlouvqkoA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAxNyBTYWx0ZWRfX/9/6+qXL0z8O
 C9vEc4v5A5WnXwBDkVEXyhz9ECvaOjiYp2fzWsT1aQJh0wOIsEcHyHevqLFP9hmAYew8wOHbNQ4
 gLpja1von36tLFuMuS9kcqZGra6u0EDxT1YPO/bSuh7SEEwQiQnWU4xkdkF5deFAD58jj9qpmi2
 50V/PoOQeGMk0DqDP0/rE1mMvWDzFE51mPTnaRFl4MAsRIJdVeUGMNoukf9PhcvsCiKO9AO2sbY
 UBXMLNGTNvGxpjjF5gHfdPy834l6NBODw7JrrIzcoTv96A7fvWiJuHIQthWw4d1Y8TRDmH+XpPd
 B6VE2tiJKLkbA6f2AH1uGsN0GXN8EWFnZKhD33w1/RXrYA5wPn1uDckeaInNxl2383i8XRT2Bu0
 HAeiIhGQy+FA9qGIjFYcBVbv/obvrA==
X-Proofpoint-GUID: upeOCbx7ShGgbyKnLfZedQRC6AcBA5Lo
X-Proofpoint-ORIG-GUID: upeOCbx7ShGgbyKnLfZedQRC6AcBA5Lo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310017

On 10/30/2025 3:13 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 28, 2025 at 10:44:11PM -0700, Hangxiang Ma wrote:
>> Add the compatible string "qcom,kaanapali-camss" to support the Camera
>> Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
>>
>> The Kaanapali (SM8550) platform provides:
> 
> SM8550 is not Kaanapali, AFAIK. Looks like typo.
> 
Yeah. That's typo. Will remove this version tag for Kaanapali series 
because CAMSS and other modules only use 'Kaanapali' name. Adding 
version like (SM8850) is not considerate.>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSIPHY
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 406 +++++++++++++++++++++
>>   1 file changed, 406 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 000000000000..c34867022fd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,406 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    maxItems: 16
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  clocks:
>> +    maxItems: 34
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_nrt_axi
>> +      - const: camnoc_rt_axi
>> +      - const: camnoc_rt_vfe0
>> +      - const: camnoc_rt_vfe1
>> +      - const: camnoc_rt_vfe2
>> +      - const: camnoc_rt_vfe_lite
>> +      - const: cam_top_ahb
>> +      - const: cam_top_fast_ahb
>> +      - const: csid
>> +      - const: csid_csiphy_rx
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy4
>> +      - const: csiphy4_timer
>> +      - const: csiphy5
>> +      - const: csiphy5_timer
>> +      - const: gcc_hf_axi
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +      - const: qdss_debug_xo
>> +
>> +  interrupts:
>> +    maxItems: 16
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description:
>> +          IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
>> +      - description:
>> +          IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>> +      - description:
>> +          IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
>> +      - description:
>> +          Titan GDSC - Titan ISP Block Global Distributed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: ife2
>> +      - const: top
>> +
>> +  vdd-csiphy0-0p8-supply:
>> +    description:
>> +      Phandle to a 0.8V regulator supply to CSIPHY0 core block.
>> +
>> +  vdd-csiphy0-1p2-supply:
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
>> +
>> +  vdd-csiphy1-0p8-supply:
>> +    description:
>> +      Phandle to a 0.8V regulator supply to CSIPHY1 core block.
> 
> Nothing in changelog explained why suddently 8 new supplies appeared.
> 
> What exactly changed here?
> 
> Best regards,
> Krzysztof
> 
Thanks. Will add more detailed descriptions to explain this change in 
changelog. We once had a discussion with Bryan and Vladimir about these 
supplies name paradigm in v3 revision. That's the conclusion from that 
discussion.

---
Hangxiang


