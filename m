Return-Path: <linux-i2c+bounces-8881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB0EA00846
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7B3818847A3
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623341F9EBB;
	Fri,  3 Jan 2025 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3nNmUaqa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED671CCEF0
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902724; cv=none; b=jE5hh6m8gvA/mmXmTjNv9AG+FzAqONTW+KdtpsjY9QmEtuPoZUi37R5nNmZCdHhwyvMz3VKmJ45B0todWLmYubKiLZPBKnudlso9Ktr6n6D4xS245RZ0SFemvjnrqacqgJFxnOK8hj8Q5exl4ODC0eKDKsLss/1tmPd1BtmIlyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902724; c=relaxed/simple;
	bh=3Kao8cuA27nNtqtZ7ArvGjMkQrWXYdTWNUrhnNqarb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jT8fP1mQ7DPMleiI4YVMif86uqEL9iTZQMHLQMCYTFUeMuN6oLLv81HF6mfNuU8vbb0orp9N+QcSuArR9404DZq6PWvI1wWQ3d23ZbT9e3/epj+JW7j5L23OoKS1wNm2QQI80+RxRGuaSjJEPBj6JvDpC/gz+yKbcSkvVZaTxi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3nNmUaqa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so1915500566b.0
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 03:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902720; x=1736507520; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlPl5jV33f2/R0ateITHqdG4xJP9TuWZHuBX474wyNM=;
        b=3nNmUaqa7oLBOY0uGgbd8yGnWsWqZt8L0lt4yT42jMg5VDKxsSRfpTIIHNdtaT0mMe
         g0BIRfnUXcaP4dUiQ7n+l4P8Y2hlnScKBm/FPxpFkzlMStwgxitezYFicQ6xas2XpQNn
         X22O6HMYDJldY6erH88eMyeKvwORqC0P7/U5hJylO/9IN7/ygXAbEb45yBr1/eFVANSb
         vb9dv63nlYOV4clepG+Y7vSeyEuxHVUTfqHpnJnAml1LXdYdf0UtaCyCNBQdyR0w6tYh
         bmImYNLXwGR5tsM14FrVMIA0OJAql+UI2CSEa1jOSq1PPR9AZFEqqk+aQOZ9ATJyOqBc
         nWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902720; x=1736507520;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlPl5jV33f2/R0ateITHqdG4xJP9TuWZHuBX474wyNM=;
        b=mS1fyeM4FIlHoMEe3BL+zLx8ymCRo+alkg16Z0j82ueeyynsbh/8qQDNdaE55JSq8m
         2Pb6nd5xivh3GC8CO/1ChWdSxGzzpXH+z5n8UaGdzgb6odvcA8YVy50MZ2/4GYnioKoN
         OzMCx6e17q7G4L2/fBAqnkXaGWmJ6zVfV879E03lZs8Sj6Vgzst2iP/PD/Yj7kZBak2a
         z/mRs2QW1vI1+aZd4P9c3d8k86V5HI/KLo+fSiIw5WU6B6jHdU8E377CI7kJ119fMLZQ
         eUjjXCeMKU38HPNNbFStVO7nzFCbyaEI3CstJUJxnAxuq6EfCDDfKHlDWybZukLS1OAn
         eRqg==
X-Forwarded-Encrypted: i=1; AJvYcCUrcJX8gCm7WQq2qAEIT9K09A5n0c3lf1p3qd4qd5+2XRSvgLJ9w1WcgC83RxbfYzyjtW1swCcaafY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8vgTOZfwRQ46F0k+Ou2U4RVwtx5EjUnov9TSulmG/CYhqJNO
	g20mt0v9oTKwf/C9HCfukmVM/amnSD+rH7GTc79OQ3zTUsENBniub/olDk2WTeM=
X-Gm-Gg: ASbGncvMI5pUgSjWFvRwLEyUOmRR6+HHqry6zgQJ/5ggaA14U80lEsoQSXSa34E6qHK
	0gbtm01leC8LuDRmmGFSd8hn+UEvpNmbbxEFp1Bs0uW1MN+fqCYwiSRFrdUXk7qlo877BS9XDNX
	eXqEDxKql11VQwckp3w6zxk+1kvwgmgYCjDc3dI56r2uU3o70UNr2NJzx43QqQpM+uaNYhoaKHW
	TLnej/R/GxTgbowtxO2UJhqIus2g8FHjWrLbNe2nLGEwGgawgGRDcGI8zEYp2WQBPrEVhxq8MSF
	0xwMFAIszC5UTZVKyMwKmqlp2g==
X-Google-Smtp-Source: AGHT+IHX9Gt1bpVbl5dPmi5oxB7HnAT6IzsM3NBq24bJtVCEfLNeIiPaDzcNkqDPYVwl8Jq7uV93+A==
X-Received: by 2002:a17:907:9804:b0:aaf:123a:f303 with SMTP id a640c23a62f3a-aaf123af418mr2914122566b.55.1735902720107;
        Fri, 03 Jan 2025 03:12:00 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:11:59 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Add EEPROMs found in the camera sensors on Fairphone 5
Date: Fri, 03 Jan 2025 12:11:56 +0100
Message-Id: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPzFd2cC/x3MQQqAIBBA0avErBuwTMiuEi1Ex5qFJgoRiHdPW
 r7F/xUKZaYC21Ah08OF79gxjQPYy8STkF03zGJWYhISfVJoTUCilO+AWiuS1lm3LhJ6lDJ5fv/
 hfrT2Ab1uLK5gAAAA
X-Change-ID: 20250103-fp5-cam-eeprom-995e3cdcd843
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

While out-of-tree already two of the three camera sensors are working on
this smartphone, getting those upstream-ready will still take a while.

Until then already enable the EEPROMs found on those camera sensors
which doesn't have a dependency to the sensor drivers and gets those out
of the way.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128F
      dt-bindings: vendor-prefixes: Add Puya Semiconductor (Shanghai) Co., Ltd.
      dt-bindings: eeprom: at24: Add compatible for Puya P24C256C
      arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix regulator-fixed label
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable camera EEPROMs

 Documentation/devicetree/bindings/eeprom/at24.yaml |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 101 +++++++++++++++------
 3 files changed, 78 insertions(+), 30 deletions(-)
---
base-commit: 9ad93a473f97ce94bd3229e5dbbc4f1b2d48127b
change-id: 20250103-fp5-cam-eeprom-995e3cdcd843

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


