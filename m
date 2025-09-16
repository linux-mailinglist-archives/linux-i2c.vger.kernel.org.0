Return-Path: <linux-i2c+bounces-12987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6233B59B3D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5AA74645EF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4988235207B;
	Tue, 16 Sep 2025 15:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BP6c457A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6F5350D53
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034804; cv=none; b=kPhIXuWAyTJYKqidwXeirwJYlgH0ny0NyBGboPTzisXA9XqXIMeHX5/EXUxOYlQtsHABZ3T2f4OyaccQVMgS3qRMYZoUZo8Vhw1dpzjxlyfhdnDIJU9EzEf8IJVrIPQf2GT2EAKqflbxxZ6bXgLzJV+aXhZO9md2JTc7FWBNUeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034804; c=relaxed/simple;
	bh=oJ1RvJCommkmu9uglugPl/o5TOg6XYqZSj96bt3gm08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JutGwTrLriA1b2K7s3LhAImxRNBZaV8sweMPQIaqzo9mbnHF8bx42EnSYMKZv1xFUlOZTlKOagkIwpyevrRQNquDL6IpCBGjLg4ilDzSR0nnZFpzAF6JUFpRSd0zVN1T5Q2d6Nu5qCuVpx8gXhYv4y12AOFgZ4PVZhoW9B1weEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BP6c457A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA1esk012549
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3y9/lW+dUggFVSzfvHXuYGDXV3KHAmr21I+oLDCe+i8=; b=BP6c457AMgOmA8Qq
	+9foDnaL89aXYEN3YU9efDfS0GLXitIv5xyZsL8+/p4zs3APfoupCb/yJzTxSrwm
	PdXMVv8ynjhRswXsZmn2uSB6rM+Ju0owI+02lVyWdgo5TM2Y9ejhcvUcdLIL5OT7
	a0Jp66kaOHKLcAK4NaDThWY1TkPS4R26p8K7KG7uMbLZJlD7ujkbVE/lrxAr72LJ
	dlk/YFEckPxRevarwvWsJnyGDs4uawz67QR1U/B+k5pWJmg7EtDC02z7oF6ln6W/
	mSsaIrR7FoYQ318TvOTc/P2eb7nHgeEwzYBkZogI9fMfx17cYoQLOY4NhJfsKmID
	ABzaCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072s83a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445805d386so65383355ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 08:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034800; x=1758639600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3y9/lW+dUggFVSzfvHXuYGDXV3KHAmr21I+oLDCe+i8=;
        b=WzC1Jm+NZtfrDwLNUBpH/bTnARAb6h9BUHQSmNqrVKmSirQ6OK3KfixeO7EbtZ5Exf
         kXplfxHEWJFmIXyPuuXt5oD1eY0sUQMTJM6whAVq1UJonO/Gd43u1dnVRTByujEuypEl
         Wp4s57qyThYFCV2ppyXgCO1RzePTRqWZ+dr3hLCvvTDwwzE028fx3m0ldgGIaBRF9vsT
         GOTobC8tqDHUZKrUWyZopZ28r9uv3757Um2PShuWYtV2qCdr2bUHxHy7C71WaTWHUt7Y
         DU9dNIb+XgLPqPiwO+FErcMTySAZI3vfJEskDcpy0c6HMgLlFBsrTnly496Eu3RsFuO0
         Ea5g==
X-Forwarded-Encrypted: i=1; AJvYcCXfMmH8YCgX5p9ScHu8a8OxEcGP+/lqEkagiiuyFiTHnPqk6auOz60zJ6TdSGmReARXYwC3h88X/cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9hxnOe2zcxSJWia6j8bnDBssHAW9hzvLZwVlBLF+Cg+EzyWm0
	Pup0Qr8e3NV8Q7Bc5tZ7erfl5nDSXHImufMMYL1wKZsCVRXhEBi0fo5YxW7+SGWnmW4aGt8/p8k
	JhwGofmwR35lEYiKqKew/9C3YEadco9+caSotINwzBbfnUt0c4Y8JpgKJGkpC9vktYQomF9w=
