Return-Path: <linux-i2c+bounces-14181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22405C7154F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 23:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A5CFC2FBE6
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 22:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51842335094;
	Wed, 19 Nov 2025 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="pq2pDupl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837EC331213
	for <linux-i2c@vger.kernel.org>; Wed, 19 Nov 2025 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763592172; cv=none; b=gt4hqac9G6cqt8E4LHosbSBPLAZ4sYpn7a6HkyV8x+6mtYQWpjx4jIqLcZyeZYUo8oL4q3Y6I56m4cdMYyp3bD95YXrvZf0mmFdShlbAgF7cIWz5Mmfa8xLks5mdw2Rpe/t2L7Su9PUl5IJEgyy7y2fdwHdRh2NveqNWw2IxzNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763592172; c=relaxed/simple;
	bh=BcSfZrTwXW+tG5DjjJVVlX94/P8il/6qd7mbhqcpDiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SInJD2AwUY4zD6kH74/zzDKhJ0MjdP5aU1qe7ufpT7bBkOqOkC7pr7sCNkcm0o7Gqw5d242uGacd0YlZWG/Xi9irK1Uke8aFuoHY4TNRyu3vFgyZ7dbMkEe7cYW553xny09nXuM3y8isYzdzYijwxg4P0gJn9wvwuFUbgWrNoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=pq2pDupl; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vLqsx-006kwV-Ru; Wed, 19 Nov 2025 23:42:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=+Igy4kUQLGvcfJ0gjg5dhRoXIT9GJM+aTt6LKCSi1bo=; b=pq2pDuplkexq8wn8TWwg5//+lK
	7bypaF24KoUBMmsCgmL/Kl6QeeIIAxklwSAXoUxxvZ6kn3ib2OXUbjMuJjkrgT4a+0urkbTuNR2Mv
	IUvU2WKS3ySO/zZasLvKLqfYGj59+S6vViVkMuBcrL8b1GDCoqXkjh+tYAv7eJS6ljEgikxkwj8HV
	kaXa5fTs1jRSoEpYifoJISCEcGmfhKx5Vnk9jspw4E60lQnOB6w/EZjLR5t+eRBlCuQC0atx+XG6a
	pVTp4qrSgRR3pFjUNQrjSaL4c/8POtkHYpX5pcuLqYZ6pvZ3G/j8zK/BUpIpAKIf827n1BZzfSHFy
	7SIX7xaw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vLqsx-0000DP-Es; Wed, 19 Nov 2025 23:42:47 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vLqse-00Fos6-8d; Wed, 19 Nov 2025 23:42:28 +0100
From: david.laight.linux@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 20/44] drivers/i2c/busses: use min() instead of min_t()
Date: Wed, 19 Nov 2025 22:41:16 +0000
Message-Id: <20251119224140.8616-21-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251119224140.8616-1-david.laight.linux@gmail.com>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

min_t(u8, a, b) casts both its arguments to u8 potentially discarding
signifinact bits.
Use min(a, b) instead as it cannot discard significant bits.

Detected by an extra check added to min_t().

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 41e9b5ecad20..8fc51d472a55 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -564,7 +564,7 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	 * after receiving the first byte.
 	 */
 	len += (flags & I2C_CLIENT_PEC) ? 2 : 1;
-	dev->tx_buf_len = len - min_t(u8, len, dev->rx_outstanding);
+	dev->tx_buf_len = len - min(len, dev->rx_outstanding);
 	msgs[dev->msg_read_idx].len = len;
 	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
 
-- 
2.39.5


