Return-Path: <linux-i2c+bounces-11515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59911ADE8B8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 12:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D0DE18856AD
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 10:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568472877C4;
	Wed, 18 Jun 2025 10:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eXdaS/XN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E8B2857D2
	for <linux-i2c@vger.kernel.org>; Wed, 18 Jun 2025 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242115; cv=none; b=SzlPE1kjv9U6ZCj+mhkF/VbGDlwJ0A5A+wHob4WDfT0FzBF0aZwjVSb0cNMn0iVxnigocXGJQSxO6h9sL4+aWGuOS8g1sNlsD7XFIqlo+2J3Vc2y3E04w3qFEuREVcKOxjlkY+tRZKYV2/e9x6iBw5G9qyxGvAxZ6CIkegALLu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242115; c=relaxed/simple;
	bh=C92Qa46CVa8brvsCtjg1pwamo+BKK1QYwIWrn/BFthU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mzeoHtL1VwBmDMoWxSojEn4KlV+0k4DxkGXH2vMwAtuFFJvJDsc9XMlo93/uaYswvIcBjEhxf78lOqRdZjMNWnsiye3AnAR/kC+p3wwMDczqGg6KttjP5T6NFVb5p1J71hs6Fl+QCOrN7n7OJdCka3vkyVCS8Zrefjk+mCwAfe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eXdaS/XN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235d6de331fso83641905ad.3
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jun 2025 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750242112; x=1750846912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GjmzlSMJGThF/X6xEUPvfYdLDsdkYToZuOGOEJIFwyo=;
        b=eXdaS/XN40mLPqn+nhSGraoujupa5BPscG1phbo7hFjlboxcZkgL9yfzNckwn1Tnpp
         lHcsah2xfuy63hvVureamQLVvcgtMevX7Ug6Uw7TtBTinEl3+0rYQlbjE889tcSjn57/
         OMOyb6JZtRstXV/7mg/R5fq1QF1Q0wkd+hASqOD2As5nK3txIleWMcAmZ0letrDEPI4U
         e/Zpux0oaGxlOih2guOsLH2MczXhMDlY6InSN67MGVX8YESD1hspSU88VWp2L6VrPAsI
         GtwNbMxWCMeLxewEq4pRs10CIJLto/RgKzKj0j1DBgInH4M+VW8SMBbrPiV9r9o0FPwA
         DNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242112; x=1750846912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjmzlSMJGThF/X6xEUPvfYdLDsdkYToZuOGOEJIFwyo=;
        b=VlIHdDePEQwCwTKnQrOdB1ascDidqit7lNFskSeTuD4vxCGgA7JnIVjl7jxy6zIrqx
         I5On37qLiCiXZUrfHkMPfWJTqdLWt/YQMFhq61CAzGvh41m6oLcRLLa9cabzkJ+tvTCx
         m/SqYyt9kqXRtt4g25sejKwqjxWSn8d/5fZN30cWmPQ6eM60H75p1rIhsWcmJkKpPV+G
         k7N1wfMqqux/CxUQq9SPOiIJ5F1fJQQE60/EyF49uYd5oLciqHu14vO6UNUvjjbJRp/0
         F0z06SC2FI5KvwUBQr8qYTvc/jTWuKBl8Ov326ZIkid0dBsEGorLWjFe/zLe9JXfJRmP
         U1wA==
X-Forwarded-Encrypted: i=1; AJvYcCVYvixJZiPkT10xNHOB8/FzoVp3jyWcA6ivDhKqJbgOF7/9T5fPUqAh0GOyaHaQMDVZRPVtPcIkj0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMD0u0HjqjTG73YVhnQU2UBFnjuL8fJ+9Aphiml4fwLdQHENGA
	uydc3+EMv/CoCz1U0LSCd4FDze7GThpt/eDaUkqKH6dfqZIOEnpew4OrwZH01GqEvEgNrgwHj4p
	uFlig
X-Gm-Gg: ASbGncteESO8FX3L+9OMxEaYTD1WynaJX8FW7u2OKBotJuMVQglsTCTuTIvf1k1mKVI
	ANGUXnYYyLZ2kq+JV3rKsDABUUFmXAUsrmT0OeSzGZwSPno4rGKGFR2pE/RqxugqsKIg5vMAqd6
	SV/xenjJxHpDcFXoS9Sk5ixZ1w8r8jM7zpFZwtb19rlBYEx8iCsJKgZc/ErjJtde+JZ39aqZd8v
	rDsN+IQIG+NGGSJPZEedBwyOtYw3bUFiD+WHfdulgKGfTyT/XxxmePIfEr68QwTXRuIk/Q9n0Nq
	oIu6WFzpQLKGE9the1r0lsDCQjZ28nPfG/tr0l5xLSO7Wt3u+W4kftBMFpg8bFntX/Y/1PSwK+T
	e25NZt0o=
