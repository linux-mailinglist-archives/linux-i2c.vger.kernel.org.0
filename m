Return-Path: <linux-i2c+bounces-11718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 140A6AEF308
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 11:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D733A2BFF
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 09:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD95A260585;
	Tue,  1 Jul 2025 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVp7/pJK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DFB25D212
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361465; cv=none; b=jTSNeSJCXq9cvdLupQtmBbkYQM1/s0sJdJLzgu6M68kbOOSGupqMjXuDnUyNh0oMCFLL7LOkGx23u9oKyaPmKLXVW1uLs/zhYlhLDuMoaBNws0s38rooNkMDDeePxvnnJQz3dN+KxSdtSol7ObGo9xH7Mq4fPJoLUORaFsIiUqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361465; c=relaxed/simple;
	bh=6U36zINUzmOxNBffIUjvcjKv9EITUO4o89Le3auZYIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tKkElawBIQjWX1szueRop5Mi+d3P2x5Dz0UD1HmX1/OKZucW3quInkYBy60Nddkkw2SMTgCRxH2whEBjSLt86EORYgqVEWfmk++e5v1bqNJJe6E2tZppWO1Y7CsBAnaUq3H+FmUHepJeF7khf2z6fBKf0dvuSKhNrgExHPOBD2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVp7/pJK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so2631600f8f.2
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361462; x=1751966262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qONQUtWdCk5Z5EGIxTW/habYUKP2LgiBrpl9cN24tO4=;
        b=lVp7/pJKgcu+Yr8Q6s/LwoUp9kS73C3ZCZZEemNV+O7OPi8leNWElTYDFmhwvutUkv
         CDy5UVJR+XvieJoZ7yzeXBeaMmZOkN+lMFnfiJtv3v7wyArzXb6QqAlOJCxx1KBn5Kvr
         pZE0bG3VpfzmuXRN+Rp9RUEciFu7Wq4m3A1Tjt3UfvEcbCIvBzXnDc9fPu2h9ukrepQ5
         LLMecE71Ui1plYsoj7ecEfbYD71PVi4yvnAW68tcPKvqNTPc3QdC70QKHiLvL+EiuT5H
         Txd0/cGymEI+nTlsZk1r0hSXt/nhyMiPrX3CitNsOLGMCc/AmzOgq1MuRF7wD7CJNhyM
         zd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361462; x=1751966262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qONQUtWdCk5Z5EGIxTW/habYUKP2LgiBrpl9cN24tO4=;
        b=PGB4UTouwqqa7YG8znCU1SVyYM9sajOJroJG12FZthzSLN2mMBUqeouRaTeXsowWGH
         FVG+2Hlut5Xzjl4dPlPGUewj3zY8Dzoc4CXuQbDb40GMO538L0fCBpuBYUgma72Lrob5
         +JMTypZt97BH1omt+UgWr2jzZWSDHYaZaK5qE56mNf2SA+l/tdPFfQblkSszimU80N1C
         moztoalu7DyN9HRLb+ARKFMePzB22Ox6ly3qx8KIXdBmOT1PHG4wqoEw0xEtIokf5gvt
         idnJnMfOOc2+Qoa8CoTsmZ8xlsEzZNn8QNSTWtZWabMLAUcO2QYJW/YJMgeQ6a7+/5Ww
         yc+A==
X-Gm-Message-State: AOJu0YwThBXZTR45S+Lg9NWM+MBAB8p7eGWvbMRSZZjaRXyx5EcTkkYS
	ZIoCEH+KbKhin2Yv6fhRm2WFZ6YlEx7LPVd2oA/RJQ8euYwBjShLYh6iy2TqXQ==
X-Gm-Gg: ASbGncuZBQnlEqXpnlNOeiSJFgAvYmfY3ME/WiOqwzmprU0pKgfQg5p+XmBYBSIB9Ae
	YGZDd3XF73OESP+A9I6ummidSU/Ago0k4Iy3P2n/HcWlPIpxH4nHuCPfoFtP9MZA9z1mZBUfw1W
	kh1O12nQAiseVcfNwYWJPrzU64vVb+R47VDnTnO5IglhgdciDSU9nHNNbaLYlpiOH5zTW7V7dWW
	7shFySGnvK3bVo/nf9WOAHcgT5vvW0K+vvtpSxIWSTCs8gDCXzl2labBaFrq1lpBrDLQ6HYbBNR
	dlmgbQGYxUSpz71EWAvPe4XGgfbVYmuLgyJXDQA+w0R6XPqrgyFn+fsZg9tEMsI6nX6jtvtn35N
	6DROTsNooRIFaS2ZAjSpwXoDvMbk=
X-Google-Smtp-Source: AGHT+IFKd97xfBLI3Au52q5dKAKyVfScswz5PK2CqswNQ2Sgj5UIyMe0vXNRXBMtFdBncMeKmXqmUQ==
X-Received: by 2002:a5d:64e3:0:b0:3a4:f52f:d4a3 with SMTP id ffacd0b85a97d-3a8fed705ffmr15933232f8f.28.1751361461720;
        Tue, 01 Jul 2025 02:17:41 -0700 (PDT)
Received: from builder.. (253-8-142-46.pool.kielnet.net. [46.142.8.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5979dsm12624379f8f.75.2025.07.01.02.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:17:41 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH 0/3] i2c: rework and extend RTL9300 I2C driver
Date: Tue,  1 Jul 2025 09:17:34 +0000
Message-ID: <20250701091737.3430-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series reworks the current implementation of the driver for
I2C controller integrated into RTL9300 SoCs to simplify support
extension, and adds support for the RTL9310 series.
Goal of this is to have RTL9310 support upstream in a proper
implementation to be able to drop downstream versions of this driver.

The first commit reworks the driver to use more of the regmap API.
Instead of using macros, all registers are defined as reg_field and most
operations on these registers are performed using regmap_field and the
corresponding API. This allows to add support for further chips quite
easily by providing the correct registers and driver data. Moreover, it
avoids to add new macros and a lot of chip-specific function for every
additional chip support.

The second commit makes use of this by adding support for the RTL9310
series, providing the slightly different register layout and a few
specifics. This also introduces a new device tree property 'scl-num' to
explicitly specify the hardware instance in the device tree. This is
needed because RTL9310 does SCL selection/activation in a global
register. In contrast, on RTL9300 this is done in a master-specific
register and thus is already handled by the reg_base of the controller.
At this point I'm still open to any suggestions if and how this could be
done better to avoid a new dt property.
Both has been tested successfully on RTL9302B-based Zyxel XGS1210-12
and RTL9313-based Netgear MS510TXM.

The third commit adds proper documentation to the device tree bindings
for the RTL9310 support.

Compile-tested with Linux, run-tested as backport in OpenWrt on the
aforementioned devices.

In case I messed something up, please give a hint and I'll fix it.

Jonas Jelonek (3):
  i2c: rework RTL9300 I2C controller driver
  i2c: add RTL9310 support to RTL9300 I2C controller driver
  dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  33 ++-
 drivers/i2c/busses/i2c-rtl9300.c              | 227 +++++++++++++-----
 2 files changed, 190 insertions(+), 70 deletions(-)

-- 
2.48.1


