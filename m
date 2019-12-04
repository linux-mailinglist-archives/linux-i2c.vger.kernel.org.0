Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61802112B7A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2019 13:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfLDM3t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Dec 2019 07:29:49 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:36823 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726604AbfLDM3t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Dec 2019 07:29:49 -0500
Received: from [109.168.11.45] (port=60292 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1icTms-00DmHO-1W; Wed, 04 Dec 2019 13:29:46 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: remove unneeded 'extern' from function declatations
Date:   Wed,  4 Dec 2019 13:29:36 +0100
Message-Id: <20191204122936.20101-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

According to coding-style.rst, extern should not be specified for
exported functions.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 include/linux/i2c.h | 117 +++++++++++++++++++++-----------------------
 1 file changed, 56 insertions(+), 61 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index d2f786706657..ee5bd19e0b00 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -50,8 +50,8 @@ struct property_entry;
  * transmit an arbitrary number of messages without interruption.
  * @count must be be less than 64k since msg.len is u16.
  */
-extern int i2c_transfer_buffer_flags(const struct i2c_client *client,
-				     char *buf, int count, u16 flags);
+int i2c_transfer_buffer_flags(const struct i2c_client *client,
+			      char *buf, int count, u16 flags);
 
 /**
  * i2c_master_recv - issue a single I2C message in master receive mode
@@ -115,11 +115,9 @@ static inline int i2c_master_send_dmasafe(const struct i2c_client *client,
 
 /* Transfer num messages.
  */
-extern int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			int num);
+int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
 /* Unlocked flavor */
-extern int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			  int num);
+int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
 
 /* This is the very generalized SMBus access routine. You probably do not
    want to use this, though; one of the functions below may be much easier,
@@ -138,16 +136,14 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 /* Now follow the 'nice' access routines. These also document the calling
    conventions of i2c_smbus_xfer. */
 
-extern s32 i2c_smbus_read_byte(const struct i2c_client *client);
-extern s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value);
-extern s32 i2c_smbus_read_byte_data(const struct i2c_client *client,
-				    u8 command);
-extern s32 i2c_smbus_write_byte_data(const struct i2c_client *client,
-				     u8 command, u8 value);
-extern s32 i2c_smbus_read_word_data(const struct i2c_client *client,
-				    u8 command);
-extern s32 i2c_smbus_write_word_data(const struct i2c_client *client,
-				     u8 command, u16 value);
+s32 i2c_smbus_read_byte(const struct i2c_client *client);
+s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value);
+s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command);
+s32 i2c_smbus_write_byte_data(const struct i2c_client *client,
+			      u8 command, u8 value);
+s32 i2c_smbus_read_word_data(const struct i2c_client *client, u8 command);
+s32 i2c_smbus_write_word_data(const struct i2c_client *client,
+			      u8 command, u16 value);
 
 static inline s32
 i2c_smbus_read_word_swapped(const struct i2c_client *client, u8 command)
@@ -165,19 +161,18 @@ i2c_smbus_write_word_swapped(const struct i2c_client *client,
 }
 
 /* Returns the number of read bytes */
-extern s32 i2c_smbus_read_block_data(const struct i2c_client *client,
-				     u8 command, u8 *values);
-extern s32 i2c_smbus_write_block_data(const struct i2c_client *client,
-				      u8 command, u8 length, const u8 *values);
+s32 i2c_smbus_read_block_data(const struct i2c_client *client,
+			      u8 command, u8 *values);
+s32 i2c_smbus_write_block_data(const struct i2c_client *client,
+			       u8 command, u8 length, const u8 *values);
 /* Returns the number of read bytes */
-extern s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client,
-					 u8 command, u8 length, u8 *values);
-extern s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client,
-					  u8 command, u8 length,
-					  const u8 *values);
-extern s32
-i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
-					  u8 command, u8 length, u8 *values);
+s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client,
+				  u8 command, u8 length, u8 *values);
+s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client,
+				   u8 command, u8 length, const u8 *values);
+s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
+					      u8 command, u8 length,
+					      u8 *values);
 int i2c_get_device_id(const struct i2c_client *client,
 		      struct i2c_device_identity *id);
 #endif /* I2C */
