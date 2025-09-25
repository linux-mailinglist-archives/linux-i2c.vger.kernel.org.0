Return-Path: <linux-i2c+bounces-13142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75CB9D140
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 04:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1853285A8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD452DF3F9;
	Thu, 25 Sep 2025 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YyTjSFQb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DB2DF14E;
	Thu, 25 Sep 2025 02:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765854; cv=none; b=e4pXiE7P26jhDXksNotjg20DFUxcgSRfZOKVrAjz5u9xS5jzgQqfa4e13/+ZQcL0GR7CnOtf5BhGcWVBNFryR2hx5zCjJMQG0u70b6xi80Yazp8hrHtvuO0iIfPa0Nwfo8y4nSco9dOy6lr7t9tW9SvMrgVdmY5bghEm73DeW6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765854; c=relaxed/simple;
	bh=LHjHJrXqZVZYgG9B+E0spJV3Yspn9c/QJE4SsURPrkk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WRBV0OYsLuvWbKGe+vqCvIWfGuhkyTxZK+I2sSh7P5LifKzd70PbtusE7VOrWgEA9HtYaPHEPYanmGFKtXooS2hYzl0krssb5InnzjjGXY4vLNQkywmdKKQqOls1CbixE4YU25I5ecxn/f6m+UJv56q3CNM6ZdQwkDWhTbvO8Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YyTjSFQb; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765757;
	bh=/3q2hOrFcCfu03khAGZ1/m7GoaKoIkgm7i5lEDGVYOo=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=YyTjSFQb5Zwt6mEeQgiOwFdp+XAqFp9CosvONLiyfZoWJ36MsSIUWpreG4YQJsIyw
	 b2du1geJ+OfD2c/dbz2UNgCGcPy712JcnjBuA1W5Fc+fiMszu7Z2YwN6gWrzLezSQ8
	 VZxAwtRrvFdoOq+uV6Whrauz2gYPvlfXTh96oeXM=
X-QQ-mid: zesmtpgz4t1758765755t3d602099
X-QQ-Originating-IP: DeFQPRLG9Sq25rBnhlRa3qMFcNcl4wFzlsRxRS93BXs=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14026594320109242510
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/6] i2c: spacemit: fix and introduce pio
Date: Thu, 25 Sep 2025 10:02:24 +0800
Message-Id: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGi1GgC/13Myw6CMBCF4Vchs3ZIWy4CK9/DsKhlkInSkhYJh
 vDuVuLK5X+S820QyDMFaJINPC0c2NkY6pSAGbS9E3IXG5RQhahkjg+JrAzq2Y1ssJe6FqbL8qz
 MIX4mTz2vh3dtYw8cZuffB7/I7/qT1PlPWiQKpKK+kRaqKytxebJ9rWmYtKGR59S4Edp93z/bt
 rcMswAAAA==
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=1649;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=LHjHJrXqZVZYgG9B+E0spJV3Yspn9c/QJE4SsURPrkk=;
 b=Su2mS330C2vNCCq+gt5t62A6KZK4tsdg6gSgeNS4FbIYaZoa2cbyNhzaEQh6yuF8MgnUIfY+C
 jgG3GOAMktZA3lwyMMPydvEnms+OYeIrri6WP4NvcDTGT7Wu02p9UKK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NRRxESCIhBwbRNuk49BV5x0uHNXa8B0rjoX9N/6bAOUIaDy00mbWICZq
	Iecap9Qt5vigiIs4QmYgkFI0gtTdTr9SggUZG9o5HSZehYOrW5g3/OgG3T959bnFdLy9o7i
	P5NveDy3S0Aw7DfMlANVAAYqV/tEtM8byw44WlRh4C0EOcCKNuUAYNYsXTuE7u2Nce3Hip3
	f/nD9qEDswx1np1fcpOpGkO8veqU8joXybMU4rfNQn8Pmb8Kp8nGnThwIM+fw6Z32PpzWoS
	oQldK7dTFjin3uNNxU6KPbi5peJ48MGQaYoASBY3Sizzx2aEyryjCrrqCpf2te8GyNVRuAn
	hhYvqJzGzMjJQifqmC6/ScLBzaJNnLoPcIREyMNpb2UCbBus9h+pOK8kPBlUP5Ob5iDQr+V
	HS6wSsjBGtD99frW9LA1g/UFK3FgJQjaalGkduhvLMnlsZTgJNnpSuOBNTgozUtWa9XQnw3
	bBTzdUfWMTUhNvNRNHhoReJe+UPbm2lkcVD05zGyJosRzrOr/MQoshLS3vWF6DlV6z0OV6g
	OaYYzn9IGXx2mjMAKKnWiELNgDh77+j05cF9UC4+0afGpui23qu41tifErCmo1t1J+mcOaP
	NdHURmxlezEh67SNfjSbzEJtmtZnsob/9MkVk5mTbiXe7Vqp1i8nYy+YFiRDAKxPbEYivs9
	xVn2zXT36MSL4RYNGGQLiA/KP/YH6c/AGaRSLqKuwDQqU91I4A2kDsRR/8oF7r9k0Hkc3QP
	OhuudXX+AEzX+DStYWE/NBgcfy0Wghf/xvHUABpQys7Ai0cFP484J567ofsYiWfAIacezPC
	QjOQxY5tydZ96Va/oVEEpxkdPm4WF4Eka3cI7bJq3D+/71kQF6dckC4ZpIhJ0xr3NkV5iLG
	OYG8HnR18SBbLJax3URJlt5Z7PhC0mdM+8EFDduYGShOg1ZYeFjgKvs+A/4veV1fHlWfsve
	GkQiAVanA4yCBx/I9lwgLiYCz6kR1UZG57AySBmKyzaS3XV9wfXOpu3inSGpHrx2vUOk+01
	Ecqx5fP5BIDUAzo8PpkqTc1HRqsCKni3Vfcdf4QibaNTbXLEsHbwdiyHB6AJwkEXFh0V1Q+
	jW56CtZ1SB2CcwJv2hYlX3QKWtu2wRr7sBOl2xAZ81mUPQVBnniuWhV3G6bBxNKw/9R56Gp
	adiH
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Previously, there were a few latent issues in the I2C driver.

These did not manifest under interrupt mode, but they were
still present and could be triggered when running in PIO mode.

This series addresses those issues and adds support for PIO
mode transfers.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- Patch 1/6:
  Patch 3/6:
  Patch 4/6:
    - nothing
- Patch 2/6:
  - remove is_pio judgement in irq_handler()
- Patch 5/6:
  - fix wrong comment
  - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should 
    return directly instead of using break.
- Patch 6/6:
  - add is_pio judgement in irq_handler()
  - use a fixed timeout value when PIO
  - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO

- Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com

---
Troy Mitchell (6):
      i2c: spacemit: ensure bus release check runs when wait_bus_idle() fails
      i2c: spacemit: remove stop function to avoid bus error
      i2c: spacemit: disable SDA glitch fix to avoid restart delay
      i2c: spacemit: check SDA instead of SCL after bus reset
      i2c: spacemit: ensure SDA is released after bus reset
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 221 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 178 insertions(+), 43 deletions(-)
---
base-commit: f9a7e1f3eff519e88c91d87701d05cfd968d89de
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


