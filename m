Return-Path: <linux-i2c+bounces-14889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61ECEFB2A
	for <lists+linux-i2c@lfdr.de>; Sat, 03 Jan 2026 06:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B383011A66
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Jan 2026 05:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CF523C506;
	Sat,  3 Jan 2026 05:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOT2P1hu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5374E1FF1C4
	for <linux-i2c@vger.kernel.org>; Sat,  3 Jan 2026 05:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767417925; cv=none; b=sYQ5LkoVMyro64qZkZrMD8IS1NE2Rhxfj1CQ3fkGu/KuIH87RCnxM+Q52bzO0Mb7O6GWbJk/rEYyp7SW8LxJV9UN8wYaTo2VeYXF3fakW4IdXTcgEoK19L87VnKu0g3OsPF8lSNr6sidsP/fw5fNEOq7Sa2l8rI/z4zgN4lc9wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767417925; c=relaxed/simple;
	bh=S2mcst643K09OKYXHxqDPQ6dw/6DW4eZsgcWAPoAPu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoKIqsjQm4iJHMWoZOuhvVr6UxNkAAXdl5GimpP7gBzALa8u9jg3JelWGlLEEXJ5NGt6vDBpa6oi+N04nsFWP/CBSFnWz1Jgz5neB6/PGBiO/by+QlpslY7Pry4QZddbUW3IRiKfLzI3s61da44zMa+VObd4xEvU58SNggow5rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOT2P1hu; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso9585949b3a.3
        for <linux-i2c@vger.kernel.org>; Fri, 02 Jan 2026 21:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767417922; x=1768022722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3Von/oqR6tF4sweOsQdB8oflDGVDpq56CSH4LwQR/I=;
        b=FOT2P1hucAqYEnDWm7jL1zLHq70Z5J/Fhv7/y6lMO92oyjGGw3X6TpQJ94DxhFjoSx
         BBCxVR3n3F3ZmA8dOEnI0JHPCDvA6JuQt4bijOv99UmU2uNchliNnVhaVxIjR1+DqmOl
         ZAbkDjaTVYPLY3fxcCwqNSH1v4RxSpn6Jsd6yV8kMZR6BblU7Xx7DyDW6bFix4vcnJox
         NfADiYZG2XFiYHoX0FA6g1HD6K/yHk3gKob98mtaSQGlfXetStyCS6xIKLu+YdEueqEW
         WpnQusCb5el6F7YEqxlZ8KkpCZjnar36422XvzeRUNHoZH7ucr5RrzEtaUk+nX00hi9Q
         vBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767417922; x=1768022722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Von/oqR6tF4sweOsQdB8oflDGVDpq56CSH4LwQR/I=;
        b=tpCVRher3Te3AK3rw/wzIQDfsGQf+ueFi707hh1NkYIFiFKLQtm6efQAJ6KnHu7kkQ
         LfOk6kJ6715B4HnyCkdQioom8m+dCVX0YAo7rMxYo1zUX/pF/xWRvNNIN5ZZxdyIOBo7
         aY/xut6huTjH+IL0r35jR7uVhXjqoUB9bMK0tdfJEJchvbYXFDkXG03iHEA+VIYrbl2n
         naCLEJWDZds1gfvYYgqk5xs8YD4CnRK+s9H7SAcLLUqxlMjt1ZcP0FRNl2+3AY5sTsk1
         AQMFa2G/3JDnpv1e7h+/qzy+MBhDR+Y7c/R5lwk7eU2UJEx39H5pLnzHOhqZMUl3Wwcm
         2OzA==
X-Forwarded-Encrypted: i=1; AJvYcCWSRT+OG47ozjQnh3M7E1QhqiP4cByOR895NCrpoIb6rjDs6g1et9fsPxRqoOlMILg4/6AYNaqXqNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzh7JAMgj/yPvL73obG9jRIyubZy13JLb477KYKQfj5ugGGDE7
	Lx8kGHXuE431jVdUWGlzlTf+v5oJGQRA1WMrGywwrfXWGHBg1NNBfwax
