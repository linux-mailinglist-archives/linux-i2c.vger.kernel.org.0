Return-Path: <linux-i2c+bounces-8779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5A9FD8CD
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 03:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13329163874
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 02:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B00318E3F;
	Sat, 28 Dec 2024 02:09:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 5.mo581.mail-out.ovh.net (5.mo581.mail-out.ovh.net [178.32.120.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443DA94D
	for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 02:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.120.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735351752; cv=none; b=AHObH5iRnRnNpnwbs72YQb3RIVqk7XkUUIrRjQyjfvKbGABMSzvrhE0qv2oermXnFwGWlyZJRvuMc9TPdrl7oMLDw7/T8PpLC9v6KDQfF1JPOizT3xgJwCFRqinesiM8jUSs5dOpPXvnJQj1yrbEyV1VhKqV+M/D4KOsZzXj+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735351752; c=relaxed/simple;
	bh=DxdHL7LIje2MX7oGa/lfMwXrPUrGRfOLbpDUT/+I7wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h1B/VepEL0ZNsneGVOGGsdtlb62s7TDSL4zoaTmscX/w4LleWkAmyZLQCXZXmrYpMNmVTY3vnyLsd64PamKM3UP63E1JLUPXc1u8XqXtICVt1qCXQLOU76Wz/kxDTl/oLzloBlMXWpZUBeN/sB4DazW3JTU+LqH8Hh0E6Kz1uzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.120.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.25.209])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4YKgHJ6QSlz1Ghw
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 22:32:44 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-mwjd2 (unknown [10.110.164.1])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9905B1FDBF;
	Fri, 27 Dec 2024 22:32:43 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-mwjd2 with ESMTPSA
	id iI9sFwsrb2faWgAA37XCKA
	(envelope-from <andi@etezian.org>); Fri, 27 Dec 2024 22:32:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S00192d5a8ae-d094-4402-895c-817d716359ce,
                    1CF389E8DC6EE1CDBE94366E1222F406669E166D) smtp.auth=andi@etezian.org
X-OVh-ClientIp:197.26.54.218
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v3 0/2] Qcom Geni exit path cleanups
Date: Fri, 27 Dec 2024 23:32:28 +0100
Message-ID: <20241227223230.462395-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3101854246940052045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddruddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedtveeuieehfeetudejhfehleeijedvveetleefhfehuedtleektdevjedujefgvdenucfkphepuddvjedrtddrtddruddpudeljedrvdeirdehgedrvddukedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth

Hi,

I am submitting two trivial cleanups in this series. The first
replaces all instances of dev_err with dev_err_probe throughout
the probe function for consistency. The second improves the error
exit path by introducing a single 'goto' label for better
maintainability.

Thank you Mukesh and Vladimir for your reviews.

Thank you,
Andi

Changelog:
----------
v2 -> v3:
 - Don't forget to assign ret the proper value.
 - Add tags in patch 1.
v1 -> v2:
 - Updated the final return statement to return 'ret' instead of
   '0' for consistency. Since 'ret' already holds the value '0',
   this change is purely aesthetic.
 - Renamed the exit label from 'err_off' to 'err_resources' for
   improved clarity and alignment with its purpose.

Andi Shyti (2):
  i2c: qcom-geni: Use dev_err_probe in the probe function
  i2c: qcom-geni: Simplify error handling in probe function

 drivers/i2c/busses/i2c-qcom-geni.c | 56 ++++++++++++++----------------
 1 file changed, 27 insertions(+), 29 deletions(-)

-- 
2.45.2


