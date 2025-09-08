Return-Path: <linux-i2c+bounces-12747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B1B4869E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F092167CEF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993C52EA481;
	Mon,  8 Sep 2025 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="See+D8Ax"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF892EE5F4
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319634; cv=none; b=rtuZO6V94DHrDv2aMCS9uIqBSDDKjEaY9OdYanJuzYd4mpDTKUVFf2QWVfwNtuw34Ka8LJC26ZYH1bi2m73cJytsz583dJCCpQ9OIXZ0yYxWt+mRbyVTYR91IHDxIMoXKEzJehxjM8mppYfAzKRBfsAfOauKv27PT9QLn7WqXhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319634; c=relaxed/simple;
	bh=ud3TuPggLahDGChDQ1o7XXbj4HVsLOYi90l9y4PcyNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3Hf3PjTrOUT6eOmTqlMT2G4IThyAQLvaqIWQA6kTz8UOn9K5vXLeFAF6ukU5myCfRl9Hw2ON2Unbq61/EUWUfn/jrOOKbfKkgkffq+ms+4yuJMEXopD6TjOQwDa4HgdxCGjTsFD/p2JL7BSvv5mSTFDqD2fFaCYiKvJJkHYQ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=See+D8Ax; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5880P1JZ001510
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7cNk6IecMVebr618FdTJPAEvTMA8XqQdB5/864dCQc=; b=See+D8AxF84ZaO7f
	VjLUDEfJwHPDwXoWn7kbdFH6yNWdgY7uBKAYMRKR/5giDJ7Hh02DnxtR0AFadNH7
	mz5og+gmKz/p0xruK63mZ+yhzZOmT7OCOuOzwODv7xxUHPgbcjuv6z7Df1cyApQ/
	njq5sUJP8tC+aY8K/oT1DYmXPZyrJyItgMF72IPzM/N9K2+guC65Q85+T2V+uIC2
	omzJZpL96xJaruQfltqUT2zX0bPhK8r0rJP1UyMRGSOaNYjl+BR1WVXc7U8IQZEn
	pt66e7ySgCaYUB6fLMvF9hPKhWkNpCUqFUYb3k2ujmjK3nBmQpeKSwnf1loA16L/
	vQSpmg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8uvct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:20:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24b2336e513so64541815ad.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319630; x=1757924430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7cNk6IecMVebr618FdTJPAEvTMA8XqQdB5/864dCQc=;
        b=GuOJJ5Pf2ACVe7oVUq4x7h1LOb1ZvAdtNMzXDRMuG9oV5rehFBZLOpGziwF6i+ME1G
         K78FoA5O42fNeNdLXQ/6mRGrAoaUNtw6vh31r/rUWbvGIpBQDE63Lro6ipHdRO+QWH1I
         uKY6gH2fqqWP4xT0KEB38gvAK6KZMOU9MvT9NsKLlGdFnObeC0xp2BBo3LRahBXGrfFp
         R3c4+p+rUVTmdOgTWQq7gU1s71W/aimIY5+wa7vYAL5JZ5uCqXdGoMDGMbvE+Vu9/l/h
         XgoiXwaIPYEHbJDcYJXm1oiD+iCEmT1XU/tEp7iLzNNAMFxBeOfvkMoHNy1yMkGskoVI
         OWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1XslBAyAo4CR2eMLrNUjzxCLNiJJi112BT6sf6He1PtgZKaHInCdBlg73cR3jjSZh1zJqGAbCdHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZFoTd/cOZMaRTlyWQVELqU+6DdSitVJMlVXUJIfoNpkYWbL4
	klZmzDtmI0xCObWxDS5W8Yitzbihy1nDi3skR6nVdXTAjiANf+PMV+MCtZUYlNqvx70jwHXLSmI
	3cCkQMUN/Dh8/c9ewEBzinQbGQnqyZMBrftm1rLUssasGM0leF2ocwohPW1h4tX0=
X-Gm-Gg: ASbGncv72zn/eqnUuRyeJ6+2EXZ/FjkdN2a7oEpUFWPYz7B+MB30p8CyzW66AjMN2WZ
	S7DADUj0ZVO3Dv/6Vz3LhmbdyhmLGf7MNqrGjtd8ljweQcMwlCqS8aihW84uDvEe3d8v2INF9Em
	s3QLpAKMJ7+m4dJ3O9zma1KFoalWxp65asRPBWLkfZ6Z8OW5cZNUho/yvu8A+I+OzDouNit5row
	Ib8U2jn2Ar/OtAm2it2lmB4CHbd9VWCBkakfUzB7KG/vSFZdjpspGhaGJyAY5LBRtyUd+VDb/aT
	Dnc4VYgMgBy+LgEbWoNLw95K5KRgTU8AuPwsYdraqIAFUGoTPE5z974BCc88yFgvmhOQ
X-Received: by 2002:a17:902:ce8b:b0:24a:d582:fbaa with SMTP id d9443c01a7336-2516f04ee0cmr106344215ad.12.1757319630244;
        Mon, 08 Sep 2025 01:20:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU2+Pn3pFEGWPMZXwcqWfe38DfVXT0Rgjw4TxXRkh6HKMpHekVGqpZgUJunuzabHm2j/OvPg==
X-Received: by 2002:a17:902:ce8b:b0:24a:d582:fbaa with SMTP id d9443c01a7336-2516f04ee0cmr106343655ad.12.1757319629581;
        Mon, 08 Sep 2025 01:20:29 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:29 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:54 +0530
Subject: [PATCH v4 04/14] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-4-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=1307;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=jewA1ZuLrE/ryGMwa1gffJep1WWzoOZkukzHH7TucfM=;
 b=i9UWS6iq/NvrnGVeENKuHD5pzIRUYthJoB6yM1Eyw7sVIHrJwjlTu8pkSBmTCXd9ZbMx/WCOa
 JV0jF+D6AGnDzZ94UZQCW6n+UQmZrlDbSo4PlLz3htX5eUNiirnba07
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be91cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=itmwO_cg3X_j9a1xKB8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1Qk-VyvhWx2WgdjIsfyp_XuuIUBzq-7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/TGwc8xGbyTS
 6uZKGpxF2y7XiAck4u4noSHcRbg1whmMu6wkpnf2qns0+uISrhsthdEh3ajiJZEBtfnOuOUdBAT
 dBhSvdAZlh4cGdtjwlm7JZvxDjCs0PJ/luQGxN1WE0Ku2qAqp1nRIBVtfmT97HMZctlVG48yU8i
 VWCUoGUjvUbmuJ5shcRoEGMqOmuaG15uunDd6Tmc5lQ/0pLVZKsvBEn+yJFCldbOKx/DMxHNZVf
 THLDSxTfX4vaHahMl0GTqTx6c8WcH/hcseJ8SWXrE6yJTklZLWj8ZBNT3K5x+yfNJBcxfWf01Af
 XN3VAqcygdY9nuY8v0/vEE9Bg3t8QNji+XrGjA8OSUGPvRu0UbNQybkNs90vjPGPY1nCKC0e9Cw
 87aag5k/
X-Proofpoint-ORIG-GUID: 1Qk-VyvhWx2WgdjIsfyp_XuuIUBzq-7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

Integrate the TCA9534 I/O expander via I2C to provide 8 additional
GPIO lines for extended I/O functionality.

Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 56aaad39bb59..c48cb4267b72 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -289,6 +289,38 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&i2c18 {
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		reg = <0x39>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		reg = <0x3a>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		reg = <0x3b>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0


