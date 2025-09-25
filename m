Return-Path: <linux-i2c+bounces-13147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0198B9D4B2
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 05:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E0811682AF
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 03:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02952E6112;
	Thu, 25 Sep 2025 03:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QX3/bvxM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD65E2E6CCF
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 03:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769950; cv=none; b=q03WmHaY4BRu5UPsuP3SOlM6kr1S/xyRayYoiT6S5DN0kcRx48emzZBLPKRxo4SXgTsjH6b+CTbqvBu5a5qiFzGZt0wnI9xUjWP7LSLe+Dio7jZZT1///4SmxKmk6Kt9dsbzoBxuKL5t2VlshCT+/8vDx2Ppq0IiEzr5vFKkC24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769950; c=relaxed/simple;
	bh=WbmFfTKbiM/cwdUypO1aH6ubcdAq8We7GZ3/XDnx0ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hhw37jT5tymWXV80xRpxPCWa/xHZPDurBSBaie3zZkXgXM9wMYPWM8mLrUGBWhcBtuX7e2sn0Joh9vea8jjMnkKGDdmUPKN1ADxzUfF/Ducy48mG+W8bbzMiD8KypZRVr1N2bG6pdTF74dcUP4he+Rya2EFFT7b1wxeH/6otqu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QX3/bvxM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0QVa8016453
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 03:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Amq0dTDX4tA85cdveazerftB
	mRhuknHwIj5cEGLZUHM=; b=QX3/bvxMJpUNneqiGEbcUn5qIlagFcGf1E1FLQOF
	rr/aBDxXnxSBFj1Yidj4mISkpPe+Fm+AgHhn5jn7T7hogyeNkkzUmVMeB7nrcSGm
	lOp4BSlbQ7EqNaVODvWNQKNdE37KmHBdcF+bPbv4o2wi8kdJYXTZ2zrh/jG5/ox7
	9pC+yTnmcc3e61zgi2MyroMgkTzK+swMuhVGvCBO3ZxlS+XQTG+4o781VyIn6bUj
	kMKG6O0VIt+vVtmZqoORf0Y2iaKI7t7cFANkjfPUGG39P82fBuEXN5FY3pBX4nMw
	e4MWksWQTXQFJWULkgVwMoNtSs5Ai+gv29VuV3oKpT1lPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyjcaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 03:12:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5ecf597acso11345341cf.1
        for <linux-i2c@vger.kernel.org>; Wed, 24 Sep 2025 20:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769946; x=1759374746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Amq0dTDX4tA85cdveazerftBmRhuknHwIj5cEGLZUHM=;
        b=MDK1MH8wTnbOsUlQxfj+5SH2zaW5rZZRSf0EsyQwTGzNrFIUzbARYbupCyqWKeY8Ys
         VAISN61j1vf1mLyzBR1q1N+CQOpq35bDhIg3CBI21Eit+4sx9fS3Xnz1ZDBKrVs609tj
         n4oo4lO58+j7EzuI+UIKTk+tTytVDg2pCmapNTJkXl9MC41XDcITjljw8DPhwYO5GLKZ
         iKBHPKwIn2ei/HzaU1K2Z2XaN3LV97gqJ249UlVVyBUjRx8vPtg1wFtWOEQX2IWcQhmW
         MwzvEZwy4rFVfkKzc24NNwocfeSvZM7Atoe4K5C4vedFMhH3OyHIJniwqT/49Lerb1g9
         H2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUgjF6p40IsvMEXP3zJezIKhIQTL8LtAETFWPKxnQlerTxO/VkY1++nF0j+7qnFIJ/DY6Pbld6hH+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+7VulUa5l8UtbubMlaQvagddNtYKXum1aK3G3jtsgx19LE1s
	Evc1oyK+RRrWoInDfilxnZ/8eK81zCa+WofC+cBDQcEoc8fmqdn+5C9a6x88dRfmi3tqQ1xCy2y
	l0uXEbQzaj3waQQ3/CrC7UqCQZwaNqJQezxnKe34/OWCt6vqrISlEjcB4TxcXtUB8ZYFOLig=
X-Gm-Gg: ASbGncs5AEWJXw3hfdzhTnQIbpYPmZ3E3yIMfZLQYHPZZKx5nL54WvVKYFvx0KUcJpr
	GgJ13dUzVJ4zowHOBxjOLMdG7Uw2NYPi1QWmPK/tZOiKu/oSDew1k46lP0y7sv8oraBmOFrV4bN
	0giaTEU5VrcWLRYZ/8RIg8ykivIuyKGl5LbAM6s7vQRtD7EguCC703VoWIKn3d6qJzCSb0edbAV
	lyYlWthsBzxghDWTMfaEF9hHlWuhatCLDT0NUkGJP5kk3FyrY6BliP4ZSxwB7MlW1D+pzEZ1mXp
	wLNq/GCnW8/GtD+JHPac4bmyYhm0k3y1K1B3Qmw6GI5GPw4EPpozd2Ew9Cziw/ycc33lAya2AIR
	qMdcWA3i9LW3507BhhtIEmY7rgNQ5uzEccaUReOk9JLAvl4H6kzLt
