Return-Path: <linux-i2c+bounces-5775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A695DDAC
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 13:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E911C2125F
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 11:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFA116F851;
	Sat, 24 Aug 2024 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6a07QXB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFFA14F13E
	for <linux-i2c@vger.kernel.org>; Sat, 24 Aug 2024 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724500746; cv=none; b=jOn8h8yYTj7UVpoSC/Kf3OW8zXwqZDqnCs7Yn1a/tmS1m8U7zW+R3o3++BDnytzByFZqd0J2HsMdwoCK3BM8IwQoGGQ/6w4nE3eh/DY7RMIVkY0iq+YsQtQzNEuXBp4eRj00xZe6yXFb5P121duDOks18coN8LHR7XeB5vxXUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724500746; c=relaxed/simple;
	bh=0DuzVKEoj/UXgJ7mEwk1mI8XAwz74JJWB+QxpB2dey4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIbJR5Aeb1JINo9bvM4jDPurpF+/Mre+MIYkTaxbIHhnOb5ZqqdfVovSLIXPupzJWGg0qkV5GsS7U+FgWCGywltIW/qHFgDvRMtHaR2cv6oEhxvL5avcaPajsZeFalHFFzID2SYHmmMfbh43lV8bp28OiPQVXaEu+9VVut4Sm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6a07QXB; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8695cc91c8so298918566b.3
        for <linux-i2c@vger.kernel.org>; Sat, 24 Aug 2024 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724500744; x=1725105544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFI93y00zMD6bCmpfwEIFGjVAprudVxyzc0oGsV9Nws=;
        b=X6a07QXB62MNUrElErXJ+PQ2QJnh2hMxPNfZ9YfkG+0VYxnANmoJv899mwfqqtlSBU
         URvPL0nXwcA5ytbANWlmXYjOnrDJgC4VG3ZyxYdiw9VdhCk11yiqHNRviVffrMEpYgrV
         nZZooPltoUDOydmo6bMQA6I2CytMjSQiM/MUJapP/GKhUWpf6Bx9rQMHsqDQeShioe4v
         g9fn3M9OvpHawxrASbM2bi2skrZmt8PS7qSs6sXt2vxK9AVpJhvIRUC43cZlA5st1bFJ
         gaw6rHX0O/wUCsTrZaBcuPoHxtxxXavGCV41E/XFBQlu/0+rOOxkKfvhQ+t0knh2c038
         rhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724500744; x=1725105544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFI93y00zMD6bCmpfwEIFGjVAprudVxyzc0oGsV9Nws=;
        b=C/S4shj3TanP3CPupteRrL1s64X+qhdsmAAkqjAM0mnxVukDy+i40Qj+G/n7Nlt7WH
         3izjjZtYgr3H6dCVKe5WJNg1Hr89W+IbSCDLDB5jNOUS4Vz5JBilppj/6ZpyaM9sRHJ2
         4iayXpkK5XpNmjMF/Ut8xSnoQT8NVW+E6VUDCdUvuAYrbRScScBySzzWf8W/PCDURs5Z
         +frjStDpA0EWeeCQcLenz61zGFFnGj2T1nxulYRy6UZnAuSD9+ecmKy+kIBSEmtl6Tv6
         pjz5TDdSi/FShAOOtIXJuxSGRT/FPa9JY84sZ3lmqfmYBMDtpOIx9+YGkcmplZtjMRbV
         2O7A==
X-Forwarded-Encrypted: i=1; AJvYcCXCuwXMYDRlCj/XZ8KL8nPNI0l4qAo4oZ1CxPcMMmicCXGdDf1zc+lR3KEPEKbATkst1V+y/wr6ofg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDe1+n9O8pyXjUGN/dL0rVkTEeG0zh4Y8swcanyZIbb1z25oi3
	xLrTGC/GeXFm3sJYZLm/aVirs+kAtqEB3148M/gSR2nsdD5CNBY6OkJu2wZSTUE=
X-Google-Smtp-Source: AGHT+IFjioJWqfHoLZSyZtpbC3hGCEXMM/p8fgRmV3Ro8hWJPu+jWJN6wQIPD2x7AwJXhGlaVxPS1g==
X-Received: by 2002:a17:907:e2d8:b0:a86:80b7:471d with SMTP id a640c23a62f3a-a86a52de598mr403785866b.37.1724500743573;
        Sat, 24 Aug 2024 04:59:03 -0700 (PDT)
Received: from sagittarius-a.ht.home ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f4a95sm390881166b.210.2024.08.24.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 04:59:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: mailingradian@gmail.com,
	vladimir.zapolskiy@linaro.org,
	loic.poulain@linaro.org,
	rfoss@kernel.org
Cc: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	todor.too@gmail.com,
	mchehab@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] i2c: qcom-cci: Stop complaining about DT set clock rate
Date: Sat, 24 Aug 2024 12:59:00 +0100
Message-ID: <20240824115900.40702-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <Zske2ptZAV12YLyf@radian>
References: <Zske2ptZAV12YLyf@radian>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is common practice in the downstream and upstream CCI dt to set CCI
clock rates to 19.2 MHz. It appears to be fairly common for initial code to
set the CCI clock rate to 37.5 MHz.

Applying the widely used CCI clock rates from downstream ought not to cause
warning messages in the upstream kernel where our general policy is to
usually copy downstream hardware clock rates across the range of Qualcomm
drivers.

Drop the warning it is pervasive across CAMSS users but doesn't add any
information or warrant any changes to the DT to align the DT clock rate to
the bootloader clock rate.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 414882c57d7f4..99e4305a33733 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -602,14 +602,6 @@ static int cci_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (cci_clk_rate != cci->data->cci_clk_rate) {
-		/* cci clock set by the bootloader or via assigned clock rate
-		 * in DT.
-		 */
-		dev_warn(dev, "Found %lu cci clk rate while %lu was expected\n",
-			 cci_clk_rate, cci->data->cci_clk_rate);
-	}
-
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;
-- 
2.45.2


