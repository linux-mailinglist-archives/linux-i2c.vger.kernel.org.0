Return-Path: <linux-i2c+bounces-11623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C5CAEA60A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 21:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C823D5606A3
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6392E2EF280;
	Thu, 26 Jun 2025 19:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9RJwSSy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE1321348;
	Thu, 26 Jun 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964744; cv=none; b=V2AjM/9IDS6PEmDudkxgRAEhrXQtQjw007itN47CaL8MJ3RJTEpzv+7tBaj84HARFnpOPkvjVMx7RbBUXC8PESyOhlnJAJSk0yKPaSaHI7wCjAOK7jTG3wQ0HNAPC7lUbm/Evc4yLa3AugLsZa9aED375lxwVnQg3g5Au3e270g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964744; c=relaxed/simple;
	bh=W96jFi0ozYt7piTYdJEZ/ATHq9mzwXp5ZChmtko8xmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=blb5OuWD51fEaEMabouP7PTSLy76mu/kFrZNgO+BlIrQkIYkS0KVhZEHLa8UHSwnFfRkAtGw8NfaSBqXbY1DoTaNd5QCeAPH9EVg6IUt97MGrb5LDrwZvspRsDkNzht4HPaIGMn1NAzv9KD359UQj60AML84CAUVgHtb8fnlB0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9RJwSSy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750964743; x=1782500743;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W96jFi0ozYt7piTYdJEZ/ATHq9mzwXp5ZChmtko8xmQ=;
  b=L9RJwSSyLbWU3P04xjhGLICdqD4jCUm9D+ZFWKXQTGh4O7L0AEW7mQsy
   YOXjurDfGO/o+tgIFK5ZpQ1uskVkzbR3WkcA5cHlNLuyUJFOoZuLH2uaN
   MK6nO7Wwy2MwrNZYPOVUEUfsBa23bCEV2w+/jGBuAdG7xehbiq22V1GAZ
   SEo0+nudBYrM+NRRcjvkeYJPGtj2mvpgCVfR2wUBheEK/OcWXpRXB7Ot1
   FVXJeX3QqPSCabrAZaXzldJ7gulK3+g0e7xD4KA82It5wson9urfd4S9o
   JhCEWB5b/dSBJbLqXVuPprKuxf3DbZHHc21HPGwvHZG35Q6iLLthD8coX
   w==;
X-CSE-ConnectionGUID: z59Z8Md1SVODH4sjQMXP1g==
X-CSE-MsgGUID: aGB1cIsVT7m+LGhBd+Y9fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52503827"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="52503827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:05:42 -0700
X-CSE-ConnectionGUID: UtGSwUrvTgCJ/e5p76g7+g==
X-CSE-MsgGUID: nDUCc86UQ56XE4f56yrnCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153119214"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.105])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:05:41 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: linux-i2c@vger.kernel.org,
	andi.shyti@kernel.org,
	andriy.shevchenko@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c/designware: Fix an initialization issue
Date: Thu, 26 Jun 2025 15:05:25 -0400
Message-ID: <20250626190525.469618-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c_dw_xfer_init() function requires msgs and msg_write_idx from the
dev context to be initialized.

amd_i2c_dw_xfer_quirk() inits msgs and msgs_num, but not msg_write_idx.

This could allow an out of bounds access (of msgs).

Initialize msg_write_idx before calling i2c_dw_xfer_init().

Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
Cc: <stable@vger.kernel.org>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c5394229b77f..40aa5114bf8c 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -363,6 +363,7 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	dev->msgs = msgs;
 	dev->msgs_num = num_msgs;
+	dev->msg_write_idx = 0;
 	i2c_dw_xfer_init(dev);
 
 	/* Initiate messages read/write transaction */
-- 
2.49.0


