Return-Path: <linux-i2c+bounces-14484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F09BECB1922
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 02:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6231302573A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 01:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F8A21D3CC;
	Wed, 10 Dec 2025 01:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mkB2lDx5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100621ABBB
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328752; cv=none; b=KdsgYndAG7I3vOe3AnSXDFl8MCJLVVyNwzXH3eI7SwAu0PsDhoQPSetiSXvsc7NzipXC7J63dGeJwCKpCiBahcVdwa0k3Thniogb7xObKRqvQmqpjMTjQGa2JutzQh+pj3qtMqhuQaiW24cuyOmn39I4fLRbfmk1CblGAQTg2Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328752; c=relaxed/simple;
	bh=cs2ROINLZYbi8BGcsQ5ZsjpjD8nNHjdVuG3v+tZmqdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahPG/5rWptzzk+bgj3br5eXg6l6j69ezILT7sG3RaHqzaKdNst21AwOqlsfjiCyM4Gfq1BvMV4SKAmvwqpEbi62cm+zpKBQJw69Xr+m0+ty5q2I7VYjq/39ffXhuz9oXLHo4zfeeBYB+/O6q7AnfqiwqVQB7fqgLf41P9sVa/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mkB2lDx5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso3549325e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 Dec 2025 17:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328749; x=1765933549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G61t03ohH/z/XV0khgzgfcMzXSsyCROO+wthBFVYyxk=;
        b=mkB2lDx5e5rwwi1Ziq2SO6Kzm84NU3rTkwxc9nsC8pI3S0pelsJHA/1W1yvWh6GfDI
         BsOgpqYBURshf+K1BMomG3ar+M2QESPLLJe8rHhzt8jANM0QghLSPl06ASdfgG44dy7P
         dJ0kutx1zQc3w1x8ZnBu9sL3v5J+4UVpvOrbqVCqdKNsXx+KLKeZa95Jvz5o1wWAZ/fe
         rmrgbHTdJkk9eOo8fES0Pa86aevb7pCpBWc9H2M0hTmJh158uu1gu1Ugzc506X5m/LXf
         TjEdArMXImDlvCH8xhuZYpKJhCCWKvWViH0rsfhWhHVCePr+NDy1sv8QfS0vUP4lNuqk
         EYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328749; x=1765933549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G61t03ohH/z/XV0khgzgfcMzXSsyCROO+wthBFVYyxk=;
        b=lTN/ifWasMcQiYyySWqhLg7ysdM8+QODgkVGBWCMpHu96Ot70TFllf0Vs8TGcSyibw
         hguvBd4ZYUuFWv1xzbh2UlPysgRFghfQcxQgAvI2Y7zcvhuewsSbG1ODk26kXH2tqmUn
         xyWGX2bL1R1WA8Cu/V9YfyIH9Ds5O+swhMzo2idz4wl8NjJ59p4ComyCkysAKaGhjadW
         sX26rvTj1fFLOdZ2aXJtTj9ZVvwx7waijwdr7gqwUHakZo1dmgNNLxH//jCx1bUt4p6C
         a6LFNIZqwAOTz6bMAzzV/862ZtW4fwXANArWwJjlPIBaJIDJuIxZ/mec26b7F20MMVoa
         9vtA==
X-Forwarded-Encrypted: i=1; AJvYcCWFZnIRSaglyMhyodnIYfycf+64Lrltw+N+goce6YX58PdLWa6UhnXG1lsrQhTe0KBIdqlGKEjHwVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YymC4cIsXrQUCYUZq+K+qvxKgFcFyh40aPit9X4jlzzGKxigjaY
	QvsFTjcewvbWsphcGcyhJgYTFuEUaJ5ks0oqPbE8VY3ODkE4pWWUOi0pzo0Cr1ynsOs=
X-Gm-Gg: ASbGnct+SzrszPs48HqGjtU9oJnDaIqHgVwxwQKR30sC3uB4jxGCWjE4xkEZ3Ur3jSP
	9vwJGlKcyKTlOtoE/0cQhr0pB7a1r9OBw4x94/5WuwRmYI0iN9edtdCTm1JY2bXt4kM7NNJqk4N
	84UCxS5S8IjRMfhC0fh6Cj0LBG2BnPlX6HFBWoav2B2NS9Z71DlHe6WFjynNw7IIKj2RJ20Z/tz
	tmb8IhP+ngvAewH2MTuYAgTbO4iDTnq1Yuka4xRD0mdbyK+IMRpmSGLf+7ERTRzBTarHPzuaLfv
	0Dki4XIeACeXNkChZTfLQVG/pp7OewW2Jo6uUBhURkPfwU2hy/C7PLOXJY8ByJgrTokF/7HrFNt
	T9+jnQNQSCDSXtPzwBGrQbbZA2q/rlvAuy4DclG4dRHhCDAdFxIiUlCOLIFOy28SJrQJboWFi7V
	z9StP4FoomDrQuQkBHICm2+2mIIeFwb8LVCcQTSFHRQT7V2cFKJrUE08xU1+K6
X-Google-Smtp-Source: AGHT+IFEGfjPiVQGshkO/20ig42r1aY3hbFJDhHP5lh9K8nvPlehfynniudzGdwdIlbKiqWq71Akxw==
X-Received: by 2002:a05:600c:888e:b0:479:3a8e:c85c with SMTP id 5b1f17b1804b1-47a7f969677mr27860525e9.18.1765328748862;
        Tue, 09 Dec 2025 17:05:48 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:48 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:05:29 +0900
Subject: [PATCH 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera
 fixed regulators
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-fp4-cam-prep-v1-3-0eacbff271ec@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=1911;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cs2ROINLZYbi8BGcsQ5ZsjpjD8nNHjdVuG3v+tZmqdI=;
 b=LXFLCMuznT9I2R4i9n1Lfv8o05COPLbPk0j1FGBCLabG1z515SK+gadOEWSqZVdy5/5+brTjg
 OzlfbWjz2CWAiVOg0ylUP/stmYcR+5gZDSnIQew/hA/iutOQa+F1DAn
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add multiple fixed regulators that are found on the phone, which provide
power to the cameras.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index c2f856a56b2b..0cfb24e3941d 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -246,6 +246,46 @@ active-config0 {
 			};
 		};
 	};
+
+	vreg_32m_cam_dvdd_1p05: regulator-32m-cam-dvdd-1p05 {
+		compatible = "regulator-fixed";
+		regulator-name = "32M_CAM_DVDD_1P05";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&pm6150l_gpios 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_s8e>;
+	};
+
+	vreg_48m_ois_avdd0_1p8: regulator-48m-ois-avdd0-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "48M_OIS_AVDD0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm6150l_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_48m_uw_avdd0_1p8: regulator-48m-uw-avdd0-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "48M_UW_AVDD0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm6150l_gpios 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_ois_2p8: regulator-ois-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "OIS_2P8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 72 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
 };
 
 &adsp {

-- 
2.52.0


