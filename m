Return-Path: <linux-i2c+bounces-12249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA8B215F1
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 21:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4017F624FD6
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 19:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7762E2DCA;
	Mon, 11 Aug 2025 19:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtiHDyeg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BD62D9EEA;
	Mon, 11 Aug 2025 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941815; cv=none; b=cihzMlGPayr8fHmboidv5ctt3MPq19hhrmiU30DEbF46ER17F0YIdUoobCRfI6vsLcFbtDJjeYUgqKf0rP+kyt1tlTDXzTKmGG+/0mo9f4hgkFdQlIS8WuqR3xkxVhOlfE4XWOzEx29vX6V032J4IihENOEFF+x+xXnhLQKfA6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941815; c=relaxed/simple;
	bh=89jFVCcvH315+OBPK+ER309BSdX2dvJBAwSZQuHsMXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7ncg/SiLbpPvU15lKgxf//OlFIRxOhLSkrw9txfsPRfu/3wW5+Ztwyqr0mIIqBN1lvByw3oflOPPr9zM00NHgRiTh5JnEziyiOE+4zOLeDVSthz9KCu4cPdlMqvd47IpjqCmTeQAb3IiPhuscAeoBv9jZfkNJjENSTiJxxpH8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtiHDyeg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b8de6f7556so2645808f8f.1;
        Mon, 11 Aug 2025 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754941811; x=1755546611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq0f9hbxOiPcgOoagCVQftGeGCtA482uSOeV1n3ljhk=;
        b=KtiHDyeg0Avxc5/RGyN80z5Q3QvboT7EyLd/mik0xcXDazF2bfXQ6OBpeG5FZM3nxq
         pe90rVorQ/KiuGnPZYnbwPhdNXRwq7RyK+WClJLWGTKEIjLKUyb4vMozHaFDcPuxhT5S
         f1poiCrBB27wD9S/qRCFHJKFHDATG8egWCVVfhosRuXiOYKnKuezj3vdEQcLRYsbr3Ox
         RJ4f+eBMurs2c8RHvpmu6lI5xq6FcfEwbiG6mNB/NaL5mYGs92q/361g4i+3mYl8/b9u
         MqkEZ2amgAlMPnDx93jTXNRYaj1da8+dkj4CuoFkXbUe6MRNyPAEoLo0wft68xdPvbas
         qyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754941811; x=1755546611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dq0f9hbxOiPcgOoagCVQftGeGCtA482uSOeV1n3ljhk=;
        b=BfMkhPRl192c1P/rh/BnGMNnx8xVlQixlCT7291ObiyQEOKQ1ui/agkb9AsIqRdoTT
         k5aIs/1ObAmh3j7ujggAz3DmoTXaKLGwmowfcmkeHrgvZpW2YVnvlZfaM/LFYR5MoXuO
         q4uqY3CaPNHFJrF3J2V3m29YfTs3UlKNYiWKdVTlJXi2ZForw3lxTBiomCe9cb/RBY4t
         c2Rv5hnjYVeO31f6CypFjtiWn9U6TAPYOS3l7+beMXHcONyPKLC0Q23tZi+/t/oIHNvR
         CASYSCRP/EStT2fkJEH3o7zyoX2hnIU5OBb8LIsmfgljx8Y0M9SLIFWxqecjwzg3rZLv
         UIPw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZU+TztRvpfAm5NcmmUolH1OLfui3z/y+eXAon47dGBOTwwfshIVG/FRcB5kfLYmb1PfYB33x@vger.kernel.org, AJvYcCW5RVaLZPuTp7AThaztMCgKa667OLGCLuHzQ70k2rvbHFjRU3ERBnMQgO7BGoVrEMbP/fz5Abp6VIxBKV4f@vger.kernel.org, AJvYcCWksFJF6ie53IJUF2ikajT92G8h+k72+snZ8XtasIXHx1EHY20Eioko/t4jB18U43YTLkrneggys/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTITeAAtK/MA3w6qfhBJoYAbinqSuwHZTBZbvpt8u0ztZfzg2R
	lfGAaP1nBMk0L0XX4EPbRJIZki+q3fGmbeDs54mAhZRb0JXdMz11cPPg92k2iA==
X-Gm-Gg: ASbGncutz7TV6p/Y9V1JnVZ9O9bp3yONseGFvzSvxVxZ99SNNDOgdh2oP/OKIplRdZu
	AzDbg4dMa2vpckr1JX2/p/ZssGB5v/Rgne/yDMyNXLy6mornSLs4JVpXyANZusVIh6VSjSmDbrs
	bZcNCvKnqh1LV19swfdGv39YQaHDSQVaTHJD2Fuyek0YfL4oKwE6mnqBX5Tt5/w7Rm9WzcKGdEH
	E9T5+6Y7tsgAVq7VjhcgLxtMyXVfXHbgx8xfA+30mdSWLyW5r7yoOUZMFKQ1Xazm06U0Ykfucfd
	xuD4w81q85mrp50HCqDtG04OpA4L28ITKrvFxqMftepHVYxqdm9CjwVJR/tABVX89wofLzYZSKG
	KAUeIevHt1pCN1j2OZWiAHQVO4onALrJWKsHJFcKx3lg7NJRQjTo=
X-Google-Smtp-Source: AGHT+IH+bAdPsDt9XrIorgyNOEYeyaktekbVrFIZRRBjXCSd5Yc5wHtmlxqS1JCQ8nOI7Z8NtI15og==
X-Received: by 2002:a05:6000:2002:b0:3b7:9b81:73f6 with SMTP id ffacd0b85a97d-3b911042100mr751660f8f.54.1754941811015;
        Mon, 11 Aug 2025 12:50:11 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm41709246f8f.22.2025.08.11.12.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:50:10 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 21:49:57 +0200
Subject: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
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
 Imre Kaloz <kaloz@openwrt.org>, Gabor Juhos <j4g8y7@gmail.com>, 
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
Changes in v2:
  - rebase and retest on tip of i2c/for-current

Note: the patch is included in this series for completeness however
it can be applied independently from the preceding patches. On kernels
6.3+, it restores I2C functionality even in itself because it recovers
the controller from the bad state described in the previous patch.
---
 drivers/i2c/busses/i2c-pxa.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index f4cb36e22077753e21b0260df52b8bdbb85fa308..6239200631211b2b6c9919d27fec63704bd19e52 100644
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
2.50.1


