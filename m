Return-Path: <linux-i2c+bounces-3998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB4905E10
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 23:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64C761C21B7F
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 21:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B0E12C484;
	Wed, 12 Jun 2024 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duEd34AX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4212A14C
	for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2024 21:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718229522; cv=none; b=BTq7YVCMgcsYiIljOZ4cwPWtnoD0LlezYLQQqqgha4phaPR8UnIghxV5HFi8KKVSmNyjCV5KW75z3JUWCe3wcS6uKDfn6Gg08osZQH6pSGtLvTh98qXUh4a8cI5bFp+I2lWqNIwwxi/UMyhCYVH4PaZI2ZPdSgbizNZvZ30VZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718229522; c=relaxed/simple;
	bh=RwirxVQ5lCYdqrq2CamTDoFinCGGMm+4YAa64ynicsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=coQF2fok8ElwA+MtgeDmDTdfXt0RSOgMfQRpqn70e3tFwfzFRYJ6Wmfzrj4uLJseGow7C7IBsdAbaBiOKQSh2WxjHJ5DyT3ajzsBaah0yeu1IS2J58Ri6O0oUO3OWkqPKY5PWEhEfqI9XsHsnL66z8P1S0Po7PSbTGTSEgbqI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duEd34AX; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-52c83f21854so52374e87.2
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2024 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718229519; x=1718834319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zcv/dvg7WkrFwHEFNP1T9ef5+b/Oc5DEEcdM/vW9RU=;
        b=duEd34AXS6sTGcM8cMrooVkutWMQBDZ/dyuE3d7JVxuyT04d6QC1wXt6c9yf/9Aw9T
         BDfC34BapPjIowDPQAw/yt3dCH9sjy1DlZjjdAQSDsufo500yV7O2vEEM3BbBMTgnzra
         b2XJnILUx833z6WNvOlMgDmteiAB2w9y55v0Y4nS1KkcFCFyUwzZn9kEpiI4qMhWfM0l
         JG+g9ij/4SyUcQIyZuNTHVOZiS/FZXKFfUyBYdz6Lhw2AFBUeIXU5HbwOfeKZftipxeL
         hb9FInPzpkQO9JyfarIES+XZdFZ3GndF/zX4/9c66u49qNXzbFOxPcLkXIPnucd07gY8
         O6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718229519; x=1718834319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zcv/dvg7WkrFwHEFNP1T9ef5+b/Oc5DEEcdM/vW9RU=;
        b=hfGKafN+MNxW6/3MGcCZnVQpfyusOBYodxiJIGpJkfAN9Tw/OmBTvmI2ZCcZUuRkmW
         cIxq4PKzb/DhWUDr4j6/mBpqTaWYmugA+8WY47EfbbPNzRfZ4VwjcZiT1FkEJZjnwk0d
         Y0ii1r9cQTbOAphxAQtWTzAvVMISGIFFYJ1WbhS91L3LRiick94IjadTQnn8va/LPNXq
         asAI4f9fRMKtbswpyj03IZ8FVCsJygiFIx/yRdh8XaEIuVA5JS8NkO//yATyhjQ29s7s
         9bCxEqDM40BeK1qf7HfPYOXz4SCWEfqb83x/mABwkYeUMhmH0IgaNN84/wPyCfOBkglY
         grUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsq4gtjOGv/7sPdBAP7JXFKxL8ry2T8fZfXI29SC+ajnf4LgzkOrnAiainv1L51NIVqH4s/PnfipYdL4tb5CV4d4OGRmWNNtXb
X-Gm-Message-State: AOJu0Yyki8O6SiYUEqF2atGRRtGr6kbF0+hOSDPW1AiaGI/0a02Wb9H1
	kGLQpGgFEBnoMgvW3akjlao9F2EVrr78L97Fxenkp91TqTtlYEk8SzqBY6P3vBY=
X-Google-Smtp-Source: AGHT+IGbt+hiv1cK+84CIIOD+ul5bawW2KjbJwf/tKijr8Zc1WRz4H8zFkeJOC1rldlsfeTgdCtJsg==
X-Received: by 2002:a2e:a796:0:b0:2eb:d5f1:d8b1 with SMTP id 38308e7fff4ca-2ebfc992062mr22432861fa.3.1718229518918;
        Wed, 12 Jun 2024 14:58:38 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c179c5sm57011fa.67.2024.06.12.14.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 14:58:38 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: qcom: add description of CCI controllers for sm8550 and sm8650
Date: Thu, 13 Jun 2024 00:58:31 +0300
Message-Id: <20240612215835.1149199-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The changeset adds description of camera control interface controllers found
on Qualcomm SM8550 and SM8650 SoCs.

Previous version of the change is found as a single patch for SM8650 SoC:

    https://lore.kernel.org/all/20240410074951.447898-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added new SM8550 specific changes,
* added dt-bindings documentation changes for both SM8550 and SM8650,
* unified bus names to follow cciX_Y scheme as it's mentioned by Konrad,
* removed minor code leftovers in sm8650.dtsi.

The patchset is based on v4 of "Add support for videocc and camcc on SM8650"
series by Jagadeesh Kona:

    https://lore.kernel.org/all/20240602114439.1611-1-quic_jkona@quicinc.com/

Note, that during the testing on SM8550-QRD board I discovered that it's
necessary to replace sm8550-camcc power domain from MMCX to MXC, however
that change and these ones are independent.

    https://lore.kernel.org/all/20240612214812.1149019-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (4):
  dt-bindings: i2c: qcom-cci: Document sm8550 compatible
  dt-bindings: i2c: qcom-cci: Document sm8650 compatible
  arm64: dts: qcom: sm8550: add description of CCI controllers
  arm64: dts: qcom: sm8650: add description of CCI controllers

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |  20 ++
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 252 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 291 ++++++++++++++++++
 3 files changed, 563 insertions(+)

-- 
2.33.0


