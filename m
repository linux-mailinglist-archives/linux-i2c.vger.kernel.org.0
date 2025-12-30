Return-Path: <linux-i2c+bounces-14880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F8CE9EF6
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 15:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 093EB302AE04
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 14:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81027274B44;
	Tue, 30 Dec 2025 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSOZa8y+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67CE23C4F4
	for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767104984; cv=none; b=a6QEqo9kRUXpTK0zpc3ihx9+nABpOWBuwLh/GWt9EHqljefRbO8tyRhYS9h6qwLUPyNH0+80XGJWfV1Ck3K1GeHwbbjMKzvojnIT3Axxs90P5N1m/Ygk+6o/khAXlYJfm2d9vIlNMlQnrX+ZLt+vnrrX3DzaQ5BMjjG2rXu4lOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767104984; c=relaxed/simple;
	bh=a1J69aM75aks5NKEgsk6GGcoN5bgwi6MKrm7NlrTPLc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qW9f6wRB/DvC3K0J/EJD39t3ASm+PP2yZgUfSdAoiZ7LZ/8cNBKdkDLOj74R0zdyzxJLSR7TWZS+MjX/4h4x5uZ8pRN/7oy8ole6MbURWd7ikwWEFs5GNpWZAI9sqYAfOEl4o5za/WtEPMJU7e7Wv8nduwqLmEsPvtwenaD/Szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSOZa8y+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0b4320665so152952495ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104981; x=1767709781; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxCXRDx0w1yWm9FY0vwmJNFDCxUNTSO4kUQ4eb5iubM=;
        b=WSOZa8y+F91K+5UPoDZTU4L497GHK5BOsFbUb8eEiCOXexUIPLva4JdIAE+SsK9xT/
         S2NiV8ivFM8vH2km7NqAAwlaJDDPJulF+NBJlrMdKTSmGXkieydv4Makv3lv+Uorq1v2
         Oh3qD0Ic2Ohp716PJ0/xna2akt9PaxPCFskB5w+TsKwrktjP6D2zgItUTbL7Yz//OOaB
         aHO2GPObIzWfWWVCt8PRugUUiOKjESlIK1ddxRLI4XmYocjFF2d8BVTbaf5nhwso//dV
         EJJ6bjfmTGmzQLO4VtmuO5IsuJsuyXnrQd8wv9QJFAWt4NtqMoomYPtcT1FRM3wGrtaS
         aSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104981; x=1767709781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxCXRDx0w1yWm9FY0vwmJNFDCxUNTSO4kUQ4eb5iubM=;
        b=fiJJFeyvT4ODPgruNXKbkiLeznj2I4267NZll6lPp0YCut2FuPK8sJN0vKoOAPs5dM
         ns4ogVMu0lC9DwwQ43CSDnO0gYFJGAvrSPMfR8cpGmAec1xtTEroKYz9X90zDEDeJjhi
         O9Bpx8LlH2zM4O96YCYWQmnnKhoFsBi/b83xPWsw3JUbfivxthX0rSkbqc6ZGi6KBHIU
         usnOQ0LSBm/aMFDZNWR4UtYgiYBRblDq1oMZFLyt3/gi2V7Mw3Zw2VXZ8/a+dtoKgKQj
         hzN3dmbYnEmX0tdWP2lUfb+NoIj29RquEc8GJmDM+1gUPY9WOaTsUxd9Zx0IFdfXGoFP
         ZB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQQlKnghcsxgav7Vkr2ZyvERH9QWLhaRN3WEkLw82Ku2zMLWTh8GB+935aqMQZVFn9pY4r+zRLEHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6I8VagvZ52r5UAHCLoFv/Ge/eTujUmqCyD9eXv/Nql6gblxxM
	/+ypewqRpYA+ZCkJhS5aNBIQORhL8nIocNdyqahrgU15t63fa3FQ3elg
X-Gm-Gg: AY/fxX56AhxG4apxUbB4DJog1hVBC/0qXC3Mfxwr0cx1blFWO0vOH8OWgJKPQmOBAj8
	oRF2wTvb8TNd5qVZb5OHNYpm6VyFqahaG6/wAw1LWyIY6f0uH+tApGj8ZnEkw5SCTXnIMVCZi3+
	EHMQRxlTfyCHGqU7nrt1Fl2Oz9hl/J+uU3fIHmi0Wysy4hHQKCzMrQ8+MQgo1ODYq5D3qEnXnQW
	ZYlPjfd+JrQGv3IJxJLFC6jyoCFIJ6UB/4/W19+ncVefF80/x+Vw2sKbffiN5Wko8/N2UKgpkQB
	CXkfYj4dvQC9IvobJIbjkI3kb1MMXt5VV1Gcl2LW0R9JlfB6diW9GXLmhWkIEEA8csItlq9XnRo
	Bbc5Kp8253crZ+KDLlzl/m3mSNy2Rib5GqIBP/Rci6AQVwlgYgnj1XygFtB5RE+IhypweGgF+Al
	M2eta3Bo4MJtErlI4=
X-Google-Smtp-Source: AGHT+IEuziUm5FuVFOLapyO93nCQfCb40IgI2Or9ENPDmWDsqW88deWU184+w+hKs3Tyi+48xUtmng==
X-Received: by 2002:a17:902:f607:b0:2a1:4c31:335 with SMTP id d9443c01a7336-2a2f2717b88mr314299295ad.26.1767104980514;
        Tue, 30 Dec 2025 06:29:40 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm298183155ad.8.2025.12.30.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:40 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH v3 0/3] i2c: spacemit: add reset support
Date: Tue, 30 Dec 2025 22:29:01 +0800
Message-Id: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK3hU2kC/03MywrCMBCF4Vcps3Ykmai1rnwP6SImYztgLyQlK
 CXvbiwILv/D4VshchCOcKlWCJwkyjSWMLsKXG/HjlF8aSBFR036jEIOA0de0NZ31qYhbTxD+c+
 BH/LarFtbupe4TOG90Ym+609p/pREqNB6UtqeFHF9uHaDlefeTQO0OecPQOy0fKIAAAA=
X-Change-ID: 20251218-i2c-reset-a7be139213de
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767104943; l=1371;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=a1J69aM75aks5NKEgsk6GGcoN5bgwi6MKrm7NlrTPLc=;
 b=18EDF1Yo3gil3UtsnPjnP04wMrhNkhNbTfRqJtMQTnJdkoA05tCeC3CideDM+jpKg5I8J2niZ
 Bu9piLwlLabC0cfTZuCfH/4VcODZZNdWNjER3S6w/QX91MM1paamAdS
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add reset support for the K1 I2C driver. A reset ensures that the
controller starts in a clean and known state.

Reset ensures that the I2C hardware is in a clean state. We cannot assume
that no program used I2C before the kernel booted.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Changes in v3:
- Move reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v2: https://lore.kernel.org/r/20251219-i2c-reset-v2-0-ad201a602e74@gmail.com

Changes in v2:
- Replace reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v1: https://lore.kernel.org/r/20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com

---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       | 8 ++++++++
 drivers/i2c/busses/i2c-k1.c                                | 7 +++++++
 3 files changed, 18 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-i2c-reset-a7be139213de

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>


