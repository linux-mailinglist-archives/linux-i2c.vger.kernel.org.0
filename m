Return-Path: <linux-i2c+bounces-10604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64FA99FB2
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 05:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D31D0460042
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 03:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8751C5496;
	Thu, 24 Apr 2025 03:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="vVhkAc1m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7E917A2FF;
	Thu, 24 Apr 2025 03:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745466307; cv=none; b=gRIJdk438lGpX8VHelQdi2LznS4Aw5ncxwYC2BCMLot1fDzNwPqAa96Zv48wIsqLkl/grUlgif1i1RwTAdMaBG2xsvhleC8cpFi9fHBWiLAZuMAhFDTFHOpqWjNWLZ/x5iil6oLtMRb6QP8cfXWeOThXRaJFJ/1CQbzABTKU8Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745466307; c=relaxed/simple;
	bh=qaFVrgFP5F1nuKMveHCBZx5qHUQCmCkHc1x1hZRR9+g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m7x3FsLZf4m+RGrMzWTrkiPRPoqIeQaC3Oc85xCv+kYUWO49F8/N7gpqKMmr4ZxuGC9w+XqBNSJ+WgkgJ8dFK0Xc493286ic94oIj1PT41rJwze0+088VRNJ8wi8Vambi9dXxI8h5GCMRoGO/jLva1VfxB1D0L8D+SNqFO1u0KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=vVhkAc1m; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [10.102.98.142] (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6E5D03FDB0;
	Thu, 24 Apr 2025 03:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745465793;
	bh=d5WfvOqQjyeeGPF2w/ILFr41bfYXh8teGuVYt3zWlRM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc;
	b=vVhkAc1mPN5dCFZ5N4oIZugxymgluE78pYUQAgqs+/8LMcqhjFn4S5cIkTKIqs0X8
	 TDdHX/s+RMxQLjb/ifOvzP9Ev9zmjgBwt8BcsNZZiqHHfqTDcOaAiva9hgcWRYjumH
	 igX0jSHFHBJEvGrCDHUVlJ+eGwBgDo1zcJc0yNUWqjk9VVqt1MZCH1+MLD7Z4K4rGE
	 4j868oCZjAQP8ZaFCRffMg/xKI0FKDAM3Umd1ffiPeeemizBx1wMxE37agmEVpsGlH
	 M3gLmOUSvqbcsIPqP5pZSWduI7cAcaSIkv9txdmPm4jKj/1A4dsJB4VOqNAcYLKeKN
	 tfKCwzXyOreiA==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Subject: [PATCH 0/2] i2c: i801: Don't instantiate spd5118 under SPD Write
 Disable
Date: Thu, 24 Apr 2025 11:35:42 +0800
Message-Id: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI6xCWgC/x3NQQ7CIBBA0as0s3YSoEXRqzQupjLVWQiEQWPS9
 O4lLt/m/w2Uq7DCbdig8ldUcuqwpwEeL0pPRond4IzzZnIjrrnip2irTG+UYCxqid7agCmjJG2
 UmlBjHBfv4hSufKEz9FypvMrvv5rv+34AonTQ4HoAAAA=
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=qaFVrgFP5F1nuKMveHCBZx5qHUQCmCkHc1x1hZRR9+g=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBoCbG01nWbQEm2FizVxkaYFT9pnDnjYrTFPOdot
 7BI76WvpL+JAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaAmxtAAKCRBfF7GWSinu
 hrQwD/0VNwhw+jB+7E6ExkkqEhIAvhEDoJ9BFTHmkP93TYo8xHeJRAkiCt2QZOXXNRbC8ITwZCj
 zXwJlikyCc+18MTP+a+YJtOuGKhFDhJFhQoVEEz9OOgU4RFsFXjrRZeccjiAe3OhPY9e130s2HM
 9LBwpEbX1wv5wEo8Fdioq20slBCMNEmn3t3288sYQOK6ep5Zy8ibsY4Wy9pDSYJilQvPutk2a3D
 T8Lm52SzJkRyCNQgclgdQuLhxKDx2UCtLozpUVmVxTw5tCeiMwGeTHMwmHKeE+aNKGkneuZT+Fj
 7LRKGy858RSvn6aevxepSnDHlq5G2NuFJTcf2SRXHMgHdaLWrtS+cMbZXzOvveaeFo47/SZiQsG
 iH+KyuajMEFSBry8tjJwxPII6XVStnHkHcH06Dnn97wxKVTqF28Fna/GcpBKyjWVOQeJvH8ut5R
 ZteVKVScaE1WjHU4U2tcQ59MoXcvTO8GLWWurjZ8r69zWyJRTTDMYf5/V5UrypJUE9TlBxharin
 FONrjK/iiqRxhtf4nXREn6uEEpg6eAytdvDT/wgI1hju0bUCXMk5nJVmlHhQ8GhkSJHy2HfRKuu
 O9YzMWy0zoyKzszUusuYqoI8qX8IpYjYNUZLPHXDHCp19EmoAsC2EAqEdLaixxWzCEnaW63ALsX
 obrEoHtwrXJhjHw==
X-Developer-Key: i=leo.lin@canonical.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86

On some PC platforms, the BIOS may enable i801's SPD Write Disable bit and
forbid writes to certain SMBus addresses. For the i801 family those addresses
are 0x50 to 0x57[1], where the spd5118 sensors are usually probed.

The write-disabling bit will make sensor functions related to writes and
nvmem access unusable.

Also, the driver is unable to sync back values from regcache to the sensors
during resume, leading to resume failure. This has been observed on multiple
existing PC platforms from Dell and HP.

Furthermore, for the sensors from certain manufacturers, after a reset they
may need to select page value to 0 before sensor values can be read. Not
being able to write to the registers renders the temperature reading
unusable. See discussion in [2].

To address these issues, do not instantiate spd5118 if SPD Write Disable
bit is set.

[1] 18.1.16 HOSTC—Host Configuration Register (SMBus—D31:F3),
    Intel 8 Series/C220 Series Chipset Family Platform Controller Hub(PCH)

[2] https://lore.kernel.org/all/acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net/

Signed-off-by: Yo-Jung Lin (Leo) <leo.lin@canonical.com>
---
Yo-Jung (Leo) Lin (2):
      i2c: smbus: pass write disabling bit to spd instantiating function
      i2c: i801: don't instantiate spd5118 if SPD Write Disable is set

 drivers/i2c/busses/i2c-i801.c  | 6 ++++--
 drivers/i2c/busses/i2c-piix4.c | 2 +-
 drivers/i2c/i2c-smbus.c        | 7 ++++++-
 include/linux/i2c-smbus.h      | 4 ++--
 4 files changed, 13 insertions(+), 6 deletions(-)
---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250423-for-upstream-i801-spd5118-no-instantiate-3b52d489e7a6

Best regards,
-- 
Yo-Jung (Leo) Lin <leo.lin@canonical.com>


