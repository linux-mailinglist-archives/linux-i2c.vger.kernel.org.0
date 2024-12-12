Return-Path: <linux-i2c+bounces-8470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A5A9EEA9F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 16:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB022162AA5
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 15:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C4E21661F;
	Thu, 12 Dec 2024 15:11:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 17.mo583.mail-out.ovh.net (17.mo583.mail-out.ovh.net [46.105.56.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2081F21578A
	for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.56.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016295; cv=none; b=s3FMdOLOtzZGnwTgrsGoWX5n34EY1YqWbdjGmVi6c53EovY1LWulTAvjmAqSSnT4bKaEvaVwVDaXcSOZuFVapLV2m5ANxRoX6wPPjL9oQkRTHV6kNyng6flTQ3v0XHL6UjW11h00eU+abHAfz6dFKqH+ZZlRacPMkG8t0J33zSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016295; c=relaxed/simple;
	bh=ZpKue6r4eSqHb+2lWRYfZYYoTjy7HSoiuGKtYVz9IMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X+9k9sD0LrixHUp854N6kB2O2IgSdgj9KdEIfH747QW0genjmIiXuUAC+DGTUgZTg5q61RoYaE1CQ5Oy2cBxig5B4SoKXRYe7Mqj0jKPlHC6jhfKu14/1tVcGf1XtwWaxKL72+GhKQ5awXJnj8FjqiK1u7hT0wO0lh4wrcD2t18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.56.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.118])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4Y8DVN67n4z1Yv3
	for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 13:54:36 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-ks6hw (unknown [10.110.178.25])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B94391FD4F;
	Thu, 12 Dec 2024 13:54:35 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-5b5ff79f4f-ks6hw with ESMTPSA
	id gDzDGBvrWmfP8QcAwrclww
	(envelope-from <andi@etezian.org>); Thu, 12 Dec 2024 13:54:35 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S0045e79d698-0c10-4535-8aa3-c02f7cae5ccf,
                    7E8E14E11F102121CE247F47C6B4DBC0808239E0) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 0/2] Qcom Geni exit path cleanups
Date: Thu, 12 Dec 2024 14:54:14 +0100
Message-ID: <20241212135416.244504-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16941415900673673799
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth

Hi,

I am submitting two trivial cleanups in this series. The first
replaces all instances of dev_err with dev_err_probe throughout
the probe function for consistency. The second improves the error
exit path by introducing a single 'goto' label for better
maintainability.

Thank you Mukesh for your reviews.

Thank you,
Andi

Changelog:
==========
v1 -> v2:
 - Updated the final return statement to return 'ret' instead of
   '0' for consistency. Since 'ret' already holds the value '0',
   this change is purely aesthetic.
 - Renamed the exit label from 'err_off' to 'err_resources' for
   improved clarity and alignment with its purpose.

Andi Shyti (2):
  i2c: qcom-geni: Use dev_err_probe in the probe function
  i2c: qcom-geni: Simplify error handling in probe function

 drivers/i2c/busses/i2c-qcom-geni.c | 55 ++++++++++++++----------------
 1 file changed, 26 insertions(+), 29 deletions(-)

-- 
2.45.2


