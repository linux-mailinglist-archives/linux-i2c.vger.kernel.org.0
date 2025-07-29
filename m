Return-Path: <linux-i2c+bounces-12059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A752B14969
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 09:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CBDD18A09E7
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CD326B093;
	Tue, 29 Jul 2025 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUZQjMDB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CA7264A74;
	Tue, 29 Jul 2025 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753775528; cv=none; b=lyWgw7ob4eRubzqGNvdhXRAypivmcrkAp1r67hJyzutj84paufpX/XLIy2NXsleRPz9W0Qf62XO6x9QCcmUKhANfX4mItEuxHNvd8xJfDGAMVAbf1V5wfGZ0lBb/Z5ZxFTQYTu6zOWYqqPBYjgvfFW73dC+5xeBe440M+Ddw98k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753775528; c=relaxed/simple;
	bh=59yPLjV1oKDgQnAIoESOgPml+Td0lslGd/7VUkzNTaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MmNk9tsfDYo6MTBuA9lb8z8urz+d00pyAszyAArTDjBQWfN1LynzV+t5QWmeXh/xUnCxetoTOyC/aaewPyqC+0gVpwso/gESsPNWKoeRM//FcHFCEM9minwaj4hTdmwfbp1jW2TvHvu/i0edsFR2nOSrz8eoufx0adyMDKhUftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUZQjMDB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b78bca0890so851628f8f.3;
        Tue, 29 Jul 2025 00:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753775525; x=1754380325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/vGXG+Y2ROImo97YvG9XS12uaci1YT5Mv7jP+PuwLA=;
        b=XUZQjMDBPD8AzOh+PLJb5I74Ypr64UHL4u6FNX1VgQM6z4nSVkDrLBzIq2fqjbPj9K
         Ho/4ptxgHFy6LG0BO0ZgNFSb6vq97H3lVI9qehtl9SzZ7CSz8wGG6Q1oTpbVB/LZG7pQ
         jPIu6RZNDx8PdrmEzQxk4Ff52C+MjtxDis+tOuzkIxZpGJG28QVER1N7buEtTV+pSWUZ
         iwfyFTJX/hJvW3Uvmhv2ZWwb6BcAE5UnYWKtxNGulLT37IKoEkEwPwdfoUTGFqPtvUG8
         cNWEJkcff8iVx/oXNl0IXHqEgy+8cV2ds6dnD+QEMPBCSRFLgCMICK4sfLshsy3bH/Go
         g+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753775525; x=1754380325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/vGXG+Y2ROImo97YvG9XS12uaci1YT5Mv7jP+PuwLA=;
        b=UXrq3FX2Mu67HB3/vEoEZL7tVfwOnh1qRDYrqDqo9z0zzW4foufnuA3cMAInx+pwNH
         ADigZZ1H9yHenJs/fVJi8uqWMT1jzg9XBtJziFX1tAHr03D/nsfMfwijw8yNfRONed8G
         Cvv6RNPBq78Ed0MjmStSaNp20PInRKtGwKeJss6eJdOlwBoMMoo85MsEBCeuSfdkfZC8
         g+etVeTN1i0nHezuwl8dIc1hmbDDN4seBuHshxkLKElly9bjKFjrlAh7UYpf1P8MJQfx
         MQRV5ieSGTgH4SZlPSQ6fL1SEY3ddHjekIVujgT7CWT2QqqjoQsLDG4aeTy/w8MQUATN
         4vwg==
X-Forwarded-Encrypted: i=1; AJvYcCXS1vLfU4LxdHd57PC/N7NndIsYGiVDnfjjX35jaMkkatSu6QT77tX2Fh9vnSGHkoRYVrcxlenqyEUIB4G3@vger.kernel.org, AJvYcCXy744jR9oLibSUY+YsaRvVyTo0Cc3TgSv3UuHk2hApTIG6jab/XdeTXzSIxtCoCinUXVlt/O+EG+3T@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcfp8nhriYXN+Q37GWWPp8QF56NLeCsnsgDjUPzoRRMQhhwA94
	pS9YAGi7z5eJt0A9fdMo+Q3qZzDz/yVwSlySFrvEqdxhSrxdUtjnc5hGyrlqoQ==
