Return-Path: <linux-i2c+bounces-13915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1BBC23187
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 04:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59C5F3B7B1B
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 03:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F58270EA5;
	Fri, 31 Oct 2025 03:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmUGrBj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfOE/arR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFD71A76D4
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 03:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761879613; cv=none; b=XdMYCJEm6A70hXZmyyZZyrMslBdI3HPFmTWANy5tTJ7FYWW9NBQfA9Ae7Z/twKNd2tsKQUkggeRzSR8z7P2HidZaIJnS3YX7Y/RU9I2tGbs35IgPC1PxAfIwqVeWRYe7Q/0jqYnX1glKTuM2Ct+N4GeL9Rh/hPgChS7HgY6A3mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761879613; c=relaxed/simple;
	bh=Khzz40hwj3ZY3+as8VHtCKliJWZtzAwIawNDjDFsAro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JlRIN8uZix6d6aJR1h2dLPOgtMMLyZLyyCs+/VkaGyPzBRU9JBneMlNrXB7c9P3JsetPxvNlxEjlJk7nRquviprcYZzapYgRSGyHX7h1XtMjCAB2E14K6mhJEboiAJzkMFmH7Hxf+jk5Pg3UBOrldGQZMSu4soR2UvK97ZF0UBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmUGrBj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfOE/arR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V188Gw1417233
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 03:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m6KoZ9TvPTrc1LEEmgj3G7
	lzZyeZoPzNbqQ3wxDyJ94=; b=HmUGrBj+nGfU0lJ35hqnzi7baE+LUdBfl0L0l7
	Hpr/tYrk+RUh0HZm1LlJ1vA6lAluOs1gAXRYspM6cX9JHP5mZG4yUqrk7V+Y7bxj
	Zl0+nvdKci1pr3FGylXFV+Bc7mCn6QHg5NDdvzLAW09mOnm4qHBL/2rdkcun2ld5
	IjEmyIXpUHP6lOcyRYK0YAHBDd6lgkA4ED8P1CVzw2NREcwoDtBUxnRo940w43I5
	+aI5don2Kffg7IcrBrrajRWqC0ZtoXatQTapRliyluMUqKfvR3vkJAet/hKrS41P
	IKOeLRlSQgh9r7KeCSvElds6bYujltmITZLkX0LcKK3dEJQg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69g844-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 03:00:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78117fbda6eso1579641b3a.3
        for <linux-i2c@vger.kernel.org>; Thu, 30 Oct 2025 20:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761879609; x=1762484409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6KoZ9TvPTrc1LEEmgj3G7lzZyeZoPzNbqQ3wxDyJ94=;
        b=hfOE/arRfcRAY2XB2K24MTtQ/YBAGwIiT7eEXTZSsg5cfKKF3ga+A2Vd169ZbsOsQG
         v4rDUwwLeznNw9wssaaAbKmWdBK1Ece/rHeP2aBGuNLIg3DcUaK9KDBjVM0lQUeWuLRV
         4eD/VTFbwgkl25p1wwgBDdouBDURZ7T7/n4/vF4Ri/GhnbwsY45vnG+GFi7qfg7Az35x
         MW50yGnZ73jOTPLq/zyG4ljPXfamrtQ4w6spG9KR44pJ0lC6JwnYMc7iyOB1/0RlN/4+
         VkfFiEOCyzteIwtm6xV0aARsFRqYYicO6WB43QLW6e1D6xtpG7dr7nUw4A8uz5ctyjvt
         k7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761879609; x=1762484409;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6KoZ9TvPTrc1LEEmgj3G7lzZyeZoPzNbqQ3wxDyJ94=;
        b=l2kmUuJPwqtz1jeRAuYz4cHuIBa5jpUzegLkq4Ga+JBF33ZKQMMV8r87JDNrTNyE67
         ti+1gInZH5P0tEyR9w3IFevcxuDpy22pyyv1Br/wNB4pAlsZlE+TVw8DUuiiG9Ao23wc
         40hJIZPBQeOhcDBMMdfdJ4uh7+i8QB7rmB+/H6aPA/tv3OPFH8H3t7RF0pCPgUKmsam4
         HY+OEoG6is5ut8c7qEn92ZugVsGla1/LKcS3V1iNB/U/LiKjZ8dSoIZTYOzwJAaHuCLj
         S9nXno8uRAKsisuo4i7PK68ujctuz8IljEwVZPQHkYirVAUFL0GXpbI35btXpJZO4INm
         YGtg==
X-Gm-Message-State: AOJu0Yy7D+Trez1bdkVpewq8HgPgQYHxeYWRriOk0MxfG0MAPEYmTtVg
	QC5/VVB9QtNLffe3np2b0HSvjhH2aW+XSQjbAoLFfOVkZUGiF70GzwMSRCqZYrAOONxr7I5ajs+
	PqFxbscPjEBSRHp9hgLnQZKk1CW1Au/0ix/Q1vCMO+hcGW66mK5TrEiwZhoBy3mU=
