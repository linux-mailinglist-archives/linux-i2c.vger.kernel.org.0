Return-Path: <linux-i2c+bounces-3070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2108AE5BC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C382819D2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9930C86254;
	Tue, 23 Apr 2024 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YAMOvKqn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204C084A54
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874416; cv=none; b=TU3tj++N0G9dMxzrnHsEw2irD3ibdJiKy25adQQFLTV93zizavYQmf0EKitj5YsaL8zTP5WB9THZMUkMZdfICR7Qmb8WYvzzEE8gAALiYERVsMtFMuJ/iSXgY4SGLQARRmsCV3yJNbPWB0YfgqOUWHVII6CrxfAKRJ907qwpHQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874416; c=relaxed/simple;
	bh=dBygvkfQXFWBSlvZugPDlWsj3ToXbLrbuNMm4aF8/f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q9PwwIfgYtYNpxzjjlAIbEwqnclY5QMhhGyRNcg4pRYTCRsiugCOIWmYOn+cNaOK87uakvvdbj96gwyEbkrHMwnwKC8JlU3XsSWFUwEjuRai1eM8KG+DdIhUXI3NIb5iZeqWBSnKkj0n21+HxnQpl++6Bv1agxWMnuT/o8JN0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YAMOvKqn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=wVUlkU87NdfwB2
	SPpYib6Ju62vC1Z5r1sdhyNRMqKbw=; b=YAMOvKqn7LQ6Pevp+kBOKD7XhzAJYb
	TrbiVG86tHxgIHe1p2W/7x/8HIs55qN473ZkYvy8eCqdcSPcrL6stcj28u6Rzf4H
	8ogdQH3zLS0IA9o3zrepLBeD0iNsSJnBRVomUZRFeyJZ27Y7LKypdowI6KO1nRWd
	3iUMsA1Ff7wNrdn36GpNCSC702uO9nK+ESN9rx01AfvAgMypRb64kiez8xK8U0EA
	JZRs2jhedmhfUL2wSgAE+3L3EPLLuKctL/TN1OjiSfbhugL2SDMssPQSf2yqJKwR
	EivmBRVQM7E6xGiJ1KCmONqOdaPkpoK+ESfWLhs1o+ttfOFm5lhyxFKg==
Received: (qmail 215871 invoked from network); 23 Apr 2024 14:13:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Apr 2024 14:13:27 +0200
X-UD-Smtp-Session: l3s3148p1@bzNAe8IWOMIgAwDPXxiyACzheF6dGXh7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] i2c: remove printout on handled timeouts - part 2
Date: Tue, 23 Apr 2024 14:13:17 +0200
Message-ID: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is the continuation of the previous series, largely applied by Andi
meanwhile (Thanks!). I improved the i801 driver (only one debug print
left) and added the three ali* drivers which I overlooked before. Hope
you'll like the patches...


Wolfram Sang (4):
  i2c: i801: remove printout on handled timeouts
  i2c: ali1535: remove printout on handled timeouts
  i2c: ali1563: remove printout on handled timeouts
  i2c: ali15x3: remove printout on handled timeouts

 drivers/i2c/busses/i2c-ali1535.c | 8 ++------
 drivers/i2c/busses/i2c-ali1563.c | 1 -
 drivers/i2c/busses/i2c-ali15x3.c | 4 +---
 drivers/i2c/busses/i2c-i801.c    | 4 +---
 4 files changed, 4 insertions(+), 13 deletions(-)

-- 
2.43.0


