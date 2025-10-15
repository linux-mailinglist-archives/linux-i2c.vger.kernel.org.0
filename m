Return-Path: <linux-i2c+bounces-13491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ABABDC369
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 04:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DF524E3E9E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 02:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A07226D4F7;
	Wed, 15 Oct 2025 02:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fj7BQ+f7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1C72580DE
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496979; cv=none; b=TRnO6qrH5DbTSr5lDuiaERLu1w3/g4aXr5/P9/dpQ7StIMc8uY6mfrg35fNs0OII56/s1Dvd/KyTMHD6yKXRullyRA+m7ZTrP9foP7osuYorofOeY06/Zu3oqj7UQ93og8QGLZwv9tNXJ6lV43FC/grgiLOUod0sXKjRP60emD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496979; c=relaxed/simple;
	bh=Kjr3ghiFhoEm7AjSPByV1uHThM7S353r7iIvTBhT2YY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kRFgxYN7rniviz3QDEN96/apQAiAr0xC9x9PFX7uRoynzx1SQ3jeFq7FzSSB3f5eG7N9ir9cc5At2Z/2kgMzsllqQde+6CtPN8RqClxVW1Efb/w0B+He1uvY7wFnIyIqAuLedPBA7Sf+B5zlYmZ3YCGKVC/tgBAHfLMykDoVAks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fj7BQ+f7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sFSW016276
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K1dAs08UzkyLMIXJtBsx5r
	bZIrn2HyC6e0aCnh1ANvI=; b=Fj7BQ+f7iD8YJakmYY00sY86Xgc1H5A32JyttD
	lc1k6+9YdDeSAQ36qQXxyZUQ8ENwJEgtjCraIn6JQtpYfJ7V2U1kUU1vWaqj+CwU
	C5zG8fgEap4bqjAxjuwexa30+iLpMgrZxd5QSQjaInZs+7mY0aURZ5qg153TaypW
	fVx69sT6lGTwU0V40G8gCT//DTtIbmNtFkl6n+MmGfEIlZzSkDFokwACyxcgSjPq
	pOFdlLYiKb/EupsjeuNkfWP4EY6X+SPJmM0HrL8jYVgBrt1FKQ+g2Zsqg3NUnlR0
	hFW1UtN5omngh3OUff7UFnwd1g/vqDD78BYSsA24aSoSSfhw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkatu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:56:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2907948c307so40691415ad.0
        for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 19:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496975; x=1761101775;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1dAs08UzkyLMIXJtBsx5rbZIrn2HyC6e0aCnh1ANvI=;
        b=WYAThyJZRRvXgGQU8JN1hUHax+bxt9Y1nmU/t0ldn00GWgAjydh057w2mZGsG8AwA7
         Y0XbfQLuT7hzt4gs3bCHXhJIacZTs+qmFllo/xa5jtRg+vm++bihKuQS85xAHDWVdfVF
         cV9t7TPgYl1r99Z/O1k0Q2+U8gwkM17ncl6uX1yqMt30O81jb+S7SchKSvk7emyOYG4j
         pKOzbYKBORm/232Iy+3VZYokO8cdaY1t7BPEr19XR1t934gaBkNIckp2sU9EqP0g9lyR
         yZYY7JHa36f/MCaaIjvfznZAEu5RS3SqiiICCq9R5Ws9XFhhDpTdjQM2ATKVZ6YWY1zp
         8TCQ==
X-Gm-Message-State: AOJu0YzggrQO2n1f0/9A9IaVJcOiad6eu+KJpARFic9OTazLtK9CF5KI
	RdI4Sopgk8h0j31lNTARBOPDTD1AEapelZIHMIsLHjTB+PQiRe1cTeaTEKVhivg/N1ZdD7Fktu2
	HGxIfsVGo96gERCr+daAh824no7CGQmFoK081YA+xQvwnLBDC9BcbcWQvSAH+Ymw=
