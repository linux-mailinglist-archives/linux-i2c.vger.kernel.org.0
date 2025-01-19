Return-Path: <linux-i2c+bounces-9130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACADFA15F6A
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jan 2025 01:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1BF91653C3
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jan 2025 00:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6EFC8EB;
	Sun, 19 Jan 2025 00:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXnssyyG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F902DDA8
	for <linux-i2c@vger.kernel.org>; Sun, 19 Jan 2025 00:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737248101; cv=none; b=f62pDmRVVVXDrFFcVeDNts9bEqT3f0bfWJuUaOoYPe2gnioKT598zLKJBTWJb7Y1q0i82CVuw4D8z7BBvVzA7r/3N5CnlVM8M6T7BHZ13LBmUiPnkoQIhoR0ojOIzEjDSUlb6b1ru2dI4bleZOnVCV3aDDW9qpxQXFLUlvuA6ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737248101; c=relaxed/simple;
	bh=VFtYwX07oZvHGxiVg/5uqQZa1Rz1XByvclsQUprLecg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ceEVCpClg0zcnGAArC8KwUtPXfHM6Z9J7iLePNQLAbxtWOuaovt830/dJKditwOzAR2DuCo8MqxwfxCk/O6SMEUTJ5R8gqUMrEm1eIezqGTrOgEyZSh7j7aQFkzUq8duNgx1cS71ZG4Z28g/2+pR2dfIXVth4k9Ea0lGrokr7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXnssyyG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38632b8ae71so2612556f8f.0
        for <linux-i2c@vger.kernel.org>; Sat, 18 Jan 2025 16:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737248098; x=1737852898; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPVy2TZ7nxNOnPzYmR2/3BBjXksk2FPEQABRuEps/hI=;
        b=ZXnssyyG9sM7nECFu5g+PTqS54/M93wzP/RPV96DF6Gh+KinkDtFeeu9YGnbJ0O2Pu
         +xxTxeB3LPYfIZycV9Sjf5Ih/ZvfayqkuO1LdCIJJnlR/h8FsG6st2so28xCkQiLzrOV
         ikqFe1kDd0lq3UrjMbfdood7PCHtHG+ncLuRJwq4hnIDHWSNRZ8BwLTTrKL0itYfELHH
         ImKkAKqp7IlzBh4QwRhFzE0yIRSmeBXGsYP7Rn4HxhzVMzWGn28l2Tyf6kueZ5gpruo5
         rY4E2NM1C2zK3QjzSpjAcl8IJcXYfLFrafOBaxalYb04rgWsUpAcaYDDOJTIUBOuqq5h
         qw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737248098; x=1737852898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPVy2TZ7nxNOnPzYmR2/3BBjXksk2FPEQABRuEps/hI=;
        b=CgS65FHszvfAcbbfFGkEkQoVxROQB62dGiLzitRkvZ7t+ab8sZtxqy191P35SCvosr
         +mIqdAwh8P+/rNME0swyDBAuer62TPAxAzU1Ym31f/kP/Hu1NlWffa58lEcEgDUWJhRk
         aEhx6HOWlPqNQg7gfloGBqV9JHlxMAubella+Ja7qGnvcQtAtZWeyaErnNw8N7VZI+dt
         kWy+D/Xy6KJkNNwzttWFBnXzqvblcQBlmHTLcAsZAY1u7fIekamH8tXEDKo+iB2Ar6+p
         bGDjeSzeBgzROEjZlJVyo5nomUDhpCK8zk1mMovUOTV3hQHdyjgLmOPgxRZSoCt0lP0p
         2ySg==
X-Gm-Message-State: AOJu0YxEpKTYZV7fwozKQnIb+RmGloP3T+6FMUBtDDNUAP/ppgglARKS
	+DyUOTiFeRbQnJOBSS1TCERtJ6wRzKGTcinP6QFA5PfgymeTjV4fqONyCWg2aOteJFJ59aKUhCa
	d5rY=
X-Gm-Gg: ASbGnctbWVJsX1OnCcPdQ38z+Vb2aU0mAfgxZRQH1s/snqnXYzsgFpwPzaAFuM5Chib
	0VsN4cq0oD/CnFFPTmiztiYnKda2fOuVuXoxxDFxi4xzppkaq1Z+xkBz3cgXnHk+BKXR6G4vB6y
	BOW8DVQv5JhTfJTKCv+N4OU5FXZOLxWQgBw+d+L5h/Ue8hKSa6pxfAGhMaLzcji2nP47osYAo7J
	mjuOrG07FO8WROOqIWtKCIBPJRIqitC6DxLul7vA7Te07NwXNCK+kiQAu4POF7OKOdF8k5E0+yC
	UmQ=
X-Google-Smtp-Source: AGHT+IGtOaL5Zt6V5dTGsVlWfUStNwZWdqma2iCttMpY56KqQ7XHBLD+8DWgwoEHOAJDPekrodr5Eg==
X-Received: by 2002:adf:fec5:0:b0:38a:88d0:18d6 with SMTP id ffacd0b85a97d-38bf58e8fa8mr4691530f8f.42.1737248097750;
        Sat, 18 Jan 2025 16:54:57 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aa40sm6339241f8f.45.2025.01.18.16.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 16:54:56 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 0/4] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Sun, 19 Jan 2025 00:54:52 +0000
Message-Id: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxNjGcC/53NwUrEMBDG8VdZcnZkZppJqiffQzykmXQ3oK0kt
 VSWvrvZBRHxtB6/gfn9z6amklM1j4ezKWnNNc9TG/buYOIpTMcEWds2jGyJ6AEGC695+thgSts
 CbIEIqAddaoaNUo+ECDG81Qo9B9f5zil6Ng18L2nM2zX2/NL2KddlLp/X9kqX678yKwGCWPSiX
 kYn9ql9hjLfz+VoLp2Vf2xmf5PNzUY3qkrwKsPwx+6+bWlvfJPdNTsOzqmIMsb4y973/QuC+Ft
 InQEAAA==
X-Change-ID: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-33ea6

v4:
- Applies RB from Konrad
- Adds the second CCI I2C bus to CCI commit log description.
  I previously considered leaving out the always on pins but, decided
  to include them in the end and forgot to align the commit log.
- Alphabetises the camcc.h included in the dtsi. - Vlad
- Link to v3: https://lore.kernel.org/r/20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org

v3:
- Fixes ordering of headers in dtsi - Vlad
- Changes camcc to always on - Vlad
- Applies RB as indicated - Krzysztof, Konrad
- Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org

v2:

I've gone through each comment and implemented each suggestion since IMO
they were all good/correct comments.

Detail:

- Moves x1e80100 camcc to its own yaml - Krzysztof
- csid_wrapper comes first because it is the most relevant
  register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
- Fixes missing commit log - Krz
- Updates to latest format established @ sc7280 - bod
- Includes CSID lite which I forgot to add @ v1 - Konrad, bod
- Replaces static ICC parameters with defines - Konrad
- Drops newlines between x and x-name - Konrad
- Drops redundant iommu extents - Konrad
- Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
  Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
- Interrupt EDGE_RISING - Vladimir
- Implements suggested regulator names pending refactor to PHY API - Vladimir
- Drop slow_ahb_src clock - Vladimir

Link to v1:
https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org

Working tree:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3

v1:

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (4):
      dt-bindings: media: Add qcom,x1e80100-camss
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition

 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 351 ++++++++++++++++++++
 2 files changed, 718 insertions(+)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


