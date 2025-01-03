Return-Path: <linux-i2c+bounces-8882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF9A00851
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11F9B3A45E8
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC08E1F9F61;
	Fri,  3 Jan 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4f1qIQud"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198AF1F9AB5
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902726; cv=none; b=QBMdVhOVubaa2w6TCHQqWwwg35xJeycJ936oBBztokoT99WeCIu3rAKS78sdl7UldICE3nlCIBpa+xfw3nCfmGmcy2gCN780+toT6T0siKPVrj03IqnxnEBeuQSlTK0FU0hF57Rq2zg7igKV6vwxTQnS61oHpfCk/tn2xV/kOHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902726; c=relaxed/simple;
	bh=V7LLzS772JzWekboxc7ic58WU1/YMCue2Pnz74JgmzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ihLWGMTFTQF4yD9secxH+UQrJBewjMr7QzQO6IQSS+B0yUUXDH1j32CUNSSQV1Y2iWlT00OU92nYbEpyDLVFuMrsAxHVwFxa4bdQUACyY0YdHTRLZ0Hwo70pEfllw49UyL7GZiRM77/nRiKaOfXun5F6we7zKopiiNsmDaJxkGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4f1qIQud; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa68b513abcso2258932166b.0
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902722; x=1736507522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZ0KxM+G6NVYDY4yC/WE/MAo3QAuIiwCharn2GxEX8E=;
        b=4f1qIQudf5SpQOkHhLxSF5i7ihOqy9Ood4AOE8BeeCrDcqUTOQ2J3pt1x/3xrNNvKK
         nIrMShFvtyZVoQ+K+XozR5tKu2cHsF6JGBgGtCcHmMRafp3tQte2PB17SY8BxfszUz64
         9EbC2AIluJN6YyPSSe1UyuEN3ORvouDn7n2bk9dnBESJKfmmlADzurnrNOXqwCJ0qKIB
         okRQ1Upmga0l/skQBErm/BBzcBcM406+wCeCi8dUg4/GrIjCcPMzt9C0d4gVTwWP+ONk
         Jufmsnjv/I7xvOwQgfKZ9nlwb8qTb76fmcSB7FehV4N9XVM+mbr5R68v304FjxCp1YGa
         fN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902722; x=1736507522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ0KxM+G6NVYDY4yC/WE/MAo3QAuIiwCharn2GxEX8E=;
        b=TfAjVszdc9LLmmqu609xhnFyWF6yboXON0fHoiqhvzIdj82Fhn59Rm2qpawgyibrOW
         xb2XvSINyyc87fC/fo0/P4w08+E7mlEYeJneSgSGScOfJ3Sx6oivtQtKd5ofiwz1LX5W
         4OnRaBmFGxAZXLoyA8E6bvCdOrud0R23gjvqfxUUiBlk5yHjSwmyu2m/MVC89Iz7PK48
         3oL0/WAVOK8dnGXmJ5fCTYCfS/fpZqt0aP27/VyYcXQjgxet4o5vnjqyntoV+8E9MQBv
         z8dvc1IwxApOnLWVQ/qtMP7/k/cfHu9m52WM7dJOpDsAVW7lD4ExFCIzJsZof5MCBLq4
         M87A==
X-Forwarded-Encrypted: i=1; AJvYcCVFAADJhXKAm5ctoExj7KFRP6MnVlEoeZMgufueY/Qg2AdW1lkiWoEpD7c/Zap7C66s/C3qtncFyd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfPSxvsa9mrKxjf2xXM0o1opYbboHetS+sW1C7Ibr49U0U0PYL
	Q3ROdV2WHeNjgKwHG9EymPvvLDRsVmcHZjiZymYkZtuwUo6kOAPlTIpGNfiHqNk=
X-Gm-Gg: ASbGnctmVjF1CzT4gW1uejHYZ/eepQiqD7Y97dt2HwQhzNREInSuxxUwk/Hl3TZZuRy
	XkRKpDkx16f6z/dG0GCMUHmyjTUEC3xOgMD5ZxCCLOMbX2HcFIkitdpgAPdCUojA62mZGlzbqgz
	jUFIVusHwhkIAcrK99a9fe7Dqww2QOBTJZCRdQyn0jF9ty2GO2HCnuH1tQ1U+nljobplNTtjXkX
	18NrOjz40KBEHkPZRX5P77Go4fh+n5KJZvI5hbFrp7zfMstST0Z2kFFZw2H/yqOlsowBKKneL2r
	SOrfgoOdc39zIBX1yRwKLknm1w==
X-Google-Smtp-Source: AGHT+IF94pkNvH7h3XHPLp4HlTKDGRzARv5cgxdc0QFDVdciNsmjQcTgfzogxJGqFhNBU1VxR2h4OA==
X-Received: by 2002:a17:907:6e89:b0:aa6:538e:a311 with SMTP id a640c23a62f3a-aac2b28eee7mr5003930466b.18.1735902722233;
        Fri, 03 Jan 2025 03:12:02 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:58 +0100
Subject: [PATCH 2/5] dt-bindings: vendor-prefixes: Add Puya Semiconductor
 (Shanghai) Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-2-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the vendor prefix for a manufacturer of EEPROM chips among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..7e743a9f638dc9623f73a31cdc4b6cc899cb3320 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1204,6 +1204,8 @@ patternProperties:
     description: PulsedLight, Inc
   "^purism,.*":
     description: Purism, SPC
+  "^puya,.*":
+    description: Puya Semiconductor (Shanghai) Co., Ltd.
   "^qca,.*":
     description: Qualcomm Atheros, Inc.
   "^qcom,.*":

-- 
2.47.1


