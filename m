Return-Path: <linux-i2c+bounces-3281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B544F8B4FDD
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 05:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606B81F20F5E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 03:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF1A8F6A;
	Mon, 29 Apr 2024 03:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIG9nt5j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF9B6FD0;
	Mon, 29 Apr 2024 03:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714361923; cv=none; b=GE40fPyx6W0pfgsBRfvxajr1kZsGwFSclenBsNGxEFjuk0mtM70Lyq1aeU61C+mzLEYxvVD/3JMkgqaR9KTQ2OQffaACwqTCKTvs6B0sL4aA7Id0sHSRlph5Fw8HTtCquxUgSg3CtgiMecaYaE9+Chyy54JpFagrR49+fRIIChc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714361923; c=relaxed/simple;
	bh=ZAmjTwF6yoXFTOYFHK88jkBnSke3Kk/EgHpHSH5a2pA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=hjjpbFN+IDRLuBAO044xyaXtbMwpHv09IDoOalHmdEyP6bm8WdRHGfNzmfQ8Q9ewjhs3siNFGsE1a0Uw4RyRRzUloDPEH3+nCDhHV07YI4kI5PXr9mMAgM/FB3y9+gUUiOBwWXUNdJkvqWVygtlpsugA+QrOSF0xqFDPWXuOF2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIG9nt5j; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c8644aa3feso528729b6e.1;
        Sun, 28 Apr 2024 20:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714361921; x=1714966721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5F3XqO3gwYBh+qZ32WvAihH+srGMf65nvhU1ICDwCnA=;
        b=HIG9nt5jo7hatuVQyPP0GBby2Xcq1xHxsjTUHJYI1Q5Mz1z3nHsxKNDJTNAGqITGQ2
         UwR2GNRrjqIm9q5WII6tBgpXl6cxofUN9gGb6xRzvTk/svgiUa4ml7BzL21hzEZcin6S
         5p5swS9D1nTxYxAWzT7tj6wvbQwuUjW0FtH9sulWd0bDVyhedCLrjNXzfMxAnlLuNc7b
         LaKR+zUMklggZDYdIuUvPvqlhHFyKbcwHdbYvx9lnobzadSW/+N7DIk5OkUGXNB6g8H+
         2tCuMYmtRQyoNYEESyR/iGZgSZQu987OLr+06aspAa9HQ3lK2TGalHz+WOYzxUJk7S4g
         G2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361921; x=1714966721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5F3XqO3gwYBh+qZ32WvAihH+srGMf65nvhU1ICDwCnA=;
        b=Hvan0KpdFIHiCX6dmagm2OHV+3qlXlQ369EDymB5vw8Q2Aya9kk5mMCY8G+ULdG0xF
         USY7mqdJHF/yKWCLP0t7j0SnKH1IveVtoLHEPP2Gli0sPHJodupSO3uqfucqOGmXETnh
         bLgmzYP4lWtDQQGGCHAi6nhdWCJnwJzOEtmXT77mDPvuY1CXdDJVRr5NlvjYftSrF0bq
         Wow0FhsnsCOBxV/D1FEQmeiMWsN2mLTqXcA9SJBWOqYOwtNE+aUy7DW1tgoXv9LE0fgO
         k8myflnEk6ZqxGV/t1EGgbJjvVf3RSGBOzC3u5r2hVX5iTrYGWuEqOpitQumq6erGCHf
         /+nw==
X-Forwarded-Encrypted: i=1; AJvYcCWGg49JyY49dUwceXhr05p8m7R9NMoUzpuuY+nMP/heqDVSIpEnL585HQQ4gHJTua4dmIEVH0QFwgjKnW6M7kVy9Eknc7hroXVQ0OCmvv7W/irkjjFWUuwHOv/iddmDmivSJNydS1ZNUsQdpd78Ghf4M0m0YVVAVta2/C9WJoBqVoe0Hg+6S5bG1D0QkOrzjv64doU8nNO46y2BGwpRJnl7t+DQeH+f2pFmr7lcnLZXy1kX7bNANNWLDfj8
X-Gm-Message-State: AOJu0YxVZethibIFptAV2R6/p8gx73YGEZDLQ3DDqNJaDcL81f0qTrIQ
	tt2SvA9Yfi6lYkg/ecKHYY+HOfWRDCs6kjqKpuhU1Nr1oa+7rZBJ
X-Google-Smtp-Source: AGHT+IEVkNKGgkf0aimQWPTPkaL57Ie/RiwOj6OQsfAYQl/46vOuW21nhf1/t7015lw6T/NDsNtMtQ==
X-Received: by 2002:aca:1b13:0:b0:3c8:2bb4:2288 with SMTP id b19-20020aca1b13000000b003c82bb42288mr9621924oib.2.1714361920689;
        Sun, 28 Apr 2024 20:38:40 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e2aa-928c-7bf0-01bb-028d-772b.emome-ip6.hinet.net. [2001:b400:e2aa:928c:7bf0:1bb:28d:772b])
        by smtp.gmail.com with ESMTPSA id i28-20020a63585c000000b005d5445349edsm17835424pgm.19.2024.04.28.20.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 20:38:40 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Lukas Wunner <lukas@wunner.de>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v3 0/2] hwmon: (pmbus) Add support for Infineon XDP710
Date: Mon, 29 Apr 2024 11:38:24 +0800
Message-Id: <20240429033833.895122-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Infineon XDP710. This is a Hot-Swap Controller.

Change log:

v2 -> v3
    - Fixed Ack quotes
    - rename "microOhmRsense" to "micro_ohm_rsense" 

v1 -> v2
    - Merged patch 3 into patch 1.
    - Modified comments.
    - Fixed the microOhmRsense array.
    - Improved operational accuracy.

v1
    - Add support for xdp710 hot-swap device from Infineon vendor
---

Peter Yin (2):
  hwmon: (pmbus) Add support for Infineon XDP710
  dt-bindings: hwmon: Add infineon xdp710 driver bindings

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/xdp710.rst                |  83 +++++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp710.c                  | 132 ++++++++++++++++++
 6 files changed, 228 insertions(+)
 create mode 100644 Documentation/hwmon/xdp710.rst
 create mode 100644 drivers/hwmon/pmbus/xdp710.c

-- 
2.25.1


