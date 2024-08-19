Return-Path: <linux-i2c+bounces-5556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8FB957727
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 00:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B04AD1F21C75
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589621D54D8;
	Mon, 19 Aug 2024 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PChuTNax"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9513926AD4;
	Mon, 19 Aug 2024 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105459; cv=none; b=UrInDgh5tsvP6DRGLfTrOw+uDEop6r8MUTBuZJPPvhDfWHROBjmNyrADrs/VpEaltp38Aq25PfxHVd5fPM21blmtr8QFY1AUKtoVyHWhpD0HpbjTjpLxwVYZdSEEO3km288FacI/arxQD4PKDZEAQfM6FZaoKjf9JiOynQz9fVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105459; c=relaxed/simple;
	bh=ZW844ioCz93Oa9LBH6CdQMs8bM07p/FvPAYk95Fffs8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Y6PYKDwLKqXJlSmxK8inCoFiPMDTp1CsbSGF3Rrn+iqk89nymMHhSU/7FEMH6z+6eL4ejE9kLKC6xSqyAqAypJEEHpjd6PtlYdfMW6iqA7lCpUjFsz4XC7Ct5pW/bXFUDArdiOovku27TOPeoXm7gfAh81JEdPEVP5kL8oRuy+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PChuTNax; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a35eff1d06so341734585a.0;
        Mon, 19 Aug 2024 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724105456; x=1724710256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CA9Bp1k08Y8BqXZk5jLF5kLwjrXp9IU5/oWoCriKO2o=;
        b=PChuTNaxJUwLNdTepiTiXCEISinjkQkDyeFko+8RBwF0X7lUPrH35llYURcA6WhF/i
         VtN2kamxs4P7T6f5ZV5wez7kHJff0ezqP5D6plDljPZMYwDG2BNfzro0xzLRBbQ9VKwP
         Rj086C2y1kE7ItygZ44g8sjSx5tXZGeb9rNZJYYZOD75MEAPlERoHYIPHQ/enyDzGHbk
         Sq08kQriB/AHgQPNIWJpfKloANWFafxMkxzxdkiOaPr9CQbBlG9g10iv2DFVqwmtF3HH
         1H79KJC9wSfQk+il8C7X+2YRZNwrzZ+OTT5R9jKJGHHaw+gVNjk+gmXsMhebjo21lZKk
         opmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724105456; x=1724710256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CA9Bp1k08Y8BqXZk5jLF5kLwjrXp9IU5/oWoCriKO2o=;
        b=S95SQ9ifiFul6P7A/zX/IaacPIi+oVOxPu1bMZy+qeR/6+jiU4Si3f3r9BZGZuIDkz
         fWgmIqPs5VAcavKqymMd9weAFPml97FMdeOue8Fr+HaXDBKCHsTjWH2mgZQbd8eerdPS
         XshGTKEuUSkuryMOpISmQrjSkT421wYWMU473VdCbNU00/8YLFaHIX5ppQHEAE9pyAb2
         HgNm+GbFO9W/eJazAa2Z/p7Qm/T42xf2VcoOsSKXrzEl0qVzvlEQS4KK8vzJauDUqe6Y
         4ZPcyaPUTsbG0aTxuaju7JijDaYirZwLoNcGfbtJfda8+7DnSxo0aroB77dS+RMlcuXN
         VsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUojJwNUnSlpYvnNXyARlx+n8Q+UYd58gdSWiMgKI5Uy0r4E5FizerH/0/IH/5gEOkfW+6zLiWneVI6@vger.kernel.org, AJvYcCUpGkCRvw5rSl1SQM/q0HAD81UxMA8fTJ97KH4lP30/1EsVj+yC+EenfdbB6oiF1yiZh9dUgQD7j2TQ2BzOKA==@vger.kernel.org, AJvYcCVTutz/TTYsbOThB+K7kIQZAoAyRx97RK6/LRRbOMCzLNx7aYANDyB0xyH2vzyJ5lkptcsICKItRaNqFJw=@vger.kernel.org, AJvYcCXsOxCuBW0ju23pSS8opGZ4W+f37MC/TP7F6qimUrF3CpGVfAiHqhymzaYgOnHWqw5ooEvCi7Nr7J0h@vger.kernel.org
X-Gm-Message-State: AOJu0YxETateUtpG9+LZX9XLopCbnOo+StIv4g90svt2wKD5Vtqnd5Mx
	gSpNOre0T+LJ5gbXmmDMNZZdz52QDajzTWdk5t1Y95O1PTLDOW1CP5KTsU0o
X-Google-Smtp-Source: AGHT+IEcfDPtP9aGr9kNEWSHcGJP6IXe7mtsomI8Ll/WodYAVFnSLJC00cpX9hrr4YhNgu6ZgXIo3Q==
X-Received: by 2002:a05:620a:2989:b0:7a2:e53:3f60 with SMTP id af79cd13be357-7a50693aa91mr1356449485a.21.1724105456248;
        Mon, 19 Aug 2024 15:10:56 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff11fa9csm466852285a.133.2024.08.19.15.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 15:10:56 -0700 (PDT)
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
Subject: [PATCH v3 0/5] Add SDM670 camera subsystem
Date: Mon, 19 Aug 2024 18:10:52 -0400
Message-ID: <20240819221051.31489-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

Changes since v2 (20240813230037.84004-8-mailingradian@gmail.com):
- drop unnecessary assigned AXI clock frequency (5/5)
- drop src clocks from cci (5/5)
- add unit name, remove mmio properties from port in example dts (2/5)
- correct the reg-names order (2/5)
- add parent_dev_ops to csid (3/5)
- remove CSID clocks from VFE (3/5)
- remove AXI clock from CSIPHY (3/5)
- change subsystem part of the commit message summary (3/5)
- add reviewed-by (4/5)

Changes since v1 (20240806224219.71623-7-mailingradian@gmail.com):
- define dedicated resource structs/arrays for sdm670 (3/5)
- separate camcc device tree node into its own patch (4/5)
- specify correct dual license (2/5)
- add include directives in dt-bindings camss example (2/5)
- remove src clocks from dt-bindings (2/5)
- remove src clocks from dtsi (5/5)
- add power-domain-names to camss (5/5)
- specify power domain names (3/5)
- restrict cci-i2c clocks (1/5)
- populate a commit message with hw info (2/5)
- reword commit message (3/5)

Richard Acayan (5):
  dt-bindings: i2c: qcom-cci: Document SDM670 compatible
  dt-bindings: media: camss: Add qcom,sdm670-camss
  media: qcom: camss: add support for SDM670 camss
  arm64: dts: qcom: sdm670: add camcc
  arm64: dts: qcom: sdm670: add camss and cci

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |  18 +
 .../bindings/media/qcom,sdm670-camss.yaml     | 319 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 198 +++++++++++
 drivers/media/platform/qcom/camss/camss.c     | 191 +++++++++++
 4 files changed, 726 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

-- 
2.46.0


