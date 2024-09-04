Return-Path: <linux-i2c+bounces-6098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AEF96AE4A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 04:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C3A1C2360F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 02:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56BC58ABC;
	Wed,  4 Sep 2024 02:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Joja58JA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1864055769;
	Wed,  4 Sep 2024 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415502; cv=none; b=au3lFPyBpQ1Xv0WPrxajW8OAD0PnxYPqanOHnXi0Ni6un5smdUM+q5TAF6l96nO1z9tUtBREBq5y0HjKWF0RmwvV0cAQfymXYs+eQIMDrkgfJohlO5zvSTiceBPmcNV+zL8A/3M8YnCuj24Fl1Vn8g2TMAPrVYVTAiVJsPVySs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415502; c=relaxed/simple;
	bh=pUpq8UsXqLezGna/TEyJ9fymabJ0PAxI/7KbnXUIwTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLBvFBrTbNNrQsfERhHexDUwuw6XrSNTWWotAyUH5zmNq6FPOTj+785DDBYFDsYuX04vcivfxEb8Q6nvOZbWNZCIQtkEoFM67bHsL7dLOsd59M6hflnIumDFcG4m/tuetmoScHeADH1HW/knXillBsLZvFFGgcUKPpWnqWcK778=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Joja58JA; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-457ce5fda1aso18256901cf.1;
        Tue, 03 Sep 2024 19:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725415500; x=1726020300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyQAdLSFbiT04JpmWn5P5vj4/UQ+i4Gu5Pn5Akf8UfE=;
        b=Joja58JAcyAd4TfFlCNIXJqtfHJ6jpXbFO83aeX/JBZiTBjMzYyrUU/pnh7HQEIhk4
         7wyYEJ4U96Da4wj6vOz43IgR2U96aTsgJGcb6q+NzAjBywlgLvjcdSPEaz8LvAFs9tPb
         N+Mu3gbm1cIUY20V94SpHVsIq1mVMiRdzASvN8P/c1vfojjLe2AIXYqVyI45EohmXBRP
         gCcnXNtJhztQatIyp9p9sQbYas5yAML+pjY4IBcuXbjsPDNz6xETloWZmEfkkJy8IkEq
         yqa925tEbQvTkd68vz5O9/41vw8QhXwfkPNLd2NzDhb9VZR+rtqeP8jpji7dMRuCd3SU
         1D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725415500; x=1726020300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyQAdLSFbiT04JpmWn5P5vj4/UQ+i4Gu5Pn5Akf8UfE=;
        b=Bo4UtOZVbGouKeXhB+OVb5nh5P61MK57q/QWGXL+k4WaVMGw8tWHlNzuGU8wSv+OAQ
         sY6UT562i0v94nhPnynjUUoJuwHksM7wJ+cdZPUrXqh2WT2tmYNhwGtkwtjyqfbHcQHU
         YC7/jyaeTOx9xcbNkQef44uulYq57ykccFkFKopCojm5AbP+l9fNEWdhgfu779h/Y2J6
         l4bsS8HWYFZMfgZI4B2hJ4JaV8L28yaS3jPQlT51EJQDer6AhvIwp47Ll7Zpd7ue+oiv
         RuxrzrQtgViTcrzbu7uHD/QqBKsEY6L5UAIn+MJ2K1vrXzV6IyCv+qpcfxro1tbdTA2e
         +1cA==
X-Forwarded-Encrypted: i=1; AJvYcCUdFvPCWz1V0jL4mkbyOvX2E3voKtq33/21niOF6JlD3NSNFdo3/qgQzkyJdAp4UIb6rRqx3x4Pe81e@vger.kernel.org, AJvYcCVOi8F8CfCtLRr76Hx28QE68HJ6zRfvqDTPzF9a5+FlLffjHeJULGv8D1650T0iG6Vkx/Ug7JsjOMWC@vger.kernel.org, AJvYcCVRfEEF2Y9zt2t2O5FB2AZ4ycWySL9Gl0cLMAxlufAinlEnNaLZEMD6ZfpWLRMaIDaLqyv13dcj+uUN@vger.kernel.org, AJvYcCVml9XzJA8A8xU1qNTUQ5To6ncpAAkAgy90tBvKDqCVoZw/RMwrJTA9Qa+aeTklWHMq+ZGIuTM1QPYREYk=@vger.kernel.org, AJvYcCXP+HHf4RXJ7ccAnazhnaEPND9ee24hId5x1AE5lb+kDyc7Tr34Em6J3RveM1RfSSgjhi5kBcw4iReLVEAs5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHKCRxIdD8l7yBng7icDoznLLvKJK3QPLJ0YKYTeWP7UAOrPdH
	j/8aXWd+UIZjo6jIKYDszWB00egn/9j8AG776P5i9V+5WySKmUer
X-Google-Smtp-Source: AGHT+IEcB9Nkptpf7aJS2Wv07l2GIS4ZSjmqFDlo0KAZt831u7HbQ/D9UOdCjuh/bXzTwN9NbCzhHQ==
X-Received: by 2002:ac8:5793:0:b0:457:c593:50b5 with SMTP id d75a77b69052e-457c5935305mr153522051cf.30.1725415499884;
        Tue, 03 Sep 2024 19:04:59 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682d9573dsm55060981cf.84.2024.09.03.19.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 19:04:59 -0700 (PDT)
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
Subject: [PATCH v4 3/7] i2c: qcom-cci: Stop complaining about DT set clock rate
Date: Tue,  3 Sep 2024 22:04:52 -0400
Message-ID: <20240904020448.52035-12-mailingradian@gmail.com>
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
2.46.0


