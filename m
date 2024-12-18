Return-Path: <linux-i2c+bounces-8618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F324A9F7105
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9686616A81B
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2610E2066F4;
	Wed, 18 Dec 2024 23:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILJ/EcO2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA7204F66;
	Wed, 18 Dec 2024 23:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565058; cv=none; b=ZWa72RSFlEdiEhe140nQl4v2e1LyOk72wSIA4q6JFaqJZ21udtWmUK20Ad4XV6znfjcvqeZ4sLKYL/uSSdAmTfiip/23hhBEohnj1H66PgAYqegQFosSfYjO+Beumh//oki5wjpxGthew4qzFlMc2jJ3vHa68Xq1H/dLsZN3JS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565058; c=relaxed/simple;
	bh=eZUgIXh4Dafp5SjQXe3JmOhBWmOQQGNy2uNWoRlXbQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rU/wkFqQtKl75dIr+9FhGMeRqfhYayfBEgozfNFHl59qVxvdO0A748aCjiar9eXjya9y3iZJTIhDoixzwmgZ9csZ//ZTTyzqctneQ6kgJfLxlMX9Tbzlqr9g75e4Y8kfvNOOipxKBErjQn04r9TwUgJyeKGSfe+hHmtpchk4rho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILJ/EcO2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216426b0865so2170875ad.0;
        Wed, 18 Dec 2024 15:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565056; x=1735169856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2p+Bn+O63LERCuE6dGd6gVg3sXhL98osLDUQM697Sg=;
        b=ILJ/EcO2Y5BLl/RoAUabqnW76Ct7JSvRn2V3/vehQG4PjmkgQTWdf6DdJF6XxzfmR9
         qT7RPXeNgzWQkYiLpJ9pYruUWaY0geFTeM7lSgCNzM/r8HAnrJcdVUHQ7cvFFch6mBZa
         xezxNvDVrrfrQhhht1rRtkxrky40Vb1dmoc5g6Bzl0zOru20sl/oJnHFPyMEbGXbEg+K
         gwarLydx7iQcjKtzgVqK8TVPF71D5eOSXRi8SwGPIkoJ+s4ZCRPi3ukdW0Ogtc2a0j1x
         NaXUoiqDNGVkWs2hUPCQEd3pUTValJTfdVqxmksXiSzlbXJEf7deBGAIa4OuoRY7Vs7+
         SsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565056; x=1735169856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2p+Bn+O63LERCuE6dGd6gVg3sXhL98osLDUQM697Sg=;
        b=fdAuEvP1arumZpBLatz42WK+HTadRAE9nIIoZ2gx34pUTwZV11Ndg+Fib9ieDq+0G0
         1gUySxSDaEwNiBy5BPJZW2AybXSpPFqaN9pkoxKKr74Dot5WfozlGDzptiM21SkGY8ho
         +S3bfHcN2x7mE4l6PtOHdpKM3KGa4N8SevNXHW3S0IlyJ11SYFpd99jo6Dm7RjQ3hJfR
         jziy8sxT5PmBrXaC2mTZXb4DwdQQ4RtT+HCpfsmA1q2z5C+wwFKqz0ItWthUl1ssWZo+
         blxwwCGT03IDElSnWUlgf3JfPrZ41WgNVoqMWG7BoDxqMHyTWx3hoF3PrJnaA9H1N+3A
         5iQw==
X-Forwarded-Encrypted: i=1; AJvYcCVGHVLolDKSD5NdC/OpM9sRmxiVXom6Zrsju9N9b9aWtA2ckm9DKK0Tvx6ckJAwzx/W23RI+gARevKu@vger.kernel.org, AJvYcCVjB50JSG8sMbrb9/IEGHOczSIsoOG4iZwuEQrwg97mnt3Ig9l64wT+GvHKT3UkP5vqVaFkWZsJLobheCiA@vger.kernel.org, AJvYcCVsF12TcgniougzEi4j78W6NhPf9hlpl7q29+6+VDfvSThrH/sMSTI8fdzFPCupeerTy3JV6sZDPBXbafEbxBU=@vger.kernel.org, AJvYcCXDDwqF0XJBKHxqzMi8TI3AzO9yKPr/fgzVR/LCv0ECgwFPqBS1TPBI9R3qZ2AoNXXBlkm5fgLxvtng4yer@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGY5P92PqDCxiOeWTeyMHMMTmSwvLnXU5PYpzhgZK+oeec66J
	zBHtKorh/rRXuC/ncY7rNfZ0tI9eeEJPCjEQbabuxq8fT+MdWRaA
X-Gm-Gg: ASbGncvr0mLow9apz2RJDUx6efyMEsfIFLERdNfhdZkvf46nBUCCfErUYxge70NZJFn
	vggZJ+QQMPQc2AzP9xcPxJFqKV+4xvqpOTQs2NDKSYRJ/IpRp+tgEfr0ysw73hlfCje0jv4JVOm
	tW6QAOpcr7H6zFfreXyJynvrK10S3czeUjcjRonO1iPJm/B9BbjmTVbZdO1E9pm9Q9Y9pEEKbba
	dyPErxyfb+pmsvljk9OT0Wge4xb8PRzoDNUqymc00E2sMzhcG50d9Lb
