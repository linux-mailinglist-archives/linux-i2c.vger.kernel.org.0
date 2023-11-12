Return-Path: <linux-i2c+bounces-91-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 579787E9303
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 23:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 045BD280A9F
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 22:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5BC19465;
	Sun, 12 Nov 2023 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="beafTtYw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1388182DD
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 22:54:54 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6C92592
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 14:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=3XXX0zQ/nYYYM1
	tqk4L/LfUMpi+ajf3hbJjlbJDjsIU=; b=beafTtYwE2iZ3igRQsXZPODJZ7Sn5E
	LoXfHBzHrIn3u2qz46b7TTFglSjGJYoZrKATy1MOiwO4U2Jo5TttbJsIGsLK8HJc
	l4oSNqt4TwB3XBpwsXtGmNdT/eyVft+iiQpl5xUZY2sAtO+twWJGPijc3Ud37Fyd
	0vQmeNkNflVhDXTTFPLhBpzVWIfZdKETsDwwHiZcSTHJs8KqxUH6JO3hA/UcTFg/
	XajQGSddAMKhLrIrQ5Mn58lsu6ejErtws+LE99wzPJaYFR5sbUIcwUJ79dikq+8J
	xSFFBInSAm0eSxyyoPMXUphwjIhN2djzc+yH7Eeq4QbRKY09+8mA9X3w==
Received: (qmail 4066220 invoked from network); 12 Nov 2023 23:54:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2023 23:54:47 +0100
X-UD-Smtp-Session: l3s3148p1@wnCocPwJTbYMv8XD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/3] i2c: create debugfs entry per adapter
Date: Sun, 12 Nov 2023 17:54:40 -0500
Message-Id: <20231112225444.4487-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two drivers already implement custom debugfs handling for their
i2c_adapter and more will come. So, let the core create a debugfs
directory per adapter and pass that to drivers for their debugfs files.
Convert the two existing users as well. Tested on a Renesas Lager board
with the i2c-gpio driver. npcm7xx was tested using QEMU with the
quanta-gsj target.

Changes since v1:
* rebased to something close to 6.7-rc1 which includes i2c/for-mergewindow
* tested npcm7xx with QEMU

Wolfram Sang (3):
  i2c: create debugfs entry per adapter
  i2c: gpio: move to per-adapter debugfs directory
  i2c: npcm7xx: move to per-adapter debugfs directory

 drivers/i2c/busses/i2c-gpio.c    | 34 ++++------------------
 drivers/i2c/busses/i2c-npcm7xx.c | 49 +++++---------------------------
 drivers/i2c/i2c-core-base.c      | 11 +++++++
 include/linux/i2c.h              |  2 ++
 4 files changed, 26 insertions(+), 70 deletions(-)

-- 
2.35.1


