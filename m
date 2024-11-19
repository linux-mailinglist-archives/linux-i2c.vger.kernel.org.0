Return-Path: <linux-i2c+bounces-8040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510439D26E0
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39289B335F8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 13:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEAE1CF5C8;
	Tue, 19 Nov 2024 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IjdOHedK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB761CEAA9
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021843; cv=none; b=nx587pxa0Vn4b0hGLDzjFZTBTAijCXFVXasD7NGqhXO/va//4O6UhpSfwAfeJmlgm6oohzlGDEeOQGSTK4ooug8cTNt2MD+5gXtGg/Ql/tInrAVWfXTFkq7pj21hLkbmKM5ORSyEhsZrA1e4s7NscN8eQApcPs61nVFa92PflfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021843; c=relaxed/simple;
	bh=t12v8zWCVM0pM+HRLfyIIOho0KIRne2GJY1N780c0Es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIn+7rkdAeYnqj/emfna3Ahszn2o7/kd8mL0Bpm8+91bNlneOuaPKplnWNMrT41qieNOYs2O0tLeNgyp9bLsnrZHeBeX35h+LH5JEnGgSRQHADo1HfjNHrLU8QwUPBUllstJJZqzsQQ5OL8ZhQ2AFxoUzIGX767T6DDIxA1VcQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IjdOHedK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso7624465e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 05:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732021839; x=1732626639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4jJgXbb0QumNcqO5LY7bB0qO+5goS+G7JsQo6VSzJE=;
        b=IjdOHedKu/Y2uj3FBU5b4eQEJN6buQ4VCrWZaWrLk+t7KrD3ar6QBCtSAtybr4nCP0
         SO8WHYN4cPTcpizyQhcuxNIUClpYDMErWqSg0/pH52BJZbnu5SJZHM3+S4haR9stY71q
         81qT1/m0E4xkVUM76MUO03988hFw/8QAPENDSYlj6TcJjkKuQcwqbUWgbbZWWiO7scuF
         8QeXMPfKKkox2b3NS9pOmIf8vKGqilUWk0gSTCJ7Iv1L4hcq93kMVR7CSaVvLdbiU2Bb
         KAnKGC7s59ssMV/83o1LbZSpgGA6XXwWQdpaxEauRwBNG31CNwYjB1gHsDuEVB1HXELi
         DHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021839; x=1732626639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4jJgXbb0QumNcqO5LY7bB0qO+5goS+G7JsQo6VSzJE=;
        b=EeQ/MRZ++qdJFS6ujczhDU0gh4w4GZCuAOAc8SyfXInWceAeQAoxNi3/9tVQc7MQZh
         R/iEuI3t0TkTkg3COAp7GjTGK5iCwZBSnxqe0ZhNB80WHnTpk3SFxyLw9mRdJWNs+F7p
         /6OO8sVj2gu5aLuNwwyMxhwtF8f+Pp86vf1wBlTetGgHI9D0cocZvucUq/tVl2O13J3Y
         JrPyFz9cFGHgUdTwlA3+64zb5TdEI/4rlB+ng7qXCn2y8L+/2zlObWHEyf4GkzXqmjvZ
         iqDbSk4DoNhPvkI+l7xqX3inJ042whXOm4ptlMlhpJVGajIBR9i/Dk4Pd4ckEwK7g0E8
         nG1Q==
X-Gm-Message-State: AOJu0YyNDol4Vs4sutiYCiWCkWBx2bxMB+mkdcOx156ZWWdQ5YnMHpzD
	YU0i9t6l7JrXDZwO0DpxTD8jNgz6lhtw/z4BVzCCb0pI4VCirMmtVU0wr01SovQ=
X-Google-Smtp-Source: AGHT+IGFsuq97lalRsqu9bZK5hlcfb7/qqbliC6yYx8ftgFBBphfw5SzY13d0laz8TcME54XLOlzBg==
X-Received: by 2002:a05:600c:1d09:b0:432:d866:f45e with SMTP id 5b1f17b1804b1-432df793618mr128865905e9.33.1732021839068;
        Tue, 19 Nov 2024 05:10:39 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab76dafsm192016185e9.10.2024.11.19.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 05:10:38 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 19 Nov 2024 13:10:33 +0000
Subject: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block definition
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5119cf64b461eb517e9306869ad0ec1b2cae629e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
@@ -4647,6 +4648,22 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			status = "disabled";
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.45.2