X-Google-Smtp-Source: AGHT+IHSZdbhBBo2sF8tqN4LT+Oi0B4GGcc3Vh9M1Y2KXAp+XnvVO/Rtbaui7owIt/uIhqw2619amg==
X-Received: by 2002:a17:902:ea11:b0:216:2f7f:ff69 with SMTP id d9443c01a7336-219d966ea2bmr21730945ad.5.1734565056516;
        Wed, 18 Dec 2024 15:37:36 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:35 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Date: Wed, 18 Dec 2024 15:36:39 -0800
Subject: [PATCH 9/9] arm64: dts: qcom: apq8039-t2: add node for ncv6336
 regulator
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-ncv6336-v1-9-b8d973747f7a@gmail.com>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
In-Reply-To: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Fabien Parent <parent.f@gmail.com>
Cc: devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, vinod.koul@linaro.org, 
 Fabien Parent <fabien.parent@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=HWjtZtg1pmveHn6OiavIms18l8HI9Sa8dLce2gBDllY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtwQTJvQ0gvSmYydG1KWGZDWGx2SGo2CkY1VnJSNWNRbG56NFV0NGJw
 TU5PWTRrQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeXF
 BQW9KRUlpYklNUVMvYXlrdHQwUC9SWG1lTHU1L29wcHNxWHR1blJXUFVQeVpFZlBYVnlmbDRNaw
 paQnRFRzBDcU1RZTdqMk5qVVAxS25hWHFtQTgvVS9mMzRKSGNwSjBKTVhxV2ZxY3Z6dmxNRXh0c
 jZIK3BKM045CnFuUmt5KzBpUFNiL0lNUUZQVktWMVUwSHN6VWl3MVVtbTNNWlVTenBWQjBPSm9U
 OC9MODlEdHNzUVFCenZxaWsKanJLc2ZSV1MwNzlpL1NJdm9uc1JqOFZFY2lpY3FrbW5maERLYWo
 2a1d0MFE2aTcvY0daQ2QvWVZndWFyYlNKOQpFcm8zbndrVEI0SVkrSWpGWWtQbkFhUGJUaVJpV1
 lSYlQ4TjhIaDRjdEFKa2hSM1pzOFNkZ05jRUtwWEFjN1ZlCmFjelNXSC80VXNCby9mQ0U5d0szV
 mgvclZSTDlxdndBbWRCY2ZYMWVNZ2tMZWYrQWt6ZXNiWFpVUVR1L21aanoKZThNTk1IS0JYYytl
 d3pzYnlDd2UrWVJEcE8reEt0SVRpcFFvRFpPS1pQbEptaURJZ2RSRkMzeHJDaHROdy9mdwphNnB
 ReUFBS0RLWVl1QktrMjk3M1JmOFRQM0xPS1FJZ0NLRU1haXRQV2NzWWFKdjgrSkRhVU5aOWEzSj
 A3VDVnCjc2eXRvOS9qYW02dVNreWlqckpSYW11YUVRRjYwUTNvUzlQSTd5NnVWREFEdXEwZFZTe
 GZkb2ZBM0NCN1pyOTMKSDY3REVZWHErNG9CY2kwdlVmUTV5Mm5WVG10bDZuN080UHRJRTltNFk1
 RHRXT2lOTXhCS05jdFVPSjlvRG1mNQo1bTRXUHJVWkEyQjI5TUZpVDU0dEhKb05yR1ZKUHBBVWh
 HZWNHcVBPQ0tFeXJvL2FWZm41UHhQS3ZZdXBPN3pkCmoySWIzSjMvZU9BbHRnPT0KPWNkTDkKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

From: Fabien Parent <fabien.parent@linaro.org>

CPR is using the power rail provided by the ncv6336 buck regulator
on the apq8039 t2 board. This commit adds the required regulator.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
index 4f82bb668616f942d65f59a6f418cf38f404df32..2da5b7d01521520a6814b76c02329be3bdedb4fd 100644
--- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -111,6 +111,23 @@ typec_ep: endpoint {
 	};
 };
 
+&blsp_i2c4 {
+	status = "okay";
+
+	regulator@1c {
+		compatible = "onnn,ncv6336";
+		reg = <0x1c>;
+		pinctrl-0 = <&ncv6336_vsel>;
+		pinctrl-names = "default";
+
+		buck {
+			regulator-name = "ncv6336,buck";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <1393750>;
+		};
+	};
+};
+
 &blsp_i2c5 {
 	status = "okay";
 };
@@ -371,6 +388,12 @@ typec_irq: typec-irq-state {
 		pins = "gpio107";
 		bias-pull-up;
 	};
+
+	ncv6336_vsel: ncv6336-state  {
+		function = "gpio";
+		pins = "gpio111";
+		output-low;
+	};
 };
 
 &usb {

-- 
2.45.2


