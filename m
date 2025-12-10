Return-Path: <linux-i2c+bounces-14483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A063FCB1919
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 02:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29E0F3027A02
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 01:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C2021D3CC;
	Wed, 10 Dec 2025 01:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hfIFQpXi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F75321ABC1
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 01:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328748; cv=none; b=b+lfilLELmkzpZfkcpAPhCYFe6KAukgXYjr56WFLgUaF29ryG7QpBqqIAm6tqFTPcoMSjbPkjht2Mq51STzxKI3gQgBa9Q2D8L5vdoQQQeOnPRhUEQXYsU9Qy8RurZpJoLX4y81MOrfWiMA05ujvAN9WsQqrHh9UF/dgWvp9Dl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328748; c=relaxed/simple;
	bh=goccinMLaHEmabkFCqO9o4yhj7pcUuPuPE8zhV6HoeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUEgERhVp3MWbLt4BQZcN5WQRpoHyhIk2RwYpcUVPgjJVeGVmN8G1QhQEo+OzvtBhj1JXkysi8fONM/vFc1adjbEI+dr2pn/OMd1fQ1wHR/+quSzZkEpxtWxRNmNljMf8gkJhAorHVLRGpyA16BgNZZ8ct2EkNFaidIvfXinjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hfIFQpXi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so48620715e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Dec 2025 17:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328745; x=1765933545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AY6FgvO1oJLXsD9PKgilv0kQjui2GU/Z+eZkSiK9oHg=;
        b=hfIFQpXi4n6aDjr6nqCLEZjw6wR6CG9M5nBVnklA3SZeK5EP958ZbwC7HeCxD18Cfa
         gPfXmCrPh2aL5P5xWvCWkV1KfRSlPXJ2rdYd4Hiz/yC7hs1wSYg6YobhswyjFmw2dNK/
         vE/pwlX5XwOgfdL3NbiXrX16rp+nzPdvpH5ZQuwPOpU3m5gvT8ca0B2pud11mygioBWZ
         Jf3EDikPsTWUozSzWoJIglI7+NVotXgWH4VrFUvv+W35x/lyR6lxHT0rxNoogiK8zXBw
         GmFHynXSrK7+xdi2GO1u3kyRwYaKlydS1BQxD9bhJiWadqOBe7/802INRVqtvCEmWJVY
         Y3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328745; x=1765933545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AY6FgvO1oJLXsD9PKgilv0kQjui2GU/Z+eZkSiK9oHg=;
        b=Lr1IM+wyIrd4jNymnMxfI5SJSnmtbIVrPv1vX7RccuPwwyrrBw9d1tJ8E0ByRUoyPR
         tuYbvP7kquKgfpmo78XlbDvEpjkaAOPjxdtlolWagz3ELhpKHGbV85im9ePc5EAUnE1z
         EykskJkHxOK7NijTJrI6JcSRhopV1gOKvTuNVpdeMs3oKTBHu6JYOQfJb/Gx9dfOCo/f
         +1LV2+68ulv5kDJJca9VjNuU4KxBhj2kLNavytRZ8r4bNpUxsKuFNnuB9KWsZCOJC4sv
         NP+vF8mUoHIq8gGjERP2ZEBux+2IbUvIlBrTQA8c6/cXeyNl1PcyMYAZYzXt+qX2QWZv
         YPCg==
X-Forwarded-Encrypted: i=1; AJvYcCXCY9rjvT8Kj58jvbtCARkDrtLmlr0f1TPCafVox5QhGF//fUDduVmQ0p19G7fmmgrK1JtuZZy5zmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVijuLKo2oNTfknoowcfnrGhUbiiUBAkkj7YmPI4Tckk5dKmc
	AFa7UBxSuv5plhHQHwGIG9cVUmltIkhNGLIKt965MxTcl1FwXXXXW8Cil5MVaySt2uE=
X-Gm-Gg: ASbGnctOsJ3pFBbJPB4gdR1q6LwkrgyE+MH15MONqzGVo5JnVF1c2ot0UPHcRilD3ZD
	PVXv4SK2TD2HDlWzgzJRfVhpt4qpgR4TC8pmrhNljYEzJyiA6MXHUhOC7RGRT+CYCR1nZnTgRwB
	FSIlDYq438EDHP/zaYFN8nnXpwPIw6wvzM3ucZ4l1zQAdRuerodsgVezyHyPbblG2sTeFSHSe3B
	YVOLzpfojzAvifU8+u9G/BrVr1ke6yEC4kee6V9SJDn6NcI3NFMBCVSkBzETleaeorQsJaShHCk
	8GrKewsfCTZN8ulqywXvweQ9UmgyFn8sMaflYcUoNQA9YLz6WF0f4rzdXnopBW2QdtiNFl2MmUy
	heyHiD0lP7iOSGUL1yTMV6Gk94eUBUim+98kiCIDEa/HClLkTAE2kPjZFOjAqMsg5YT+tYj5rsv
	y09OzdHpZWZzEm0E+N2l47UTe1yh290aHtZs4vTqO2iNv43RlX+g==
X-Google-Smtp-Source: AGHT+IESNnX7RvzwvjTpl7xFbE3HQKrvyyqfUm2MxK1c3Lbfi/0XVEDv+nuBjWKR+/VcNhQl5vCcbw==
X-Received: by 2002:a05:600c:45c6:b0:477:994b:dbb8 with SMTP id 5b1f17b1804b1-47a8379dd43mr5969275e9.11.1765328744784;
        Tue, 09 Dec 2025 17:05:44 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:44 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:05:28 +0900
Subject: [PATCH 2/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera
 EEPROMs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-fp4-cam-prep-v1-2-0eacbff271ec@fairphone.com>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=1635;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=goccinMLaHEmabkFCqO9o4yhj7pcUuPuPE8zhV6HoeQ=;
 b=2BcG7xucVVS0rNBMQIq+fWHKIK4V/cwTBP+N4sVMOB6WyzhmB6iNVVsKkq8JMRoiqh1VjcJ6y
 BabA9+gB/1oBjkgLEjFt/opTJILmtnEjvQZNtgteMIITDdYerAy63TG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add notes for the EEPROMs found on the main rear camera, ultra-wide rear
camera and front camera. Also add some comments that act as placeholders
for other nodes that will be added in the future, for the camera sensors
and some VCM drivers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 30 ++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 4afbab570ca1..c2f856a56b2b 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -512,11 +512,28 @@ &cci0 {
 };
 
 &cci0_i2c0 {
-	/* IMX582 @ 0x1a */
+	/* Main cam (Sony IMX582) @ 0x1a */
+	/* VCM driver (Onsemi LC898219XI) @ 0x28 */
+	/* OIS driver (CML CM401) @ 0x30 */
+
+	eeprom@50 {
+		compatible = "giantec,gt24p128e", "atmel,24c128";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
 };
 
 &cci0_i2c1 {
-	/* IMX582 @ 0x1a */
+	/* VCM driver (Dongwoon DW9800W) @ 0xc */
+	/* Ultra-wide cam (Sony IMX582) @ 0x1a */
+
+	eeprom@50 {
+		compatible = "giantec,gt24p64a", "atmel,24c64";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
 };
 
 &cci1 {
@@ -524,7 +541,14 @@ &cci1 {
 };
 
 &cci1_i2c0 {
-	/* IMX576 @ 0x10 */
+	/* Front cam (Sony IMX576) @ 0x10 */
+
+	eeprom@50 {
+		compatible = "giantec,gt24p64a", "atmel,24c64";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
 };
 
 &cdsp {

-- 
2.52.0