X-Received: by 2002:a05:622a:5e07:b0:4da:7d53:c01f with SMTP id d75a77b69052e-4da7d53c586mr13402151cf.28.1758769946101;
        Wed, 24 Sep 2025 20:12:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGndvSuvzNUzS8kv81YGOyyzpwLuM8ZOteNmHmM2cVjtyrZj5/sHFUjxtIwXXT3+ld+Wv/Ysg==
X-Received: by 2002:a05:622a:5e07:b0:4da:7d53:c01f with SMTP id d75a77b69052e-4da7d53c586mr13402031cf.28.1758769945522;
        Wed, 24 Sep 2025 20:12:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656243sm279134e87.91.2025.09.24.20.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 20:12:24 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:12:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
Message-ID: <cei2cl6mbjatq54bmersjdcql2kw2occrygk6hid23eaecr62m@ozrrpxh7l7ws>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4b31c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HZEin34QoVA2C26_ZvUA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: JB3cXi0SqfSayzGfGkfERWcp2LmlehJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX3YMMzs/DIFwJ
 to9dn/5oa9LDqmsoCJm9Y27MOkyMhtjhZA4TVkXif2AAD7Ea8agyxbC6eZi/yiIs6cy7DmMEKfU
 6CJXBghLNWjhhZCNFRTCkCOotTNeJ42oPLmYV/h1rgDORKjYiVlFP2/5DrSroF5SB+yfVZfRDIh
 ddFtd3zSm5zVfl1uyJyLZt7QkBgK9+C7gDTtYdXXNoOjdBLOaOhfZNetKB7fHg9ohvNW42duhc9
 NEohb0jpJGYURpJvm1aLnQBDi8h9iCX67VeSE8CL//XPXZ1bgm6bqK1fvS6UnJe84AnpaQJG/Lb
 3Wh1GigcixTagkyJAynPPVeNpPezfnKS6qXnpmRQ8L2cwH3h7pljFiQqclkc5x+Yz2m9cxQKMeC
 uC+qWG99
X-Proofpoint-ORIG-GUID: JB3cXi0SqfSayzGfGkfERWcp2LmlehJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

On Wed, Sep 24, 2025 at 05:02:49PM -0700, Jingyi Wang wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add bindings for qcom,kaanapali-camss in order to support the camera
> subsystem for Kaanapali.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
>  1 file changed, 494 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 000000000000..ed0fe6774700
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> @@ -0,0 +1,494 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-camss
> +
> +  reg:
> +    maxItems: 16
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 34
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: camnoc_rt_vfe0
> +      - const: camnoc_rt_vfe1
> +      - const: camnoc_rt_vfe2
> +      - const: camnoc_rt_vfe_lite
> +      - const: cam_top_ahb
> +      - const: cam_top_fast_ahb
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy5
> +      - const: csiphy5_timer
> +      - const: gcc_hf_axi
> +      - const: qdss_debug_xo
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 16
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_0_mnoc
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description:
> +          TFE0 GDSC - Thin Front End, Global Distributed Switch Controller.
> +      - description:
> +          TFE1 GDSC - Thin Front End, Global Distributed Switch Controller.
> +      - description:
> +          TFE2 GDSC - Thin Front End, Global Distributed Switch Controller.
> +      - description:
> +          Titan GDSC - Titan ISP Block Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: tfe0
> +      - const: tfe1
> +      - const: tfe2
> +      - const: top
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
> +
> +  vdda-phy0-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy1-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy2-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy3-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy4-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy5-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSI0.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSI1.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSI2.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSI3.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - vdda-pll-supply
> +  - vdda-phy0-supply
> +  - vdda-phy1-supply
> +  - vdda-phy2-supply
> +  - vdda-phy3-supply
> +  - vdda-phy4-supply
> +  - vdda-phy5-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
> +    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>

This will break if corresponding patches are not merged (and they were
not even declared as dependencies). Please drop platform-specific
includes and use ephemeral DT nodes instead (you don't need any of
indices, just the nodes).

> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      camss: isp@9253000 {
> +        compatible = "qcom,kaanapali-camss";
> +
> +        reg = <0x0 0x09253000 0x0 0x5e80>,
> +              <0x0 0x09263000 0x0 0x5e80>,
> +              <0x0 0x09273000 0x0 0x5e80>,
> +              <0x0 0x092d3000 0x0 0x3880>,
> +              <0x0 0x092e7000 0x0 0x3880>,
> +              <0x0 0x09523000 0x0 0x2000>,
> +              <0x0 0x09525000 0x0 0x2000>,
> +              <0x0 0x09527000 0x0 0x2000>,
> +              <0x0 0x09529000 0x0 0x2000>,
> +              <0x0 0x0952b000 0x0 0x2000>,
> +              <0x0 0x0952d000 0x0 0x2000>,
> +              <0x0 0x09151000 0x0 0x20000>,
> +              <0x0 0x09171000 0x0 0x20000>,
> +              <0x0 0x09191000 0x0 0x20000>,
> +              <0x0 0x092dc000 0x0 0x1300>,
> +              <0x0 0x092f0000 0x0 0x1300>;
> +        reg-names = "csid0",
> +                    "csid1",
> +                    "csid2",
> +                    "csid_lite0",
> +                    "csid_lite1",
> +                    "csiphy0",
> +                    "csiphy1",
> +                    "csiphy2",
> +                    "csiphy3",
> +                    "csiphy4",
> +                    "csiphy5",
> +                    "vfe0",
> +                    "vfe1",
> +                    "vfe2",
> +                    "vfe_lite0",
> +                    "vfe_lite1";
> +
> +        clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +                 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +                 <&camcc CAM_CC_CSID_CLK>,
> +                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                 <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CSIPHY1_CLK>,
> +                 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CSIPHY2_CLK>,
> +                 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CSIPHY3_CLK>,
> +                 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CSIPHY4_CLK>,
> +                 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CSIPHY5_CLK>,
> +                 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +                 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
> +                 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +                 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +                 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +                 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +                 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +                 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +                 <&camcc CAM_CC_IFE_LITE_CLK>,
> +                 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +        clock-names = "camnoc_nrt_axi",
> +                      "camnoc_rt_axi",
> +                      "camnoc_rt_vfe0",
> +                      "camnoc_rt_vfe1",
> +                      "camnoc_rt_vfe2",
> +                      "camnoc_rt_vfe_lite",
> +                      "cam_top_ahb",
> +                      "cam_top_fast_ahb",
> +                      "csid",
> +                      "csid_csiphy_rx",
> +                      "csiphy0",
> +                      "csiphy0_timer",
> +                      "csiphy1",
> +                      "csiphy1_timer",
> +                      "csiphy2",
> +                      "csiphy2_timer",
> +                      "csiphy3",
> +                      "csiphy3_timer",
> +                      "csiphy4",
> +                      "csiphy4_timer",
> +                      "csiphy5",
> +                      "csiphy5_timer",
> +                      "gcc_hf_axi",
> +                      "qdss_debug_xo",
> +                      "vfe0",
> +                      "vfe0_fast_ahb",
> +                      "vfe1",
> +                      "vfe1_fast_ahb",
> +                      "vfe2",
> +                      "vfe2_fast_ahb",
> +                      "vfe_lite",
> +                      "vfe_lite_ahb",
> +                      "vfe_lite_cphy_rx",
> +                      "vfe_lite_csid";
> +
> +        interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "csid0",
> +                          "csid1",
> +                          "csid2",
> +                          "csid_lite0",
> +                          "csid_lite1",
> +                          "csiphy0",
> +                          "csiphy1",
> +                          "csiphy2",
> +                          "csiphy3",
> +                          "csiphy4",
> +                          "csiphy5",
> +                          "vfe0",
> +                          "vfe1",
> +                          "vfe2",
> +                          "vfe_lite0",
> +                          "vfe_lite1";
> +
> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "ahb",
> +                 "hf_0_mnoc";
> +
> +        iommus = <&apps_smmu 0x1c00 0x00>;
> +
> +        power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
> +                        <&camcc CAM_CC_TFE_1_GDSC>,
> +                        <&camcc CAM_CC_TFE_2_GDSC>,
> +                        <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +        power-domain-names = "tfe0",
> +                             "tfe1",
> +                             "tfe2",
> +                             "top";
> +
> +        vdda-pll-supply = <&vreg_l1d_1p2>;
> +        vdda-phy0-supply = <&vreg_l3i_0p8>;
> +        vdda-phy1-supply = <&vreg_l3i_0p8>;
> +        vdda-phy2-supply = <&vreg_l3d_0p8>;
> +        vdda-phy3-supply = <&vreg_l3i_0p8>;
> +        vdda-phy4-supply = <&vreg_l3d_0p8>;
> +        vdda-phy5-supply = <&vreg_l3i_0p8>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            csiphy_ep0: endpoint {
> +              clock-lanes = <7>;
> +              data-lanes = <0 1>;
> +              remote-endpoint = <&sensor_ep>;
> +            };
> +          };
> +        };
> +      };
> +    };
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

