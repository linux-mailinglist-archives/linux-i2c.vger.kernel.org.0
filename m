Return-Path: <linux-i2c+bounces-6095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554496AE3A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 04:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AFF51C2360D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 02:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0081BC2A;
	Wed,  4 Sep 2024 02:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTvzoOmd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20FED529;
	Wed,  4 Sep 2024 02:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415496; cv=none; b=Pgh7LNsTNvw0zeMcHm91NStOaQXKcRtku0YDIng2BPK9SlQhCX2dL/RQEpYIdV3yZagy/5JWh0XSYyKEpy86HrVVfdfdbdLCVwE3uOvbZ3b7Y9Y8MOdiDLq32B3n/4eTDZz6QCxuuhtk+LapSNdFstT+/AG0oOwdPJOz0W83U04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415496; c=relaxed/simple;
	bh=s4Jiezo9uL0aAB0mvZ0xJc4+WbaYsc/jG2jEIsn98UY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4zkDTug9HeNYzRRikr5xRJxdfD/4Hr6xlV9yu1qAAR31/VWMl44fsN0vndv9Qd4xn9KZbXBI76wUl65pumGSsuMqju0S4j4pfd88SJV9blbrTIbEOsrRPTs0Tmb0TfQcs9hEmNXB7U93Y4+U9+xTOPwJHWS0ZBrW/5MM4AT9Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTvzoOmd; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e1a90780f6dso3794281276.0;
        Tue, 03 Sep 2024 19:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725415494; x=1726020294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qM3ZCVnrlMuurghg+8eAxbQKNT+spP3oTnGdsmJX1As=;
        b=GTvzoOmdmZBPYBLoHEW+pAxhCIYTjfZrB1URpuHnACVSJEj0H7GULAwWf41onbS449
         i2DIIFwqYSaedg3E1U4RnesuN/R5NQw7IZODc6r/HQM0gL8dFQ2fo1Gau+7c9tzusteK
         TocRBAvyzD9ib5VTiJEBXOmn5Uiu/VQjlgPdnIb5du/mehg4dMFDKcp7mCFsGDgR9W75
         YlrYrteBklfFyOsrGlhMT702WRHsjsE3DRUQvzBu8iWn23PIq2qUS0O1Ss5I/7SXMXmW
         WJryk9chCgwI1folel43ktYv8hR5KAIrwy8PJL+x8bkbqypdZT+Ij/2B0np2erR6cUUu
         erBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725415494; x=1726020294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qM3ZCVnrlMuurghg+8eAxbQKNT+spP3oTnGdsmJX1As=;
        b=w4OBVWqLF+nsmOINL1NZ/mE92tf0ZsCrNit8feZu+HFC1saNuctlTrxk4CNeb3yW4L
         OuSxHDSRxiBCurvS6CVBPEXTJc1m6oYeXLkYi/vvR1oG3TK257iMtcahFW9//3oIirLm
         PW3d0ILXfkOqJSvOY6geD22IEgoLc6RKw86Yco+CS9Hn5iVDieXdYzxO2SMEYjkNob94
         JZ7cuautV+hyjnicrB+/xdTlzqD6O2fF4XuZpx2x5JgoN87m44tOzXo4FiXWo4Gw6YFx
         KCDf5yOwYVD3xOeFb/1gMm5cYypFCpX2+gTEsF7hS5CY3JaeIaP9hm/TAeFWNoG+zdlW
         mWVg==
X-Forwarded-Encrypted: i=1; AJvYcCUU+BmP7G0lRyFbx4cFVOl+svSkJJcFLsg+mria0ibP6e77BZJwOhJHEqIzeIF/qtuww6LuxosQvXMRVhI=@vger.kernel.org, AJvYcCV1bYRNH50ptfPc/SSyMuEIhpOlaAklDB1bSk7rE3ljeGIdujolXgMAJ3VKuzZ2xW0CYm8y9AL+6VNX@vger.kernel.org, AJvYcCVJ2R3S8Fz+FwNpglMrtqpz7IR4fGSJVI/k64rckJ6sRXQoZceiJSScnbIrZ/ulMpNouZ757XD9pJkM@vger.kernel.org, AJvYcCWIz8BXOx8byT89EKeGjQFEJMeQ4KmtfkRWGCNK8uHKLVtqCEwQUC1Vpkjzxrd1snlZZ5EoLxEifDBsr9DjxA==@vger.kernel.org, AJvYcCXTExkW0H0rsscRkNBg7hslAAhXKGXavXWyDFTMo3OYpK1CZJmXUbX5areSYD7fyEJjwI3sAncz1azN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+g0ZZ5QGoXkCarB2hGcEwEsH6fj0XcKrrU09hdEhWfWLVxaw
	8O2LIh0hqoJ6p2I8W6ZiqdRC4O/caPE2Tv+elkPZS7I2LUcPM7sIpXrrWNkR
X-Google-Smtp-Source: AGHT+IHmLcyU2g/QYq23/BS1LXLImIdoLtFZWhjKoKdQhLAsKN6dgAbD1Lvs4axCzxRcGYk1gIBSqw==
X-Received: by 2002:a05:6902:a90:b0:e1d:13a3:87ae with SMTP id 3f1490d57ef6-e1d13a38948mr19286276.10.1725415493804;
        Tue, 03 Sep 2024 19:04:53 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c34e6e07a4sm48499376d6.6.2024.09.03.19.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 19:04:53 -0700 (PDT)
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
Subject: [PATCH v4 0/7] Add SDM670 camera subsystem
Date: Tue,  3 Sep 2024 22:04:49 -0400
Message-ID: <20240904020448.52035-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

As of next-20240902, camss seems to be a bit broken, but the same series
works on stable (although it is much less reliable now that the CCI clock
frequency is not being assigned).

Changes since v3 (20240819221051.31489-7-mailingradian@gmail.com):
- add specific sdm670 compatible for camcc to dt schema and dts (1/7, 6/7)
- pick up patch from Bryan for CCI driver (3/7)
- stop assigning CCI frequency in dts (7/7)
- add maxItems for sdm670 cci clocks (2/7)
- remove empty line at top of camss dt schema (4/7)
- move regs and reg-names up in camss dt schema (4/7)
- move gcc and ahb clocks up in dts and dt schema (4/7, 7/7)
- add reviewed-by from Vladimir for CCI dt-bindings patch (2/7)
- add reviewed-by from Bryan for dts patch (7/7)
- add reviewed-by from Krzysztof for camss dt-bindings patch (4/7)
- add rewiew tags for camss driver patch (5/7)

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

Bryan O'Donoghue (1):
  i2c: qcom-cci: Stop complaining about DT set clock rate

Richard Acayan (6):
  dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
  dt-bindings: i2c: qcom-cci: Document SDM670 compatible
  dt-bindings: media: camss: Add qcom,sdm670-camss
  media: qcom: camss: add support for SDM670 camss
  arm64: dts: qcom: sdm670: add camcc
  arm64: dts: qcom: sdm670: add camss and cci

 .../bindings/clock/qcom,sdm845-camcc.yaml     |   6 +-
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |  19 ++
 .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 195 +++++++++++
 drivers/i2c/busses/i2c-qcom-cci.c             |   8 -
 drivers/media/platform/qcom/camss/camss.c     | 191 +++++++++++
 6 files changed, 728 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

-- 
2.46.0


