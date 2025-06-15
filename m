Return-Path: <linux-i2c+bounces-11471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D170ADA280
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 18:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 341DA16E9B3
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 16:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAED193077;
	Sun, 15 Jun 2025 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwMg58Vy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11415383;
	Sun, 15 Jun 2025 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750003272; cv=none; b=uVGMhMivS3s9GPKe73CUzqjAGWSuyGMWNWM+/NqqsJoNJ1XYqkHj4DZyJ98Z+lhIn65lqbcJRMZeJRSQzQpb4fT5QZSZiTzKdCOj9kxkTw4eKd7Lg3COexQ/Jzw6zRB4QW6wdu+9sPjAME5YyNueZPyC/Jt2FiI8pbjGYSNc38I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750003272; c=relaxed/simple;
	bh=iei+Rbi1EMsM3VoJTS+GLsvIcopbRLAxDDDRUGZbLlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NsBrS+g7xCb8FJjxlcj6CfyVsxYXRAEowGLFFI9tfgqO1flU6BIF0P6d40/Ju/qdUZimreTyLyVP5cAcT11s4pZWzWeFOFnWxD2EEZv9IJVA2d8/eseZ7/JzkrF2c8i0RB6RWTNblr24/6GEvQsWdT+Mz+dvXYfw43YySkTjl5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwMg58Vy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62194C4CEE3;
	Sun, 15 Jun 2025 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750003271;
	bh=iei+Rbi1EMsM3VoJTS+GLsvIcopbRLAxDDDRUGZbLlo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LwMg58VyykYKgijDs9VvqD0l3vO45uUoCAVQHiwY5atNJP4KtA8Uk27Iyt/hj14ZV
	 yIyBTUp/pQ7pm+K+GkZ7Ok3AAUPWLlbvqacfSbYFdpyyR9yN1ZdzBRP84bNpMZ/xsj
	 unGOFF4Hi4OH2UdHXT7wZsA92WgurjZgFe8eR4z+BdFnxGN83B3Ox1MQEzvcByKYlq
	 l1DQ3oP28YUQiTKtjMuPKG2UmWYFvIVLErXutNBAQlvhtnpFFlCsKCsu7lJIlvFH55
	 hw2WgIKCo5VYHR6J7NU1nQb8ZTgBS2i8zkM+f9myvUGptMGN3/zONLedsVUHFx0ogs
	 ztzHNSJ8b3D+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DDFC61CE8;
	Sun, 15 Jun 2025 16:01:11 +0000 (UTC)
From: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Date: Mon, 16 Jun 2025 00:01:10 +0800
Subject: [PATCH] i2c: qup: jump out of the loop in case of timeout
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-qca-i2c-v1-1-2a8d37ee0a30@outlook.com>
X-B4-Tracking: v=1; b=H4sIAEbuTmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0NT3cLkRN1Mo2TdFBPDpCQzw8REU8tUJaDqgqLUtMwKsEnRsbW1ACh
 PBhNZAAAA
To: Andi Shyti <andi.shyti@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Yang Xiwen <forbidden405@outlook.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750003271; l=1276;
 i=forbidden405@outlook.com; s=20230724; h=from:subject:message-id;
 bh=7A4MyX2wBo/3swedAnLq8MA5y/hamSq89OQJdzuf1oA=;
 b=TYce6RfqS10iEeMra5WRsEso/JZvK/1nNmpkB8vrnFU1IEaN1FN/sM8Acao00LTn63aEfJj7x
 M/7eiwbqmFDAE+0bJ6f3myfi92GEKMeyGL+3pN2T7gKsicrMi3I+wvc
X-Developer-Key: i=forbidden405@outlook.com; a=ed25519;
 pk=qOD5jhp891/Xzc+H/PZ8LWVSWE3O/XCQnAg+5vdU2IU=
X-Endpoint-Received: by B4 Relay for forbidden405@outlook.com/20230724 with
 auth_id=67
X-Original-From: Yang Xiwen <forbidden405@outlook.com>
Reply-To: forbidden405@outlook.com

From: Yang Xiwen <forbidden405@outlook.com>

Original logic only sets the return value but doesn't jump out of the
loop if the bus is kept active by a client. This is not expected. A
malicious or buggy i2c client can hang the kernel in this case and
should be avoided. This is observed during a long time test with a
PCA953x GPIO extender.

Fix it by changing the logic to not only sets the return value, but also
jumps out of the loop and return to the caller with -ETIMEDOUT.

Cc: stable@vger.kernel.org
Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
---
 drivers/i2c/busses/i2c-qup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 3a36d682ed57..5b053e51f4c9 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -452,8 +452,10 @@ static int qup_i2c_bus_active(struct qup_i2c_dev *qup, int len)
 		if (!(status & I2C_STATUS_BUS_ACTIVE))
 			break;
 
-		if (time_after(jiffies, timeout))
+		if (time_after(jiffies, timeout)) {
 			ret = -ETIMEDOUT;
+			break;
+		}
 
 		usleep_range(len, len * 2);
 	}

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250615-qca-i2c-d41bb61aa59e

Best regards,
-- 
Yang Xiwen <forbidden405@outlook.com>



