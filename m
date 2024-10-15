Return-Path: <linux-i2c+bounces-7375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3236299DFB0
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 09:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55E191C2188F
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 07:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B936A189BBF;
	Tue, 15 Oct 2024 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPo3L3NX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60EF18A6D9;
	Tue, 15 Oct 2024 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728978708; cv=none; b=V5pfn9sV225QbTBOjTlk/ht5H0225ohp4ljeFsbJ5GkqdrkOEO1048rWhWG72n1LN14XgXY6X1WXTqqXo0E4lDVbvdxUBUiPNQvTXdrv2ccS22nLaa+D9f4eXSnEfkK/A+ls6IVfII40ZZdKAEsCVVE+0Pu4SNFXLHOSvKaEGEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728978708; c=relaxed/simple;
	bh=UGy26oTofZng2iRmtk5mTp4yZzb7IwxW7zuLdtTGU6A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MAuZ61K32fbIBthh7yzXOF5MZflF1NT2PsEx1JXbcyiSHYzk/0sqc0DtFTAu6uv44mmZnoFROTf7ZPVQe7XJcPI3ndJT8+kS9lgzg4BDYav03d4dTC/oIQcmwjGMNMRNkbZodGhCzVJHzISS/WVRs55p0WmEtdmLNbAmKP6WWLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPo3L3NX; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-7c3e1081804so2779052a12.3;
        Tue, 15 Oct 2024 00:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728978706; x=1729583506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bF8z7RJ9DDzAYcQDHh+gYpQBt3nvE2l3nE7uniidAVQ=;
        b=SPo3L3NX7Inn2kpcdJeRp2nCIVoy2smhnyklFOueOzJm59qkAkhq+pKyjtGGsKpVhY
         jPCZhdmfPZ2ToGCnA7KCShOK+/KOJaHN1+ThxtNZ9z97NiKaIXmp/nQhLKHzxQyxdoAd
         2IR7Q4yQR0etYImfWOpFZS0Wk7po5p37MJtWI/vdhKd1Ca/sYusFSFU8pZSCoswANb4N
         c/VpRaCW6FaA8QRfBrzUumoouNpVlB40qAUdbqOtQcGisVcB98nDRK2TA98Yl2fAcPOP
         dLFxBa53pEokmQnLN1MOHvgYvA3IzZ23PUCk1tXoL4pbZnaaWoDKYv2WiJOB0C9aBeMC
         p58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978706; x=1729583506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bF8z7RJ9DDzAYcQDHh+gYpQBt3nvE2l3nE7uniidAVQ=;
        b=N+vJhDdhHdIi7azVoyHTFEhGmULSth/SmbtDqZ1YcfFpms58vW8XAHCIFDQlCOjeQC
         VP3BE54UhykiNly797+9+Ih8FrEF+GK66UvyeHKV1DdRNcM4n2+ASd2ER3Vx7wwa+UJZ
         Vl0vjBrjXWJDST+8t4/6zLhxRqUNQxho7g8o66xXyaAPWzkHfOthYnuG+1ojOjL3KZep
         FP9wKgW9omPyfQSyEOeAUI5mCgu0FLszeBehVsqLoiITUb1GBUx7+R3P08r6X+lUzgvR
         FLr0f+1czU0qDUeJbZMt43+QJiew2cS0ZgFbr7oMA66ysxJiope8ktzi/ADTC+TUYnw6
         BSpg==
X-Forwarded-Encrypted: i=1; AJvYcCU7faXW3NQ5mb7lKqdTaDNxFBkVXRRroMY9woyxhvtAoUgBA2UtvW3kZjymxGuy7ReNZO2XNYLNE8Bm@vger.kernel.org, AJvYcCV2YbRoMYvkMAZuDvwa0hi21pJgs6LVZ1iXNAZjhUU/+wn3hmLNjla+j5GJsOwxHqSLZt0lYKz6zHdyDePQ@vger.kernel.org, AJvYcCWcnsFDNQK9Q+fJurgt7Fmuaoo1Ju6elET1TK7vkwzXbRKb2vpoCsMNgEH3lAMnYjCJooMtNfaaSQn5@vger.kernel.org
X-Gm-Message-State: AOJu0YwUR05y7FNhcleB0z2jwkRrFPk+0H96H6DlA4ZUUwfrw0YRBuxl
	JC6v1VbQfsRw0bThyknAhhWRUv/MPt4x18EsKZjwyMmBydsQvwZB
X-Google-Smtp-Source: AGHT+IG2dnnt5Qf1zqBrq7aTYO6JcJ5SEp+oR5pygtXgcFP7zKkdKOgI7YiOmolcjSw5P2Rg8rMBmw==
X-Received: by 2002:a05:6a21:505:b0:1ce:d9a2:66ed with SMTP id adf61e73a8af0-1d8bcfc393amr21038428637.48.1728978706058;
        Tue, 15 Oct 2024 00:51:46 -0700 (PDT)
Received: from troy-WUJIE14-PRO.. ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774a4243sm682134b3a.131.2024.10.15.00.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 00:51:45 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Tue, 15 Oct 2024 15:51:32 +0800
Message-Id: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch implements I2C driver for the SpacemiT K1 SoC,
providing basic support for I2C read/write communication which
compatible with standard I2C bus specifications.

In this version, the driver defaults to use fast-speed-mode and
interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.

The docs of I2C can be found here, in chapter 16.1 I2C [1]

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]

Troy Mitchell (2):
  dt-bindings: i2c: spacemit: add support for K1 SoC
  i2c: spacemit: add support for SpacemiT K1 SoC

 .../bindings/i2c/spacemit,k1-i2c.yaml         |  59 ++
 drivers/i2c/busses/Kconfig                    |  18 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-k1.c                   | 694 ++++++++++++++++++
 4 files changed, 772 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-k1.c

-- 
2.34.1