X-Gm-Gg: AY/fxX7cFR2LJ9JOgTwExFK6oqN85Pcy8aUlGFc2iGux0jjUcC9lCaidTEE9HQRnYjb
	c5kU18VXmn8EZV8DsNZSxZ+XzEWmIrHVYek0azIuvtLcPgGL5LyGexoJFkVvrli/DIgOpWNfXoC
	iABls2SLViZoMK4ny2kNjb0zv4JGOO8KYBul+P0aPRwyYr3thAcrf1UoCtF7HCxlfJqs+DM3+vd
	7/yqMEiSyOiqhaNxJzD7DcV/OeQ5gidmGsuGMKZIbCDRNB66PPeL76Qf0FoyzlkAKkJQpHvfH+w
	ZxEc9sYdp5KCJgFTEYovQ8PR5qcH6W8tqYsb9Qy4+LzDNGyVQIdN4fiIVlGG1SZFQlgTuApCJWE
	lJnt7RpNGWs5dK9XJwQfmthIHOJ9+CD2XIXvMxht93sR/1T1n6CrdO/LlHl6/MFU7qlWx2KxALn
	OePhWe8A==
X-Google-Smtp-Source: AGHT+IGXYc8+FvRJ1M0wgH9j9p6V5dVha9j+Kma2Qez7gSUK8elkPSRSvbOR59FPXYmmBJmR/5NC/A==
X-Received: by 2002:a05:6a00:1f06:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ff64ed14d4mr37036813b3a.14.1767417922373;
        Fri, 02 Jan 2026 21:25:22 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f258sm41658653b3a.47.2026.01.02.21.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:25:21 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	David Wu <david.wu@rock-chips.com>
Subject: [PATCH v1] i2c: rk3x: Add support for SCL output enable debounce
Date: Sat,  3 Jan 2026 10:55:04 +0530
Message-ID: <20260103052506.6743-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Wu <david.wu@rock-chips.com>

As per the RK3399 and RK3588 datasheets Rockchip I2C controllers feature
a SCL_OE_DB register (0x24). This register is used to configure the
debounce time for the SCL output enable signal, which helps prevent
glitches and ensures timing compliance during bus handover or slave clock
stretching.

Introduce a 'has_scl_oe_debounce' flag to rk3x_i2c_soc_data to
distinguish between hardware versions. For supported SoCs, calculate
the debounce counter dynamically based on the current clock rate
and program it during divider adaptation.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: David Wu <david.wu@rock-chips.com>
---
v1: This change have been pulled from linux-radxa kernel.
---
 drivers/i2c/busses/i2c-rk3x.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index d4e9196445c0..31d7d6487613 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -35,6 +35,7 @@
 #define REG_IEN        0x18 /* interrupt enable */
 #define REG_IPD        0x1c /* interrupt pending */
 #define REG_FCNT       0x20 /* finished count */
+#define REG_SCL_OE_DB  0x24 /* Slave hold scl debounce */
 
 /* Data buffer offsets */
 #define TXBUFFER_BASE 0x100
@@ -164,6 +165,7 @@ enum rk3x_i2c_state {
  * @calc_timings: Callback function for i2c timing information calculated
  */
 struct rk3x_i2c_soc_data {
+	bool has_scl_oe_debounce;
 	int grf_offset;
 	int (*calc_timings)(unsigned long, struct i2c_timings *,
 			    struct rk3x_i2c_calced_timings *);
@@ -875,6 +877,7 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 {
 	struct i2c_timings *t = &i2c->t;
 	struct rk3x_i2c_calced_timings calc;
+	unsigned long period, time_hold = (WAIT_TIMEOUT / 2) * 1000000;
 	u64 t_low_ns, t_high_ns;
 	unsigned long flags;
 	u32 val;
@@ -892,6 +895,13 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 	i2c_writel(i2c, val, REG_CON);
 	i2c_writel(i2c, (calc.div_high << 16) | (calc.div_low & 0xffff),
 		   REG_CLKDIV);
+
+	if (i2c->soc_data->has_scl_oe_debounce) {
+		period = DIV_ROUND_UP(1000000000, clk_rate);
+		val = DIV_ROUND_UP(time_hold, period);
+		i2c_writel(i2c, val, REG_SCL_OE_DB);
+	}
+
 	spin_unlock_irqrestore(&i2c->lock, flags);
 
 	clk_disable(i2c->pclk);
@@ -1198,6 +1208,7 @@ static const struct rk3x_i2c_soc_data rk3288_soc_data = {
 static const struct rk3x_i2c_soc_data rk3399_soc_data = {
 	.grf_offset = -1,
 	.calc_timings = rk3x_i2c_v1_calc_timings,
+	.has_scl_oe_debounce = true,
 };
 
 static const struct of_device_id rk3x_i2c_match[] = {

base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
-- 
2.50.1