X-Google-Smtp-Source: AGHT+IFazvSPNlbUxR4VYiAlmcTE9A4W+7BMiVTRCRXWqUGSyQF3kdAvM4//0ZOLw44KbimyVMMUYw==
X-Received: by 2002:a17:902:c946:b0:234:d292:be95 with SMTP id d9443c01a7336-2366b149f20mr223382045ad.42.1750242112586;
        Wed, 18 Jun 2025 03:21:52 -0700 (PDT)
Received: from localhost ([106.38.221.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm96547735ad.131.2025.06.18.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:21:52 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: aspeed: change debug level in irq handler
Date: Wed, 18 Jun 2025 18:21:48 +0800
Message-ID: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In interrupt context, using dev_err() can potentially cause latency
or affect system responsiveness due to printing to console.

In our scenario, under certain conditions, i2c1 repeatedly printed
"irq handled != irq. expected ..." around 20 times within 1 second.
Each dev_err() log introduced approximately 10ms of blocking time,
which delayed the handling of other interrupts — for example, i2c2.

At the time, i2c2 was performing a PMBus firmware upgrade. The
target device on i2c2 was time-sensitive, and the upgrade protocol
was non-retryable. As a result, the delay caused by frequent error
logging led to a timeout and ultimately a failed firmware upgrade.

Frequent error printing in interrupt context can be dangerous,
as it introduces latency and interferes with time-critical tasks.
This patch changes the log level from dev_err() to dev_dbg() to
reduce potential impact.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 1550d3d552ae..38e23c826f39 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -317,7 +317,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	switch (bus->slave_state) {
 	case ASPEED_I2C_SLAVE_READ_REQUESTED:
 		if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
-			dev_err(bus->dev, "Unexpected ACK on read request.\n");
+			dev_dbg(bus->dev, "Unexpected ACK on read request.\n");
 		bus->slave_state = ASPEED_I2C_SLAVE_READ_PROCESSED;
 		i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
 		writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
@@ -325,7 +325,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		break;
 	case ASPEED_I2C_SLAVE_READ_PROCESSED:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
-			dev_err(bus->dev,
+			dev_dbg(bus->dev,
 				"Expected ACK after processed read.\n");
 			break;
 		}
@@ -354,7 +354,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		/* Slave was just started. Waiting for the next event. */;
 		break;
 	default:
-		dev_err(bus->dev, "unknown slave_state: %d\n",
+		dev_dbg(bus->dev, "unknown slave_state: %d\n",
 			bus->slave_state);
 		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 		break;
@@ -459,7 +459,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* We are in an invalid state; reset bus to a known state. */
 	if (!bus->msgs) {
-		dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
+		dev_dbg(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
 			irq_status);
 		bus->cmd_err = -EIO;
 		if (bus->master_state != ASPEED_I2C_MASTER_STOP &&
@@ -523,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
 			goto error_and_stop;
 		} else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
-			dev_err(bus->dev, "slave failed to ACK TX\n");
+			dev_dbg(bus->dev, "slave failed to ACK TX\n");
 			goto error_and_stop;
 		}
 		irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
@@ -546,7 +546,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		fallthrough;
 	case ASPEED_I2C_MASTER_RX:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
-			dev_err(bus->dev, "master failed to RX\n");
+			dev_dbg(bus->dev, "master failed to RX\n");
 			goto error_and_stop;
 		}
 		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
@@ -577,7 +577,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		goto out_no_complete;
 	case ASPEED_I2C_MASTER_STOP:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))) {
-			dev_err(bus->dev,
+			dev_dbg(bus->dev,
 				"master failed to STOP. irq_status:0x%x\n",
 				irq_status);
 			bus->cmd_err = -EIO;
@@ -589,7 +589,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
 		goto out_complete;
 	case ASPEED_I2C_MASTER_INACTIVE:
-		dev_err(bus->dev,
+		dev_dbg(bus->dev,
 			"master received interrupt 0x%08x, but is inactive\n",
 			irq_status);
 		bus->cmd_err = -EIO;
@@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	irq_remaining &= ~irq_handled;
 	if (irq_remaining)
-		dev_err(bus->dev,
+		dev_dbg(bus->dev,
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-- 
2.47.0