X-Gm-Gg: ASbGncvPV++H7+bKCTZNiasgRSPuACOseurytMStuMFAJ5DSTy7YpESFcWaFImRUKpA
	kuHzgXT94alqrrYlJRPiQIvWxvsJPrUoC095eyyZmgRYMVqtM7Ys0tNt03IElaK0cqhUVNHwd0e
	SRmWImRCq4UKTX6CPwmQn+ol3wOp0mU5AlJ7mEaoCXoe8SMKHHMW2dAYr6FeHF465JZNt9b3wrn
	2cWie+xjL5ZPOmsdoYsRIUQ5dpxvNBFiTivIrKSGAz6izVUeNOlkc7JSv+kyWXO147vC9XsXkuR
	t5BrlJo9eiskU6TqxGbHQGmXU804633tOEw+XWZC8CBivBbwumjvNJx4GvL9DhN1f5cZ5YroPPl
	EtOwZkj7+XVDmMB8wnCITJobEH4Ua7FYKffTUo688QwLTuREP+anLBQ==
X-Received: by 2002:a17:902:ef4d:b0:27e:c18a:dbb1 with SMTP id d9443c01a7336-29027373cb1mr378846395ad.16.1760496974808;
        Tue, 14 Oct 2025 19:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbPuuZJwubZcA1X3TvL9jOZsDcH79mZnR3vcviKmtSdz80fMT6aRjUwjcu/dItkzNrfnnBzg==
X-Received: by 2002:a17:902:ef4d:b0:27e:c18a:dbb1 with SMTP id d9443c01a7336-29027373cb1mr378845925ad.16.1760496974323;
        Tue, 14 Oct 2025 19:56:14 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54d2sm179122855ad.12.2025.10.14.19.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:56:13 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: qcom: camss: Add Kaanapali support
Date: Tue, 14 Oct 2025 19:56:00 -0700
Message-Id: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEN72gC/02QzW7DIBCEX8Xi3I2A+P/U96hy4GedoNjgAHZTR
 Xn3rp1KzQW0q9E3M/tgCaPDxPriwSKuLrngaZAfBTMX5c8IztLMJJeV4LwFZS2kZZ5DzDCECEZ
 NKUHwcFXKq1mNDrDStdW2krxDRqA54uDuu8nXieaLSznEn91zFdt2x/NOlnD184aEVQAH3UhbW
 0TFq/IzpHS4LWo0YZoO9LDT88WOeFsod34Z/MemFntoIWFJCJOKJkAOYNGHTIJJkUwvw4AR/DJ
 p+oxGwxuh2/JY9xTt/QpvuO0GHr/BjMFcwXlYh42fzcX5M4xUD2Q1aIHHpjVl90fSilJs6V3uC
 493Eu2tRUNVnr+QQfvQigEAAA==
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: HDq9nx5e3nQbXVj4IBmV0llhbDdK2Amo
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ef0d50 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NMcFVE--X395r7UwzKoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: HDq9nx5e3nQbXVj4IBmV0llhbDdK2Amo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8N0tQ/SjiMGU
 NfOXsfCFcNxxsWPVjZxmrL/hbOGOnVhscjHAzTSzJ0NcWNXaIsP9vV3yveCBNeABlaGVcPFAoyk
 8jD7IUV+zXnIuEeM8Vq7ninw30u4KEZQy/jZXFtzXdRCs26ViVYH11kthW3FODEpVlDNMXFEjuL
 5X1twlvB3hZA3wFd5I0SjbHA19COP0t2zt6P5MHXg1gbMbf36tGoH5hyF+hPkm8qbF8YIMd0rQO
 PBBALNzqHCan37aBr4YLffpjLWqeEsL0RtE64jKNQ7cLRyYGDf1aPJT4VCGshseu4PsBomFz3Z7
 DnPSToO1hp1GTth86RfYo73EID3Kn/jGZdkLxqP6K94XhDGbbMdgYdx9wt1RQAeHwGMe71QC/Gl
 A1Fn5asVY+mwT/qkfUcJ1zq6iLK2LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

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

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
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
      dt-bindings: media: camss: Add qcom,kaanapali-camss binding
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   6 +-
 .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 371 ++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 drivers/media/platform/qcom/camss/camss-csid.h     |  12 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 147 +++++-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 188 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 14 files changed, 1576 insertions(+), 12 deletions(-)
---
base-commit: b09b832c719df5e10f2560771fd38146f2b3fd7c
change-id: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
prerequisite-change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436:v1
prerequisite-patch-id: 3ac5d6703a9530eda884720c146b9444f90cf56b
prerequisite-change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49:v1
prerequisite-patch-id: aacb03b359fdf95977805f42918c0b6c39889e32

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