X-Gm-Gg: ASbGncuNArs9FMxXL0v6QUcA573kZE4l/9msbI7Vf8ak40+TzgF9btQdUk376AGDOXr
	RqLalmBEZBTQIjzBVnUA5hWcsRXNRXWd5D3VwjOhqKFGLNWOmD53XffqsJQJqlD5rkTPEqW8WuW
	JUGTB3OwRsDKf+GdSSHpbP2rXM5i9vDVi4KASkn/aMtGIq+C8nNvRRlR+QkLqoCz+XszDiC7LX8
	sttyd2jKkWPV+bLRMrLG/QJDsHqtDpeHO3+YiSYjaImn2LQ+VHN5xOO5SQVxkEOWKYWQj2X05cW
	sPkT+OgOMI6LVI52kYspyKGqX6s0RWd9SsLNhoJGbJt0odBO7BIJMf3Z6BvkV0Ip0HCQkoVa1k5
	6fIJyxWW9YWXCRIX30+u21ust68u93U87TXpmeR/I8GzIFSeAbQ==
X-Google-Smtp-Source: AGHT+IHjf0fyZI8FDe6pBTbYKK6KoxqUEzta2TJcghjGqVbNWN64iP3zwStPFKAuVhiqBvfNuob3/A==
X-Received: by 2002:a05:6000:4022:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3b7767765a2mr12039789f8f.39.1753775525065;
        Tue, 29 Jul 2025 00:52:05 -0700 (PDT)
Received: from builder.. (53-8-142-46.pool.kielnet.net. [46.142.8.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f047afsm11046706f8f.39.2025.07.29.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 00:52:04 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v4 0/3] i2c: rework and extend RTL9300 I2C driver
Date: Tue, 29 Jul 2025 07:51:42 +0000
Message-ID: <20250729075145.2972-1-jelonek.jonas@gmail.com>
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

The first patch reworks the driver to use more of the regmap API.
Instead of using macros, all registers are defined as reg_field and
operations on these registers are performed using regmap_field and the
corresponding API. This simplifies adding support for further chip
families and avoids potential redundant code by just providing
chip-specific functions for every chip family.

The second patch extends the existing dt-bindings of RTL9300 for RTL9310
support.

The third patch makes use of previous changes by adding support for the
RTL9310 series, providing the correct register definitions and a few
specifics. This also uses a new vendor dt-property which was added by
the second patch to properly manage the I2C controllers. Having this
property is necessary to properly describe the hardware and allow the
driver to correctly work with the I2C controllers.

Both has been tested successfully on RTL9302B-based Zyxel XGS1210-12
and RTL9313-based Netgear MS510TXM.

Compile-tested with Linux, run-tested as backport in OpenWrt on the
aforementioned devices.

--
Changelog

v4: - fixed an incorrect check for number of channels which was already
      present in original code

v3: - narrowed vendor property per variant to be required only
      for RTL9310
    - narrowed usable child-node i2c addresses per variant
    - no changes to driver patches

v2: - Patch 1:
        - adjusted commit message
        - retained Tested-By and Reviewed-By from Chris Packham
    - Patch 2:
        - simplified check as suggested by Markus Stockhausen
        - fixed commit message
    - Patch 3 (all requested by Krzysztof):
        - use vendor property instead of generic
        - add front compatibles to make binding complete
        - fix commit message
    - reordered patches, dt-bindings patch now comes before its 'user'
    - properly add device-tree list and relevant maintainers to To/Cc

--

Jonas Jelonek (3):
  i2c: rework RTL9300 I2C controller driver
  dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
  i2c: add RTL9310 support to RTL9300 I2C controller driver

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  58 ++++-
 drivers/i2c/busses/i2c-rtl9300.c              | 231 +++++++++++++-----
 2 files changed, 218 insertions(+), 71 deletions(-)

-- 
2.48.1