X-Gm-Gg: ASbGncujVzRfeRzj76oQqfM5XMDRPM5DD8LIzhBKaN9ojBZpPeP/CVNunEnfDvVVtUM
	DNKGBGzUNMNlawgjNtSa4gGiBlmr+8BcdqMwBH+DOkH8Cl+6n+FCltRwXAhAb0LUjGmpS70n6MR
	0NrGQlmm3fmo6E7IUQ1OBDxxTkPBW348CP49+l1QKP0lJV9BiuK5bAb+lohsEmvS+38mTDzb4sA
	CPlEBQcDkrKcuXLzJw/tvIZfyYl7enM1PyAXxnpaDpBS3Qx4NfQqyf+r/PH4wOd9e25q0xNnVhR
	8KgFLJ9qNjmy8vQHg65I+n+gJdegxV2uRRL3UjqC2IvTIW2576NBj2+EYguKBcGOiW0Nw8eMfnT
	nis7T/A/ZT7OrGJIKXxTKfSp5TCh6M8fUcDUxYvcSmBTB2pOSoctnIA==
X-Received: by 2002:a05:6a00:94d5:b0:772:114c:bcbb with SMTP id d2e1a72fcca58-7a776e942d8mr2260609b3a.4.1761879608354;
        Thu, 30 Oct 2025 20:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAmdM5sYVWdCTBztzNB/MuLI6WpgOljKdkJdBKk42LnlvU3VgUlkHnB9tegMCR55BWgVmcnQ==
X-Received: by 2002:a05:6a00:94d5:b0:772:114c:bcbb with SMTP id d2e1a72fcca58-7a776e942d8mr2260553b3a.4.1761879607780;
        Thu, 30 Oct 2025 20:00:07 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db67cbdfsm352570b3a.49.2025.10.30.20.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:00:07 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v5 0/6] media: qcom: camss: Add Kaanapali support
Date: Thu, 30 Oct 2025 19:59:47 -0700
Message-Id: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMmBGkC/42SzU7DMAzHX2XqGaMkTdZ2J94DcciHw6K1SUnSA
 kK8O+5AsAOTdkgiW/bPzt/+aArmgKU57D6ajGsoIUUy1N2usUcdnxGCI7sRTCjOWA/aOSjLPKd
 cwacMVk+lQIpw0jrqWY8BUJm9M04JNmBDoDmjD2/nIo9PZB9DqSm/n2uufPOe8WwQEk5x3pCwc
 mBgOuH2DlEzJR9SKfcvix5tmqZ7upoNtYrfdM64vKW7VRDZq04qo4XzfrhCbi/Ior2J3BKZCW3
 soDnrjL9ClpfkmxRdJZE7NLKXth9Ur/4hf34rnfFloSnWb7n/hnjY/YgkYCkIk842QU3gMKZKA
 ZOmMLN4jxniMhl6rEHLOm562e4PNKjLnbjAbf1HfAU7JnuCEGH1G7/aY4jPMNKwQShvOLZdb+V
 wjSQ4JZ0QbAnz8R1K1XUp5LI5AR2SZB51JYEmUO3AnOWi14g/OKPpU5sYoR52Ed+o5nmleEfKf
 H4BryDuFOcCAAA=
X-Change-ID: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
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
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNSBTYWx0ZWRfX3Cj+42u3H/z/
 HHvfcvT+Lg2ehKfpdINyzUatMkAXmD0bPe6XdeNoK7LOplCF62JMMxz+s6UF0qtqaGtxinEPyqO
 hyNSmzeXE8FT8vFyaOrzkv6cqcNdMThExdZQd/s+YpY+Wbvug7ckxRjHxiKcASa6gef4E0tCfZH
 JOP0e0OKIN5Etz2DfR28034UkCcQE4MJZSln9+knBzfkyZg3WaaENXxF3jaPkqwPaMyln7V8k7B
 zUWrBZHberKXb4KcHylEBCs66eYinrXjxYdTJhTQRwBmzMP2h+ZfB4+SuVTMLBSabeoMhuhh7cT
 jJpNDc3Pv5TG9gUCfcJksVIBk81AugnK6u4OJJck5AcaKyHSuNAW1f0KWcYmaJIO1HH3b+5y/bw
 UZuaGAExsMhVSUAELRSTPOk98rTwdQ==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=6904263a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yQDS3Gn8WMEx0jDyfooA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: QGEyXXy-YRIx_0Ov748Pm1YzEqqO2aCp
X-Proofpoint-ORIG-GUID: QGEyXXy-YRIx_0Ov748Pm1YzEqqO2aCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310025

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera sub system provides

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.

- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/all/20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com/
- https://lore.kernel.org/all/20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com/
- https://lore.kernel.org/all/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (6):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,kaanapali-camss.yaml       | 406 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 382 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 +++++++
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 13 files changed, 1486 insertions(+), 5 deletions(-)
---
base-commit: b09b832c719df5e10f2560771fd38146f2b3fd7c
change-id: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
prerequisite-change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436:v1
prerequisite-patch-id: 3ac5d6703a9530eda884720c146b9444f90cf56b
prerequisite-change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49:v1
prerequisite-patch-id: aacb03b359fdf95977805f42918c0b6c39889e32
prerequisite-change-id: 20251021-make-csiphy-status-macro-cross-platform-5390dc128aee:v1
prerequisite-patch-id: 27c2ef96f0e747ec6b4bcf316d8802356e4cc3f4

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


