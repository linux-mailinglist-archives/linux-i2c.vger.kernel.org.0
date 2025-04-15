Return-Path: <linux-i2c+bounces-10354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849CAA8A2F1
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 465F43A8484
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 15:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F8529CB32;
	Tue, 15 Apr 2025 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxgcx+y8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6522957A3;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731437; cv=none; b=lINCh6KtwcNF09ilbWYEQ92MZIq0tHaJP8fAo4zOeHtM2QMSzKpNY1TxITEtIvm9WmPlMjLrTJdkNo33eJ3ZliaGUULJPT2yvCDYMGsX2/rMOw/DlDO6MTRa65sckY/xvojdsV1+1Svd+SZVxFiWEluU1VQpysmkKAQUi6T6SG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731437; c=relaxed/simple;
	bh=ymN+LyNWSLpbDsTvqi1RfS1hGNC4G0Ay2QtUtBcebSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m8vuALhF0KqONStofi/tW97AHAW92WQrAC9l5QNpiTeJm3wEFwU1HR01zsQgdyqis3dsprDOcxBZCirLG2r9kNKnxqBccA+wYih6yMsJyki6jlhs0sJMQj/40q/0Y5aDWeo3KpZrdiWQuSFIIE3d0vjnyE492vHUBIspz6vXmv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxgcx+y8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21F3EC4CEEB;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=ymN+LyNWSLpbDsTvqi1RfS1hGNC4G0Ay2QtUtBcebSE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qxgcx+y8f/T0QqwUy4z4BMkQEGP5nKd1tpaCCc1jg1KFKOJGkzMKzu5Hvs6zUjBtO
	 papZAgHQ9egtnGMZCNNILgO67XO7nKVDpnB5DvbV0knXpFGLv/x6ui2RoIS2U42H1H
	 t/PilexvtBsfXdrjGfUHI+BdmkSRO8np4kHOjlMjylBhFd5noOwIRZ87XzPuBCTrfO
	 ptrL7N18ofihn7iZdUW3zSZOsSOAeSHVxuDoY+frBagPdYWrEjGNL7akfYIRsOqN1d
	 1P3kb3Bm9hKvDo/dcMvsOBeQudYo+gWBiB9btuxHyDeyoeBr7/jHjYT3dRYLacu1L4
	 r3bs1VLwQ8/Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DDDC369AB;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
Date: Tue, 15 Apr 2025 15:36:54 +0000
Message-Id: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZ9/mcC/1WMQQ6CMBREr0L+2pq2gERX3sOwKHSUvxCaftJoS
 O9uJXHh8s3kvY0EkSF0qTaKSCy8zAXsoaJxcvMDin1hstq22lqtghM8Wd35BVFncxqHrmt0Mzg
 qSojYj2Lc+sITy7rE915P5rv+QvY/lIzSyndwde1bPba4SsIcsCIePRL1OecPBfj1sawAAAA=
X-Change-ID: 20250220-pasemi-fixes-916cb77404ba
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=ymN+LyNWSLpbDsTvqi1RfS1hGNC4G0Ay2QtUtBcebSE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WqW39UeZ2Vs4Hu471P1vrbLFhq3/9kvNXFKdzyq+j
 7MlkbWwo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRm0IM/0y7N11kSl4vsPBN
 e11CRPJmjTvNtzVf/ehWW7f33Wexj76MDEc5bobPYdU5tcPjyDnljo4tLnwHrzcd9mDs/BEcN79
 4Ej8A
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
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Log bus reset causes

Sven Peter (3):
      i2c: pasemi: Use correct bits.h include
      i2c: pasemi: Sort includes alphabetically
      i2c: pasemi: Improve timeout handling

 drivers/i2c/busses/i2c-pasemi-core.c | 114 ++++++++++++++++++++++++++++-------
 drivers/i2c/busses/i2c-pasemi-pci.c  |  10 +--
 2 files changed, 96 insertions(+), 28 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250220-pasemi-fixes-916cb77404ba

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



