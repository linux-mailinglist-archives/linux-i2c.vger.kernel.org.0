Return-Path: <linux-i2c+bounces-5351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F03951008
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 01:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C5E1C22C1F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 23:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D1B195B27;
	Tue, 13 Aug 2024 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hm/IcsPE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE33D38E;
	Tue, 13 Aug 2024 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723590050; cv=none; b=Bdq08g8gqvPcCB2p5AlgNX2xrmkxo0KUdhNzk/6l33pSh7t2Ms6Plz/u9JvRLGIzRdscomKi0NnVO/bqIpADeQZyX6LStgRpL5guI5J53V1D4PlMdT0qd1GxBK/Kfqhzb6FUUxyz8uQla5NVEuCp4MIzQ3c278rFL214jrlYJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723590050; c=relaxed/simple;
	bh=yaUz1P5yD4ag5kkSzSYb/GSZh0zAIwXs12QP0zzl2EM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l8X1MzXOSO0AaWByKyAmBqrfSDwK9Vfdk06ynlGPqZOdkIqG//0V4dYQ0zj1GQjm2pn6vUICedCCatjBnVM8qmPKKxsYbEbS2qzRyK4W0Y8xjn6J0Viutxit/jg/RipRZV3d7U//FCVViif0q210/oSnp4Eay8E5bbV7Xo7UXi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hm/IcsPE; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-70940c9657dso3112319a34.1;
        Tue, 13 Aug 2024 16:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723590048; x=1724194848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttCWrc8h5Z4hw7Jhbn0HjixtKIJRgLcXKgPXhy4OLhQ=;
        b=hm/IcsPEPIIVipBC1Pz4x6u08Nbvvmj78c7lyuMW7CiFijO5VT8gbqqXoROL+KjRaY
         4exGx3fuWwdvbKHtTstzguCrtnh8gFCOiiyB7xdK83XQepLZBbft3vqzj4PQf/VXsaBo
         MtLYo3Rd1WF9OWu2o7jtWCLRTxoUbvKiJ+ZBW8wyo6ibsOzzaSfaAuaCsXqjrXw7j/SU
         BXykCgE3c3XSaPar87IDhhM8VQdjq3Jdz2f1tJxnqCbJBjZfo8HpTpyj21rHEwMjAIBa
         ovRbdg3OUlVqnH4+FtmWESff99wxiM6vfpOCQ9QhKMcCOowKV+L82eHgY3UCBiUL51wh
         7IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723590048; x=1724194848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttCWrc8h5Z4hw7Jhbn0HjixtKIJRgLcXKgPXhy4OLhQ=;
        b=JRMP8V570hGJdU7J3e6wg90jStL1gkU+CxeNoGF/s7DXBEbuhQkGSd5xckp3bCRv5S
         XoGyIuOi2fE5vsodXeYrT520D8Wt0vx0rdK97PvDMet38U8atTOwiFhT3HOQjkE1lBvr
         zQ5UuYOAa4DXF0wxThKDaIkNRZXJ3bxgiep66ykzpjuXU+/W+ED8leaiR/pf+Fm8hkyc
         16E7L8nUS1KsV0a6dXDzvPlFrglP4UjITLiadl23UZoXcu79xgLtDPmTSasfXpIOKwpH
         XRGS9Fz61zw4XuyUWLD7BIrSzODDJWnWBdZbJTvQ+1FXMT2WSaXKhY3GPNz4XR5RGt/G
         4cGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0ETDWn0vZ9nzMYvOGez7PVO79MWjKryNqsRxogmRZfZ836ay8cDyvEkr0Zj8N0zyWmnjFeccAfzgw@vger.kernel.org, AJvYcCVfHUVG66O2PmjPQsBJ4fQreQ2ajKR83Q+EyVTcJxTZl0j43G1K5EJUrxkeO8E+kyW+G4bQqQvZudst@vger.kernel.org, AJvYcCWAsnKaWKaEYv1uSlkLClgeiBfTbafT0r+VazzvK+YSTuLvuKVUVYwVp0vsGOzgU9w2X87oQzAbc5RVT7w=@vger.kernel.org, AJvYcCWjbWuZSTrJ9mnfyht8diLl7YrvUhn5EcZyu7iO+ZYDlbT2tjaeOxVGTLueHt3JcSN0CVPw4sBQ6O8Kbq2cXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKRTZVRV4PU2nUMYZMWdebErpEArsDfgte9Q0h9khNx1VbK1it
	3xpUT3fI5084EW+Vw9ko03Y2EeeYBbcFKUadlW+sAfb+HHun8GdA
X-Google-Smtp-Source: AGHT+IGcXWBRqE/mjQh729tfgAAGNoNgDJyjYnZBYFkirnhAIh6lfKmswP4UFXpPq3k9J9JdRuF10A==
X-Received: by 2002:a05:6358:7f02:b0:1ac:f3e8:b93 with SMTP id e5c5f4694b2df-1b1aad52cfamr109603255d.20.1723590047760;
        Tue, 13 Aug 2024 16:00:47 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d64e70sm376950485a.7.2024.08.13.16.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:00:47 -0700 (PDT)
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
Subject: [PATCH v2 0/5] Add SDM670 camera subsystem
Date: Tue, 13 Aug 2024 19:00:39 -0400
Message-ID: <20240813230037.84004-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

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
  media: camss: add support for SDM670 camss
  arm64: dts: qcom: sdm670: add camcc
  arm64: dts: qcom: sdm670: add camss and cci

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 .../bindings/media/qcom,sdm670-camss.yaml     | 324 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 203 +++++++++++
 drivers/media/platform/qcom/camss/camss.c     | 194 +++++++++++
 4 files changed, 723 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

-- 
2.46.0


