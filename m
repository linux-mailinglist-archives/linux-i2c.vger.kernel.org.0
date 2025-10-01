Return-Path: <linux-i2c+bounces-13289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 600F8BB1CCC
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 23:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F9F64E22BB
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 21:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D359D2D3EF1;
	Wed,  1 Oct 2025 21:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiF1fqIB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F033C2F
	for <linux-i2c@vger.kernel.org>; Wed,  1 Oct 2025 21:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759353795; cv=none; b=rTbnmqic81F0zqmimrX1cEtPEpePS45JiCXfSPxnoM8L8jkTndUIVdXTRABxiBupyz8bPQuShwXKGYK1NBa8nAfHJ8cscvuntQmCKukSAQYoSkCapwbr/lHvzI+Fo33CjFfYMYCJzmFtrPgu4oovQLO3SS7qG+PFrRm+sWJHCqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759353795; c=relaxed/simple;
	bh=F+bEVwNwPdj8TIlivkwkuVjOhytxbyJxa1JDVvWp7jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiN7jRaYkWhsSsr9WnSxbyYQjwl03WIMnb7o2tVNXpuhipIIU4De5bF55dlRhJXi3dGg9x2riyKfL55EPOGBiXobSGaQw/AMPztgAiTFkQbjX9ggwykemBDyKhHIfu7q8hAYrbDWkCZZc+UQ0GfGFq6WnDv8H3IWs9HFOS3shQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiF1fqIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C27CC4CEF1;
	Wed,  1 Oct 2025 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759353794;
	bh=F+bEVwNwPdj8TIlivkwkuVjOhytxbyJxa1JDVvWp7jk=;
	h=From:To:Cc:Subject:Date:From;
	b=WiF1fqIBcFwB34rQFRcJlgwT4gwZUELuWsMXEIeAEw3RbeezevmWu1p+OvVhUNWK5
	 /KzCaG+9vZ/K9akxDae+8kXMTZykw4DYUR0EtN5tL/Cuyt0Ov69xzAnV2BUOmv81ZU
	 X4bf28FFJIpsD3lWvUn5xWdWhn+sii9K7tVMEgSQpbcZNw2X/DUF93H7rpUQxdDKCj
	 emPG4FlRraV8+wmbBwfWnJ6yXWDyWZtleUZ0kd8+B6+EXwFrPqxU5PPoH6lq5hcMEs
	 9w28lrpTnUFEnkVkqvHAfWNCl1hsG7p90hiAF/Jevme4Tp52INt2kdI2gcwqbhCsd5
	 0rKAxolvrO9AQ==
From: Hans de Goede <hansg@kernel.org>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Date: Wed,  1 Oct 2025 23:23:10 +0200
Message-ID: <20251001212310.4813-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "INTC10D2" ACPI device-id for MTL-CVF devices, like the Dell Latitude
7450.

Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Note this applies on top of the addition of the new i2c-usbio driver which
is being merged through gregkh/usb.git usb-next
---
 drivers/i2c/busses/i2c-usbio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
index d42f9ab6e9a5..e7799abf6787 100644
--- a/drivers/i2c/busses/i2c-usbio.c
+++ b/drivers/i2c/busses/i2c-usbio.c
@@ -27,6 +27,7 @@ static const struct acpi_device_id usbio_i2c_acpi_hids[] = {
 	{ "INTC1008" }, /* MTL */
 	{ "INTC10B3" }, /* ARL */
 	{ "INTC10B6" }, /* LNL */
+	{ "INTC10D2" }, /* MTL-CVF */
 	{ "INTC10E3" }, /* PTL */
 	{ }
 };
-- 
2.51.0


