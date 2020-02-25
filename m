Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34F9C16C386
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730499AbgBYOMg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:12:36 -0500
Received: from sauhun.de ([88.99.104.3]:39120 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730449AbgBYOMg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:12:36 -0500
Received: from localhost (p5486CE6D.dip0.t-ipconnect.de [84.134.206.109])
        by pokefinder.org (Postfix) with ESMTPSA id C91092C08C2;
        Tue, 25 Feb 2020 15:12:33 +0100 (CET)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH] macintosh: therm_windtunnel: fix regression when instantiating devices
Date:   Tue, 25 Feb 2020 15:12:29 +0100
Message-Id: <20200225141229.5424-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Removing attach_adapter from this driver caused a regression for at
least some machines. Those machines had the sensors described in their
DT, too, so they didn't need manual creation of the sensor devices. The
old code worked, though, because manual creation came first. Creation of
DT devices then failed later and caused error logs, but the sensors
worked nonetheless because of the manually created devices.

When removing attach_adaper, manual creation now comes later and loses
the race. The sensor devices were already registered via DT, yet with
another binding, so the driver could not be bound to it.

This fix refactors the code to remove the race and only manually creates
devices if there are no DT nodes present. Also, the DT binding is updated
to match both, the DT and manually created devices. Because we don't
know which device creation will be used at runtime, the code to start
the kthread is moved to do_probe() which will be called by both methods.

Fixes: 3e7bed52719d ("macintosh: therm_windtunnel: drop using attach_adapter")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=201723
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Tested-by: Erhard Furtner <erhard_f@mailbox.org>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

I suggest this stable-tag: # v4.19+

Adding the Debian-PPC List to reach further people maybe willing to
test.

This patch does not depend on "[PATCH RESEND] macintosh: convert to
i2c_new_scanned_device". In fact, this one here should go in first as
5.6 material. I will rebase and resend the i2c_new_scanned_device()
conversion on top of this regression fix.

I can also take this via I2C if easier.

 drivers/macintosh/therm_windtunnel.c | 52 +++++++++++++++++-----------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index 8c744578122a..a0d87ed9da69 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -300,9 +300,11 @@ static int control_loop(void *dummy)
 /*	i2c probing and setup						*/
 /************************************************************************/
 
-static int
-do_attach( struct i2c_adapter *adapter )
+static void do_attach(struct i2c_adapter *adapter)
 {
+	struct i2c_board_info info = { };
+	struct device_node *np;
+
 	/* scan 0x48-0x4f (DS1775) and 0x2c-2x2f (ADM1030) */
 	static const unsigned short scan_ds1775[] = {
 		0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
@@ -313,25 +315,24 @@ do_attach( struct i2c_adapter *adapter )
 		I2C_CLIENT_END
 	};
 
-	if( strncmp(adapter->name, "uni-n", 5) )
-		return 0;
-
-	if( !x.running ) {
-		struct i2c_board_info info;
+	if (x.running || strncmp(adapter->name, "uni-n", 5))
+		return;
 
-		memset(&info, 0, sizeof(struct i2c_board_info));
-		strlcpy(info.type, "therm_ds1775", I2C_NAME_SIZE);
+	np = of_find_compatible_node(adapter->dev.of_node, NULL, "MAC,ds1775");
+	if (np) {
+		of_node_put(np);
+	} else {
+		strlcpy(info.type, "MAC,ds1775", I2C_NAME_SIZE);
 		i2c_new_probed_device(adapter, &info, scan_ds1775, NULL);
+	}
 
-		strlcpy(info.type, "therm_adm1030", I2C_NAME_SIZE);
+	np = of_find_compatible_node(adapter->dev.of_node, NULL, "MAC,adm1030");
+	if (np) {
+		of_node_put(np);
+	} else {
+		strlcpy(info.type, "MAC,adm1030", I2C_NAME_SIZE);
 		i2c_new_probed_device(adapter, &info, scan_adm1030, NULL);
-
-		if( x.thermostat && x.fan ) {
-			x.running = 1;
-			x.poll_task = kthread_run(control_loop, NULL, "g4fand");
-		}
 	}
-	return 0;
 }
 
 static int
@@ -404,8 +405,8 @@ attach_thermostat( struct i2c_client *cl )
 enum chip { ds1775, adm1030 };
 
 static const struct i2c_device_id therm_windtunnel_id[] = {
-	{ "therm_ds1775", ds1775 },
-	{ "therm_adm1030", adm1030 },
+	{ "MAC,ds1775", ds1775 },
+	{ "MAC,adm1030", adm1030 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, therm_windtunnel_id);
@@ -414,6 +415,7 @@ static int
 do_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 {
 	struct i2c_adapter *adapter = cl->adapter;
+	int ret = 0;
 
 	if( !i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA
 				     | I2C_FUNC_SMBUS_WRITE_BYTE) )
@@ -421,11 +423,19 @@ do_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 
 	switch (id->driver_data) {
 	case adm1030:
-		return attach_fan( cl );
+		ret = attach_fan(cl);
+		break;
 	case ds1775:
-		return attach_thermostat(cl);
+		ret = attach_thermostat(cl);
+		break;
 	}
-	return 0;
+
+	if (!x.running && x.thermostat && x.fan) {
+		x.running = 1;
+		x.poll_task = kthread_run(control_loop, NULL, "g4fand");
+	}
+
+	return ret;
 }
 
 static struct i2c_driver g4fan_driver = {
-- 
2.20.1

