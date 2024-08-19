Return-Path: <linux-i2c+bounces-5560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B24957738
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 00:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9536C2844DC
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02131DF679;
	Mon, 19 Aug 2024 22:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIG9jqlv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC01DF660;
	Mon, 19 Aug 2024 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105466; cv=none; b=XQ200XFpgBGSKKy6SzxdHd4FriLcJenFPX+U38jjyUin7SXazykADIrXvdtoKymt1IaaWlSu7HCIbSjU9r9hU3xulRUqCweBFbwJSL+wzOqS+B42v9xIyZdgjWdfym/2ruNI+kwJ4ZriWjhUfPNdc/Hx95P9keO6zylZvRSCFVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105466; c=relaxed/simple;
	bh=f5ndnPGyNML2RBVgcCFAS6E+Cpaupo301Mp7PFj/82o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyPJbcGWIBcNigGQCTgKpwY7sviBBKkXz8B/WNmBAVUUZ/ppRQWPcPFUVV+X+2pwVb7+9riBFV/X5mo9PQgFWtuRiZdHIHrJc0YaSVAuaAY4H7BUgawH5pGUu/SmE2rIagAe7lk7CvwVBTxSjspP1SD0dXcHXFYzwPQyiRWGLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIG9jqlv; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e0e76380433so4976828276.2;
        Mon, 19 Aug 2024 15:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724105464; x=1724710264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYvOKhrvZIkdrV3l4vU+5m+L83khCaWVUbS3qfqudds=;
        b=SIG9jqlvxFMt18Sdq5OjcgDmsz6SGcKFQl8oOVD49EwqthQl0CkLOzCMTGtUphnRFG
         lzesaPJELWhOx3v+v8FlHu0kf6GBbZbT3c9hiCbFAHGRkdOQGk2jOe37Tv4v2ZFGhZbM
         m+3iGbtm3Si5/VBv4VK5PIJumVwboMCUGPrMNMh0tcF5C/ombTgCnYSSNLvpNBeyNscp
         Ek9s/KFj6nMW43XaAwFt1+wOFqsdA+8wrEWZgRF1XMhYwwORnBIMCS73Vd0TbWU7gCyW
         lh8n7+Hj89gOw6WRdxn+ac/LgNlvrBEdPusi0Cu78sONllYBIchsKeJaSA8CFlDceV1i
         nExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724105464; x=1724710264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYvOKhrvZIkdrV3l4vU+5m+L83khCaWVUbS3qfqudds=;
        b=o+uGjj/105hECTbRaPll1fej3ny1nocmRi4RWLMu6yTP+lHosbi76zjcn77f8dM2Tb
         PUhYjjo4XFUqUdusSsyngcHjIv+OLTajrWTsgL0QpAyVQqCwyqRXF07b4u+brSr0b6xF
         4ZENeta2fAuQeWZENU13SZGV3dKeKfF7PiCdk3aoi+bbiU0WAbmiCINAKs6hir8gWYTw
         cwiyeATSpd1a2pSaMW5Id69K+cj2WuV/W8MisNovptmBubhfm6THx/wFv5dP3M2+UqbY
         7hcjrl7gImNrHPblslvt3BI7aoh+DKfg0ZV2YEuJbCXhhbXhOd5Ato2/fF8FxuC16qkm
         EHww==
X-Forwarded-Encrypted: i=1; AJvYcCUWaklVt9yIdJLWSM5dAPK14d9tNyMIOoGl4fYzkkmrEk0+7JoFoXDMU4xM0c8ij1ICmk56iF4KgOwm@vger.kernel.org, AJvYcCVG+85TL8T+WdoHMNrmU+VkCix8JsSMCN73jxEu3D6loSOUO4KmUO62aco9YtYo0qA4LkqNXRr7Hxf0ASzM5Q==@vger.kernel.org, AJvYcCVJPNqSAYq16dj96LfMMS9Ny21HSG7t/Dc3S6drHhRI9MZW85G0ncb5XSyOb6AulAEzl6lRsXOcOMyvsTU=@vger.kernel.org, AJvYcCXCMF/1WmgZK8/VX/KvYXjLhOq8nWf6wY+q8JqAegYbSTZqD5jkHKLxMPYuMNE7XF2fqb+JP1ugO6ex@vger.kernel.org
X-Gm-Message-State: AOJu0Yy87bm8xG7Z3S/0KxhZTQMGTtAJkl+CEBrMfnReAdbF0SxL9sMF
	ilO/TW9EklfQ4/Jf441HPZKam0CVOB17tuw1iL/1Fp1wg960OVLFUaiYp6E6
X-Google-Smtp-Source: AGHT+IGTTVKO2yJaZhCFAqhqi8ID8pIIk1KfzrMHUwGyCDK2ECdMOw04qPnlUnhCpnKOCnAWHEEIog==
X-Received: by 2002:a05:6902:1021:b0:e0e:763a:260c with SMTP id 3f1490d57ef6-e1180fbe116mr10829882276.38.1724105463836;
        Mon, 19 Aug 2024 15:11:03 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369ff35c3sm44409521cf.33.2024.08.19.15.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 15:11:03 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 4/5] arm64: dts: qcom: sdm670: add camcc
Date: Mon, 19 Aug 2024 18:10:56 -0400
Message-ID: <20240819221051.31489-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819221051.31489-7-mailingradian@gmail.com>
References: <20240819221051.31489-7-mailingradian@gmail.com>
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
index 187c6698835d..ba93cef33dbb 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1400,6 +1400,16 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sdm845-camcc";
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


