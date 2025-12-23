Return-Path: <linux-i2c+bounces-14723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E15CD909D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 12:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66273300DBB0
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B61F35E529;
	Tue, 23 Dec 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAD5Iu+k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUc+ne82"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6F35CBB4
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484514; cv=none; b=gqOP7dSU107yqZpuJdAV7UAwRfPnRjPAUgB76t2J4viv0DPVqXtzxuerdIbFnHx7TqeA7VFFRvTGra2oQdwk/zYQ8X3ODU6QEzemvaiwS+Aadi/HO+wRZFMEirVaeKlS5U8oP0sDHe3aPrCHLHB1gCluTaC+20HlVmXvsWtS5vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484514; c=relaxed/simple;
	bh=unAIDgKhg9QhzeW9uakpEv3eKVCahNH3FqiJ6BovVso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TpYK7IeX4AUODFdY3aSImrYD5uPAhV8vJvaW23aQjYRJk/QpNlru5H86vqw9vJ+850qanc/XoG/OpcZke2bRe7Z+JVfjcpfyNcft1+xlKWWBtGwKMyceJRSYbPfJRv2yBsDNnRpbwGoGp4yMIaLYCK7Hc3X5X0GlGRRE6mV83sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAD5Iu+k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUc+ne82; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3emo71357457
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	artYoiDNMTH0r3bnnXTYYzk/xEDcNrEIskXY9kVIFPE=; b=dAD5Iu+k8dqNZA1w
	SYEbsVxYHROS/uAQkYL6Eojk3yUnthFUizsIbXWTNMliMc2ICAznEDos/YYQ52Nu
	z+/AVT71l5cKV0GrnxaOQ9CmMR3JUO+dzvM79jgY/0GTlmodPVKhoJe1rNl0/SYf
	vaP6QXSG3l6FWFtsPJovm/DBl+E/8EmCTIT+A2waNNtbumvgoEV1ifzI79VD1VVJ
	sgWCS3WXhilbfLEz4mzEquzUEMaBkMrgPyAYc6l0stYQJG4e+8W7+rGjBYXHzcIn
	wABIJ4YdQlFbK52X25j8Reks3WKU/82R9NKyEKKBf7kx8qoJUymtnIgC+4g7PMfz
	jIXlPg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2t70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso116482761cf.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484511; x=1767089311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=artYoiDNMTH0r3bnnXTYYzk/xEDcNrEIskXY9kVIFPE=;
        b=eUc+ne82nn0fjD8Z09BFw0fp0PquXojcDzEJpGwQNxy4iDnaeYZDrw7X6A8OcRBzCh
         N6OCYPbkGab8wW9IUNc0UJWkTLEPyK0MPk8UJ7hjv95+82Pn2kLqaAGUMOtiFEK4LC81
         Y4xRaTKCmZFaSrD+FnB1pDGDLRBwwS1bL0YkBe3b0wzNtXHYEpCMehnTILq1gZeZJuby
         FOySd30vFfW0Dwi2m3Kt/yAt64uOSPFYoEHiIfvYAQ90Wmxhr4h891S/ypxsdDOUP+SR
         XaUEk2wyRtOnvQLLuHAo9vpxoxmeLSvu92lF5S+u9Rg/EbYdHFv4xyOypQ2v4P87lRKX
         PhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484511; x=1767089311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=artYoiDNMTH0r3bnnXTYYzk/xEDcNrEIskXY9kVIFPE=;
        b=r0U/OxqJ+Srq2kNPa3L4KEQglRi9zouyWC4FB7yjMr6K60VdQt350AWztGxh4oCkrR
         i6fZ4fCjx4SP9rrOdrah8LSzEfRdwWJz6uegeG0uNdzOEjqA8Fg2IUuB+NcsSPAkGg5k
         lCS3KwEs3ClzbgLirKmMBWByzzH3yYuZUNHDkPN9603VsrrER863eA361LgT818TpOQP
         HCHL1y150T3BUWqbmFmdhd0o7iJgvgtD2G9cKxeKzejlWrBYb2JyYd/I6ad2NxqmqtJI
         9NzKLytwoUPbOmZQndbtchaKeD6P3OjdGN76mVJk2Q1Kpp+h94XPp7ZUw2Zv0skDzvKt
         otvg==
