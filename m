Return-Path: <linux-i2c+bounces-10928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D10AB2888
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2103BAAD1
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 13:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E399257441;
	Sun, 11 May 2025 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN6D//Ib"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF1C2571C4;
	Sun, 11 May 2025 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970299; cv=none; b=kQRM2jS6eW4H6Qedk3mlre5X43xIkQQFgh0R+drjn5IKxw7WSlQkVT2zJsw2bed6VeoE9cE7vnKhr4J8WCboKbHmQaevXJPdQTiGlGHHEJvU/YuLhYet5BZ1TZXfvGZpeZWzaWscp6pRqQbzA3KHl0FXz697Os4UPqkAUhBa7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970299; c=relaxed/simple;
	bh=7jkv0JnqFzmSMcmUrWH/0W0gawSk+Kp3T4ugwDTM6Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6SmHC6AVY0nN/v5ssui0JXQhGdl3kv08rvBvfK/pdlE7ewFaSVbKixkxYSefO3yceikO55FhwIwEE0KH2Bm2Q61LQkL7qODHzCM41aTWC/gz77igNaM5EPa/OkXgIHnzbxAp5/859vQwiE/z/sFszA2spTXI71UAEtVVZqkBE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN6D//Ib; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fcab0243b5so3292171a12.1;
        Sun, 11 May 2025 06:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746970295; x=1747575095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCnitIQrLGML0v/ZGaz7m1EqKZaS5okX2gqREoZgqFA=;
        b=aN6D//Ibj2FItHoJXAE8f4D8S4SplmAmy2wSjkq2lmM+G5iL6c6+8O6/pVizAJNXaf
         azc5OZgmIZWRGxy9GoGJ2H6b1t8lVG0XQj/JGZBnP6FwJmkfFgxM7CUvh0KcBwtwL6Zv
         W8eE0PQmuffZ3tWtf2o1fHwG6xgKiXVyT1n3MKJpcPcqwcZPLYRI1DYZY/o1fhEXX37I
         Ygw7XcYuGdg8a7cal3TgFukN+2c53yYSri2QXi5yomL1JcEdGow6f+Z8CBxTFgoi7+rp
         ODdSOYYK9pVDXzbgNMOPu5z+C9oc0zFU3c1WOjI8FU28Q6roEw8Dyuzq2lTYACJH2SGM
         dW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970295; x=1747575095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCnitIQrLGML0v/ZGaz7m1EqKZaS5okX2gqREoZgqFA=;
        b=DS/zOQKZm2qq/AsB1Pz7p2KvpzBTngaZ5P6z6WhBa4nIRw8MGCb+TaPOTz1RFGjgVQ
         eJbynyKC6fJYH0wNyrPknm4P7FCJ2ORqGMk0VPFCzrOyAuVQYaHjmoT5ssaZ+tj2wqWZ
         TOvakVoxcu/T3dxkFESZ5qT/kt6gDLFvgvwVtZI/M2wZ3+3s6qWmbDLXXaB8z/1JpobR
         Et8azdzB0IXrFelsEQZAWaYW+4IqwCjJnYXmCs1q3x3c+Az/qnw6ZiObV5+AY3rdlrn/
         lneykJiQu/m4+9wRAQZNIGsFxkxYcSFezC5msUbUyVSiDb3RlXd/+xGQhEuCA8W+65kY
         J/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVH/TG0X5nc+OJDJjdBAWKrgLZO0o2GrLLixGpqji0EEbjVK4Ag24+d0Ae7I6PQw83I11d5hYc/spAKbD82@vger.kernel.org, AJvYcCWmo6247LcQpDd+I4uAgTlulfPlaKiNF6BJ+AwgS+YlRJxJHDFzfp/rXopI5THCjtDri3EMFODbSFA=@vger.kernel.org, AJvYcCXesvpYbGky7v3MqihEryF/mufFx24ZUNAQgXc40Kpi1gSg2Jj2TG6KsL3+qmhFaws7nSjFLz+I@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50ctRI7aIjoIgWBYXAOwty+1oOss7yg7GhzQQjYlS0KWX4iYu
	2BBgFuU0R4f/x+qko5rw0Gt0aMk90xhBbRZhXE5ySkc/6VnSUaIi
X-Gm-Gg: ASbGncsbDRQ2/CQZycFh1xRs6cUQXOhe434Esj/tSYJo/DfpSy/+7PdCu2HlVdArxPK
	zXuR4MMwPB6EkEiUrbwbtVf1K3cJ0hZd5EqnkoIXCdevf+gojpLjQ20zsIwR6+eYQdAdyO6tsvb
	a0jdWiNTRzCgmpLxwuiWOo0X/V4i4EwUzb5KKmnJ2C0Y8xfN9d0BTv7mXnAsVX57hBMcEl7oMC6
	suxgbpO6FczE2Y6NBV5YtSjygErjUGWXUkfZYMP+ZrfQO90sswcnFq3SWRpv+cy7btNCTI41Tb+
	JxIDz1Sv8/lj4EzpXZhRK+2k7chK7RwfHGozwZbgie1avIqOZRcZv7aJlZzJrD01zyPmcOwaMzH
	YfZPf
