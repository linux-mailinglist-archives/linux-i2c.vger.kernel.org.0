Return-Path: <linux-i2c+bounces-2655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B0891D1C
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 15:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D761C24E16
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 14:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833541BF21D;
	Fri, 29 Mar 2024 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWJPyLeB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336111BF213;
	Fri, 29 Mar 2024 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711716290; cv=none; b=kKCq1aLwH8qiMWAacXg6YEFacpxtHTJzfGjIaWfuMoTKM8HZv8xLUiXsQSthpx16PTqIwVQUKTsBDnCYVRtoJcfXPU/my1fQjnp5ZSUqBwwM+ZC0lcruYcuxHLlXvWPX+qIQyON2LtwqA3PK6uBcItsgLbkYlitD3XIwUUrIejc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711716290; c=relaxed/simple;
	bh=GKj+uGGDM2REz2nuSY3QZu0YyUCCfqb78Y2dQkQ7SFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndQPBUYqUhFWrxEDDen0GI96lU9bJR32pantGkwro7MdKpwORK2BW1Xez/BMNogbx9p9MEw5ls1lT9mJEpnc95yHc6TZQ1yto2TpZCcA5h/0Kq0PJCtCXBg+MVYmMYzXZDzpNeZ82oAKSB4gI1AJFMvyNi8BRRBgif3cZMGLhgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWJPyLeB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E69FC433C7;
	Fri, 29 Mar 2024 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716290;
	bh=GKj+uGGDM2REz2nuSY3QZu0YyUCCfqb78Y2dQkQ7SFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWJPyLeBXwBME4UGj6gxseqO58YW/hbilNhZTd0gMKcWw7rgaUugJlJpqjHCXfUsU
	 fUoRybq5T0q85E9+Am3HIaejPrnbasNPpbAPfKR/IErh4V+tQxNbxAJQGJaunnEGSy
	 /U2+TkaPir+F1/EMRH02iCNfvDqqu9Gkuey22F4dH3UcyzDYZg9eh/Jju8UR0fhDcL
	 QX6UHiQB+UQOc9/UbZbwTYSPP0oa46RMiy44a4fPZPq3jlRSulJoI181fXl0LKx6BP
	 +aD1v4E9fazP2krdNJPZ1dsU/a0q0cFpVCurgbFOtp/yypUEc4Cub5mHm6APQf6Vhn
	 FjdxCHh/mLkTA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 42/75] i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
Date: Fri, 29 Mar 2024 08:42:23 -0400
Message-ID: <20240329124330.3089520-42-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124330.3089520-1-sashal@kernel.org>
References: <20240329124330.3089520-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
Content-Transfer-Encoding: 8bit

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

[ Upstream commit c94612a72ac87b0337a0d85b9263266776ed4190 ]

I believe RX FIFO depth define 0 is incorrect on Wangxun 10Gb NIC. It
must be at least 1 since code is able to read received data from the
DW_IC_DATA_CMD register.

For now this define is irrelevant since the txgbe_i2c_dw_xfer_quirk()
doesn't use the rx_fifo_depth member variable of struct dw_i2c_dev but
is needed when converting code into generic polling mode implementation.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-designware-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index a7f6f3eafad7d..ae835000fd32a 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -318,7 +318,7 @@ struct dw_i2c_dev {
 #define AMD_UCSI_INTR_EN			0xd
 
 #define TXGBE_TX_FIFO_DEPTH			4
-#define TXGBE_RX_FIFO_DEPTH			0
+#define TXGBE_RX_FIFO_DEPTH			1
 
 struct i2c_dw_semaphore_callbacks {
 	int	(*probe)(struct dw_i2c_dev *dev);
-- 
2.43.0