X-Forwarded-Encrypted: i=1; AJvYcCWli4D0Zl/nkjEGQuCZTTnpgDlj5Ytxj1GsN2iWPQOBAdw4Ukw8TiVgh4rSxKZz9Hy/0QDOmdbVGgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDBvEA3p/SHTCd/TyRmyTulGM3uyqzunKhll4Q6lWz5rQ48YG1
	+HQEKuYMUdQpQpOqCfebImn8ST746FQXNibHSSRliMOzzCG3+UciDvJdI7beZYeJt128FXluaRv
	sNiLeJnGnytLIf8uZ4AWhHohnhYBcyNOoDTwzcR1+It6AnjepTK0RsaEvkTUELtM=
X-Gm-Gg: AY/fxX5EwUiJVuoYgXIgl/SVAT7CSvl4g180cRQzZbj1pp33qZDwmQuyEsY+hosOPpY
	uPW5eT6JbaypigEqR3OcML/GwU8G0GppvRDsgtAInJH7FZkD9ehfvA1voLvWXpzWZZIaUM6AMvC
	1YpoqGS72UclqD+o7ILH3zRJrj0A9BAh5hMmE58z56yZfNdl79xxPhKPzhqnk7NFrX0ADptrscb
	c50ZfnhMYD6ZdQiLSTmAR6x9ca5dF9EmMjV/OFnTbP7J36cewid1U4Qd+7JCVDXoUe1EHvb+Bym
	XuM9Q10ufPrhMzkWfl9uKGSKOrk7vhPtmPQGgbLqlLxf/mdckRtWYQlLGs/8QkMggwQVN0JJC9O
	pwZReq90W36WLTCsl6d9yUN66G00IUYQnX5ySiQ==
X-Received: by 2002:a05:622a:4d08:b0:4ee:403:7f3e with SMTP id d75a77b69052e-4f4abcf3c17mr220899951cf.19.1766484511273;
        Tue, 23 Dec 2025 02:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRqx6Pu3zgeWF2/r3KdLwGXn7IQWwCuaOrc0bPXDrT1bP67wI/H27HygurvUilVdAbfsJeEQ==
X-Received: by 2002:a05:622a:4d08:b0:4ee:403:7f3e with SMTP id d75a77b69052e-4f4abcf3c17mr220899661cf.19.1766484510883;
        Tue, 23 Dec 2025 02:08:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm249823015e9.8.2025.12.23.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:08:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:08:19 +0100
