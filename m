Return-Path: <linux-i2c+bounces-1648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7874184B880
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4263CB2D2B3
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5853132C20;
	Tue,  6 Feb 2024 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YojNNIh3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278A132C28
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231151; cv=none; b=Cwmr9ez/spRNvMPy4jZ0LYmSzv6jIbtF3lwKJHzJECgj4cpFejv9k8/NLWaMD+Hebu2iYNEIAii8AP6ubZUF3pAQNcen63OfUWnCrKvYG4/2VpIswHpE/er39XTA+iCYr7hvTgM5hfvJ56/lMLQTPw8ex+jQG2N223+5nYlhCAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231151; c=relaxed/simple;
	bh=RIeQppRksYdqroSbN6cbQBlwoXZYeq5mRmaIR1aKDJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0QnfxD2c//FU9ZlX/9DuQ3tox/+VyKcVy7uSeafKjP1RiZdmG3RJPuRJIRVIhsul/cb1KaBMCvFf/MYc2SPFedZ5NaPBvl+leJRv9QmPQBDzZcZJtzpzaEHaBPS+DOzQopQ/TFlTrB9G3gP4b8vw/M2QHscJs65PALytznogec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YojNNIh3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707231150; x=1738767150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RIeQppRksYdqroSbN6cbQBlwoXZYeq5mRmaIR1aKDJU=;
  b=YojNNIh3BGiEKxli5yeRR0Y3xzWFo46LMRLZq8XMJMi25Fg+nlx5Lu7g
   qp+IGU9Po3OAAEJaz4Smh2jSJ5OO6UBBHm6jtvU9OeJxw7fjaq1+zKbED
   JbuRZqEcMAkyRVrbVmfMrTvQNN3wwM1N/pqlxbmMEal2lGDzzS5FjiZ3g
   8Vc8HUvsCL3UdsVUkro6D5T+ancR2xAV/PF0JRW6EjJ6XuzxrLT9bU0tQ
   S2SGZYDEp3lZ6Qt21TWyDohFqWailfshBziX8QemrLlj0Tw5I7dIkLG3U
   33tctggjuckNOTuOwoC9kfQ7VJA6pfBniOcCFKzixOVbBcZV96obqjAWV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26206744"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26206744"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:52:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933482037"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933482037"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 06:52:27 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com,
	Hans de Goede <hdegoede@redhat.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 8/9] i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
Date: Tue,  6 Feb 2024 16:51:57 +0200
Message-ID: <20240206145158.227254-9-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I believe RX FIFO depth define 0 is incorrect on Wangxun 10Gb NIC. It
must be at least 1 since code is able to read received data from the
DW_IC_DATA_CMD register.

For now this define is irrelevant since the txgbe_i2c_dw_xfer_quirk()
doesn't use the rx_fifo_depth member variable of struct dw_i2c_dev but
is needed when converting code into generic polling mode implementation.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index ee1dbdb52d3e..94da70ce1f32 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -320,7 +320,7 @@ struct dw_i2c_dev {
 #define AMD_UCSI_INTR_EN			0xd
 
 #define TXGBE_TX_FIFO_DEPTH			4
-#define TXGBE_RX_FIFO_DEPTH			0
+#define TXGBE_RX_FIFO_DEPTH			1
 
 struct i2c_dw_semaphore_callbacks {
 	int	(*probe)(struct dw_i2c_dev *dev);
-- 
2.43.0


