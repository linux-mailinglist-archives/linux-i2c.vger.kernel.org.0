Return-Path: <linux-i2c+bounces-150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E07EB1AF
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 15:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5FD51C209A3
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 14:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BB5405F8;
	Tue, 14 Nov 2023 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rpWoKggN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0eX7sX3X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F965405DB
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 14:13:32 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36FDCA
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 06:13:30 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 593381F893;
	Tue, 14 Nov 2023 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699971209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZG+TFBSnHn8MA7nXFwvbnKBJ+1NbG5hFac2Wm4u4jDc=;
	b=rpWoKggNH854VdfQAWPf4so6/oBlvVgclhS/I6CXzEczTQBc1oJ4SPKZIY8ut74JcRPBYG
	xZjLwpS30iWEcI7S8G0OBqTn2liTcr8GY69ktWXZCHQkVdyrH1HGXFNZsCjVkywBIG2qXc
	4UbJYKNB+DZ3h0rZYBx7YR6HFrmhNwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699971209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZG+TFBSnHn8MA7nXFwvbnKBJ+1NbG5hFac2Wm4u4jDc=;
	b=0eX7sX3XR43HaqJGaneMib69qIVAl8Ts48ZZA1dhDgM1Bu/781olrwyxMS/MzPXfzT0z5Y
	mJVqT0hTAxTxN6CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3491F13416;
	Tue, 14 Nov 2023 14:13:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FD8kC4mAU2VvJgAAMHmgww
	(envelope-from <jdelvare@suse.de>); Tue, 14 Nov 2023 14:13:29 +0000
Date: Tue, 14 Nov 2023 15:13:28 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: smbus: Support up to 8 SPD EEPROMs
Message-ID: <20231114151328.5f40b7c5@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.10
X-Spamd-Result: default: False [-4.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.00)[33.78%];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 HAS_ORG_HEADER(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]

I originally restricted i2c_register_spd() to only support systems
with up to 4 memory slots, so that we can experiment with it on
a limited numbers of systems. It's been more than 3 years and it
seems to work just fine, so the time has come to lift this arbitrary
limitation.

The maximum number of memory slots which can be connected to a single
I2C segment is 8, so support that many SPD EEPROMs. Any system with
more than 8 memory slots would have either multiple SMBus channels
or SMBus multiplexing, so it would need dedicated care. We'll get to
that later as needed.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/i2c-smbus.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-6.6.orig/drivers/i2c/i2c-smbus.c
+++ linux-6.6/drivers/i2c/i2c-smbus.c
@@ -308,8 +308,8 @@ EXPORT_SYMBOL_GPL(i2c_free_slave_host_no
  * target systems are the same.
  * Restrictions to automatic SPD instantiation:
  *  - Only works if all filled slots have the same memory type
- *  - Only works for DDR2, DDR3 and DDR4 for now
- *  - Only works on systems with 1 to 4 memory slots
+ *  - Only works for DDR, DDR2, DDR3 and DDR4 for now
+ *  - Only works on systems with 1 to 8 memory slots
  */
 #if IS_ENABLED(CONFIG_DMI)
 void i2c_register_spd(struct i2c_adapter *adap)
@@ -354,9 +354,9 @@ void i2c_register_spd(struct i2c_adapter
 	dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
 		 dimm_count, slot_count);
 
-	if (slot_count > 4) {
+	if (slot_count > 8) {
 		dev_warn(&adap->dev,
-			 "Systems with more than 4 memory slots not supported yet, not instantiating SPD\n");
+			 "Systems with more than 8 memory slots not supported yet, not instantiating SPD\n");
 		return;
 	}
 


-- 
Jean Delvare
SUSE L3 Support

