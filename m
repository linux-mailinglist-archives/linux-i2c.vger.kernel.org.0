Return-Path: <linux-i2c+bounces-5355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A9951017
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 01:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626FF1F24A51
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 23:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E15C1AC43E;
	Tue, 13 Aug 2024 23:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaDiLiF7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09A18A6D6;
	Tue, 13 Aug 2024 23:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723590057; cv=none; b=jmaS3EZBomfIcq+CmRGUDjUTyn3nnBEJvqog2Hpxq5Y1CFUdsQ1cgZc5+QOlKisdkIlbmj4sb5zcGyS2Wq7wzQ+kLhAQlr8eSQbY3ZBmZBF4eHjj3dWVURHs/KYNzrD+KWJouORrl27v/9MBChMWY7UzwoJuZUsFxAa4VQx+TmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723590057; c=relaxed/simple;
	bh=7M2viqOaROj3pXsYrUAvYPUuS9x+ANSZGFnhafQmQhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ed0ZlzyQrlpEwRvOlqjHuhbEz5M4Lr4zG4UYPrBE+Na8rujF1IvB/yhKyBVteOt0pql6WovuTQ8jEh+Vq53zXArYxmn1/2kaHCvZE+HvWViN7JsLoyIPR7iOCsu7u58PRftDFDaRt8n+QKTXHS9VehGePMfM/w0FuulL/6rZiio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaDiLiF7; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6b7a0ef0dfcso32783096d6.1;
        Tue, 13 Aug 2024 16:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723590055; x=1724194855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIwAmHgC/fogGgIARdi0QUwehFPzkJ3dfBzCA61IDEQ=;
        b=CaDiLiF7+rHiHI9NrMW7fDE5y+AhqG1nRKxJAuPZ7enapT3XE7dSnrcn8f8P+63BN1
         e7ZOt9lTyblsMXO2y/qAurlC8ydcTUyEv2wUebSwodfvejSY8X/vF1u1CCRZw9f6ybPN
         J9tdZUidTApC6wc/7SVBosTn9xJ4ia/4F7+xcnumd0rSd6xMb34qaKYG6a9kLoxSZcSe
         JY8jOmX9nEVp3fNssoFNkqPKmgojN/LxqftjI313q5yqlJessi4KzFgRph1hkVuJyiKv
         U1ydzWTzTTHdUBHuc7uxLhJ47XcMlizguV4gzGNjnYnBro6hxLvlMxegt+4oBrIzMnXB
         l3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723590055; x=1724194855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIwAmHgC/fogGgIARdi0QUwehFPzkJ3dfBzCA61IDEQ=;
        b=howr03GBFDu0DlOoC/UKuho+9F6Q5if+SYECVEsaM+u5PT7j1a/1XSc5jagIALT87g
         J9SAcRlh+nJEgQTB5t/jjMhmws9jk9TZxBH+l8Ehuym4Sg0c5CDmzKAOjUtj9dcibBrr
         KMAenf6h8wbJ/iD4B7bBKrIsoxzsRCm3fq0lYNcsCA59ppq5WoY9svXIAzh/jhxkVN+T
         90OWxTb3i0lzT3FHmIFyyBD9nLDkJvBwy3y1dqU9u5+9k+w0Txl7xY4HFfmcxG8hsTWl
         NRa9i5lge1DpVK5qF92KB+eMc5b53N/9LiW1DLlsKyHWGmLHc1ZNGCLG+cezJ7QiPE3X
         AARQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyMvekKnVQ6AONlgzTEaYo1AIZic7LJu+ytoar1ZE7nyAAVlg0wrsByhhZz1UP+qQQX6r/fj9sP3jwGgfyppW9nrFutjHoriBvlSoDWEFGhYDAoEAUsQR+ljZoRwlyDeP9BumkzGGiF2YTzhCCi6sALSO1HwHZu7h/fE5lVyaHoAoBPERtbMq1RlC7v0yRMy66+2IP4JM+Dp3wp3Ol+5OtXA==
X-Gm-Message-State: AOJu0YxQO+/DQeIgU03IIRjPBOcMYyh2SkI0pSNtt5VFG3YuD7R1b0SI
	MdFLmCjmvgZqCO+PkCM+yLeW+0aoymSyg8PRutMct5mxEsv3XS9e8QR+LBi1
X-Google-Smtp-Source: AGHT+IEOgLhY/kd6JQMbnbdom5bXWeWMdeajpjfPO/3V5j/qcD0peqB5fAcP09oJlVGoCjIBbz7eew==
X-Received: by 2002:a05:6214:5342:b0:6bf:4f29:bdac with SMTP id 6a1803df08f44-6bf5d28e6c1mr8205806d6.57.1723590055154;
        Tue, 13 Aug 2024 16:00:55 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82e6d2c4sm37601946d6.145.2024.08.13.16.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:00:54 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 4/5] arm64: dts: qcom: sdm670: add camcc
Date: Tue, 13 Aug 2024 19:00:43 -0400
Message-ID: <20240813230037.84004-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813230037.84004-8-mailingradian@gmail.com>
References: <20240813230037.84004-8-mailingradian@gmail.com>
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


