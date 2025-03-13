Return-Path: <linux-i2c+bounces-9823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1AFA5F8FC
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 15:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FE1E172266
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 14:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25F0267F4D;
	Thu, 13 Mar 2025 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="agQ7/Afl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48D241C8B;
	Thu, 13 Mar 2025 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741877437; cv=none; b=gw9YWD0lqIH0a9XQb+Uajc3T/VBZA0iFhykzPi4lE3wY8a7G1HkWAAqxJ0dYAn5VipFYFs4grFU80p67SglyVeHAdcAzQnBQwv6WgMqurx/mVlKEDWJm1ewvhSE6tqvNnu63mhkXy1qUWkGyYFd7Xdh1KT1PkZ5chr64zRQHjrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741877437; c=relaxed/simple;
	bh=JASbuPnq/fZZqtfMCcxNabCPg2YoMwjcfwmLMkH+GjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cu+WGg5cZUz+wxO3qhiB8zODab15fbZVX0C6+2NDhC9hEP7T/jNAWEUDe9FctnPDEiXoWDd5m38cARPUJLba2YxWUqFkF4xkCw1+YrDRoTsfEHBpU467Bqi0neSPOVzd1J2hsJuRNCgChPsdsyirJKjj1HGRSxIhTYs7gwlCWkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=agQ7/Afl; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6D3391F92C;
	Thu, 13 Mar 2025 15:43:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1741877015;
	bh=u4y3Mf6vb5tkFjtxo50EBb/g8sSjRTOwS1HEz/JCbvI=; h=From:To:Subject;
	b=agQ7/AflldL57JLuFwV0NTTCbXaKqalGl3674H4jRNx/vwUS6tf0B0t2vB/GAwE6n
	 pZ1yIlKhhQ3OPEGWPOOAlJmbDm+9dxWpoibqB6ibEZnRO6yEr4VmkMMZCGuXAPCs43
	 5uW4BHSEHoTtZDTVZ9kWG01ZYJhKC+Mlt+m4lkuLcbLwzfqehFddXDSMWzUvY910BV
	 WYyqJrRzPI/oDtFW2q3BKbd1W4/dRY31eLKEba1tnq604iqsF20UzIfQp9bS4GHpFF
	 9aK0eYcfS8Kaa3/amZ0DLeD0MIDXvcKvJkzM6yo7qBvo0MqXI/bK51t7OiIVj/sK1/
	 0/lsOtvtX8LIA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded controller
Date: Thu, 13 Mar 2025 15:43:29 +0100
Message-Id: <20250313144331.70591-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds support for the Toradex Embedded Controller, currently used
on Toradex SMARC iMX95 and iMX8MP boards, with more to come in the future.

The EC provides board power-off, reset and GPIO expander functionalities.

Sending it as an RFC to gather initial feedback on it before investing more
time in testing and adding the remaining functionalities, with that said both
the code and the binding are in condition to be wholly reviewed.

Emanuele Ghidoli (2):
  dt-bindings: firmware: add toradex,embedded-controller
  platform: toradex: add preliminary support for Embedded Controller

 .../firmware/toradex,embedded-controller.yaml |  44 +++++
 MAINTAINERS                                   |   7 +
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/toradex/Kconfig              |  18 ++
 drivers/platform/toradex/Makefile             |   1 +
 drivers/platform/toradex/toradex-ec.c         | 155 ++++++++++++++++++
 7 files changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
 create mode 100644 drivers/platform/toradex/Kconfig
 create mode 100644 drivers/platform/toradex/Makefile
 create mode 100644 drivers/platform/toradex/toradex-ec.c

-- 
2.39.5


