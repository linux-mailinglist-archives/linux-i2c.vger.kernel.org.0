Return-Path: <linux-i2c+bounces-12447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C79B38861
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 19:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E001734E4
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 17:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C4D30DD2E;
	Wed, 27 Aug 2025 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjfNtCQE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CF030C367;
	Wed, 27 Aug 2025 17:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756314867; cv=none; b=WGl/i7X1AiwP+gquUZnXqk8Y2Yke4Fetf+K8bh9ucnxzCxWGHFsye9xHKijLnkrsQgwrMMEZSQoBiGWvF9BOkl0Bp+jzbudJbyDv9/aTM+WYl9gNrax6a7XpLgtzdaUKmeK6ecQ6TBN7UolntOpf+bQz3H01WdFgzqnonTU8GPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756314867; c=relaxed/simple;
	bh=CXDcZQ0Se7Zr++g/D9aafksWpOAhnUBq9vUM6z+CdtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqJgXh+VFArJj5VSLuFN4YizTelzBgqahU21gL288fjeoMMySfW8k1baXkF9QypSIUBHJBtLjy5RvXU3DUytmW/cnnx+T2XpoNBxpXUow5DgXZs2pjo8xGzW+GYGkN85Xl6M7ha0aHkbKdDuZ1wQGIbu6JYtwVun0N6BpgrIaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjfNtCQE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c79f0a604aso27370f8f.2;
        Wed, 27 Aug 2025 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756314864; x=1756919664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPU4UG0shymed19kC5QQuX+JC22baf0fpM1+kwSIVDw=;
        b=DjfNtCQEOg1XGVdQ7+5UCbNT9KZGToMaV5jT2XrrzMkLvwHQLPlMFktcY9f6SEGSSG
         tMfyPcg++zCh4XJI1Uzaw5/DRaUDfiOTMHoWN0MNp3vlveCzGTHEbREXCPEXSIVarP9E
         l9lK5Fr/Un8WukxTl0GUF4W6PUkLlqwOpFi4oG7f0xqOZ59csyUYtCb/twpqjTePzyL9
         cDUxjfyawRkgXFnt2Y7QDvi+2d5i5306b3sP+SwhyHF08hNNW9Mj97AKHTRUP4pawLEW
         ynJaSUhKQoT6on0R822N3/2MowCRmH2SoenqlFLv4qOJJ1WlXQr8/LFRgOOumR2p7iO5
         x4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314864; x=1756919664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPU4UG0shymed19kC5QQuX+JC22baf0fpM1+kwSIVDw=;
        b=IEewcQ708Pa8iYih0PgHQCzuzu9MvNA4lGSsQirInx6CnMWp0jFOw6Mpa80WoNzNaH
         Q+tDwDZX74tC7BH25w50+FzsIxo1dXhTbMd352eLlnlrtIVhoWA8wUGrtN/9GXAo/M8X
         CBpW21gx7RqQYI1ElEDbS7AVDspx/sjuv0VmNAoWaQQN/Q/TtMALFVR8CZpiY1cRelkM
         8aI02Wn6RWFJPaNyvL5Vzkq3xT2AaQZBLg43tvSbvJ14T3je1Q+eBRRDu0CYo7dN37oJ
         /0Cy906iIIRKyQO0B3Ht81jZ9uAtzdTWQoWhHCXpWb6yXP1cWJnvj088YMzfYWFbEuLE
         aDQg==
X-Forwarded-Encrypted: i=1; AJvYcCUwGK4QetgxhmQPHuYhpK1GBfskVvSz4daktiWUTowX4S6awM9zg5HetZ/cKC6jHm8RVmgo0QSBISGaNq2r@vger.kernel.org, AJvYcCV1/Udclo18JngbTli83KoEWwVjdnJLx4qsBgU6hfiFYD/ayNOjkiMuWTDZb0YCCgw734Se4DTd@vger.kernel.org, AJvYcCWemF1ctQhYlIs1/fZZR/YQy/Hh5Z5qaT2HBc7w2mtZOkyeEkyDNPJkl/nXWCqofh7gMrJOW1a3Iv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz+qJK/KQQMMV1nuPw9RKsCDUrlcXHilU42okC2guw69c/p2W0
	F9K0r2F/fuGc3dk74PdScRZKt/0/6FTBNty6Ul/GFvgoy5ZtacFZAk/W7nCpig==
X-Gm-Gg: ASbGncvLym8Rey+13glIfrTK46cDjjGNF+BsJwxyCH8iNIUrGpx72qQ5Y7626N4HcmG
	7bFQgaTwRsMpTl7UgJHro6Gmh0xZF8u4W/IyQTgrTAE8VOiJoiYEb2LcnBgKwbkTHxNnI8BC12g
	nN3CYiCYIJWNUuQPRwy5qpSZMoy8FT0ehMRjZgaaJUo/o3GqC1VsMwhmulfHy9o3+BJplJ1qprn
	evrBjibXJyw8ElqtYd5hqwHxvueaX1ggfC2eGHV1jZcJ1WNoAOu/uy9txOlaZtYsMg6nK4MnS7N
	FRUgRcImLOhz5IgjgOJzXfEaQyTqVFlBj+pcc/+4/VzJamm6Q8EOnC0/5mfiYiCdhF17lkyqx3k
	ZqbtPALmt4kNG7WgRHRZlAehNdo0fG2PDUOXg4vOmxYYW4fGmuPE=
