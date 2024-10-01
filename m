Return-Path: <linux-i2c+bounces-7107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD3698B231
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 04:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CB4A1C2181A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 02:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16735481C0;
	Tue,  1 Oct 2024 02:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="La9J+6kx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E5446CF;
	Tue,  1 Oct 2024 02:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750200; cv=none; b=Yz45ssN7MgkzxLbHGd2n4gWaJ/cxc9x5NzxCVLyvbuoXMh9QcWE2cca4tP8It1/hC4PQBEeHSgK5Xmx5li6klN2AASDJ/RNciup31CQ6puKuekZAgHqqmStZsDKR5scOqRHAr3GHqZAwNMI61ATambUsgsy6tu0AwNsoddRfVzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750200; c=relaxed/simple;
	bh=WkGwLI1L/uedNG6+xyD8F8R14Xy+breXTPvfARLunz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVqKw9MqEWohr2QNxMX8OrCJ1c8dlMf0CfgFFor5omkzGPNWphq7LjEf+TnZnGDef1G16QL8tKNz4hamno7GJhNPnZH6NkkH6ewXI/kn13fxbFse+m3ZtjBk5TAoV+tVwfLVEOVZmneem8eKcuX6ePLEX3rifBlm51FR+3hI6tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=La9J+6kx; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a9a30a0490so567027385a.3;
        Mon, 30 Sep 2024 19:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727750198; x=1728354998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WwBaChOhxcLyUFWEv8XazVF7nqIYEeWlqR2X9oLCuY=;
        b=La9J+6kxDwoc5+LKoVi9mU6wmGfVndHjZKINiAHivfbOPDJmhpcNM11ZIQ+IZHhrqP
         1iO2FLM7diBjPuaYAwmxlylZxs7/Tu64xT375SKyWtTifn/bV8SxoQ6DF/mTOFZbNg9L
         Ke6s3bSDs4TKb0I9ItXayIcEwYYZHdzFnrynCDUveiZwbPRSRmshhnkCWZ8aOO/8oAJT
         M2ycoSxdq44yng3EEgR0RWoasdCPHKmw92QKGRKHs8XMBIvNTMYVz4RjbyQIqgPUF8pO
         uWQ9pPpUstvmY9ERlKgbG9XkTZzbjX1rpQWSCo76DmzdWctZbFb5NS34IdF3F97JUEH7
         qEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727750198; x=1728354998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WwBaChOhxcLyUFWEv8XazVF7nqIYEeWlqR2X9oLCuY=;
        b=SSUo4VUv3FvHE8ICAeAb6r0HOmwRpbDRSjyRSi9jGJwyUlIR/nz20e1X80UE8YkHgg
         AWskTwPljj91kVf+HjFmhQmmlvNbZ29LvJ/BzPW9NBHjvVZlQ2FOntNjvBQB7AzqjTHN
         aEea3e84nYTRJRhsMYAaqTpd0FoJEKHNKxzGjwDFxPOzi+7lOQ2ABAORrTUCimMFLV/l
         P+ypDs6OXoPvtV/xZRChaiKRXEhloczpM9PZBVrcoXitw7o5bf/hazfgSBxZS27kV3f9
         duY+yCxbFOWy+Rm65tJZsatMFDAQTNDYwIDh96xQaCx0qSmdWlNcvusCidtKTmvvBxS5
         cbJw==
X-Forwarded-Encrypted: i=1; AJvYcCVEvhXHWGAxLo/kCH9RcLb8rb+7lv8cJm7KGdOTEfTz1OlDGWDBqJj3SbCIGJ1Ag+M14afllug5swrw@vger.kernel.org, AJvYcCVert8vOV+B5cQ9fRTGWaoS62SIkL2U5+JJy98Fz3dQK/WG2Hs1swVrY6PsU1BuZ2VI5nAqwlStFm8oBq4=@vger.kernel.org, AJvYcCVylxQ9CwlMGp5seaE6ATy2hi1EMZHMrbRq5EFTAopkxvAKBi03Q5tK1Bd+d597cxRRwJ5I1ITRVKEIvf+i0Q==@vger.kernel.org, AJvYcCW4jD/iqaLUMQof1+DupB1kIrbWEndHFbcpzxO6RmR4+1me2KFM7GJ2wLj6OufT/RwOeJVtHuh76iow@vger.kernel.org, AJvYcCWicAmKmYuciKEYiexLd+CM1uGmhynBNTu3nYBvO0hum2uLi+2jJBTzcVTm+qCVGDlx0ok2hG9nSiaL@vger.kernel.org
X-Gm-Message-State: AOJu0YyWzvxZnfYvyB8Yg56zrXRgmDSSqLTz2jHSrodyjHei/iV/0N5T
	jKdfnVTHXGngZBZUfZbUvmpZ6hipyHHlv8t5fFVdt+y5dd+yY5Qo
X-Google-Smtp-Source: AGHT+IH/eB3ou7rKiWmFjLLEDXt1P5KtVQzslQTVJy5yNXXvywiVr2AttkB5EZFWgUVz47JUxdUDiw==
X-Received: by 2002:a05:620a:2413:b0:7a9:b021:ee4 with SMTP id af79cd13be357-7ae3798eb11mr1879089185a.64.1727750198269;
        Mon, 30 Sep 2024 19:36:38 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::1a17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3782cdf6sm462926485a.95.2024.09.30.19.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 19:36:37 -0700 (PDT)
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
Subject: [PATCH v5 3/7] i2c: qcom-cci: Stop complaining about DT set clock rate
Date: Mon, 30 Sep 2024 22:35:24 -0400
Message-ID: <20241001023520.547271-12-mailingradian@gmail.com>
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

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

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
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Link: https://lore.kernel.org/linux-arm-msm/20240824115900.40702-1-bryan.odonoghue@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 414882c57d7f..99e4305a3373 100644
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
2.46.2


