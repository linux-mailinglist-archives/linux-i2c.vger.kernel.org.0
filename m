Return-Path: <linux-i2c+bounces-7105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E296E98B227
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 04:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 180B01C203B8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 02:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FACD3B2BB;
	Tue,  1 Oct 2024 02:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZdM3UoM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71385FC08;
	Tue,  1 Oct 2024 02:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750194; cv=none; b=mWFpWFwvZ50MMXzzGMeFU1gKYlUm1PGbkenJgTVLsrAfqi+6e5G81wI8brJ+6wDDtISkbfYqPnIXT/khJ1ZuZf4VoLz6AAM/dJ1iKiqwg1hhgMAOM8bD6dCQs0LBT09UEryIjr6vk+OGfeDJC9rzLCxzPliNISbW3VD2cXuq03c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750194; c=relaxed/simple;
	bh=leYA27jbeH4r7Da3jhMWNn3YLu4MqDrFdjOhjyeAI0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLIbHFMaPfz/hW7C8NLOpOP50pwnLCKgHLGe5zycHS/rvgUEs0ISt49WKYii8xVdQhNzTDuYyicx8gMX84umGIzzK+0ZvK4XEZkgdCEeR0E4IntzNvRf0mvKP0PoApvb3MgbOLTM3NFwRr2UcqbsQHrcYVgw9eha9OXy9mpEFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZdM3UoM; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a9ad15d11bso451523785a.0;
        Mon, 30 Sep 2024 19:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727750192; x=1728354992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzOTW8IVDLk+OBqJG1v9ps+TkJTqEo228L3G0OZ+074=;
        b=iZdM3UoMjOJcEef1cLGVR3kKMOENMYo8rj7Y8m/27k7Sgry0R/HI6Use7jjQdNdCjY
         6c+qmHXi2Kv3e81lNLVIjQc0JVcNuorzbUwTnOwz9f3+zyfqogTo5y3jhzGJ8iUyi+uA
         SYBXm7Nr7kR9ICq9vhF/doG5YYS4wNgyKt9vluEFwxrgKeD4hEQpPumIl/jJHKWRLbN2
         M5280UlpJ1fW1BT/TRbRDKiePvLaZBnxG8EW0QGaNWTQFoi/MKYTs1vvB9F2AZoXqDUO
         z4sMps+vmFwO9y/Hge4IsXXwNLl4k+5MRDxhTEeBNS0grHVoQZWqytHS/HzzqW1lS2mt
         Daxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727750192; x=1728354992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzOTW8IVDLk+OBqJG1v9ps+TkJTqEo228L3G0OZ+074=;
        b=eyN+2LDapv/zzBrW4arLi1+c77zXSFyBb3zLn7LdsSVukVsXwzX4nbhiVKAngPRaL1
         nDm4kDRn4nQQhI0MwmSc4vOKEjIDybNdntAPZVExwvRk678nZ33N2eoabzthtWU3AQT/
         Yl6pr1o09+ieDNa9ZPOTHmvIazGKxZmvp6J0+XD/NQgvhc7JioZHIXD3WfTHJdldmiBn
         kpI/jK1A1m6EhKuIew1zyNITa5UAcUFqn3ztMCKyGZ40omuOpwTHg3611iE1wj3sEjti
         XwjeQdyTpE/O6aP2QO7soCHgEWCMLpzwPfOVH8u/tvXuW8VgyX2z74MnpVheBt2fZKIq
         Mv9g==
X-Forwarded-Encrypted: i=1; AJvYcCU6d/UZlRXK2sDzSG1Y+cGQSZhJvGmKlAoVK022jen79n6FwhycvwUrO1WKLVHvgn/hbMQyxv7asbZy@vger.kernel.org, AJvYcCULoR0AiDXjJWk26FZXTXmKiSPw4OdLMWMqJCOw6Jk6OKWlHPdLVc/N+OGUFeFWd1iZFJIm/J0/8GUJ@vger.kernel.org, AJvYcCVfgOZWe1h3rtl027sq5fpgdT0SeIBR4AoMTbbtuVx1Mek28kdFHXfIHbVsUshRJmEUSpDVUFJL43MXWavrXw==@vger.kernel.org, AJvYcCVqXMwZ3Hs7IdlkVEaNK0bkyuYWX/Y5Q4596TTUdV4qp2yv5ZtmHazPYI6hQSzvj4DxzKKODTeKcRn+4y8=@vger.kernel.org, AJvYcCWm9Mbe5yk7YlpV8bw7MMQpzGfUNv9c9NbmZqfmGUAcNGTxqxT9bibxE4nNhvG9lTcQ9GjqhcjK9q4s@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0IAY+dJyGtuc2oa0A/JaF5iCCvEtJ/h3C16DEkDi0XyFkMD/0
	h2V42ipT1qpvH+eRyhzOssLPEfHtJsdx5G0dQ/5RLp9uFEVPdtabEAX2rjlY
X-Google-Smtp-Source: AGHT+IHd/IJ/rg/ETwN3e8NpxJiJJF84+UGXVL44TcZIldZLJYwnT6BgtziJjAr0NegA6c7GD6QhyQ==
X-Received: by 2002:a05:620a:2801:b0:7a9:aac8:f244 with SMTP id af79cd13be357-7ae37826316mr2503135385a.13.1727750192328;
        Mon, 30 Sep 2024 19:36:32 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::1a17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3785840fsm457512485a.130.2024.09.30.19.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 19:36:31 -0700 (PDT)
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
Subject: [PATCH v5 1/7] dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
Date: Mon, 30 Sep 2024 22:35:22 -0400
Message-ID: <20241001023520.547271-10-mailingradian@gmail.com>
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

The camera clocks on SDM670 and SDM845 have no significant differences
that would require a change in the clock controller driver. The only
difference is the clock frequency at each level of the power domains,
which is not specified in the clock driver. There should still be a
compatible specific to the SoC, so add the compatible for SDM670 with
the SDM845 compatible as fallback.

Link: https://android.googlesource.com/kernel/msm/+/d4dc50c0a9291bd99895d4844f973421c047d267/drivers/clk/qcom/camcc-sdm845.c#2048
Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Suggested-by: Konrad Dybcio <konradybcio@kernel.org>
Link: https://lore.kernel.org/linux-arm-msm/7d26a62b-b898-4737-bd53-f49821e3b471@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sdm845-camcc.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
index 810b852ae371..fa95c3a1ba3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -20,7 +20,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sdm845-camcc
+    oneOf:
+      - items:
+          - const: qcom,sdm670-camcc
+          - const: qcom,sdm845-camcc
+      - const: qcom,sdm845-camcc
 
   clocks:
     items:
-- 
2.46.2


