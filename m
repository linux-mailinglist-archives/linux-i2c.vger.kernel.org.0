Return-Path: <linux-i2c+bounces-7104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF198B222
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 04:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9131C1F21A85
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 02:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F052CCAA;
	Tue,  1 Oct 2024 02:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LG3ezPRq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A5EFC08;
	Tue,  1 Oct 2024 02:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750191; cv=none; b=tSd0+igOh9sUtb5a0MrXC6fJwnFT5wD0UqaIz1eZDqmxVLd8gPQhlsGnSyU2Vv3WVfqi5q8+AT6MyoDFqB+QUyHUNVWoQaDbp/573vzcH161UNslnAv4Nh+DFLb3xU4u1vCG4f9NFXFmgR1NTEZDDedqJ8c/6z7FXSsYQLZY+H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750191; c=relaxed/simple;
	bh=AXJC0H+UsRse+932wT8U4PWiSnezLCwlCGRsDaCdmso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCpcNhN99tMi1Et/Xto1XgVq1gqCbC+Xtrbxh+rrT+UYv/trspGHD1XiU2PX7bB9ptDh6PLssvLzKhnLUMH0wej5AdJSBPPA99UszH3msP8xlZXjsQObjdEEcUXm+Wj/duirR87oGvqqofvgLuVDcBJZ2OiOlzargQyY/XTQhS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LG3ezPRq; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb4f1137a8so17455776d6.2;
        Mon, 30 Sep 2024 19:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727750189; x=1728354989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lPG9q5l19vwEBXwpbDlrZx88+QoCty36iyTE1Wr6eRQ=;
        b=LG3ezPRqrvmpZEDFABuXvpUMQyqCtnWkkV9kU6b/SGfP3TP0lkdmhkX6z3+tRdXrEv
         R/i+a2R1/5SEdcXEkEMrhpgqTp1LjR3mpcJH36yv0DVqZ9WKASugeLCJsx/WzWzMdle+
         fWwA2W6gOuJGfVOnHn8jXU/8+Si4H/TE6b1PFV7lOEYh/NOX9AuN+idsn1BidpnTkdZW
         GYl0S+q6AieHfgrYI05QxJ+ze1wqDrA1AQg/O6YAFhabOcyW36AwlRInzZo42Y+v031S
         T7Vlic3pVbB5zyjkZhIkbOh1wJE8qeasBoLxoP639tC117kmTM1j0dg6VMSIWwwmldts
         9YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727750189; x=1728354989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPG9q5l19vwEBXwpbDlrZx88+QoCty36iyTE1Wr6eRQ=;
        b=DL7rDQji3NSBsNnDrRmh5AzKgaAloGURQGib7P1xRZswo/YDoB6I/tPBhTvPOqeQOB
         cMCCUL9MUluh4As38nBUnYScccQ8b2BfBSg/PvGK+bTwQRzKEsq46X/f9I7opTPo/q0e
         RXwJ3uLP4QzM77nsO5urjzj3CZWMkK4AKnhhg+SVIFz9jYolPCPkfKO9GRKJb8ayFKh4
         D7KAXMxp+Fki0VOWUx+KaYvXo2wU/Jz4usfGZLiczA/HbR3RkWHxwM5D4FfYYXOVSDcI
         l+l/sXIXoPKwZ03NCZFInE7FI0v7hZwmhmET0EvGwvUtArfv/m79HTordGITJ7+LLHb5
         cXZw==
X-Forwarded-Encrypted: i=1; AJvYcCULBjnF1/NUtHoqSbhcQrP9kYfaQEBHoey3Nwm+oLZr5MWv0Pe6zkI17zP8OhDAbiX/de8APT2/FEstFn+Ewg==@vger.kernel.org, AJvYcCUotURdxX7llm8wMrqjnQumTLNjWdSRRxitNlhyebo1Egd8zs6/vfL4+QIZXaUtkeKNPF8XuyrKkw/8@vger.kernel.org, AJvYcCV1S9OoY8fbX1ldYdm4BxV1e2mRHhEvZtSkyRhK1YHypPiHjQdbez46M/btH/p6s33Dhd4swOh8M/K7@vger.kernel.org, AJvYcCVfEyIZm0P24frJ6mmnk6yQCf2VDlg5L5fflLXjfrJnEH9VkyCI8IcOVpFg2kt2Nw2rChHCxToiLpNA@vger.kernel.org, AJvYcCWSmj2sSJGyIEmO6n1TZzqnaiIGbaHlKOZJ+9CscF7AXaeSNIyxoBL+tiRxE9mgGaOYAXnxedXpkZyi9kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwelI5NhIUfmE5CxxPbcgRR6d9OefAjxUkISQ/3nCL/7VsQwaaE
	1QwSjRzb6UISf67qNetxgZRsqzwK2KHyurh64RF+eb1DOpI6pKlR
X-Google-Smtp-Source: AGHT+IEMvPdRU/92CB4wfyoxRZxEPorM6DB81gE9iF2LUxzQ9WPXYkhPsOwaNzh1NdNhahEm5pTNMw==
X-Received: by 2002:a05:6214:87:b0:6cb:386e:244a with SMTP id 6a1803df08f44-6cb3b644015mr206851346d6.39.1727750188762;
        Mon, 30 Sep 2024 19:36:28 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::1a17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff171sm45441186d6.1.2024.09.30.19.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 19:36:28 -0700 (PDT)
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
Subject: [PATCH v5 0/7] Add SDM670 camera subsystem
Date: Mon, 30 Sep 2024 22:35:21 -0400
Message-ID: <20241001023520.547271-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

As of next-20240930, the bugs with camss have been resolved. The
dt-bindings were tested on v6.10 with:

    make O=.output ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=clock/qcom,sdm845-camcc.yaml
    make O=.output ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml
    make O=.output ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=media/qcom,sdm670-camss.yaml

Changes since v4 (20240904020448.52035-9-mailingradian@gmail.com):
- change camss interrupts to rising edge in dts (7/7)
- change IRQs to rising edge in camss dt-bindings example (4/7)
- move gcc and ahb clocks in camss dt-bindings example (4/7)
- add reviewed-by for camcc dt-bindings patch (1/7)

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
2.46.2


