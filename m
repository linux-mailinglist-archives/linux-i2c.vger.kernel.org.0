Return-Path: <linux-i2c+bounces-4355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA09891772A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 06:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 925751F2359C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 04:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD6C770EC;
	Wed, 26 Jun 2024 04:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="UEXETlX9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB8132103
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 04:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719375163; cv=none; b=rfD6vxc5VqETYy78p+I5sX6OMEQoTt8CJpgmKCDGbymlrzkP6PINVrFZwTCfLtMCXbXsGsj2RItWYx+Y5Zt/ob7p0gZt6WAtyCEdyGmSo6IL+L1leM9N1KlUDbJRERiOP5HFGnd6J0bK6Tmcbrg7lnMyT7OPF3nJhVVVzgFAcao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719375163; c=relaxed/simple;
	bh=BIzVq21O0UEEJGgNWcR0sQeMSNHvdFYmXD+RpE4rc9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p7UssX5RgMyQpZDNUNqY6V5LM4qYxc7EXg+B6yZrBxwQ202GewrTB7Df0mlj+fZYsD88B0z8s9BpUdEeGFI2AkYgYnS9gYOivAL7q2WZ6oAllP9paEv3KL+gDUuT+7tIM3wstkj5th4W6OCQMHS+HnxPLhOicfFFvhlXn+5O8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=UEXETlX9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9F96588216;
	Wed, 26 Jun 2024 06:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719375160;
	bh=h585xFpqaczjbUYr4JYZkQHiTfuHjkeqU8jL3tW17CU=;
	h=From:To:Cc:Subject:Date:From;
	b=UEXETlX9Pn/S15tRlo77kh72PcgxpTn1eygp/elXSOY3+vjLb0HDUbHRVhA9DEk8d
	 lcDsaxs5avztbXr3Iehc1/q3JJmjnzlKf/0LogXNp63VEilfVvtrwKIku980dxhGWF
	 vMlQMiTdKJc+7NBoCKe0eyjzbodT1MJnV9QIpz65eDu2lQI21A4OpAz8kIMEj+WEHw
	 YC0Sqltyqa5dPDNyoOv24lgQuuDWh355rcTrAej9AVnMiUFToLUrggU4aL9d8UjCvi
	 V2GbPxQP3Z0wx9VkwJxk/UOmUATio8XD4QM1xNFu/e64O97DZnYVDvNZE9crT1evRm
	 hF9LgH77cdhJQ==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 1/4] nvmem: Replace spaces with tab in documentation
Date: Wed, 26 Jun 2024 06:11:14 +0200
Message-ID: <20240626041214.513242-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Replace two spaces with tab in the sysfs attribute documentation.
No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-i2c@vger.kernel.org
---
V2: - New patch
V3: - No change
---
 Documentation/ABI/stable/sysfs-bus-nvmem | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
index c399323f37de3..854bd11d72ac4 100644
--- a/Documentation/ABI/stable/sysfs-bus-nvmem
+++ b/Documentation/ABI/stable/sysfs-bus-nvmem
@@ -1,6 +1,6 @@
 What:		/sys/bus/nvmem/devices/.../nvmem
 Date:		July 2015
-KernelVersion:  4.2
+KernelVersion:	4.2
 Contact:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 Description:
 		This file allows user to read/write the raw NVMEM contents.
-- 
2.43.0


