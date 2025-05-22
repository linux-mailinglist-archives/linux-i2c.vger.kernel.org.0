Return-Path: <linux-i2c+bounces-11100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 400EAAC04DB
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6D48C803B
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 06:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612BF221FCF;
	Thu, 22 May 2025 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cti6Fn8I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD216D517
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896933; cv=none; b=SK/dpD5YnMVc57/8o0FBcGr+ZgXN6mjgudZ/6SJJUZk3rMvYaezGmKdEjOtQiDtmor2aYUmp3KcGhU3beWRFxGXrVlqXx00fcOcli/u3suLDqN3zUF5jb759rnDtnMg2kQvGTKjv1UK4GULePdczOMHB8a7qoFCAgPecsX4yewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896933; c=relaxed/simple;
	bh=I42t90yixrOoWP5JYYdtz0IiajboH72fYmBz+KxKpUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B1pwYtb01aNn1hhQaMyiDq2QgKfYD6JXoKq/hEqRFweXFVlqZTOfQxjsiBMzuy8mbjHxo9l2ISaHYFdBUL+Xg8gAX6lb5Jw47Bq5q43ZSU6SnGCDOhMqDc9bCsettI3c0yNd/JAW8qL77OoZ9OTiA03/gIiSeDSrfujgn7LVEKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cti6Fn8I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=3Z7SZmFSISd2bH
	b5yExGAn35YPe+IQVw3MZb3heqdRw=; b=cti6Fn8IxmcKEWQFy37JatDXaJjCHx
	OegVRU7qk4gVvXul4J28dG3a4QwbEqrKOAX54PUD9vBl2N7WPWMWF4tVI1CpN6dp
	c3uQ6UF3T7OhYCL3L50svry72rYpJVCELXgXVkIe4I/17wJDyxIKS3M1IymLs1LG
	8xiwAeFlO9ggUT2+64xIGhGIo0FTczajLxdOZNUR8IiyjChQVw5u2O2GurGEaDzn
	4Hf5nyCB2clt3Cy9SpJCI4Z/bp0rCxjbNkN11ZyWMJ9TmtgLK2Z33gZ0uNHn9BC0
	HN2zIsk1T8MJce4dM25HZWsNj9Z8yFVdNTl4NLMpRxtNeeAvIIJex8aw==
Received: (qmail 3537885 invoked from network); 22 May 2025 08:55:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 08:55:27 +0200
X-UD-Smtp-Session: l3s3148p1@LH5097M1MuYgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/2] media: usb: hdpvr: make use of quirk flags from I2C core
Date: Thu, 22 May 2025 08:55:19 +0200
Message-ID: <20250522065519.4138-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We found a pattern that could create USB protocol violations for devices
which embed an I2C bus and use I2C message lengths directly. Patch 1
fixes the bug for this driver by using a quirk flag. Patch 2 is a
cleanup to remove a pattern in the driver which can also be handled with
a quirk flag.

Wolfram Sang (2):
  media: usb: hdpvr: disable zero-length read messages
  media: usb: hdpvr: use I2C core to handle only supported messages

 drivers/media/usb/hdpvr/hdpvr-i2c.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

-- 
2.47.2


