Return-Path: <linux-i2c+bounces-4949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8F92F3A8
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 03:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D232B21951
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 01:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6298B7464;
	Fri, 12 Jul 2024 01:49:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 20.mo581.mail-out.ovh.net (20.mo581.mail-out.ovh.net [46.105.49.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA039454
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.49.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720748941; cv=none; b=NtBHnLP1kM1Pz4cfX37P3EiBEs323JWnyAMTPBfTih9WBlouALWuzI44C8cdF4kvzn++ycwZt4uFCJ8LltAReyTcmb3Aq46ppI2j5+zZ2iuQOEl0+qPmxfBG8SAY4cJXQd3RIwKI4rMZBUgEkRF8VsluGgjvVM/p+HPmM0VAqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720748941; c=relaxed/simple;
	bh=GK3R50NkNch+lbRG9vDNLoiia9t8YCkGRD93QMmXbH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYtAPTZ4s99sxQ6zpJ9ucNWney7BpzYBqs6H5iiAPEb2XGpMlLNvLC8Q6KjBZSa9THoAKDYMOHTOu0TM7z/G3tx3rtjiQWLEFLJrgN1BJv0AKraBTkJEYaNGnLl0baP2kb0VqNaCjoiTujqpQ5BLckW5ftRykyCI2zvcJBHiIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.49.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.176.203])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4WKrL53xxjz1HgS
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 23:20:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-276s8 (unknown [10.110.96.35])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B92B51FDE0;
	Thu, 11 Jul 2024 23:20:11 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
	by ghost-submission-6684bf9d7b-276s8 with ESMTPSA
	id d61dKKtokGYCRycAIhEDZw
	(envelope-from <andi@etezian.org>); Thu, 11 Jul 2024 23:20:11 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R004025ef779-b8ef-47a1-8f81-7534dfa48c8c,
                    47FBFB77BDCA57EA66E7955FCDEBFA84A3B4AB1A) smtp.auth=andi@etezian.org
X-OVh-ClientIp:194.230.248.195
From: Andi Shyti <andi.shyti@kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 1/2] MAINTAINERS: i2c-virtio: Drop Conghui Chen from Maintainers
Date: Fri, 12 Jul 2024 01:19:25 +0200
Message-ID: <20240711231927.3103820-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711231927.3103820-1-andi.shyti@kernel.org>
References: <20240711231927.3103820-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7542684953390811759
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrfeehgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeefvddvgefhhfdtffefleehheevfeffhfefudehudejhefhjedtgfffhfekvedvtdenucffohhmrghinhepihhnthgvlhdrtghomhenucfkphepuddvjedrtddrtddruddpudelgedrvdeftddrvdegkedrudelhedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht

E-mails to Conghui Chen have bounced back:

  <conghui.chen@intel.com>: host mgamail.eglb.intel.com[198.175.65.14] said: 550
      #5.1.0 Address rejected. (in reply to RCPT TO command)

Remove him as maintainer of the i2c Virtio driver in the
MAINTAINERS file.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
Cc: virtualization@lists.linux.dev
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e26555e52bfd..96745f7971100 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23859,7 +23859,6 @@ S:	Maintained
 F:	drivers/vhost/scsi.c
 
 VIRTIO I2C DRIVER
-M:	Conghui Chen <conghui.chen@intel.com>
 M:	Viresh Kumar <viresh.kumar@linaro.org>
 L:	linux-i2c@vger.kernel.org
 L:	virtualization@lists.linux.dev
-- 
2.45.2


