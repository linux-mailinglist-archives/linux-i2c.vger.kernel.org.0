Return-Path: <linux-i2c+bounces-3908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FAE9001F5
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 13:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65CE71F24F45
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F72197A8F;
	Fri,  7 Jun 2024 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Du7CJyl3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14924196C65
	for <linux-i2c@vger.kernel.org>; Fri,  7 Jun 2024 11:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759061; cv=none; b=Y80/flxoid8jRbGT85iDHAFz2is+GjuNqRz/tXYoEIsAXIjIM6EwQCxro4ejuKXOSiMOYAhiKIoeNQwfBeiZ/lhzUI19Xsa+XvZgia/9HG0YRP1fNPVcWVyDtX2OnKR0WLG0joOO4lSGhlAKsRDsBsB00bvWm2kPdBbUeP2Wuxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759061; c=relaxed/simple;
	bh=OX1iv+64DiE2nSrw6WF/G7zGJLeBH5NejPmMm3YR04w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eouJjY1NfS4hIZ6y+5NAlkh+yepLdEBhkzL72heWIo+mdXSQ2+uWQuZo+B4BcaLrMaNpkMbPfEut/B7E/60GPrYh2xhm8aSmloS+zqD7zyPbXfAPTgtsgkCpoCZwAisWknhBQ3QrHmXYgWrMjo+S8euDVl3d20q07xXS0/7GHM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Du7CJyl3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=k1; bh=t
	thfMhzBIcyniI/MfPn1HMJ6gg2hCjtIFW+yt0boddo=; b=Du7CJyl350g54fD5L
	9/2AyhsP8/Z3Y2XPJujbOzyy0UmpNcEC3HJ5BvUmKNw5lk3sg+dc1MmDtXcFg+0v
	WtWicASxLqWn+aECbwW++PBmNUVv/HaweA/5KFuWlfgyKYEucY6PtDwDZOOnesQR
	6YUUajRhhiR511E7P9MnxfvuzeHG16IKw2R+pY4Qblr5+KLBvfRKj51uMS+uTd/J
	eRmtW6IRuGBEq6qU8z07mCFqL7wHRsprvpghQTDttOQSf5eM6h/g517+wlRTZQoG
	iSXRO35TLSrIj0VcYHPA15rtmwMsqAYMs1pgGvARgIoLfbjp83soZXRjR9AFuxdd
	MS5IQ==
Received: (qmail 3292124 invoked from network); 7 Jun 2024 13:17:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2024 13:17:32 +0200
X-UD-Smtp-Session: l3s3148p1@KNkc8koaBrAgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] docs: i2c: summary: update and use inclusive wording
Date: Fri,  7 Jun 2024 13:17:19 +0200
Message-ID: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The main motivation for this series is patch 4: switching to
"controller/master" when defining the I2C terminology. This sets the
base for further improvements to inclusive language within the Linux
Kernel. The other patches are improvements found on the way.

Wolfram Sang (5):
  docs: i2c: summary: start sentences consistently.
  docs: i2c: summary: update I2C specification link
  docs: i2c: summary: update speed mode description
  docs: i2c: summary: document use of inclusive language
  docs: i2c: summary: rephrase paragraph explaining the figure

 Documentation/i2c/i2c_bus.svg | 15 ++++++-----
 Documentation/i2c/summary.rst | 51 ++++++++++++++++++++---------------
 2 files changed, 38 insertions(+), 28 deletions(-)

-- 
2.43.0


