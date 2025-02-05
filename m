Return-Path: <linux-i2c+bounces-9306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D395A28C38
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12C33A37C7
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 13:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A6D14A088;
	Wed,  5 Feb 2025 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GoazA48I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8292E149C7B
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763194; cv=none; b=WsjtoYVKGfdJY75esa1Q74/AwhSvCClbD3NSrP428sOQZ+ZKOQgFpRsdiBgAVr9gy3wf1Wp/tlZ2+8egVPSmRLuGspLO5xQYe2x9mRgw4NEKexyKGwjvNaVBeJ/C3r1AhXhPFz+IwrBkiNiCIxwgjOxAbY+gn74Ll43BBm/Z/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763194; c=relaxed/simple;
	bh=ODcL6Yxbj5cfyzCwYxhXJf9ai40FiBV7YJaFkeuxK88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xq5Jwlbvoq1WANxwaqHn/Te7YrNRhPu4qa+g746XjBHjCsIYbzpwuk9S4zCW981r1K1tlk0p/MeedJArPMg9fcE0HQ8gKSeCvS/tq1gBuon56fhWGUKFcbyTGa2gPh+RqxkwZ3bHqXFNUUyxFnU4vPw+g4v5PbgZIeLDvzAhWgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GoazA48I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=FlKa0VMf792zDz
	DUcLRwxTAZBpC0lZ3knvWFQqm0lA0=; b=GoazA48I25U53I2FSlk4P3DPSvGZdb
	l6Ve1sNifpYrrU3sW4Ux+UxQkDxu1wXH5RUBbXpBhNDxc5H0pQ/+R2bi591e04Vi
	mi3M1DToajLx1uXgpcnKOnPjPvygblmRMZHNEVxQoXMSo15SXkMZccKGml3uhixY
	J6giFXUHlitajCSN0WqniasEXrHFGLkE8jWiHhP5dOhzes5eRH7SqrHBaJrmAH7K
	+HgQgpEKws3C/SsbvoLnsadokfQczRFfFdtCLowRIIp4w8/PDW6hX0TF+tyanXRg
	pQh4DVrfDbto5yAlfkMmmdyoruXJrFEr69xagmbWgKN+k86ctT6twR2A==
Received: (qmail 3407749 invoked from network); 5 Feb 2025 14:46:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Feb 2025 14:46:26 +0100
X-UD-Smtp-Session: l3s3148p1@RqgOWmUtisFtK/OC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 0/2] i2c: revert flag based client handling
Date: Wed,  5 Feb 2025 14:42:25 +0100
Message-ID: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turned out the new mechanism does not handle all muxing cases. Revert
the changes to give a proper solution more time.


Wolfram Sang (2):
  Revert "i2c: Replace list-based mechanism for handling
    userspace-created clients"
  Revert "i2c: Replace list-based mechanism for handling auto-detected
    clients"

 drivers/i2c/i2c-core-base.c | 113 ++++++++++++++++++++++++------------
 include/linux/i2c.h         |  10 +++-
 2 files changed, 83 insertions(+), 40 deletions(-)

-- 
2.45.2