X-Google-Smtp-Source: AGHT+IGkGgu/zepDaclUovYHbHFUPlfCtylJkPVDNcl1jkGqRtflyZavEYXbWDBRApoSMNQfSS+G0g==
X-Received: by 2002:adf:8bd4:0:b0:3cc:a507:80d4 with SMTP id ffacd0b85a97d-3cca507822amr1650176f8f.7.1756314863975;
        Wed, 27 Aug 2025 10:14:23 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c7113fdacfsm21272365f8f.35.2025.08.27.10.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:14:23 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 27 Aug 2025 19:13:59 +0200
Subject: [PATCH v3 2/2] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-i2c-pxa-fix-i2c-communication-v3-2-052c9b1966a2@gmail.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2

Under some circumstances I2C recovery fails on Armada 3700. At least
on the Methode uDPU board, removing and replugging an SFP module fails
often, like this:

  [   36.953127] sfp sfp-eth1: module removed
  [   38.468549] i2c i2c-1: i2c_pxa: timeout waiting for bus free
  [   38.486960] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
  [   38.496867] mvneta d0040000.ethernet eth1: unsupported SFP module: no common interface modes
  [   38.521448] hwmon hwmon2: temp1_input not attached to any thermal zone
  [   39.249196] sfp sfp-eth1: module removed
  ...
  [  292.568799] sfp sfp-eth1: please wait, module slow to respond
  ...
  [  625.208814] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO

Note that the 'unsupported SFP module' messages are not relevant. The
module is used only for testing the I2C recovery funcionality, because
the error can be triggered easily with this specific one.

Enabling debug in the i2c-pxa driver reveals the following:

  [   82.034678] sfp sfp-eth1: module removed
  [   90.008654] i2c i2c-1: slave_0x50 error: timeout with active message
  [   90.015112] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
  [   90.020464] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
  [   90.027906] i2c i2c-1: log:
  [   90.030787]

This continues until the retries are exhausted ...

  [  110.192489] i2c i2c-1: slave_0x50 error: exhausted retries
  [  110.198012] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
  [  110.203323] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
  [  110.210810] i2c i2c-1: log:
  [  110.213633]

... then the whole sequence starts again ...

  [  115.368641] i2c i2c-1: slave_0x50 error: timeout with active message

... while finally the SFP core gives up:

  [  671.975258] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO

When we analyze the log, it can be seen that bit 1 and 11 is set in the
ISR (Interface Status Register). Bit 1 indicates the ACK/NACK status, but
the purpose of bit 11 is not documented in the driver code unfortunately.

The 'Functional Specification' document of the Armada 3700 SoCs family
however says that this bit indicates an 'Early Bus Busy' condition. The
document also notes that whenever this bit is set, it is not possible to
initiate a transaction on the I2C bus. The observed behaviour corresponds
to this statement.

Unfortunately, I2C recovery does not help as it never runs in this
special case. Although the driver checks the busyness of the bus at
several places, but since it does not consider the A3700 specific bit
in these checks it can't determine the actual status of the bus correctly
which results in the errors above.

In order to fix the problem, add a new member to struct 'i2c_pxa' to
store a controller specific bitmask containing the bits indicating the
busy status, and use that in the code while checking the actual status
of the bus. This ensures that the correct status can be determined on
the Armada 3700 based devices without causing functional changes on
devices based on other SoCs.

With the change applied, the driver detects the busy condition, and runs
the recovery process:

  [  742.617312] i2c i2c-1: state:i2c_pxa_wait_bus_not_busy:449: ISR=00000802, ICR=000007e0, IBMR=03
  [  742.626099] i2c i2c-1: i2c_pxa: timeout waiting for bus free
  [  742.631933] i2c i2c-1: recovery: resetting controller, ISR=0x00000802
  [  742.638421] i2c i2c-1: recovery: IBMR 0x00000003 ISR 0x00000000

This clears the EBB bit in the ISR register, so it makes it possible to
initiate transactions on the I2C bus again.

After this patch, the SFP module used for testing can be removed and
replugged numerous times without causing the error described at the
beginning. Previously, the error happened after a few such attempts.

The patch has been tested also with the following kernel versions:
5.10.240, 5.15.189, 6.1.148, 6.6.102, 6.12.42, 6.14.11, 6.15.10, 6.16.1
It improves recovery on all of them.

