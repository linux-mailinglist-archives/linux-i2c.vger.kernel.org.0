Return-Path: <linux-i2c+bounces-8886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24457A0085D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F9B3A3A7C
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62A81F941B;
	Fri,  3 Jan 2025 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="x7SfxGNA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763E1F9F51
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902731; cv=none; b=ZgHGwXJxGKPBIBAG8/uKg9+ORPkQI7XexoOjzPIu9N9pzD/81Tb0iUzHeTelj9r33tD7WxA1H5l+VqKcSTRRxym85qSpUlvNPhX4aJqAsQjEJA6AE+mctURQIr5glRX46JfKzvAusdLF/2bn3Kq1dSlj8+10EhL1rHzoqx7FARk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902731; c=relaxed/simple;
	bh=hFrxBgJ07NatLLy+nIK/H0Io113gN4/rPtmjVt9wEEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=diOEymiw5/kZNL1bd+bEKNtvdkSZvWrzD1LsUtm1dGt9XST1977QugzGapWYwmyrmYKlHTBPW63Ed2jedxjseFx7n+in3LnvgP4KTluZ+hAqF6JmUL+XBMHAqhdYJBKIEY8ic4+qkv3SbD90PxebZlV8iJIoiy7InCJ73o9WQpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=x7SfxGNA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaeecbb7309so1315564066b.0
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 03:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902725; x=1736507525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHOvMibGbyPBOPoFr5QKh/wTDy8ZFQYsWy6HgvhHWug=;
        b=x7SfxGNAuWCxuDecvpbjVDbPrrcHCJ/4J9ZqjFQ4L1iqfYBzFejVby5DJb6oXpnVnz
         IG4hb+o/0q/tDsnnyu5jDgLZxa9dBfS7bRbZjaujRCo/4dj74BX36B4G8Tu8pv9XZg3k
         nHOtImYW8byr+VfvKNP/U1Twy6MloDqrwMFnsX53Y5nUfglAhVlN29051RWVU8AutTeL
         ZQCc8MlgM4pKg0Pj6XcBOkX96bPu5Nz4s/7ZOVd+DeC/DcXm17t/Lie8KnVnvd7Qk439
         ++PaHkVQXPY9kNP4X6qX2Yt+H083Z5a9JhO88YXsb1QbQosa3DujL/qJu9jfF+EQRAtN
         32Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902725; x=1736507525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHOvMibGbyPBOPoFr5QKh/wTDy8ZFQYsWy6HgvhHWug=;
        b=jKJ8Ft1MWPxw9hSgsmQO7xP9am6xozBTQKgJ0nAFdkoYUWnltOsjPXcqhsCY/DAJCU
         DVYBEgIIpVJ6SqIjBu4kSTtD643Iurk1l65Ja2obBDfkRsG3rMH3mPqs7srncwPqhejT
         Y5lHLkiRGKmmgfGVo5ElDiSJ2xxAgLig7shlcCrPN0RRJnCMFlX2QERczBhKWQLrg+dL
         ijoyChS6wey0f8BbZAQexqXyyCX5KxbQtVQnFk428VK52ZXgJ9QEeMw/c3G8HD62FgiH
         dQG5+861PkLHgxAS2HjV7T7JW1HeTsgBrMZQ0atx5EkzVMlnBEd+GKirN7G+M75Pgert
         Z3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA7uBdHlT2Zg50ARWCw1SjmewzMEMT81n/QSj1Z2SlR2LKOv95ZxMoZtACZlfGCGTgUid+X25FHS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/Pypv2S3rTVV37cJk+EdEaOWFDl+II7fDkv6bUQArOO0QaYi
	Z3tbr0BwdazShKISJQYtZE+PMZtg7npStCpX7BFHhlumVqpymr+TUqMfMB+V0mA=
X-Gm-Gg: ASbGncu0e+x6ADJbHEy1cIuxPvHOAjtJQhaCeteVe4OIsR5dOvnYWQmLr6w1rtJPIgo
	E6wrnry3pFmxgGH7MCZltG8oSLaKAYd1m0xoJU6obOlXwvGO5v0ATdEz/evrqBBvcVDDrs7zuMb
	tWZy1KqJtQC7bB+75YaQpLVTl1UxedX0UC0MT5LxKqqA2MDPdiJ+s4Cls0uC/c4qzNElDr4J7G6
	ccMg5iAntTGc222DWwTjRLX3vP0F+1RWEOZpN7VHSCbYMVZ4xvqElKcyO9jUOVRgrU5Fk8NzVLV
	x/gqV8OqqmYYQIq6tRxEzR08ww==
X-Google-Smtp-Source: AGHT+IFd8bCOiprfe2Wzx8rbAxGJwtv5TEfV+pliUKXxGJMY/Rwo3+ia2wgDHt5fi12mELrWPAU58w==
X-Received: by 2002:a17:907:3607:b0:aa6:5910:49af with SMTP id a640c23a62f3a-aac2b6611c2mr4470650166b.24.1735902724669;
        Fri, 03 Jan 2025 03:12:04 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:04 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:12:01 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable camera
 EEPROMs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-5-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Configure the EEPROMs which are found on the different camera sensors on
this device.

The pull-up regulator for these I2C busses is vreg_l6p, the same supply
that powers VCC of all the EEPROMs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index cc1f89a4015218b0ea06811d2acd4ec56078961e..769c66cb5d19dbf50e137b3a72de2e36ec4daecf 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -556,6 +556,47 @@ vreg_bob: bob {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* IMX800 @ 1a */
+
+	eeprom@50 {
+		compatible = "puya,p24c256c", "atmel,24c256";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
+&cci0_i2c1 {
+	/* IMX858 @ 29 */
+
+	eeprom@54 {
+		compatible = "giantec,gt24p128f", "atmel,24c128";
+		reg = <0x54>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	/* S5KJN1SQ03 @ 10 */
+
+	eeprom@51 {
+		compatible = "giantec,gt24p128f", "atmel,24c128";
+		reg = <0x51>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
 &dispcc {
 	/* Disable for now so simple-framebuffer continues working */
 	status = "disabled";

-- 
2.47.1


