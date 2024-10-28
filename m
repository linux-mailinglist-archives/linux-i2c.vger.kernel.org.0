Return-Path: <linux-i2c+bounces-7610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309409B2441
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9739281767
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 05:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8EE18C93D;
	Mon, 28 Oct 2024 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msouiy7c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98640170A14;
	Mon, 28 Oct 2024 05:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093555; cv=none; b=qrvzLh5GDO0hg5qlk27cUwXwpaHmnJ1o9WPCkhc7cDDgD4RSmAgInzJIilMT8fdY7WZR6v16WUKnk5jAdUaV4Rm9U+DqoNVWl4ZVxUKPJcMQ0odPACZrtHCpYnkpDo6VB7Gd2rjOm5rN30jAVvcuinlDFuVYI9CJ5jcHO6/hSBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093555; c=relaxed/simple;
	bh=fDCPI3lenANlkSNM58eRToLtbXivAj9PpBU1pNoEn1k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sBSWLIkqnXu8Q/MYPr62MwSqLn5NwiAeWWnSaN8VneRUpysUbrKrHKhvbHIG/OBE8XwnSRburTh/cxNFqUlCQQ6gSXec5QEfUDsLLgxfhj1A1/3eo1qK8cJF8eaReyHKfCBvy1aBYPaHehnCztYr9aV+xJ/AG1MB6P3eqp68esg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msouiy7c; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20c803787abso29810785ad.0;
        Sun, 27 Oct 2024 22:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730093553; x=1730698353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OE9ZF53+aq50EW6IBKp07AsaB1tUWgDq0HfrchrCLw=;
        b=msouiy7ckeqHnsSbGhtabZd5/7loW79dh4PKpU54Rbkfo0PlC4BfOs4TWW8C7ZEAV3
         abQJcbZlUEf6JDxMfqWVzCFu4d8q8qcGVE06x3ik/hfnzwB+Rla7V0jl+Bjdy42zUQz9
         gqlN86RdahOJfn/rsRXuPHFRE0Z5lysEGhWs5DnLMgE6hvd5mlBaJat7d/LdWbEe2gt2
         RotC7brotSJCFXrbzsbqbPx0PKJzpmC+wTm0BUaIZG2PEkU7idS5wYnVx8fHIj6zGkiW
         QiZGmdr5cC2CyAkuRnDh5yUPrZEOarMWHRBTqcUYFwBCPBDUBBE+rMpfxrrAaYsygX8o
         r9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730093553; x=1730698353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OE9ZF53+aq50EW6IBKp07AsaB1tUWgDq0HfrchrCLw=;
        b=O2VO0hwQAAN68RwwvjbBFLX90+JEFUKB+RzEgG7fOoFFbEc0GLtYsfuN4s/axZG1De
         ZaHLuSMsUknKD8wpFgQndOKqEjP/gHBPnn7w+qUX1FT9XT88+uPS+vC+ZLhigE34DiGD
         s9gMLoq920sE6gbyAdWhoK7yMQK/qEL0HSFBrrbyGngK/2QJ6W+lB/687lW2HLm4YJ25
         yV1ioglQWUQgizXNOO9nNDlCplYhYNjL9N6GR90pwewPFW+XjSN0dPoKcveDhBBsFvCt
         XUDZ01w/4xfwsrd+QS0acR9v2T5Eki+tQKSAU0Hv9sh0GBiWFSNYvBZ+gDMltjDhaFcW
         N4qw==
X-Forwarded-Encrypted: i=1; AJvYcCU63GdbLzzx0s5IVrAryjBC0mWlC+0uMNvGeyVMEfNiQeM7vfuMu6lgX9PuVquooHJl4rVCJEau6Hpx@vger.kernel.org, AJvYcCVB2hztsWxhj/pg5fM0wLibKLPuQ8r2wSCZHnhTlS2oiT2GesRoyW2nhSF6AbcdtmIYuxEctA/+69SUUGhd@vger.kernel.org, AJvYcCWHroG8nivI3zxR19xbWgSPaGU/gYrvqljHBqb4nLKeeADrHX0f5iYDnGGz3Y4iI47Z7FgM+wUzNEsf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OsOEnQtQSu0XS1UumeILL1CBW9i+3l01U8Hf6YZEAiBMppAo
	5pyD8KtjWfklsQUcvDwf6g42j6Gmiu0O5DPsa0Eh1cSgvRz1weIq
X-Google-Smtp-Source: AGHT+IFOFxvoqutIEMDhLNVuDtQXabCz+PG2NaPsZlB4GWGiMQRlAcO6dUor3vgwVIJJgTxeFwwkwA==
X-Received: by 2002:a17:902:ecc8:b0:20c:cb6b:3631 with SMTP id d9443c01a7336-210c5a76dabmr99486745ad.27.1730093552881;
        Sun, 27 Oct 2024 22:32:32 -0700 (PDT)
Received: from troy-WUJIE14-PRO.tailc1d423.ts.net ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e941sm43216475ad.204.2024.10.27.22.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 22:32:32 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC 
Date: Mon, 28 Oct 2024 13:32:18 +0800
Message-Id: <20241028053220.346283-1-TroyMitchell988@gmail.com>
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

 .../bindings/i2c/spacemit,k1-i2c.yaml         |  51 ++
 drivers/i2c/busses/Kconfig                    |  18 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-k1.c                   | 658 ++++++++++++++++++
 4 files changed, 728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-k1.c

-- 
2.34.1