X-Gm-Gg: ASbGncs2Ul/D9B/AFe4DA4Ba2cg07Z5gFKlJR8NhTvXy5rERlC9yFJ1hfx2j9SDHyBw
	YCJToAi+ki34xeYSlbWsB8mdzU+e8hxhdOMZV9fOKxPEsjL0XTcjtKnxseSIsDd8gSqrS0Fk/Fm
	GP3C44sulcqQr6Ijw4tL+wKUoS+tT6CqCTiegspkHARfH1xcIE4d9oB6GQVYYKR0cdGpD680l1T
	s0n1GPL9rgkgfdhfg8vMX+Mvj3L2weS7uZpSlDcAHgjCtQuOtLVzBgHy1jkjwwdaqwIDoAE8PBR
	+lqfnm3elLr+8pZlRD5vyWAqdMYUY/alJy0FVOx9a+LeSTZBrm0Ctmcq4qxNDMTXupqg
X-Received: by 2002:a17:902:f710:b0:248:79d4:93c0 with SMTP id d9443c01a7336-25d2772a576mr218397305ad.56.1758034799725;
        Tue, 16 Sep 2025 07:59:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgdnskq0Voz046OasrfzjlM6hwmSgiF3CO6/6o5Fk0bXBl5RNE84UvyOoH1QdPzdI+OiGUVg==
X-Received: by 2002:a17:902:f710:b0:248:79d4:93c0 with SMTP id d9443c01a7336-25d2772a576mr218396995ad.56.1758034799251;
        Tue, 16 Sep 2025 07:59:59 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:59:59 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:26 +0530
Subject: [PATCH v6 04/10] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-4-62e6a9018df4@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=1222;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=hgxN5DeUETfnMsGGyj/LuHtMQXwKu4mfjF7UJJuk/14=;
 b=LEpO2J4N7yRYl84DXGhLb5ki4A5dZHAD9vW3o9gIHCKV3twzH6dP42sHCkuiv/eNjpy0LHsm0
 rqWmySvX4aWAvQkFOZFh+Luis42szVd2XzBZPJZgduZjDCSH0bKIFHB
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX7ZuJwX42o2k1
 cRCzI+62oq+qfdvG7PIXuuuqWo8OMvNG3VJVSEf+0jrzkqLx8HI7VCoLXEvDKIiQbPOL89sSrtl
 fro7XrkrStXOHtqHMK5NmDjQm87njIQqWKCV1rTUyc6Wxv2SLqqwV30H3ICX3VV3OqerMyLmZwX
 ZAbELpH7H4MuptVGITBhVZPC9mbhzn/+qilUXNzHC0nP7v+2/HSnwlV97ndISwT4QETkaZVoYVb
 YYpLl0Shh72Sa2xf2ZhL0tIp1WESoiPTtWLlXb0f5Z3PUuMoI0m3H8qpYwUXHUVf9OuPy5+uP+6
 3jOYwpA/6QWulVcgq2a2wTZGl+n7lPIZ1VYxoe7o2QmTCFLj7sPi3IhG7vxAzFeVdmSXj/o3hpT
 FD0HWidh
X-Proofpoint-GUID: CP7TfB5AVNsoQ9SIxvAjADMzfUoGBsDh
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c97b71 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=cq19zQBcvAJi0RM8MkQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CP7TfB5AVNsoQ9SIxvAjADMzfUoGBsDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

From: Monish Chunara <quic_mchunara@quicinc.com>

Integrate the GT24C256C EEPROM via I2C to enable access to
board-specific non-volatile data.

Also, define an nvmem-layout to expose structured regions within the
EEPROM, allowing consumers to retrieve configuration data such as
Ethernet MAC addresses via the nvmem subsystem.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index d1118818e2fd..97428d9e3e41 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -371,6 +371,18 @@ expander3: gpio@3b {
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
+
+	eeprom@50 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
 };
 
 &mdss0 {

-- 
2.51.0


