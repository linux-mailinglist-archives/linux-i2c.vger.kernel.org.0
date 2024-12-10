Return-Path: <linux-i2c+bounces-8432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC649EBF98
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 00:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92931167B62
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 23:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9D122C35D;
	Tue, 10 Dec 2024 23:48:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8735522C352
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 23:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.251.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733874522; cv=none; b=PZU/94VAEK04aBjAzhqROmBqASHNoHWL7MmvUOdzhoRupDYEOZRthzHluC+m9WkZFBzWR6Rg/nb+JxBQndt4y5mMtwfRncBLzUs6dkJveHbFM1MvDNeuH4UtgIcmav4uRgNW2dFI5THUweBLER+NbnKPjqn2X2ntdN8rJC4WEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733874522; c=relaxed/simple;
	bh=j5ER/U++K3NTN1bsXcSqkjj7oAx3VBI4ceUUXc1ubLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ovz+bTyhb2uEzEkK8vn1RtUBjYOGx8IAwHZeRZcUM1bcWi7fCDOA+CvmGT0r8QGCnwlfnrXRnWAsZU4KsXCBXXBe6wpAH6RlL4iQETphHeVdkVWNsc2GW8KR8YPT6V+LtFCFZyxNMgqOaoVgd5S0ycLFmySo/TNfeVlSQhRDQIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.251.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.17.147])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4Y7Dy40fxJz1qLc
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 23:11:40 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-4ztgx (unknown [10.110.96.141])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C28531FDDD;
	Tue, 10 Dec 2024 23:11:39 +0000 (UTC)
Received: from etezian.org ([37.59.142.113])
	by ghost-submission-5b5ff79f4f-4ztgx with ESMTPSA
	id xdhtJ6vKWGesBAAA0jbQjQ
	(envelope-from <andi@etezian.org>); Tue, 10 Dec 2024 23:11:39 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-113S0073d1be6e0-ac99-4a32-abac-3ac2cd99c39c,
                    FE3B76875E3B0A6FCB1003007887B313CBEB2737) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 0/2] Qcom Geni exit path cleanups
Date: Wed, 11 Dec 2024 00:10:52 +0100
Message-ID: <20241210231054.2844202-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14604047693996165703
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrjeelgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddruddufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth

Hi,

I am submitting two trivial cleanups in this series. The first 
replaces all instances of dev_err with dev_err_probe throughout 
the probe function for consistency. The second improves the error
exit path by introducing a single 'goto' label for better 
maintainability.

Thank you,  
Andi

Andi Shyti (2):
  i2c: qcom-geni: Use dev_err_probe in the probe function
  i2c: qcom-geni: Simplify error handling in probe function

 drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++++----------------
 1 file changed, 25 insertions(+), 28 deletions(-)

-- 
2.45.2


