Return-Path: <linux-i2c+bounces-10687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6CAA49FD
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 13:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D39493B1B00
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 11:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564E7261594;
	Wed, 30 Apr 2025 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="rV5CnTm1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C225DD1B;
	Wed, 30 Apr 2025 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012415; cv=none; b=pBnZ0CBKFwJSGdAY5XZUGqNeVx2ehT0eIKYCOfVLI38JzkqAUxLxnogL+XC8Ji0OlGFrLc7CYBdWVGuwpTlIWnNkUvjpUsmH+xvumQ5NsMFFfDq/7o/Io8Pntq4Fw1JFJOfJoXJNgw/bGDU2mbMnhSxhRzdMdHgR6h1l69gEewQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012415; c=relaxed/simple;
	bh=EDbo3JrS2znZ9x0Pn0mCRGvaNSMYyX/0EB3hiCQ6fIE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GfBZivXrzVMb0CKZXin+B5JJ2QfE5Irl030Kb3m4Dt9/UcjfvfHcU0i45FuYGYlqaGvTPY+dniKbJXNDPxBLukTa8FJm2W0O+j/O6F2wjp+zOqvbnpSpwc7yvv5cFVkgxbSKBPrA3DtqgXlI+xCOBCHiIrkIOXR1S+QVnPLn858=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=rV5CnTm1; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [10.102.98.142] (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id D913C3FF1C;
	Wed, 30 Apr 2025 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746012405;
	bh=oBhojEcmQ05hF7hHyMc9wzifbXB0/OzscI99q4/pAGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc;
	b=rV5CnTm1QtoQ2cCYr0Vj4JVmUYKXiIPajosA35boGA6H7hsuSXVc4qsjiIk6laUud
	 CIskKtRgvn7Z51R0kdW1OhAkQ9hBGtfRjq1CxQad8xiyj+E5TTf1X5GEVLl0Uk0Wp/
	 DFoq5Vz/I8jJcgQcvrprFp43XxPFKUE2LcLWqpTFr1Y877cfewpyCmJQ3+5sSH2gzR
	 US9VCmAftczFL2nwy5xj0HfipbfGYB8tdPX3lj4qXqXJuTIQA6R7ah+idowOPj9QSI
	 1xH9RZUtGd/S9FsSeBJBo+EHXiLMGnnjMWbP+Ne5uUeAd5/jfYD1ogtrKl5OIQKFB9
	 zm9bBpB+R/vmw==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Subject: [PATCH v2 0/2] i2c: i801: don't instantiate spd5118 under SPD
 Write Disable
Date: Wed, 30 Apr 2025 19:26:15 +0800
Message-Id: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANcIEmgC/43Nyw6CMBCF4VcxXTumLbfiyvcwLMYyyCTSkrYSD
 eHdrSTuXf5ncb5VRApMUZwPqwi0cGTvcujjQdgR3Z2A+9xCS13JUhcw+ADPOaZAOAEbqSDOfaW
 UAeeBXUzoEmMiKG6V7kvTUoO1yHdzoIFfO3Xtco8ckw/vXV7Ud/0h5f/IokBCrZuiNbo2qIaLR
 ecdW3ycrJ9Et23bB3Q2vtPkAAAA
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=EDbo3JrS2znZ9x0Pn0mCRGvaNSMYyX/0EB3hiCQ6fIE=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBoEgjwvGwAZzOSErkfAWZ0rNYnaRal9Q2DeSeaA
 IDpm5RCTmOJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaBII8AAKCRBfF7GWSinu
 htVmD/9It6OIlCFTuAruM0c698Bc+Y6Ib4cpjSoU7WFhKGNfuZX1eE/BkM2JFgwBMVJlSHW9Orc
 pekQ5EhbJtayw9qYjeta7Jh6aFZZchh/CTohfSsGypKFtbYe/LevDjUg4ev2tk/p0xdyf3YT7yT
 sq4eAUJYEhRc5dBF5IDQq6MO2r13wRKunBefzi3shKzt0lFA90SbKj91glBVCNRN1OTe53EU7fX
 lugjbazy0cHh2q1YqHRa7pzRDJ3o/cHYLJ+WCw/kKn9v/SJG3Il9LPTOj6SAv0I0A/Smjvken9B
 plkqsQ7Fn/rReQ9WtJua5hpltLizMip6JD391HSQVyeJwaiIlh4xsVC8u5DugfGas7UAxIv9+xm
 8+1f9T8GMYMsaY/N7+qIj6My+F5Uy5umEuCgSzEP04KbY2C2IDj3G6AYSBMr0e2kbA3ogqDA6Qv
 gGY5sBmCcZmoQ+VisiRKtDO0vvu83VnYflhvYdz/SGGrAKZiNukPwCXUamBpX0mGmhBp4WFyqjB
 u6OqPW2PFxSz+JSpKu5eIXOPFMa5KUXW4zvkeQfgP3hsKeulvrV3jAMq1qOyn1V55PjwQTIYGLa
 Xq1Prew6keKU1u6wlwK/Rn0Sr+x+4EVJ+AakAjD5lCEmoxuzVptoARbUoSugjI++nOF8vnapNZF
 QsIxHlR1FJpY7MA==
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

Furthermore, BIOS can be implemented in a way that, after a reset, the sensor
page value must be selected to 0 first before its values can be read.
Not being able to write to the registers renders the temperature reading
unusable. See discussion in [2].

To address these issues, do not instantiate spd5118 if the SPD Write Disable
bit is set.

[1] 18.1.16 HOSTC—Host Configuration Register (SMBus—D31:F3),
    Intel 8 Series/C220 Series Chipset Family Platform Controller Hub(PCH)

[2] https://lore.kernel.org/all/acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net/

Signed-off-by: Yo-Jung Lin (Leo) <leo.lin@canonical.com>
---
Changes in v2:
- Instead of passing a bool to i2c_register_spd(), make dedicated i2c_register_spd_write_{en,dis}able() functions for each case.
- Rename variables.
- Refine commit descriptions.
- Link to v1: https://lore.kernel.org/r/20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com

---
Yo-Jung (Leo) Lin (2):
      i2c: smbus: introduce Write Disable-aware SPD instantiating functions
      i2c: i801: don't instantiate spd5118 under SPD Write Disable

 drivers/i2c/busses/i2c-i801.c  | 15 ++++++++++-----
 drivers/i2c/busses/i2c-piix4.c |  2 +-
 drivers/i2c/i2c-smbus.c        | 21 +++++++++++++++++++--
 include/linux/i2c-smbus.h      |  6 ++++--
 4 files changed, 34 insertions(+), 10 deletions(-)
---
base-commit: 9d9096722447b77662d4237a09909bde7774f22e
change-id: 20250423-for-upstream-i801-spd5118-no-instantiate-3b52d489e7a6

Best regards,
-- 
Yo-Jung (Leo) Lin <leo.lin@canonical.com>


