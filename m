Return-Path: <linux-i2c+bounces-14265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B5C88FF5
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9201A4E2827
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 09:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6592FE04C;
	Wed, 26 Nov 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hU5ios4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apTI4BAi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C692D23B8
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150008; cv=none; b=p09mQxa33rid3NbzxRr9yfCk7rHlJSv307iSkOv80UXt7nEHvOIHM/nZ650lrGogOLBNzRcfSjxLT9IbvJRkslXNYLDwvPQi02cRKj0iuskiEpxtNtHOgrQHV0MmsskkBO7jNvnZ/PvVqHkVdvaUpF62dOthDKZNw7KF2HE+viU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150008; c=relaxed/simple;
	bh=V/8+cWoZiwHgZPId75epFT0IeYm8R99Lm+VnrUpHI5w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FFgyGwxVh4J2UuHSHeGF0xz0a4g/qeA8nyVg+tbdUHu0ODYiEvTBC71HxgzVHJPtQ1ysQWLgrxZLfU+s9DGAacX4CTi4f1t1LVlJzZQb1lptOonLkUjMTPxC+6vlSdPs8+isvP0BjADYPYEsRV6MUeq5hNJoIwjIe463LqVBGtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hU5ios4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apTI4BAi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8tjfS1522175
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2fgCGvSUIInikFVkC42NLB
	Qiz84MdBMAq/PSjbj2+SU=; b=hU5ios4LbSO1Pw8JspAJnZBrQztO2HybONiBWc
	VncJmeoJfPxtS32m4Y4LfuVWJuEE+eJU/WBplWlLZZF6Aekv9dNRhSbsu7a0neGi
	ypNfFQ7geydj8Dlam5+NM9Vo/300L1PLak/adKZ/FuSjRI12Bdic1Zi03JMr/+v0
	Sm8jXksiy/Zlrq056AocfWb11kzSj3Ui014i58VeoezsGRkCEKWtdAxO/LUGXrRw
	3UcjDnKSBE4A+Zcbu3a/205UQqzng4busPYhfi6ueSYq3gop27y/4H5mAvDpzuiG
	TaFFshzEjy6KjcPLrjoVy0ZZbppdZtvcK4c0PuYCYtm1sTSw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anxfk059n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b609c0f6522so11708446a12.3
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 01:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150005; x=1764754805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2fgCGvSUIInikFVkC42NLBQiz84MdBMAq/PSjbj2+SU=;
        b=apTI4BAiQ+mh9p1Nsha+8SWqPPH5j/19aP6rN8+Ku8l2T13YPiBK9XlS3/PA2be+Qr
         cD7KWo1JSCVg8W/Cw0bq99spXG/5UAzsdh9sMov9xC8WIowNloZ6I7FXHFhqD2h14YGO
         DXmdC/fwzgVbPFlXScfuoYVW6oaqLr2coY1iqVQbLZKbfojXutGItAskE6hvt+LUzQ3v
         C2Ty4WcCnMmVzGroJV1TlvxYz90s29kQQWOFHjZ8qX2ZKgMIMy/mvOhaFyenfp3aLaL+
         LrbCRKbB3mJPqHyTtKFbvCAEj61QsE8qFsSxwDvgPbfirOCLRuUQc3JW79B+kxTnfrKP
         obOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150005; x=1764754805;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fgCGvSUIInikFVkC42NLBQiz84MdBMAq/PSjbj2+SU=;
        b=k+o+plVorE/G8NDZLX1pryyIJRjfcO43TbIRzsJYijalti0nsXN3nM41Ftm/qadeYM
         mFbNw53CYXybOha0RQV2sbfOv3zztTXWhbvU2rmzUVCpFjsMdJmCjwSF+Oh69LQOa6pB
         hDxIzPd1wJRIeb/ZfsemGfvo9ZJpbcA2STfbUrNc9g5Ih4HYEdTORvJgUIy/UoQkGeZf
         bvQvHrNOQ0VuG+a3R07upbLkRcVN2L1fnRm/sIC/vPxOheNlA4p3tj72CBL9wnPpAanp
         S95Ox3T5YVxr9G9DWhjnzN46bInVHpn3U5SJV9Cn3eOwkjPvindGkEtArjHLDpIy9L+6
         UOkw==
X-Gm-Message-State: AOJu0YwLaBzD+nkm98MbWJmQk73QbGEmIKPdhL0nRAomkKzK5i5XGDYE
	5uirZOL6BAyIM4POyViuhpexEMrV6KOwbAEK7ydG08P2Xy6xww/J3dxIfcyEdUs9mlxhI3xjA2V
	SjXa2PTqQR0hmArC7VdInDaru0YBlUpMpB1lODj31QNFP2jFqmxhbFeK4bzGu23Q=