@@ -336,10 +331,10 @@ struct i2c_client {
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
-extern struct i2c_client *i2c_verify_client(struct device *dev);
-extern struct i2c_adapter *i2c_verify_adapter(struct device *dev);
-extern const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
-					const struct i2c_client *client);
+struct i2c_client *i2c_verify_client(struct device *dev);
+struct i2c_adapter *i2c_verify_adapter(struct device *dev);
+const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
+					 const struct i2c_client *client);
 
 static inline struct i2c_client *kobj_to_i2c_client(struct kobject *kobj)
 {
@@ -368,9 +363,9 @@ enum i2c_slave_event {
 	I2C_SLAVE_STOP,
 };
 
-extern int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
-extern int i2c_slave_unregister(struct i2c_client *client);
-extern bool i2c_detect_slave_mode(struct device *dev);
+int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
+int i2c_slave_unregister(struct i2c_client *client);
+bool i2c_detect_slave_mode(struct device *dev);
 
 static inline int i2c_slave_event(struct i2c_client *client,
 				  enum i2c_slave_event event, u8 *val)
@@ -439,10 +434,10 @@ struct i2c_board_info {
  * with integrated I2C, a config eeprom, sensors, and a codec that's
  * used in conjunction with the primary hardware.
  */
-extern struct i2c_client *
+struct i2c_client *
 i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
 
-extern struct i2c_client *
+struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
 
 /* If you don't know the exact address of an I2C device, use this variant
@@ -451,39 +446,39 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
  * it must return 1 on successful probe, 0 otherwise. If it is not provided,
  * a default probing method is used.
  */
-extern struct i2c_client *
+struct i2c_client *
 i2c_new_scanned_device(struct i2c_adapter *adap,
 		       struct i2c_board_info *info,
 		       unsigned short const *addr_list,
 		       int (*probe)(struct i2c_adapter *adap, unsigned short addr));
 
-extern struct i2c_client *
+struct i2c_client *
 i2c_new_probed_device(struct i2c_adapter *adap,
 		       struct i2c_board_info *info,
 		       unsigned short const *addr_list,
 		       int (*probe)(struct i2c_adapter *adap, unsigned short addr));
 
 /* Common custom probe functions */
-extern int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr);
+int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr);
 
 /* For devices that use several addresses, use i2c_new_dummy() to make
  * client handles for the extra addresses.
  */
-extern struct i2c_client *
+struct i2c_client *
 i2c_new_dummy(struct i2c_adapter *adap, u16 address);
 
-extern struct i2c_client *
+struct i2c_client *
 i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address);
 
-extern struct i2c_client *
+struct i2c_client *
 devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, u16 address);
 
-extern struct i2c_client *
+struct i2c_client *
 i2c_new_ancillary_device(struct i2c_client *client,
-				const char *name,
-				u16 default_addr);
+			 const char *name,
+			 u16 default_addr);
 
-extern void i2c_unregister_device(struct i2c_client *client);
+void i2c_unregister_device(struct i2c_client *client);
 #endif /* I2C */
 
 /* Mainboard arch_initcall() code should register all its I2C devices.
@@ -491,7 +486,7 @@ extern void i2c_unregister_device(struct i2c_client *client);
  * Modules for add-on boards must use other calls.
  */
 #ifdef CONFIG_I2C_BOARDINFO
-extern int
+int
 i2c_register_board_info(int busnum, struct i2c_board_info const *info,
 			unsigned n);
 #else
@@ -845,12 +840,12 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
 /* administration...
  */
 #if IS_ENABLED(CONFIG_I2C)
-extern int i2c_add_adapter(struct i2c_adapter *adap);
-extern void i2c_del_adapter(struct i2c_adapter *adap);
-extern int i2c_add_numbered_adapter(struct i2c_adapter *adap);
+int i2c_add_adapter(struct i2c_adapter *adap);
+void i2c_del_adapter(struct i2c_adapter *adap);
+int i2c_add_numbered_adapter(struct i2c_adapter *adap);
 
-extern int i2c_register_driver(struct module *owner, struct i2c_driver *driver);
-extern void i2c_del_driver(struct i2c_driver *driver);
+int i2c_register_driver(struct module *owner, struct i2c_driver *driver);
+void i2c_del_driver(struct i2c_driver *driver);
 
 /* use a define to avoid include chaining to get THIS_MODULE */
 #define i2c_add_driver(driver) \
@@ -858,12 +853,12 @@ extern void i2c_del_driver(struct i2c_driver *driver);
 
 /* call the i2c_client->command() of all attached clients with
  * the given arguments */
-extern void i2c_clients_command(struct i2c_adapter *adap,
-				unsigned int cmd, void *arg);
+void i2c_clients_command(struct i2c_adapter *adap,
+			 unsigned int cmd, void *arg);
 
-extern struct i2c_adapter *i2c_get_adapter(int nr);
-extern void i2c_put_adapter(struct i2c_adapter *adap);
-extern unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
+struct i2c_adapter *i2c_get_adapter(int nr);
+void i2c_put_adapter(struct i2c_adapter *adap);
+unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
 
 void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults);
 
@@ -935,15 +930,15 @@ int i2c_handle_smbus_host_notify(struct i2c_adapter *adap, unsigned short addr);
 
 #if IS_ENABLED(CONFIG_OF)
 /* must call put_device() when done with returned i2c_client device */
-extern struct i2c_client *of_find_i2c_device_by_node(struct device_node *node);
+struct i2c_client *of_find_i2c_device_by_node(struct device_node *node);
 
 /* must call put_device() when done with returned i2c_adapter device */
-extern struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node);
+struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node);
 
 /* must call i2c_put_adapter() when done with returned i2c_adapter device */
 struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node);
 
-extern const struct of_device_id
+const struct of_device_id
 *i2c_of_match_device(const struct of_device_id *matches,
 		     struct i2c_client *client);
 
-- 
2.24.0