X-Google-Smtp-Source: AGHT+IFtWSfALiUVVnpFFz7ImelE+nmATZJYkY40gYG/szbhM9XPyGAl4heVD8RQkSCE7sXqGFzn6Q==
X-Received: by 2002:a17:907:d30e:b0:ad2:4cad:9824 with SMTP id a640c23a62f3a-ad24cad9bd2mr198358366b.28.1746970294838;
        Sun, 11 May 2025 06:31:34 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197bd398sm466765366b.152.2025.05.11.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:31:34 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 11 May 2025 15:31:07 +0200
Subject: [PATCH 3/3] i2c: pxa: handle 'Early Bus Busy' condition on Armada
 3700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-i2c-pxa-fix-i2c-communication-v1-3-e9097d09a015@gmail.com>
References: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
In-Reply-To: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
 stable@vger.kernel.org
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
5.10.237, 5.15.182, 6.1.138, 6.6.90, 6.12.28, 6.14.6. It improves
recoverabilty on all of them.

Cc: stable@vger.kernel.org # 5.8+
Fixes: 7c9ec2c52518 ("i2c: pxa: implement generic i2c bus recovery")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
Note: the patch is included in this series for completeness however
it can be applied independently from the preceding patches. On kernels
6.3+, it restores I2C functionality even in itself because it recovers
the controller from the bad state described in the previous patch.
---
 drivers/i2c/busses/i2c-pxa.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index a36fc30e6f262f0608e0bc77d02771d13d0e0921..5196389428b21b7d15569e7469380bf190f46d67 100644
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
@@ -429,7 +431,7 @@ static int i2c_pxa_wait_bus_not_busy(struct pxa_i2c *i2c)
 
 	while (1) {
 		isr = readl(_ISR(i2c));
-		if (!(isr & (ISR_IBB | ISR_UB)))
+		if (!(isr & i2c->busy_mask))
 			return 0;
 
 		if (isr & ISR_SAD)
@@ -466,7 +468,7 @@ static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
 		 * quick check of the i2c lines themselves to ensure they've
 		 * gone high...
 		 */
-		if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) == 0 &&
+		if ((readl(_ISR(i2c)) & i2c->busy_mask) == 0 &&
 		    readl(_IBMR(i2c)) == (IBMR_SCLS | IBMR_SDAS)) {
 			if (i2c_debug > 0)
 				dev_dbg(&i2c->adap.dev, "%s: done\n", __func__);
@@ -487,7 +489,7 @@ static int i2c_pxa_set_master(struct pxa_i2c *i2c)
 	if (i2c_debug)
 		dev_dbg(&i2c->adap.dev, "setting to bus master\n");
 
-	if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) != 0) {
+	if ((readl(_ISR(i2c)) & i2c->busy_mask) != 0) {
 		dev_dbg(&i2c->adap.dev, "%s: unit is busy\n", __func__);
 		if (!i2c_pxa_wait_master(i2c)) {
 			dev_dbg(&i2c->adap.dev, "%s: error: unit busy\n", __func__);
@@ -513,7 +515,7 @@ static int i2c_pxa_wait_slave(struct pxa_i2c *i2c)
 			dev_dbg(&i2c->adap.dev, "%s: %ld: ISR=%08x, ICR=%08x, IBMR=%02x\n",
 				__func__, (long)jiffies, readl(_ISR(i2c)), readl(_ICR(i2c)), readl(_IBMR(i2c)));
 
-		if ((readl(_ISR(i2c)) & (ISR_UB|ISR_IBB)) == 0 ||
+		if ((readl(_ISR(i2c)) & i2c->busy_mask) == 0 ||
 		    (readl(_ISR(i2c)) & ISR_SAD) != 0 ||
 		    (readl(_ICR(i2c)) & ICR_SCLE) == 0) {
 			if (i2c_debug > 1)
@@ -1171,7 +1173,7 @@ static int i2c_pxa_pio_set_master(struct pxa_i2c *i2c)
 	/*
 	 * Wait for the bus to become free.
 	 */
-	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB))
+	while (timeout-- && readl(_ISR(i2c)) & i2c->busy_mask)
 		udelay(1000);
 
 	if (timeout < 0) {
@@ -1316,7 +1318,7 @@ static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
 	 * handing control of the bus back to avoid the bus changing state.
 	 */
 	isr = readl(_ISR(i2c));
-	if (isr & (ISR_UB | ISR_IBB)) {
+	if (isr & i2c->busy_mask) {
 		dev_dbg(&i2c->adap.dev,
 			"recovery: resetting controller, ISR=0x%08x\n", isr);
 		i2c_pxa_do_reset(i2c);
@@ -1480,6 +1482,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	i2c->fm_mask = pxa_reg_layout[i2c_type].fm;
 	i2c->hs_mask = pxa_reg_layout[i2c_type].hs;
 
+	i2c->busy_mask = ISR_UB | ISR_IBB;
+	if (i2c_type == REGS_A3700)
+		i2c->busy_mask |= ISR_A3700_EBB;
+
 	if (i2c_type != REGS_CE4100)
 		i2c->reg_isar = i2c->reg_base + pxa_reg_layout[i2c_type].isar;
 

-- 
2.49.0


