Return-Path: <linux-i2c+bounces-2654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D3F891C72
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 14:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5EADB29A4F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 13:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7C5181D0E;
	Fri, 29 Mar 2024 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WetOfq6A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759DD181D07;
	Fri, 29 Mar 2024 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711716111; cv=none; b=CC9J6XXV5kJAvf7GW02Gjeaf9CSQW1d4KVrJesrrJKtGyz4mRuf2LBNeAzqbEhFUSdO0GhlVD4p08SHDQPQ1PoNEKCHQfGFTgP8hdw15GqoPfiRJdVugrAfn9DuF3vzDW9hLL9mti8uLllMtK0WEyouge0QmknthnMXyRqxX8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711716111; c=relaxed/simple;
	bh=GKj+uGGDM2REz2nuSY3QZu0YyUCCfqb78Y2dQkQ7SFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfMBqmbr7OhW7pipcp0Zp9V7c1U7dBgtcYVRgdxEidvdVIMYEF4TLbJojYm2U3OUfwxJymUOajMP6OjcQsPpjjI7o6RDO40+TcILUkPq/LiTN7JhkDBXkj7pcTP6vvYWBRmiDrpPNHFancQ8VvBiT6oqVXQPfR/JZ7C4KKXg2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WetOfq6A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D826C43390;
	Fri, 29 Mar 2024 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716111;
	bh=GKj+uGGDM2REz2nuSY3QZu0YyUCCfqb78Y2dQkQ7SFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WetOfq6AVE/p+n6xT1pq/OUx1TfKuf+L9E46diaQ1Wt6kV8iZGTI+CdSw4fqKXYKn
	 wZqw6/mUproD+b+h0DrGCM261mCXblMuAEe3QdgbYj1xYXrTQqpARGUbx3DdB5MQYP
	 zRo/9uFyKS/i427HIzaMPYoiegec40VLOPhAff3a7ihOGnK8q074Mkzz8kSGXZltgD
	 4JcoaCoCYJ0GyDowTjHOm1wPIzLQ6S+7U/Sq4Q2Mc7u3S67nvEMcP+Lp1nIyxZjFo5
	 tme807+/bKsEgKUKUa+9C+AYa5swLxg53kXxVgGEm0v/Jy/8+SQfiB4/jqosYOrE8r
	 HSEB8LbMBIe4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 60/98] i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
Date: Fri, 29 Mar 2024 08:37:31 -0400
Message-ID: <20240329123919.3087149-60-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123919.3087149-1-sashal@kernel.org>
References: <20240329123919.3087149-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
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


