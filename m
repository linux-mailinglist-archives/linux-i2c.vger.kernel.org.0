Return-Path: <linux-i2c+bounces-10644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B46A9E2BB
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 13:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEE97171E08
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 11:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611A8251796;
	Sun, 27 Apr 2025 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m750C3Cb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132DF1F19A;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745753466; cv=none; b=cS7MY1Q0XwamQ9wRRlszK3WKSfd9qXt0bQ/Qw+xQOtwhnyV4/XeMoxZEIBWsU85zlWvCqpIpcIu/IfE5j5YmSciqlvjTqj46j6EFaMWHIs2wSd/JGi8NhpGhpYpSwCKJIeyBcs5wJjMpQi0v/+muuqJfP76sqCxDojTy0FW/ODI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745753466; c=relaxed/simple;
	bh=+BsL+X+30brRz3phNXt0JYIMKKNWV3x6jUYpT2ksFCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EiHApFMBq5AKFJcMltBXy29Yx8bjpYmpQvlqLYFyHmYM6WDrIyamUk3rQn8givSAV+RfsM+XMY5ueLibVK18SoixnkjcxXooA/+2pQkdXcyzL9VDztGLJt9VXMKwKI5V29/UO5qKq+Cj6v4V2MbXIaH7dWqSj/zMbqns5vshDhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m750C3Cb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 842F9C4CEE3;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=+BsL+X+30brRz3phNXt0JYIMKKNWV3x6jUYpT2ksFCo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=m750C3CbibW7p6DOy1lkSdAcpLZHEljbRTxawEmL1bpedKtHwE3ya3Nqqa44vHTAM
	 pQ5UlToty0iVLL7EeD9TY81QeLy7W29IL8QAhErHW1bG3ZLSlybm8sKbsmJ6IIWE5D
	 0OAZMF2gWDUmQZ3ICxUomYWh9/gHcMptYK8QBe8bvIpokV9FgZtoYZNDBVm/mEDpSZ
	 q47y7QrBY4dWRTSF0v2N6e5SMrM0MhGHyiw0erB9m/7wocDwyDjkLoycvFZ8CMvy7t
	 b/LyBVDrLz6ZTipOrGYYzT+91vU+P4WvO6sUxeg+bAVVOCbLWJ9XTQq/GM0aJ3h+MJ
	 snH6jkRNg5DHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78249C369D1;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH v3 0/4] Apple/PASemi i2c error recovery fixes
Date: Sun, 27 Apr 2025 11:30:42 +0000
Message-Id: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGIVDmgC/13MTQ6CMBCG4auQrq3p30h05T2Mi9IOMguBdEijI
 dzdQmKMLN+ZfM8sGBMhi0s1i4SZmIa+hD1UInS+f6CkWFoYZUAZo+ToGZ8kW3ohy7M+haaunXK
 NF2UyJtweZXG7l+6IpyG9Nz3r9fqFzD+UtVQy1uitjaAC4JUz9iNOmI4Rs1ixbH6A07ADTAECO
 Nu0YDVovweWZfkAk4U9Uu0AAAA=
X-Change-ID: 20250220-pasemi-fixes-916cb77404ba
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=+BsL+X+30brRz3phNXt0JYIMKKNWV3x6jUYpT2ksFCo=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaP6/aCa2dTduGNTKVm5dHLRFrWO33Iefu73uVP578
 9RVu+hWRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiR3UZ/juGl3/+t3Lz1z+s
 63ZvnfBj/22L5Wl7T3Osk5l+q9xubtAihl/Mswo+Tw7s/PzwzsJpKVP/dk3f+00uItXm6OWY8mW
 rDV5xAgA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

Hi,

This series adds a few fixes/improvements to the error recovery for
Apple/PASemi i2c controllers.
The patches have been in our downstream tree and were originally used
to debug a rare glitch caused by clock strechting but are useful in
general. We haven't seen the controller misbehave since adding these.

Best,

Sven

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
Changes in v3:
- dev_err instead of dev_warn for errors
- Added PASEMI_ prefix to the timeout define
- Declared new variables in the innermost scope they're used
- Re-added a dev_err that was dropped by mistake
- Removed already applied commits
- Removed open-coded readx_poll_timeout in the non-irq path
- Reorder commits
- Link to v2: https://lore.kernel.org/r/20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev

Changes in v2:
- Added commit to use the correct include (bits.h instead of bitfield.h)
- Added commit to sort includes
- Moved timeout explanations to code instead of just the commit log
- Made timeout recovery also work correctly in the interrupt case when
  waiting for the condition failed
- Used readx_poll_timeout instead of open-coded alternative
- Link to v1: https://lore.kernel.org/r/20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev

---
Hector Martin (3):
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Log bus reset causes

Sven Peter (1):
      i2c: pasemi: Improve timeout handling

 drivers/i2c/busses/i2c-pasemi-core.c | 107 ++++++++++++++++++++++++++++-------
 1 file changed, 88 insertions(+), 19 deletions(-)
---
base-commit: 7cfa6946c58989507a52f38a1267faa74a65ab0e
change-id: 20250220-pasemi-fixes-916cb77404ba

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



