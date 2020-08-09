Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF67A23FF85
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Aug 2020 19:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgHIRcx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Aug 2020 13:32:53 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:34937 "EHLO
        7.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHIRcx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Aug 2020 13:32:53 -0400
Received: from player795.ha.ovh.net (unknown [10.108.42.215])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 537F31DFF7C
        for <linux-i2c@vger.kernel.org>; Sun,  9 Aug 2020 19:24:57 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player795.ha.ovh.net (Postfix) with ESMTPSA id 2BBEF14FE8470;
        Sun,  9 Aug 2020 17:24:49 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-96R0015649a600-0f68-4a5c-85ee-d70978482479,
                    949AEE3423C323647D875781C307A391B5D7792E) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2] ARM: davinci: use simple i2c probe function
Date:   Sun,  9 Aug 2020 19:24:44 +0200
Message-Id: <20200809172444.16019-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3560095507233459702
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkeeigdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeetgedugfelkeeikeetgeegteevfeeufeetuefgudeiiedthfehtdeffeekvdeffeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c probe functions here don't use the id information provided in
their second argument, so the single-parameter i2c probe function
("probe_new") can be used instead.

This avoids scanning the identifier tables during probes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
Changes since v1:
  - split into per-sub-architecture patches.

 arch/arm/mach-davinci/board-dm644x-evm.c |  5 ++---
 arch/arm/mach-davinci/board-dm646x-evm.c | 10 ++++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index a5d3708fedf6..d0dcf69cc76d 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -548,8 +548,7 @@ static const struct property_entry eeprom_properties[] = {
  */
 static struct i2c_client *dm6446evm_msp;
 
-static int dm6446evm_msp_probe(struct i2c_client *client,
-		const struct i2c_device_id *id)
+static int dm6446evm_msp_probe(struct i2c_client *client)
 {
 	dm6446evm_msp = client;
 	return 0;
@@ -569,7 +568,7 @@ static const struct i2c_device_id dm6446evm_msp_ids[] = {
 static struct i2c_driver dm6446evm_msp_driver = {
 	.driver.name	= "dm6446evm_msp",
 	.id_table	= dm6446evm_msp_ids,
-	.probe		= dm6446evm_msp_probe,
+	.probe_new	= dm6446evm_msp_probe,
 	.remove		= dm6446evm_msp_remove,
 };
 
diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index 4600b617f9b4..2dce16fff77e 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -160,8 +160,7 @@ static struct platform_device davinci_aemif_device = {
 #define DM646X_EVM_ATA_PWD		BIT(1)
 
 /* CPLD Register 0 Client: used for I/O Control */
-static int cpld_reg0_probe(struct i2c_client *client,
-			   const struct i2c_device_id *id)
+static int cpld_reg0_probe(struct i2c_client *client)
 {
 	if (HAS_ATA) {
 		u8 data;
@@ -197,7 +196,7 @@ static const struct i2c_device_id cpld_reg_ids[] = {
 static struct i2c_driver dm6467evm_cpld_driver = {
 	.driver.name	= "cpld_reg0",
 	.id_table	= cpld_reg_ids,
-	.probe		= cpld_reg0_probe,
+	.probe_new	= cpld_reg0_probe,
 };
 
 /* LEDS */
@@ -402,8 +401,7 @@ static struct snd_platform_data dm646x_evm_snd_data[] = {
 #ifdef CONFIG_I2C
 static struct i2c_client *cpld_client;
 
-static int cpld_video_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int cpld_video_probe(struct i2c_client *client)
 {
 	cpld_client = client;
 	return 0;
@@ -424,7 +422,7 @@ static struct i2c_driver cpld_video_driver = {
 	.driver = {
 		.name	= "cpld_video",
 	},
-	.probe		= cpld_video_probe,
+	.probe_new	= cpld_video_probe,
 	.remove		= cpld_video_remove,
 	.id_table	= cpld_video_id,
 };

base-commit: bcf876870b95592b52519ed4aafcf9d95999bc9c
-- 
2.20.1

