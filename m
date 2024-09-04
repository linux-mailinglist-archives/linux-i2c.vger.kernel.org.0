Return-Path: <linux-i2c+bounces-6101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881696AE5E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 04:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6AE21F2595A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 02:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE8978297;
	Wed,  4 Sep 2024 02:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnNWWA9O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432727441A;
	Wed,  4 Sep 2024 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415508; cv=none; b=Ba5pukSUrVf2BWaZ3EpFLqMpENNSGFlx6gK/QZ0PICRMGjld3SK8h6Nv6ipi7t8JzvROoyjm5WjaeoLgCF4lVJwujVhJerA6SuGoTHrrqVN2CDMbcrivGn9pBzPKbx6AkATZnLL9FFQh/odWZ7XP8vHuRfj/duYXPDyHpEyHj3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415508; c=relaxed/simple;
	bh=+caQQPNBz7FFaJccY6GaMn4orGwvzmCmHIlHd8FbBmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnzpAG1llhPZiMr2QvSKDUT0UEidEwCU05tI436dAj/leT9A/U6sz2zKAxVDhBsSyB8GCF7ptajNvTxTYsMX9V/0/AmRurB4vDnL2NJ4v+SIbIxFRlF8iTUQAjNsC5yu2PKpMUC/TnM0rpP/o0ZUmr3dJ/LjpLpeCOQxhvePOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnNWWA9O; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-70f6e65d605so2530044a34.3;
        Tue, 03 Sep 2024 19:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725415506; x=1726020306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ttp4XdTcBjNEKD1AIzHq96QwvzqRai2IsAK8E3pZNf8=;
        b=OnNWWA9ODtB1ctn2ZaMuP6NaUdH9f8xJ953IKBqd/5QR3n+8jB96mwDsQN1ClmhEYv
         gZaPjN9s0M76lpU+pZmVwh0cKswJbRuEZSZyQOAvEwwI96egb5pB70y8R9Pceq8VKscf
         SCDRsst2MVu1Y78cJHVvzIUgRsN/7ocW4RZ5woGk64xy/LDBulA5vS5U58lxWgNO7bJE
         G4gFjTaCYkaG9ItUPk8sGKg/CSPm9Zc11383e+Eub12g4jN0ehwRgAso7CE9iVUogOCb
         Xhhrf0Zhay7ljV+/GLlmZ+yfWzLQDMkbWrCkq8lcwyjWEHAz4TXd8MmCwvg6olXLU7DC
         K5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725415506; x=1726020306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ttp4XdTcBjNEKD1AIzHq96QwvzqRai2IsAK8E3pZNf8=;
        b=FenQwdN6ZU16zxVMpedrVrTZAiOTtbHsv5Z8mUfgTFHIDjiU4bHp3KbX/2G52Ocyxt
         VjMp+g+fY4hH6IhRdLBwEWZakWLRd0SlM4Th7UhFZskDJiQFR78wFoqoAKTMR44918vM
         CuSCN6DnbFDbf56m34Hswx5KsjP81z/BE4+ld3OPRCrB5HHdnRFs/q8Y3IkUj3kQxuuJ
         czzY4tFboFMxcN/P9LXg1rGXd+s8in2AQlMCt1YQs9SlxhZE1GmB+KYDvxD9xmMkFMO0
         4FhTk6nhVPnc0cIl65Evg6GiH+ko39Eoc4WbdaM10Zt1YawabAtNtZ0ebvXHTmIcqUwN
         ArzA==
X-Forwarded-Encrypted: i=1; AJvYcCUZCXC5zJpGke5VKqSgrYyyR/nSR4Y3FMJEvuN8yNgl5Pg3IyHMnzeRek3XkLiK9I9ki/QiT3F6U83t@vger.kernel.org, AJvYcCUofvJesiQzpjMRxqi6SNOSfYI1k6DLOAB7ghepGeDXvk4c+a08Fu7iMwkLIyGJsZ30yjtdt/sBHxw5KrJ/5A==@vger.kernel.org, AJvYcCVaSzQPffuQwTHIRU1/CxHCdGZ5yrZ09heCCWMLr6tJL2jAHaPk6zGnwbkUxpTQeUi34HONAysbsmNe@vger.kernel.org, AJvYcCX0hp2xP+del2KdUqla+LNq9Z/2F/SLAYcwEyqDMFy/C6uwjyAk1j0aiZ/KKDx+e9xLOyMAEVXhpAP/jKY=@vger.kernel.org, AJvYcCXtKlMuidorA6Mo0FD+Vn3CF/ZRE/hJY6mM0TDbYzQxv4CX2ngxqMFEfnp4XN6Jls23pDcIU+8V6UEv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WNLsLCQGjRmxLs6+e2x/rzgICbH8iRwtnvMEEyDmWcmEPOLM
	z2s+QYMhwEeQ6FQ/nPb2WJbPvGvbuc+B8dGGWgpJpPlUmGQHtV+m
X-Google-Smtp-Source: AGHT+IFvqMEMAAZ5ozDueJrkHmFthxoLIQGfD27Cj4xtN6PtJ5lRaFPG2zEIom2stiSzEbwvkUp1ow==
X-Received: by 2002:a05:6830:700b:b0:709:396c:f295 with SMTP id 46e09a7af769-70f5c4b4fc9mr27003074a34.32.1725415506127;
        Tue, 03 Sep 2024 19:05:06 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682cdde0csm54780091cf.48.2024.09.03.19.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 19:05:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 6/7] arm64: dts: qcom: sdm670: add camcc
Date: Tue,  3 Sep 2024 22:04:55 -0400
Message-ID: <20240904020448.52035-15-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>
References: <20240904020448.52035-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera clock controller on SDM670 controls the clocks that drive the
camera subsystem. The clocks are the same as on SDM845. Add the camera
clock controller for SDM670.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 187c6698835d..02f87200690a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1400,6 +1400,16 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sdm670-camcc", "qcom,sdm845-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sdm670-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.46.0


