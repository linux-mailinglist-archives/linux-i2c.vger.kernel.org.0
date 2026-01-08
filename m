Return-Path: <linux-i2c+bounces-14989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4200D01C4E
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 10:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 781323038389
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 08:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6306D38A9BC;
	Thu,  8 Jan 2026 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ubi5/jst"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A71D38BDA6;
	Thu,  8 Jan 2026 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858837; cv=none; b=DR7rJe39sEn38RRIMtLqotZzQi1+Qti8MJtjr0Z1HV3WTSI84pQu90TP7Brp5SnK4qxz16oWeWl781hQv8tM8v9P0Dq8eONXzhgEbgsTvY/u2nZK9vNvhUIzVfTxMCBH7YFbi8kXnnEM3pBqS5UYPVkOweG3igybsbYSIX8s8e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858837; c=relaxed/simple;
	bh=os9j22xJFP9qjppUkhykfcLZmmFjfsSd3/7uBNcOhII=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sMCclRb/++stI4FU4FErExN+ILxOgtwGQp0aWuqpgHaFuG790HO2R4w8wozsYwxUBTavGXPikf3RMDoqNlljmYeKXLbyV8RM3jodlf9l9/sWCL+OUXLKsGtnBihu69+BX2L00GqBbhOKDdBFWo9CWMNouWSSwd6Cw/ctpzZRQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ubi5/jst; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767858743;
	bh=dSgTeSeO39henS7z9zA+8wqyqWr9MsRhjybXmwMrFLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ubi5/jstXkOP0QNiT7Sv4NvRiNmefd67yQ8CX+9Yt6A9zgIfN9D3EZc+iuMix0kFQ
	 m++rsjNDomgLrqhS4L1Zv+jwyWjV/a450aWU0eq10QfL2fv7H7X1jPyLGUNxJjnbSR
	 Tgz2zQvcPyUynecgVaYzGj7IboF9w2DJR+W5ZQyo=
X-QQ-mid: zesmtpsz6t1767858734t11a7d292
X-QQ-Originating-IP: H36tlciJAHojKYwWDqPDN5sGrJxjmKZKGVMCoDe+Pzs=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 15:52:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14826193270515343133
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v6 0/2] i2c: spacemit: introduce pio for k1
Date: Thu, 08 Jan 2026 15:52:10 +0800
Message-Id: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACpiX2kC/3XPTU7DMBCG4atUXuNqPP6JzYp7IBbu2KEjSFLFI
 SqqcnfcClEUyPL9pHmkuYiSR85FPO4uYswzFx76Gu5hJ+gY+9csOdUWCGjBKyPflGQkGaehY5K
 tigEoaaOdEfXmNOaWzzfv+aX2kcs0jJ83flbX9VvCZiXNSoLMNhxyBEzOw9M79x/nfTlFyh1Pe
 xo6cSVnvDMB7ZrByhiXSGmtFKW4yejfTFgzWirZNtk5qJI/uE3G/DAK4A9jKhN90K7xDaDfZuy
 dQXRrxtanADU1wZO1qP9llmX5Ag2ZwWzPAQAA
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767858732; l=607;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=os9j22xJFP9qjppUkhykfcLZmmFjfsSd3/7uBNcOhII=;
 b=Belefl3BhVf82d1SVzx5wRhmtuMs1/Cm1W26ufr7HUd/UeVn9v4d6YeDCqwK/niGHggybk//q
 W76mKGaa1W4CVcJsMqUbvujoG+XNDuCRe+LH+nlOMPMfL0D1nKCBt2d
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M4PK2jc64AMYUu0qcNIr9Al8svmGy3ObXpI17ZOJcqNSoHVAhFjKRRFg
	prri++cn4bNxiUd2vQoE2uIC6J8/dsuq+SJMuzOLKiOY8Tl1vSwtPFbN/ADK52tbi4ySVuy
	iqylR9oeUcCc8goVGTVlKXfBV0NafroGwGDFBnMGcQeXdTG9/d6xhFojYxol2K+6Nwndgsd
	ECXzqhVoMO3kDdkB6/SkmX9m6L9nk8b7HROyFjlC4FpOFXEONOJTJwSTcaBKWhHFkSCJlkL
	OurnzOt6d7Me1wtS9ijPPUj20V/lLHHOcgYIzys6c5mS50U2702N3zX27Rsl1GMjXNuqEED
	sav1wg/mBfV2bxL7CWPoLWS5KJT/jvR8jj1JBEAGfjZZU+BHJz1UXfUCDjjwb1ZkrewHKPC
	BEsJoXUvIusEYHCxxhJkg29hJ2x4NVEb618hFAd09+/TW1QOOSD+PSJF3tzk/Fb9KaBS+jN
	dpvr1KdNKQ3hwm0HsJXl2YO9W1zAF901bjdK/QMUWIN1slHIWnRl3pd8YsGJWnYn5lZVLRq
	va+X1QAUFgOXressoBvgT+TU5Rrmx24NSHc9BnyCDjq63sSTyRD7xKNghTDrtXnBTIMSOC4
	n3DLnbfGClXpROMmf8cEo8sW64WUspS1kT3cuz3Nd5z0/gseMCV0SEhOlzntQTM9MLSVVU2
	uCd83selfYn7cf0vLO1r7Ruu6pa3MkTmWG1ss/YH1aZzmiiv4cBJowb8Fb8mLF+uNZJsSyO
	6tAvDW3sevCQ/FdHyEwUw4Kft/pU0/L/Z8bq5+Xy6mKtxtCEDScR5UrgrZzIZ+fvqccZZ1R
	9B6zp2ds6PWyOsX7SiQFjIOVyTm1f8PVkJl+Wae0qRDTtY8xfZtI5ol3ILeQI1sRaa6LIbw
	0spjYJM/6ZFTbDEg+attC6HHncl8mGk79L8g3o4Bj+We1oMzT3sSwOMPG3ujAL8UtYlqRNy
	afcGQRJz1WtmRX9IduDVv5QsaoSKVCoK+hYQZPT64K1jr5JWgiEwK9IoGKi+ck3HrnGmceD
	avdvJdZAYJQhAWgI/fwz1qKM+wkLkmy/Is6wnGQhpiw1UHjR8o5VO3rlwLo17eGerStdDcm
	3XsUDS8j14teb4Mjn7aIPN/hA3YyNyj6VXfeou/1olW
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C in atomic context.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      i2c: spacemit: move i2c_xfer_msg()
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 314 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 237 insertions(+), 77 deletions(-)
---
base-commit: 003e84792ce811256114dee4f4ecc1cafdab2b0d
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