Subject: [PATCH 2/6] i2c: piix4: use i2c_adapter_dev()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adapter-dev-wrapper-v1-2-bcf960a48fa9@oss.qualcomm.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=unAIDgKhg9QhzeW9uakpEv3eKVCahNH3FqiJ6BovVso=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmoVCLHjUTPBJDLxW+mM3LolMYszLln0qgbgy
 zTbg7MAN3WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpqFQAKCRAFnS7L/zaE
 wzWeD/95AY0M4id7IV+DplkPaDS0B1KUTuKutJ4Soc/6pq1ayWkS6bSSaXd9Fsy2mPsiZ+Cz1HQ
 9mIiEbSNYQ3zGlcVo7UfC4Ttqi3MlPiKXC/ELXzxLczvj5XVl6LSqHa3UlK5zysbtcAIZ+QRaYE
 SmBpjr74BXKFhnAWO4WVnH7udBxGNeJVvXxaFNfvHEq2ySMcuwL9P1JaRQikncCmL+6DXV1hjIw
 tEJwwq2dE489CLZ7NHMFuGm4PkJFEtYOLi8Qy0kck6mDqRRO6L+GRkH5saNoV0KHFKa4hXG3tLb
 C+Y9ZjRPao+R33OjDarjbpudpW+M5qQy3rY0mG0WOhKXdfPmnclxkIQn9FX4UEe/1cKXdBxIY0k
 LuSsmNPSIFuH7/6TN8KG+IdcQyuv036jXPD5EpU6LVcQkbhXWtrNklNq4Tf2SfbSh/lNlJ0SRl4
 uQoTWgaKr1gcX1VNVCSKIIRCqTvapZm35fHGcTWtRRgcQymYK3B6oGrtz07h06wwdfXNaV2aMrM
 lLiJjQHtguwNIsMv6sQ4XwOWWM+PMeMfEIs94U+fsZI5ihEwWsYRZ21nWOarRGfIuW6/PuuHq2w
 5kW3nRTJiX+ixBPg2f+/NMrqN9Ng7UpHO8FZKmyD9VefRLdM7BCqfRMO2oEzGwxwh6S9++n0k3G
 UinSTKRitg3rWSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: l72zKnBQMCUAl2FnqkGeXhj8-iTGRzfC
X-Proofpoint-ORIG-GUID: l72zKnBQMCUAl2FnqkGeXhj8-iTGRzfC
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a6a1f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zdNWxmMMA23eHnuPwWEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX3nJMH8ey4qOD
 cT1NOY3Cg7CjlVBWJXf2Ldu2A6JQR3xiNks1sk+rP7j0GQnnU/yG5k0dro8qIc5uucnh1VPZaqf
 aHuyn1n9i8GT9dLCmJshYfR6UENXIjg9MmgQ83nsVa3rpLDfJo8TaF9dItcsq5Dhzxe2SUd2x0Z
 tyKSTaMuQHRyspO48j5XcgrOb4VXrZME17lf1o8rM7JP3xRQR9vZa6+3zu/B23InotTRn+g9XB9
 A5MqY5zaD+6fxI5nvgpsb4kLEGyWZbWG0O+j9IVqt1Xdzr4zSjZN9UlUbVgryfZ8wy93F9OpISG
 dfUgfRaw80vALeum7Wg+UkPfhHolmcNBMlxWMVfIVJElJQZ3QP1nHeWyAqgrHJxM4YNCUbM6hEh
 SSvkSW7F/fef89JjJMiNN/DX9hytjP/SD01Q9Gh/N/ZCcbcpMhEJmpmBA/ssT2qfbB6VgX3Tnil
 bWae2+bglYNY/opFa+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use i2c_adapter_dev() where applicable in order to avoid direct
dereferencing of struct device embedded within struct i2c_adapter.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-piix4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index ac3bb550303fe5893822af50c385004c9292e695..4fe0c49284646a9f2910939c98b51ee6777e8b52 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -788,7 +788,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	u8 prev_port;
 	int retval;
 
-	retval = piix4_sb800_region_request(&adap->dev, &adapdata->mmio_cfg);
+	retval = piix4_sb800_region_request(i2c_adapter_dev(adap), &adapdata->mmio_cfg);
 	if (retval)
 		return retval;
 
@@ -859,7 +859,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	piix4_sb800_region_release(&adap->dev, &adapdata->mmio_cfg);
+	piix4_sb800_region_release(i2c_adapter_dev(adap), &adapdata->mmio_cfg);
 	return retval;
 }
 
@@ -947,7 +947,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	adap->dev.parent = &dev->dev;
 
 	if (has_acpi_companion(&dev->dev)) {
-		acpi_preset_companion(&adap->dev,
+		acpi_preset_companion(i2c_adapter_dev(adap),
 				      ACPI_COMPANION(&dev->dev),
 				      hw_port_nr);
 	}

-- 
2.47.3