Cc: stable@vger.kernel.org # 5.10+
Reviewed-by: Imre Kaloz <kaloz@openwrt.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - rebase on tip of i2c/for-current
  - use Reviewed-by tag for Imre
  - remove Fixes tag as the problem is not caused by the previously mentioned
    commit, simply it is not handled by the code yet
  - update list of tested kernels
  - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com

Changes in v2:
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-3-e9097d09a015@gmail.com
---
 drivers/i2c/busses/i2c-pxa.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 70acf33e1d573231f84a1f09cffb376a8277351d..19f5da08def11ded1d3de968f50fa5b5851066f5 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -71,6 +71,7 @@
 #define ISR_GCAD	(1 << 8)	   /* general call address detected */
 #define ISR_SAD		(1 << 9)	   /* slave address detected */
 #define ISR_BED		(1 << 10)	   /* bus error no ACK/NAK */
+#define ISR_A3700_EBB	(1 << 11)	   /* early bus busy for armada 3700 */
 
 #define ILCR_SLV_SHIFT		0
 #define ILCR_SLV_MASK		(0x1FF << ILCR_SLV_SHIFT)
@@ -263,6 +264,7 @@ struct pxa_i2c {
 	bool			highmode_enter;
 	u32			fm_mask;
 	u32			hs_mask;
+	u32			busy_mask;
 
 	struct i2c_bus_recovery_info recovery;
 	struct pinctrl		*pinctrl;
@@ -430,7 +432,7 @@ static int i2c_pxa_wait_bus_not_busy(struct pxa_i2c *i2c)
 
 	while (1) {
 		isr = readl(_ISR(i2c));
-		if (!(isr & (ISR_IBB | ISR_UB)))
+		if (!(isr & i2c->busy_mask))
 			return 0;
 
 		if (isr & ISR_SAD)
@@ -467,7 +469,7 @@ static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
 		 * quick check of the i2c lines themselves to ensure they've
 		 * gone high...
 		 */
-		if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) == 0 &&
+		if ((readl(_ISR(i2c)) & i2c->busy_mask) == 0 &&
 		    readl(_IBMR(i2c)) == (IBMR_SCLS | IBMR_SDAS)) {
 			if (i2c_debug > 0)
 				dev_dbg(&i2c->adap.dev, "%s: done\n", __func__);
@@ -488,7 +490,7 @@ static int i2c_pxa_set_master(struct pxa_i2c *i2c)
 	if (i2c_debug)
 		dev_dbg(&i2c->adap.dev, "setting to bus master\n");
 
-	if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) != 0) {
+	if ((readl(_ISR(i2c)) & i2c->busy_mask) != 0) {
 		dev_dbg(&i2c->adap.dev, "%s: unit is busy\n", __func__);
 		if (!i2c_pxa_wait_master(i2c)) {
 			dev_dbg(&i2c->adap.dev, "%s: error: unit busy\n", __func__);
@@ -514,7 +516,7 @@ static int i2c_pxa_wait_slave(struct pxa_i2c *i2c)
 			dev_dbg(&i2c->adap.dev, "%s: %ld: ISR=%08x, ICR=%08x, IBMR=%02x\n",
 				__func__, (long)jiffies, readl(_ISR(i2c)), readl(_ICR(i2c)), readl(_IBMR(i2c)));
 
-		if ((readl(_ISR(i2c)) & (ISR_UB|ISR_IBB)) == 0 ||
+		if ((readl(_ISR(i2c)) & i2c->busy_mask) == 0 ||
 		    (readl(_ISR(i2c)) & ISR_SAD) != 0 ||
 		    (readl(_ICR(i2c)) & ICR_SCLE) == 0) {
 			if (i2c_debug > 1)
@@ -1177,7 +1179,7 @@ static int i2c_pxa_pio_set_master(struct pxa_i2c *i2c)
 	/*
 	 * Wait for the bus to become free.
 	 */
-	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB))
+	while (timeout-- && readl(_ISR(i2c)) & i2c->busy_mask)
 		udelay(1000);
 
 	if (timeout < 0) {
@@ -1322,7 +1324,7 @@ static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
 	 * handing control of the bus back to avoid the bus changing state.
 	 */
 	isr = readl(_ISR(i2c));
-	if (isr & (ISR_UB | ISR_IBB)) {
+	if (isr & i2c->busy_mask) {
 		dev_dbg(&i2c->adap.dev,
 			"recovery: resetting controller, ISR=0x%08x\n", isr);
 		i2c_pxa_do_reset(i2c);
@@ -1479,6 +1481,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	i2c->fm_mask = pxa_reg_layout[i2c_type].fm;
 	i2c->hs_mask = pxa_reg_layout[i2c_type].hs;
 
+	i2c->busy_mask = ISR_UB | ISR_IBB;
+	if (i2c_type == REGS_A3700)
+		i2c->busy_mask |= ISR_A3700_EBB;
+
 	if (i2c_type != REGS_CE4100)
 		i2c->reg_isar = i2c->reg_base + pxa_reg_layout[i2c_type].isar;
 

-- 
2.50.1