X-Gm-Gg: ASbGncvgvVgWlwsH062Tsqgmvx/1NX84Mt0Wyp71j0EchLeypeqc1vma73uGfIujFld
	zooKX253UG/AGYGvHrFzw369ywJcB1Yb4TKL7+2M7f8Qs8+YLehtYgdFLk5uwL4r6zsx0f+E70l
	Q6XfMDMVKfmiL1tww7FPvtJ5nSVFAI4Rk66huMAerp8goHxPidPx8zSycxm01MknBr7HMDzPKSS
	hIHY8HAdca0MRV4RWs99AIQ7+6oXEihcYkrVyuTlbSLHFf2bvMUccML0dvc1Lqu3uIghOeCacQn
	R3uyMwdzCXMG18rNfHKAsrO3rBhqSQoPKFARQOR73TBYxmzXBgViL/h6zbe0s+nn+7Tm6M6Zm9t
	aI0FlZpQZuLL9amSPGqxwYNszHJbN563uywXiRcNSzvgP2MAdQB0Hxruu24LR17Xz
X-Received: by 2002:a05:7022:218:b0:11c:b3ae:c9f1 with SMTP id a92af1059eb24-11cb3aecb16mr4581779c88.1.1764150004945;
        Wed, 26 Nov 2025 01:40:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz2AQtDXrzsHnZomH2+ScK8UXKm2El5vxKs8Uxr+DGzpiE1bnoc26h/RcFRNOzG/dKGUR5Xw==
X-Received: by 2002:a05:7022:218:b0:11c:b3ae:c9f1 with SMTP id a92af1059eb24-11cb3aecb16mr4581753c88.1.1764150004324;
        Wed, 26 Nov 2025 01:40:04 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:03 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH 0/7] media: qcom: camss: Add SM8750 support
Date: Wed, 26 Nov 2025 01:38:33 -0800
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnKJmkC/x3NQQrDIBBA0auEWXdAbbTSq5QuxJmks4iK05RCy
 N0rXb7N/wcod2GF+3RA54+o1DJgLxPkVyoro9AwOOO8tS5gIkLdW6v9jUvtmNOmirWgbvHmDXo
 T8kx8DRQjjErrvMj3f3g8z/MHcgRrZ3EAAAA=
X-Change-ID: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: xMEn2uwqXYH9LCtpVXKbuaEM4YO7Qgqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfXwKSmxIprqND7
 vAwkNMT3u1VQkSRmWLoLxi0HqtUEcD2Uw3yl8wiZWjU/YzcodqAPo15nqYKdRfYDxqKKb/QUqOE
 iV3M9kqAsxRncgtvS39ZXVLJ5ontFZkvQI2lPBB63B6uwBxwhgCDq1/fq+M1KZuXs5AaJd5rXtT
 FNR1IQNRs4nnjImAATL8hFKtGriYb+vS6Uyc11MTU4Pl+0PoGvzLtztFw32CidyT3z9huTs/O37
 9Uf+ANufvYBCaSW+Z9aV88UjsBPKLDVHUjvO6y+WyhZFyxoQZS70NhkakDTNmSlbONstCUX6TSN
 eoCH4JnpKCOiTereNBUw4nQYvk5fdGj5FzePNySNXo8/oibdZYQW4dcJQ95KlPBEJUGs6wwOtcZ
 0zCrAeZa/9/jfCkkc8YyCBIvd6RtIA==
X-Authority-Analysis: v=2.4 cv=H4LWAuYi c=1 sm=1 tr=0 ts=6926caf5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SC4t0f9xk4gHsufEuikA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: xMEn2uwqXYH9LCtpVXKbuaEM4YO7Qgqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260078

Add support for the RDI only CAMSS camera driver on SM8750. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

SM8750 camera subsystem provides

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY
- 2 x ICP
- 1 x IPE
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE
- 5 x RT CDM
- 3 x TPG

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.

- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Hangxiang Ma (7):
      dt-bindings: i2c: qcom-cci: Document SM8750 compatible
      media: dt-bindings: Add CAMSS device for SM8750
      media: qcom: camss: Add SM8750 compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.3.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE gen4
      arm64: dts: qcom: sm8750: Add support for camss

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,sm8750-camss.yaml          | 664 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 599 +++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   5 +-
 drivers/media/platform/qcom/camss/camss-csid-980.c | 428 +++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  11 +-
 .../camss/{camss-vfe-1080.c => camss-vfe-gen4.c}   |  60 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +-
 drivers/media/platform/qcom/camss/camss.c          | 359 ++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 12 files changed, 2094 insertions(+), 40 deletions(-)
---
base-commit: c4c627ac2ae866d333c3ade7abc871a638364d7f
change-id: 20251126-add-support-for-camss-on-sm8750-506c4de36d88

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


