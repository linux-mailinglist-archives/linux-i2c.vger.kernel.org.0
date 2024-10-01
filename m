Return-Path: <linux-i2c+bounces-7110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0998B241
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 04:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ADF21C21A96
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 02:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7935E093;
	Tue,  1 Oct 2024 02:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCECN4VZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001C58ABC;
	Tue,  1 Oct 2024 02:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750208; cv=none; b=TzKE2zo7dGxJiP3+Gp02gDtImb40DHoNapdoy2KG1tWpthqVTQlR7cxdO67TWxWtHpF5BRl5G9FLwUEWepKfK/9pgBNyC8F8dtRoxgoycVOW1+p7MXBFXRf6XEtIykxZ/I/N+4ThWcqHGAj7P+Pml63CgVZdgcxaW2r2t6glFxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750208; c=relaxed/simple;
	bh=MXxZs+jnpgwtBOXp22m7wpotkLkesrbL6HsCO3JO6AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idsq9D8wmN84St/2ladltxVGh57MYgJFXk+RugH7V9PKJR5/pfTBdFb/LQcrFpjmsOS08wTdCR+85oYLhvdojngJg2crrOjzNvJTLu6NQA707VJBfkGQzXBHbVRh5DSeXR0YbT3kzE75HIudIz5LSQKfsK3ne/nAGhQv7z6p7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCECN4VZ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4582760b79cso24190961cf.2;
        Mon, 30 Sep 2024 19:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727750205; x=1728355005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNqMhZ25MsFOtXUUIFC8ZoBm8w862CvLikdYokANhX0=;
        b=HCECN4VZExKaJunHoAevZigThC8r7VfRkXiNEV775MYuqJJ0U92/iKjUmkInBmFJRg
         7VxpKGcHzweAYuwY9l5T54t3UMapxr0fMgbpNSqn5C3WlyjmYimhxxY1QTq8MmoldpZY
         T+iZeJ0ndBnXMM+5EPpyhGcJ+wm4nYx5eIhIenFfHB1cNlfxXaFdnAn0gySvdWkp2xfe
         W1ZIKp1UbzZQ4BcgRHCuBtF9FmqMbZlPYhjUMJPqviJ/t5eXUYH15uO6/fbxD1RjRlZy
         Rh/+E+x9/zSzUoSMRiCMidnRHgTBkyysSEQu24G9UwcaQOZojJWsX/+henFKtQi5dsUh
         VWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727750205; x=1728355005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNqMhZ25MsFOtXUUIFC8ZoBm8w862CvLikdYokANhX0=;
        b=vIZZx89uJHJwVCEL+GHPUMNqyRu+WME9arbOb7Rmo/c9bjh+9DqIOpJsQ/zVYMH5cn
         w2Z065fROsfVsD2Bg680VuXG/PgpIqVB9ZjzQId/UVTS0vy0su0JwHQis+v3rZ/WG3Uh
         o1seOOEUiiYdjkErV3UaN+mmD0MUWbKI8pVS+xeIdv5qsrceIyaDpQxfx2eH6srsSqIj
         THyd/TeexrnfJxnHG/iJDvUqSKBic3rY88O9WZLXDvqYSO/ZRh4TMCVon2WsT+qG56TY
         JItNg+UkfoD4Da9Hzk/x5viOvMo36oEnaiKXPeFxUGDBXw/qsWGC89SSEsWhK00ZcKlA
         CEMA==
X-Forwarded-Encrypted: i=1; AJvYcCVoAoUSYGypM2+YI3+d9PjjlPgEyj3+rE3wP6Ru7j3xejSsc+/ARyWaN2C4GaxcfqBz7RbhawpUk/TIiqba+Q==@vger.kernel.org, AJvYcCVvjMQX21RqC+RMVnOz+WUMenjR6EvGy6ji51w53jPv125ajPsYhNEnOxZeMOOleuJd1Ilm3oXBd8Bu@vger.kernel.org, AJvYcCVxl79OLsOlcOdxrIbnzjuTg2bfwHLb/FKHZJp9Hxlp0lbQa5GlCKU1GWotskDFLrYzEzc8tMRVrX6DoEg=@vger.kernel.org, AJvYcCWj16Rzl1WS2I1S4LswXOCKd9mPoit92+vAHRU9xkVXUZUUMaoW6Xwe9DpoHx/r5Pz7foq4Gl/sMkdB@vger.kernel.org, AJvYcCX2dJCSHYpcxpPhU0idosGs4fVmJA562cK6S7uCeFDCoR20hByd4bmaR3sCf6UfmXthbXHtJCLHArwG@vger.kernel.org
X-Gm-Message-State: AOJu0YyRuzVSxEY3mtSkMSu4yyTZNYZbXawKlB5LQPmCKUztwulidzmg
	g7tzIncVkzsa1u16al9lzXhqrqtbb9WFEQvXWHNZTm7fJRsTl/rB
X-Google-Smtp-Source: AGHT+IHjRTrwEAoOBnIqmzShtc1tymogyOztj7vso3aDVSQRyDrcdeysgd3SzJImfwvIwhD7/nztzQ==
X-Received: by 2002:a05:622a:5499:b0:45d:79b0:f91f with SMTP id d75a77b69052e-45d79b0fbeemr1100171cf.6.1727750205324;
        Mon, 30 Sep 2024 19:36:45 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::1a17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f351e18sm41143361cf.88.2024.09.30.19.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 19:36:45 -0700 (PDT)
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
Subject: [PATCH v5 6/7] arm64: dts: qcom: sdm670: add camcc
Date: Mon, 30 Sep 2024 22:35:27 -0400
Message-ID: <20241001023520.547271-15-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241001023520.547271-9-mailingradian@gmail.com>
References: <20241001023520.547271-9-mailingradian@gmail.com>
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
2.46.2


