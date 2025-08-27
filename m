Return-Path: <linux-i2c+bounces-12437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED16B37C0B
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 09:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 266F5188FB1F
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 07:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7C23148C4;
	Wed, 27 Aug 2025 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="X9e82ra+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42D313539;
	Wed, 27 Aug 2025 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280444; cv=none; b=k8R01rp8aqEwUhh9YuqldmCZqbHdvVdS1lwxKk4SGahxmVekgmNhL46j+cZpJfJlVdceUg/9HrC2zkaQjMw3mzRVsRiGVdVXB9cZ3/qJvWO92o7zicfXV2KawLft88/DkqpzEn6xbMI+dlCzA/RjQxGqA0bx3kW7uMPy8FG/MU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280444; c=relaxed/simple;
	bh=N1l9BD5aYzgsunuAJ2sdFXf5Toyl9HnAD50ZzdGOxBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CsTKHK/3vaz5hcMmfrQz9W1gFWLl0Te2bC/42wvL8qP8EPPC1P0c9CgWyKD9VWdtpNy9MzIg4eS9osJr0hkW0aibvcrDo8DUuV3CA5IJUUe6FaSY3+at1qZskbNlvXqRQovMFPduBTEshUBMGzUEragy66rnwxRxJvJEVsfun60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=X9e82ra+; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280366;
	bh=QThF+75mvK0D3/F6dA4IaBzJtaqxmaQQfMku8hdTcLU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=X9e82ra+UZk6wyaSHOZebatzg1SIdqjXQcgpp4iY2odibpR+NO7rmxUL6ahpQ0a3+
	 Fk6AnfCgMTyTBZuhOlqX23igcQyFjAxhyilKnf7dJ1HmNpLOhktX+cSHHkmQCtG3/s
	 lbMONpTsCeszuT4U7W6lRDLpHu34xoOoHcrgC10Q=
X-QQ-mid: zesmtpgz3t1756280359t6c5d6c34
X-QQ-Originating-IP: B+Ve4HLvlUCXEtyPvRob/G/ByVcmx1LXXi0796ksh6A=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9113250506104618191
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/6] i2c: spacemit: fix and introduce pio
Date: Wed, 27 Aug 2025 15:39:07 +0800
Message-Id: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABy2rmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3WxD3UyjZN3EkvzczGTdNMNES4PkFGMTYzMTJaCegqLUtMwKsHn
 RsbW1ADEyFLVfAAAA
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=1053;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=N1l9BD5aYzgsunuAJ2sdFXf5Toyl9HnAD50ZzdGOxBs=;
 b=DQOw1nUJeivhvEv6BmN8IqO13q0xCkaMKMz4pAupEt8dG9dXLnWPpoLx+iK588WpW+gP8M6Re
 ouclWmnIF69BNA4zp6EBDYpp1OlUQ4L+3dVEvcMUG4kw1r6TRxU11GK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NlrfLQhmr2s5GmGI1P9u1XcpGzMBnCyEsWY8IvJNvGWafmBtIE3X+N6M
	JKI2k5ZVP7Mb9CHFjx8fhKgZFvWUWsCsAW7YfLAa9SKRwS/YqLpY4jyIFzkdyFTuuM5grsB
	SunVAoQtHzMYPZUDdQXy/dz3V0N3J5i6LeIVg9Rbn0X0LllEcYWiNJShbVRjyyjquRotIlU
	TqROa3n0MAPFW768X4mTTxtMJSONkoIdZDzJLt+VKZb4a2qhdWaQOA+FfS8DAR7cClw/kyM
	JF335d0N0avPcJZqV/GaYMHfBCXXyFEW5G2U2PO6Cz9BBI3asZAuWz0YjydopYUpEOQ4/Dz
	uQCF41/6LFvkgOvG7+cATD1qI8CDx96GfQjI/fkWgmvNE8fzh9x69zhkQKG6kME9ywlh0wl
	nSwVyEG3x49A7EmmhRzs8Ineci1BtaaeHwfswME0nJBDM25TtFH0jpoPXPI9igg/9HTyA11
	kG9sK0XF2vIm+YYaiBbjaxYZcIr0x4Juaw1PXMNOxO0oSSZIGGQ0dGK4j3ZYEw0KcRLl+6w
	etCnzz5HfAa1G17epYvUn7soI+CkGuaLPiD8MDvZ96g5bMq9XMYjHdO+TeYBEnhd6Nc9t2H
	wWSgDWhR6nB+J/nP2cw7KhaYFywYzd9Em3en23BOPsDRzNVMorPS5AD+mfHgoEBGYiC+Ocf
	xShyfRXPtAWAb209g9z+E4r8O0TdPLKqDZF6ICFRStCJwbPOA3RDh5Hf3zuCrA8CNg0uja9
	Y2ykyqor3CZjF+IyOWrDc/jMz0USgQ3f7zxT2M+yerSPX/HN2d2p4tyudZVWqRoKynfuWO7
	dK9vq0w3mJ0NRycWLtgjtMFzCkHxKZrPZlndxkWRq5P2FGT8X7i7FymHwV3Gpeirbf2W3rr
	7dEBdljI60F0nK8PiPOV+fPKf4H/7guXR8cRUmm6WuRgrNGAo2eeaehlQpPT0dOA1EKY/cX
	Wazdm2+Hysd891uPyUGg0P6eEUzU7wcxU1TZGGFdwcdBko/5ffYXdRUe8Iv4HNDQu0T++51
	C6eQzTEcBTTr6FMjitYfYZsdi6us2cB2uvf2EVL8r/XnPmhQD74sYIWmMb2Euz5GlSgvzuj
	hwIUBNeiOivESBLjz16xJ973XKlXjBxqphEHmQWNKdm
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Previously, there were a few latent issues in the I2C driver.

These did not manifest under interrupt mode, but they were
still present and could be triggered when running in PIO mode.

This series addresses those issues and adds support for PIO
mode transfers.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (6):
      i2c: spacemit: ensure bus release check runs when wait_bus_idle() fails
      i2c: spacemit: remove stop function to avoid bus error
      i2c: spacemit: disable SDA glitch fix to avoid restart delay
      i2c: spacemit: check SDA instead of SCL after bus reset
      i2c: spacemit: ensure SDA is released after bus reset
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 202 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 163 insertions(+), 39 deletions(-)
---
base-commit: 5d05b05c7086628473f01e860c63110d1b42cd29
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


