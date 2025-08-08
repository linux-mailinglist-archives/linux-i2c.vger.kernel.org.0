Return-Path: <linux-i2c+bounces-12163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56049B1EDF3
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 19:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E35B4E37AE
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 17:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A2E27F728;
	Fri,  8 Aug 2025 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1vf0W7v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532841C861E;
	Fri,  8 Aug 2025 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754674913; cv=none; b=eMXqMcNVdeunIJOx1uE5/rX2b3+AU8Gh0lryZqzqTdFgKQJP85J9i9P3ICsyaHDFw1g5bMtaO8RmaTA2KwcAZjVGEigs58vLL5uwMbzSPVTC6qmUAIPgqMR5KdgvZLC1e+Y+730XQoDzcSQHvS+v5Wxm2Z2Grl7i1f2cGkYNsJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754674913; c=relaxed/simple;
	bh=GqM4uijE/cryD8lWClhsosZUeGz28VWZUOgODuiBkFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YlD/kQtMlpo0FzX8EVRONGXKpoDVjNQ2dko6e1XpCfUuJ9yFRNajNr50NCoJSHEmRSNpvThupux1uqVsY0RiqvP0UscvD5TPamHD8wQ87mTqxkQFUgm4hfkOn79ZYejj2jG2S440YNb8LspHM2c6lPAWgJdq75l46x69x0dwTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1vf0W7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862A2C4CEF0;
	Fri,  8 Aug 2025 17:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754674912;
	bh=GqM4uijE/cryD8lWClhsosZUeGz28VWZUOgODuiBkFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G1vf0W7v6sguhmymEimUd9BSuk+sn6ofzjXnU02YJl7oV9cnwtiwTXl64qc8MrOvx
	 3sESbLZVy+pAL5waDn+6pZ+8kdLBhQ+uMp0Ejc+MGoiNsbyyvBqgiE7/iViN8cA0I3
	 RGOvGLdqOANQccTl/OM++XUB3sTkAoTjUz17qPLwpa7jomSRSTeXnrPodziwgGs36V
	 2rZs3ZKOvMMRfGW8HRpQoogMhDKxWVQuOvT0M+/Sll5mwjbIMo5flWgsjMZX3ZfdFn
	 tMT0lKpSLnlwG+IdFj4OPJfC2dmq+K7RscLao6YqBYI460JIfNyQrpV//I0nIIcXN6
	 hCJYcB2SFL4SA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "fangzhong.zhou" <myth5@myth5.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	westeri@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.10] i2c: Force DLL0945 touchpad i2c freq to 100khz
Date: Fri,  8 Aug 2025 13:41:43 -0400
Message-Id: <20250808174146.1272242-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808174146.1272242-1-sashal@kernel.org>
References: <20250808174146.1272242-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: "fangzhong.zhou" <myth5@myth5.com>

[ Upstream commit 0b7c9528facdb5a73ad78fea86d2e95a6c48dbc4 ]

This patch fixes an issue where the touchpad cursor movement becomes
slow on the Dell Precision 5560. Force the touchpad freq to 100khz
as a workaround.

Tested on Dell Precision 5560 with 6.14 to 6.14.6. Cursor movement
is now smooth and responsive.

Signed-off-by: fangzhong.zhou <myth5@myth5.com>
[wsa: kept sorting and removed unnecessary parts from commit msg]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Analysis Supporting Backport:

### 1. **Fixes a Real User-Visible Bug**
The commit fixes a specific hardware malfunction where the touchpad
cursor movement becomes slow on Dell Precision 5560 laptops. This is a
concrete usability issue that affects end users' ability to use their
hardware properly.

### 2. **Minimal and Contained Change**
The change is extremely minimal - it only adds a single line `{
"DLL0945", 0 },` to an existing array
`i2c_acpi_force_100khz_device_ids[]`. This is a purely additive change
that:
- Doesn't modify any existing logic
- Only affects devices with the specific ACPI ID "DLL0945"
- Cannot cause regressions on other hardware

### 3. **Follows Established Pattern**
The code shows this is a well-established pattern for hardware quirks:
- The `i2c_acpi_force_100khz_device_ids[]` array already exists with the
  same purpose
- A nearly identical fix was just added for ELAN06FA touchpad (commit
  bfd74cd1fbc0)
- Similar quirk arrays exist for forcing 400KHz
  (i2c_acpi_force_400khz_device_ids)
- Previous similar fixes have been marked for stable (e.g., commit
  7574c0db2e68 for Silead touchscreens included `Cc: stable@kernel.org`)

### 4. **Hardware-Specific Workaround**
This is a hardware-specific workaround that:
- Only triggers for Dell devices with the DLL0945 touchpad
- Forces I2C bus speed to 100KHz to work around a hardware/firmware
  issue
- Has been tested on the affected hardware (Dell Precision 5560 with
  kernels 6.14 to 6.14.6)

### 5. **No Architecture Changes**
The commit:
- Uses existing infrastructure (the quirk array mechanism)
- Doesn't introduce new features
- Doesn't change any APIs or interfaces
- Simply adds one more device ID to an existing workaround list

### 6. **Low Risk of Regression**
The change has minimal regression risk because:
- It only affects devices with the specific ACPI ID
- The mechanism is already proven with other devices
- The fix is isolated to I2C bus speed negotiation for one specific
  touchpad model
- If the device ID doesn't match, the code path is never executed

### 7. **Consistent with Stable Kernel Rules**
This fix aligns perfectly with stable kernel criteria:
- Fixes a real bug that bothers users (slow touchpad cursor)
- Is obviously correct and tested
- Is small (1 line addition)
- Doesn't add new features
- Fixes only one specific issue

The commit follows the exact same pattern as previous touchpad I2C
frequency quirks that have been successfully backported to stable
kernels, making it a clear candidate for stable tree inclusion.

 drivers/i2c/i2c-core-acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index d2499f302b50..f43067f6797e 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -370,6 +370,7 @@ static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
 	 * the device works without issues on Windows at what is expected to be
 	 * a 400KHz frequency. The root cause of the issue is not known.
 	 */
+	{ "DLL0945", 0 },
 	{ "ELAN06FA", 0 },
 	{}
 };
-- 
2.39.5


