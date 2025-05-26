Return-Path: <linux-i2c+bounces-11143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09657AC3EEF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 13:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC88E7A147F
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 11:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEBE1F8723;
	Mon, 26 May 2025 11:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vNauEA0N";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="h1uYi9+z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F49D1C8601;
	Mon, 26 May 2025 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260307; cv=none; b=YN3etR9T9zCcIe3LsPEECRusCw1palhcaIEBwT5ahKUWBEEMIuEV21Nxjsc4j5j+D/Kze7v8qnLq81t0LvBMARTNfY0kNyoM0A4RVeSU+YUkhI/lVSB6UHHHJCtW/UH2D6LBXvBnCI4UuUnp4wYbEk+I//XHQpKUtN6SE7gsYVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260307; c=relaxed/simple;
	bh=V00na71ORZdQe7cyi9jM8wn2nHHwRLWsEta5FlPqy64=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VExWqFXJXllt1cBXnSDQS3jQ09Arj89KGqBcG+02MsY3wj6ZZzIHu6J50Ut9DDrAsL1rc0Ie/6B2+N/RY4CySx3+gweDm/7srDWMmNF8Fa0ObFcoxAKix7GQEsDKWSEoWenHGQPVxSdgDAxNxLPj32q4bloqB9TZuKvcR1B0V68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vNauEA0N; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=h1uYi9+z; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4b5Yql2Kshz9xn8;
	Mon, 26 May 2025 13:45:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748259955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0iEnhsMyyhLqVb+t9d6JK42KoDeD/BDXMFXX8vR1gm8=;
	b=vNauEA0NxP92F1Au9esFhltpHvXYYxuNADdZkqOwq190xijq8sUJeedWgjFV++/D2nPqWo
	2wKvs0ebgRzCxSwbUatxTa59OJuLpxGTBj3tyD+L0cA8XVOhv5WUC+VoQCj6zUsRuS6ny+
	fzgd3fdsAv5Zln8oQMaDKDAp2zVQEfaH4btyj58iXEMIbocpe35DzPZJtGmYh0hLA/EBcQ
	MH7pnSRBvuekHXsSh6TPEPjPb1UXxv4YLUA16qAMR/PEOHw673PdOajkdyfJzqyyzJIQOZ
	SFdFF8AEVXgXwiXG1efukjs8s+muR1EyCMzeIK5pnwcGDhRttamqqVvah0AJmQ==
From: George Stark <george.stark@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748259953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0iEnhsMyyhLqVb+t9d6JK42KoDeD/BDXMFXX8vR1gm8=;
	b=h1uYi9+zl/rZ0lNwjhkRUL/tTmVRKunr5taucBku1n8wKTMNXzp2fZvVCXUPTcEJAm/XLj
	AZWVxxgski972QfvxEHhWTt/dzVTflx+t7Jrakov4FmHXPElAsb7/FbGqQy8KbSkcKim3l
	k5H5vf4UW0Q+xLjOpSsCSlEMpx0+M7knLpbLe1ohTuZ/qeg29aNJIneGLC1R+VYZ1TaldP
	Z78IdPF4uPhcXljRmMVxunYX5AvK7JLGxBdvIUIQA6zOlUN+CrENrApQDc8pZseZIsDc3Q
	V3lH0i0i787ghx6NVDaDfQHB5XAPr+bajA21B5SbHCHKAFaN4ndfkOKkChHBFA==
To: andi.shyti@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	george.stark@mailbox.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] i2c: meson: support smbus block read function
Date: Mon, 26 May 2025 14:45:33 +0300
Message-ID: <20250526114533.3287944-1-george.stark@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ydmzzk1c465fug6ojipqhh39tsnq41gs
X-MBO-RS-ID: 4ee51b3cee18d95dcd0

In order to implement reading I2C_SMBUS_BLOCK_DATA call i2c bus driver
has to support I2C_M_RECV_LEN flag meaning that total block size to read
will be received in the first byte of the message. So add support for
I2C_M_RECV_LEN flag.

Signed-off-by: George Stark <george.stark@mailbox.org>
---
 drivers/i2c/busses/i2c-meson.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index c7b203cc4434..6d8fe151325a 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -95,6 +95,7 @@ struct meson_i2c {
 	int			count;
 	int			pos;
 	int			error;
+	bool			recv_len;
 
 	spinlock_t		lock;
 	struct completion	done;
@@ -259,7 +260,7 @@ static void meson_i2c_prepare_xfer(struct meson_i2c *i2c)
 		meson_i2c_add_token(i2c, TOKEN_DATA);
 
 	if (i2c->count) {
-		if (write || i2c->pos + i2c->count < i2c->msg->len)
+		if (write || i2c->pos + i2c->count < i2c->msg->len || i2c->recv_len)
 			meson_i2c_add_token(i2c, TOKEN_DATA);
 		else
 			meson_i2c_add_token(i2c, TOKEN_DATA_LAST);
@@ -268,7 +269,7 @@ static void meson_i2c_prepare_xfer(struct meson_i2c *i2c)
 	if (write)
 		meson_i2c_put_data(i2c, i2c->msg->buf + i2c->pos, i2c->count);
 
-	if (i2c->last && i2c->pos + i2c->count >= i2c->msg->len)
+	if (i2c->last && i2c->pos + i2c->count >= i2c->msg->len && !i2c->recv_len)
 		meson_i2c_add_token(i2c, TOKEN_STOP);
 
 	writel(i2c->tokens[0], i2c->regs + REG_TOK_LIST0);
@@ -288,9 +289,26 @@ static void meson_i2c_transfer_complete(struct meson_i2c *i2c, u32 ctrl)
 		i2c->error = -ENXIO;
 		i2c->state = STATE_IDLE;
 	} else {
-		if (i2c->state == STATE_READ && i2c->count)
+		if (i2c->state == STATE_READ && i2c->count) {
 			meson_i2c_get_data(i2c, i2c->msg->buf + i2c->pos,
 					   i2c->count);
+			if (i2c->recv_len) {
+				unsigned int len = i2c->msg->buf[0];
+
+				if (unlikely(len > I2C_SMBUS_BLOCK_MAX)) {
+					dev_dbg(i2c->dev,
+						"smbus block size %d is too big\n",
+						len);
+
+					i2c->error = -EPROTO;
+					i2c->state = STATE_IDLE;
+					return;
+				}
+
+				i2c->recv_len = false;
+				i2c->msg->len += len;
+			}
+		}
 
 		i2c->pos += i2c->count;
 
@@ -371,6 +389,7 @@ static int meson_i2c_xfer_msg(struct meson_i2c *i2c, struct i2c_msg *msg,
 		meson_i2c_do_start(i2c, msg);
 
 	i2c->state = (msg->flags & I2C_M_RD) ? STATE_READ : STATE_WRITE;
+	i2c->recv_len = (msg->flags & I2C_M_RD) && (i2c->msg->flags & I2C_M_RECV_LEN);
 	meson_i2c_prepare_xfer(i2c);
 
 	if (!atomic)
@@ -444,7 +463,7 @@ static int meson_i2c_xfer_atomic(struct i2c_adapter *adap,
 
 static u32 meson_i2c_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_READ_BLOCK_DATA;
 }
 
 static const struct i2c_algorithm meson_i2c_algorithm = {
-- 
2.25.1


