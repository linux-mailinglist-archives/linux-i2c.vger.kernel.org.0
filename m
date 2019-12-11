Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C423E11ACAB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2019 15:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbfLKOAI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Dec 2019 09:00:08 -0500
Received: from mail.manjaro.org ([176.9.38.148]:38226 "EHLO manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbfLKOAI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Dec 2019 09:00:08 -0500
Received: from localhost (localhost [127.0.0.1])
        by manjaro.org (Postfix) with ESMTP id 2281336E23B6;
        Wed, 11 Dec 2019 14:40:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id l9ZXN6hT5BHM; Wed, 11 Dec 2019 14:40:11 +0100 (CET)
From:   Tobias Schramm <t.schramm@manjaro.org>
To:     linux-kernel@vger.kernel.org, linux-pm@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org
Cc:     anarsoul@gmail.com, sre@kernel.org, pali.rohar@gmail.com,
        david@lechnology.com, afd@ti.com,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH 1/2] power: supply: add CW2015 Fuel Gauge driver
Date:   Wed, 11 Dec 2019 14:39:29 +0100
Message-Id: <20191211133930.7488-2-t.schramm@manjaro.org>
In-Reply-To: <20191211133930.7488-1-t.schramm@manjaro.org>
References: <20191211133930.7488-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The CellWise CW2015 is a I2C interfaced shuntless Fuel Gauge for lithium-ion
batteries.
This patch adds support for the CellWise CW2015 Fuel Gauge.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 drivers/power/supply/Kconfig          |   7 +
 drivers/power/supply/Makefile         |   1 +
 drivers/power/supply/cw2015_battery.c | 962 ++++++++++++++++++++++++++
 include/linux/power/cw2015_battery.h  | 122 ++++
 4 files changed, 1092 insertions(+)
 create mode 100644 drivers/power/supply/cw2015_battery.c
 create mode 100644 include/linux/power/cw2015_battery.h

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 27164a1d3c7c..e3eb2dbaf44f 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -116,6 +116,13 @@ config BATTERY_CPCAP
 	  Say Y here to enable support for battery on Motorola
 	  phones and tablets such as droid 4.
 
+config BATTERY_CW2015
+	tristate "CW2015 battery driver"
+	depends on I2C
+	help
+	  Say Y here to enable support for the cellwise cw2015
+	  battery fuel gauge (used in the Pinebook Pro & others)
+
 config BATTERY_DS2760
 	tristate "DS2760 battery driver (HP iPAQ & others)"
 	depends on W1
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 6c7da920ea83..69727a10e835 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_BATTERY_ACT8945A)	+= act8945a_charger.o
 obj-$(CONFIG_BATTERY_AXP20X)	+= axp20x_battery.o
 obj-$(CONFIG_CHARGER_AXP20X)	+= axp20x_ac_power.o
 obj-$(CONFIG_BATTERY_CPCAP)	+= cpcap-battery.o
+obj-$(CONFIG_BATTERY_CW2015)	+= cw2015_battery.o
 obj-$(CONFIG_BATTERY_DS2760)	+= ds2760_battery.o
 obj-$(CONFIG_BATTERY_DS2780)	+= ds2780_battery.o
 obj-$(CONFIG_BATTERY_DS2781)	+= ds2781_battery.o
diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
new file mode 100644
index 000000000000..4f1e75c50374
--- /dev/null
+++ b/drivers/power/supply/cw2015_battery.c
@@ -0,0 +1,962 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Fuel gauge driver for CellWise 2013 / 2015
+ *
+ * Copyright (C) 2012, RockChip
+ * Copyright (C) 2019, Tobias Schramm
+ *
+ * Authors: xuhuicong <xhc@rock-chips.com>
+ * Authors: Tobias Schramm <tobias@t-sys.eu>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/slab.h>
+#include <linux/timekeeping.h>
+#include <linux/workqueue.h>
+
+#include <linux/power/cw2015_battery.h>
+
+static int dbg_enable;
+module_param_named(dbg_level, dbg_enable, int, 0644);
+
+#define cw_printk(args...) \
+	do { \
+		if (dbg_enable) { \
+			pr_info(args); \
+		} \
+	} while (0)
+
+
+#define PREFIX "cellwise,"
+
+static int cw_read(struct i2c_client *client, u8 reg, u8 buf[])
+{
+	return i2c_smbus_read_i2c_block_data(client, reg, 1, buf);
+}
+
+static int cw_write(struct i2c_client *client, u8 reg, u8 const buf[])
+{
+	return i2c_smbus_write_i2c_block_data(client, reg, 1, &buf[0]);
+}
+
+static int cw_read_word(struct i2c_client *client, u8 reg, u8 buf[])
+{
+	return i2c_smbus_read_i2c_block_data(client, reg, 2, buf);
+}
+
+int cw_update_config_info(struct cw_battery *cw_bat)
+{
+	int ret;
+	u8 reg_val;
+	u8 i;
+	u8 reset_val;
+
+	cw_printk("[FGADC] test config_info = 0x%x\n",
+		  cw_bat->plat_data.cw_bat_config_info[0]);
+
+	/* make sure no in sleep mode */
+	ret = cw_read(cw_bat->client, CW2015_REG_MODE, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	reset_val = reg_val;
+	if ((reg_val & CW2015_MODE_SLEEP_MASK) == CW2015_MODE_SLEEP) {
+		dev_err(&cw_bat->client->dev,
+			"device in sleep mode, cannot update battery info\n");
+		return -1;
+	}
+
+	/* update new battery info */
+	for (i = 0; i < CW2015_SIZE_BATINFO; i++) {
+		ret =
+		    cw_write(cw_bat->client, CW2015_REG_BATINFO + i,
+			     (u8 *)&cw_bat->plat_data.cw_bat_config_info[i]);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	reg_val |= CW2015_CONFIG_UPDATE_FLG;	/* set UPDATE_FLAG */
+	reg_val &= ~CW2015_MASK_ATHD;	/* clear ATHD */
+	reg_val |= CW2015_ATHD(cw_bat->alert_level);	/* set CW2015_ATHD */
+	ret = cw_write(cw_bat->client, CW2015_REG_CONFIG, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	/* check 2015/cw2013 for CW2015_ATHD & update_flag */
+	ret = cw_read(cw_bat->client, CW2015_REG_CONFIG, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (!(reg_val & CW2015_CONFIG_UPDATE_FLG)) {
+		dev_info(&cw_bat->client->dev,
+			 "update flag for new battery info have not set..\n");
+	}
+
+	if ((reg_val & CW2015_MASK_ATHD) != CW2015_ATHD(cw_bat->alert_level))
+		dev_info(&cw_bat->client->dev, "the new CW2015_ATHD have not set..\n");
+
+	/* reset */
+	reset_val &= ~(CW2015_MODE_RESTART);
+	reg_val = reset_val | CW2015_MODE_RESTART;
+	ret = cw_write(cw_bat->client, CW2015_REG_MODE, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	msleep(10);
+	ret = cw_write(cw_bat->client, CW2015_REG_MODE, &reset_val);
+	if (ret < 0)
+		return ret;
+
+	cw_printk("cw2015 update config success!\n");
+
+	return 0;
+}
+
+static int cw_init(struct cw_battery *cw_bat)
+{
+	int ret;
+	int i;
+	u8 reg_val = CW2015_MODE_SLEEP;
+
+	if ((reg_val & CW2015_MODE_SLEEP_MASK) == CW2015_MODE_SLEEP) {
+		reg_val = CW2015_MODE_NORMAL;
+		ret = cw_write(cw_bat->client, CW2015_REG_MODE, &reg_val);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = cw_read(cw_bat->client, CW2015_REG_CONFIG, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	if ((reg_val & CW2015_MASK_ATHD) != CW2015_ATHD(cw_bat->alert_level)) {
+		dev_info(&cw_bat->client->dev, "the new CW2015_ATHD have not set\n");
+		reg_val &= ~CW2015_MASK_ATHD;
+		reg_val |= ~CW2015_ATHD(cw_bat->alert_level);
+		ret = cw_write(cw_bat->client, CW2015_REG_CONFIG, &reg_val);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = cw_read(cw_bat->client, CW2015_REG_CONFIG, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (!(reg_val & CW2015_CONFIG_UPDATE_FLG)) {
+		cw_printk("update config flg is true, need update config\n");
+		ret = cw_update_config_info(cw_bat);
+		if (ret < 0) {
+			dev_info(&cw_bat->client->dev,
+				 "update flag for new battery info have not set\n");
+			return ret;
+		}
+	} else {
+		for (i = 0; i < CW2015_SIZE_BATINFO; i++) {
+			ret = cw_read(cw_bat->client, (CW2015_REG_BATINFO + i),
+				      &reg_val);
+			if (ret < 0)
+				return ret;
+
+			if (cw_bat->plat_data.cw_bat_config_info[i] != reg_val)
+				break;
+		}
+
+		if (i != CW2015_SIZE_BATINFO) {
+			dev_info(&cw_bat->client->dev,
+				 "update flag for new battery info have not set\n");
+			ret = cw_update_config_info(cw_bat);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	for (i = 0; i < CW2015_READ_TRIES; i++) {
+		ret = cw_read(cw_bat->client, CW2015_REG_SOC, &reg_val);
+		if (ret < 0)
+			return ret;
+		else if (reg_val <= 100) // SOC can't be more than 100 %
+			break;
+		msleep(120);
+	}
+
+	if (i >= CW2015_READ_TRIES) {
+		reg_val = CW2015_MODE_SLEEP;
+		ret = cw_write(cw_bat->client, CW2015_REG_MODE, &reg_val);
+		dev_info(&cw_bat->client->dev, "report battery capacity error");
+		return -1;
+	}
+
+	cw_printk("cw2015 init success!\n");
+	return 0;
+}
+
+static int check_charger_online(struct device *dev, void *data)
+{
+	struct device *cw_dev = data;
+	struct power_supply *supply = dev_get_drvdata(dev);
+	union power_supply_propval val;
+
+	if (supply->desc->type == POWER_SUPPLY_TYPE_BATTERY) {
+		dev_dbg(cw_dev, "Skipping power supply %s since it is a battery\n",
+			dev_name(dev));
+		return 0; // Bail out, not a charger
+	}
+	if (!supply->desc->get_property(supply, POWER_SUPPLY_PROP_ONLINE,
+					&val)) {
+		return val.intval;
+	}
+	dev_dbg(cw_dev, "Skipping power supply %s since it does not "
+		"have an online property\n", dev_name(dev));
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static int device_parent_match_of_node(struct device *dev, const void *np)
+{
+	while (dev) {
+		if (dev->of_node == np) {
+			return 1;
+		}
+		dev = dev->parent;
+	}
+	return 0;
+}
+#endif
+
+static int get_charge_state(struct cw_battery *cw_bat)
+{
+	struct device *cw_dev = &cw_bat->client->dev;
+#ifdef CONFIG_OF
+	int i = 0, online = 0;
+	struct device_node *supply_of;
+
+	if (!cw_dev->of_node) {
+		dev_dbg(cw_dev, "Charger does not have an of node, scanning "
+			"all supplies\n");
+#endif
+		return !!class_for_each_device(power_supply_class, NULL,
+					       cw_dev, check_charger_online);
+#ifdef CONFIG_OF
+	}
+	do {
+		struct device *supply_dev;
+
+		dev_dbg(cw_dev, "Scanning linked supplies of %s\n",
+			cw_dev->of_node->name);
+		supply_of = of_parse_phandle(cw_dev->of_node, "power-supplies",
+					     i++);
+		if (!supply_of) {
+			dev_dbg(cw_dev, "Got empty of node, scan done\n");
+			break;
+		}
+		dev_dbg(cw_dev, "Got power supply %s\n", supply_of->name);
+		supply_dev = class_find_device(power_supply_class, NULL,
+					       supply_of,
+					       device_parent_match_of_node);
+		if (supply_dev) {
+			online = check_charger_online(supply_dev, NULL);
+			dev_dbg(supply_dev, "Charger online: %d\n", online);
+			put_device(supply_dev);
+		} else {
+			dev_warn(cw_dev, "Failed to get device for device "
+				 "node %s\n", supply_of->name);
+		}
+		of_node_put(supply_of);
+	} while (!online);
+	return online;
+#endif
+}
+
+static int cw_por(struct cw_battery *cw_bat)
+{
+	int ret;
+	unsigned char reset_val;
+
+	reset_val = CW2015_MODE_SLEEP;
+	ret = cw_write(cw_bat->client, CW2015_REG_MODE, &reset_val);
+	if (ret < 0)
+		return ret;
+	reset_val = CW2015_MODE_NORMAL;
+	msleep(20);
+	ret = cw_write(cw_bat->client, CW2015_REG_MODE, &reset_val);
+	if (ret < 0)
+		return ret;
+	ret = cw_init(cw_bat);
+	if (ret)
+		return ret;
+	return 0;
+}
+
+static int cw_get_capacity(struct cw_battery *cw_bat)
+{
+	int cw_capacity;
+	int ret;
+	unsigned char reg_val[2];
+
+	static int reset_loop;
+	static int charging_loop;
+	static int discharging_loop;
+	static int jump_flag;
+	static int charging_5_loop;
+	int sleep_cap;
+
+	ret = cw_read_word(cw_bat->client, CW2015_REG_SOC, reg_val);
+	if (ret < 0)
+		return ret;
+
+	cw_capacity = reg_val[0];
+
+	if ((cw_capacity < 0) || (cw_capacity > 100)) {
+		cw_printk("Error:  cw_capacity = %d\n", cw_capacity);
+		reset_loop++;
+		if (reset_loop >
+		    (CW2015_BATTERY_CAPACITY_ERROR / cw_bat->monitor_sec)) {
+			cw_por(cw_bat);
+			reset_loop = 0;
+		}
+		return cw_bat->capacity;
+	}
+	reset_loop = 0;
+
+	/* case 1 : aviod swing */
+	if (((cw_bat->charger_mode > 0) &&
+	     (cw_capacity <= cw_bat->capacity - 1) &&
+	     (cw_capacity > cw_bat->capacity - 9)) ||
+	    ((cw_bat->charger_mode == 0) &&
+	     (cw_capacity == (cw_bat->capacity + 1)))) {
+		if (!(cw_capacity == 0 && cw_bat->capacity <= 2))
+			cw_capacity = cw_bat->capacity;
+	}
+
+	/* case 2 : aviod no charge full */
+	if ((cw_bat->charger_mode > 0) &&
+	    (cw_capacity >= 95) && (cw_capacity <= cw_bat->capacity)) {
+		cw_printk("Chaman join no charge full\n");
+		charging_loop++;
+		if (charging_loop >
+		    (CW2015_BATTERY_UP_MAX_CHANGE / cw_bat->monitor_sec)) {
+			cw_capacity = (cw_bat->capacity + 1) <= 100 ?
+				      (cw_bat->capacity + 1) : 100;
+			charging_loop = 0;
+			jump_flag = 1;
+		} else {
+			cw_capacity = cw_bat->capacity;
+		}
+	}
+
+	/* case 3 : avoid battery level jump to CW_BAT */
+	if ((cw_bat->charger_mode == 0) &&
+	    (cw_capacity <= cw_bat->capacity) &&
+	    (cw_capacity >= 90) && (jump_flag == 1)) {
+		cw_printk("Chaman join no charge full discharging\n");
+#ifdef CONFIG_PM
+		if (cw_bat->suspend_resume_mark == 1) {
+			cw_bat->suspend_resume_mark = 0;
+			sleep_cap = (cw_bat->after.tv_sec +
+				     discharging_loop *
+				     (cw_bat->monitor_sec / 1000)) /
+				     (CW2015_BATTERY_DOWN_MAX_CHANGE / 1000);
+			cw_printk("sleep_cap = %d\n", sleep_cap);
+
+			if (cw_capacity >= cw_bat->capacity - sleep_cap) {
+				return cw_capacity;
+			}
+			if (!sleep_cap)
+				discharging_loop = discharging_loop +
+					1 + cw_bat->after.tv_sec /
+					(cw_bat->monitor_sec / 1000);
+			else
+				discharging_loop = 0;
+			cw_printk("discharging_loop = %d\n",
+				  discharging_loop);
+			return cw_bat->capacity - sleep_cap;
+		}
+#endif
+		discharging_loop++;
+		if (discharging_loop >
+		    (CW2015_BATTERY_DOWN_MAX_CHANGE / cw_bat->monitor_sec)) {
+			if (cw_capacity >= cw_bat->capacity - 1)
+				jump_flag = 0;
+			else
+				cw_capacity = cw_bat->capacity - 1;
+
+			discharging_loop = 0;
+		} else {
+			cw_capacity = cw_bat->capacity;
+		}
+	}
+
+	/* case 4 : avoid battery level is 0% when long time charging */
+	if ((cw_bat->charger_mode > 0) && (cw_capacity == 0)) {
+		charging_5_loop++;
+		if (charging_5_loop >
+		    CW2015_BATTERY_CHARGING_ZERO / cw_bat->monitor_sec) {
+			cw_por(cw_bat);
+			charging_5_loop = 0;
+		}
+	} else if (charging_5_loop != 0) {
+		charging_5_loop = 0;
+	}
+#ifdef CONFIG_PM
+	if (cw_bat->suspend_resume_mark == 1)
+		cw_bat->suspend_resume_mark = 0;
+#endif
+	return cw_capacity;
+}
+
+static int cw_get_voltage(struct cw_battery *cw_bat)
+{
+	int ret;
+	u8 reg_val[2];
+	u16 value16, value16_1, value16_2, value16_3;
+	int voltage;
+	int res1, res2;
+
+	ret = cw_read_word(cw_bat->client, CW2015_REG_VCELL, reg_val);
+	if (ret < 0)
+		return ret;
+	value16 = (reg_val[0] << 8) + reg_val[1];
+
+	ret = cw_read_word(cw_bat->client, CW2015_REG_VCELL, reg_val);
+	if (ret < 0)
+		return ret;
+	value16_1 = (reg_val[0] << 8) + reg_val[1];
+
+	ret = cw_read_word(cw_bat->client, CW2015_REG_VCELL, reg_val);
+	if (ret < 0)
+		return ret;
+	value16_2 = (reg_val[0] << 8) + reg_val[1];
+
+	if (value16 > value16_1) {
+		value16_3 = value16;
+		value16 = value16_1;
+		value16_1 = value16_3;
+	}
+
+	if (value16_1 > value16_2) {
+		value16_3 = value16_1;
+		value16_1 = value16_2;
+		value16_2 = value16_3;
+	}
+
+	if (value16 > value16_1) {
+		value16_3 = value16;
+		value16 = value16_1;
+		value16_1 = value16_3;
+	}
+
+	voltage = value16_1 * 312 / 1024;
+
+	if (cw_bat->plat_data.divider_high &&
+	    cw_bat->plat_data.divider_low) {
+		res1 = cw_bat->plat_data.divider_high;
+		res2 = cw_bat->plat_data.divider_low;
+		voltage = voltage * (res1 + res2) / res2;
+	}
+
+	dev_dbg(&cw_bat->client->dev, "the cw201x voltage=%d,reg_val=%x %x\n",
+		voltage, reg_val[0], reg_val[1]);
+	return voltage;
+}
+
+/*This function called when get RRT from cw2015*/
+static int cw_get_time_to_empty(struct cw_battery *cw_bat)
+{
+	int ret;
+	u8 reg_val;
+	u16 value16;
+
+	ret = cw_read(cw_bat->client, CW2015_REG_RRT_ALERT, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	value16 = reg_val;
+
+	ret = cw_read(cw_bat->client, CW2015_REG_RRT_ALERT + 1, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	value16 = ((value16 << 8) + reg_val) & CW2015_MASK_SOC;
+	return value16;
+}
+
+static void cw_update_charge_status(struct cw_battery *cw_bat)
+{
+	int cw_charger_mode;
+
+	cw_charger_mode = get_charge_state(cw_bat);
+	if (cw_bat->charger_mode != cw_charger_mode) {
+		cw_bat->charger_mode = cw_charger_mode;
+		cw_bat->bat_change = 1;
+		if (cw_charger_mode)
+			cw_bat->charge_count++;
+	}
+}
+
+static void cw_update_capacity(struct cw_battery *cw_bat)
+{
+	int cw_capacity;
+
+	cw_capacity = cw_get_capacity(cw_bat);
+	if ((cw_capacity >= 0) && (cw_capacity <= 100) &&
+	    (cw_bat->capacity != cw_capacity)) {
+		cw_bat->capacity = cw_capacity;
+		cw_bat->bat_change = 1;
+	}
+}
+
+static void cw_update_vol(struct cw_battery *cw_bat)
+{
+	int ret;
+
+	ret = cw_get_voltage(cw_bat);
+	if ((ret >= 0) && (cw_bat->voltage != ret))
+		cw_bat->voltage = ret;
+}
+
+static void cw_update_status(struct cw_battery *cw_bat)
+{
+	int status;
+
+	if (cw_bat->charger_mode > 0) {
+		if (cw_bat->capacity >= 100)
+			status = POWER_SUPPLY_STATUS_FULL;
+		else
+			status = POWER_SUPPLY_STATUS_CHARGING;
+	} else {
+		status = POWER_SUPPLY_STATUS_DISCHARGING;
+	}
+
+	if (cw_bat->status != status) {
+		cw_bat->status = status;
+		cw_bat->bat_change = 1;
+	}
+}
+
+static void cw_update_time_to_empty(struct cw_battery *cw_bat)
+{
+	int ret;
+
+	ret = cw_get_time_to_empty(cw_bat);
+	if ((ret >= 0) && (cw_bat->time_to_empty != ret)) {
+		cw_bat->time_to_empty = ret;
+		cw_bat->bat_change = 1;
+	}
+}
+
+static void cw_bat_work(struct work_struct *work)
+{
+	struct delayed_work *delay_work;
+	struct cw_battery *cw_bat;
+	int ret;
+	u8 reg_val;
+	int i = 0;
+
+	delay_work = container_of(work, struct delayed_work, work);
+	cw_bat =
+		container_of(delay_work, struct cw_battery, battery_delay_work);
+
+	/* Add for battery swap start */
+	ret = cw_read(cw_bat->client, CW2015_REG_MODE, &reg_val);
+	if (ret < 0) {
+		cw_bat->bat_mode = MODE_VIRTUAL;
+		cw_bat->bat_change = 1;
+	} else {
+		if ((reg_val & CW2015_MODE_SLEEP_MASK) == CW2015_MODE_SLEEP) {
+			for (i = 0; i < 5; i++) {
+				if (cw_por(cw_bat) == 0)
+					break;
+			}
+		}
+		cw_update_capacity(cw_bat);
+		cw_update_vol(cw_bat);
+		cw_update_charge_status(cw_bat);
+		cw_update_status(cw_bat);
+		cw_update_time_to_empty(cw_bat);
+	}
+	/* Add for battery swap end */
+	cw_printk("charger_mod = %d\n", cw_bat->charger_mode);
+	cw_printk("status = %d\n", cw_bat->status);
+	cw_printk("capacity = %d\n", cw_bat->capacity);
+	cw_printk("voltage = %d\n", cw_bat->voltage);
+
+#ifdef CONFIG_PM
+	if (cw_bat->suspend_resume_mark == 1)
+		cw_bat->suspend_resume_mark = 0;
+#endif
+
+	if (cw_bat->bat_change == 1) {
+		power_supply_changed(cw_bat->rk_bat);
+		cw_bat->bat_change = 0;
+	}
+	queue_delayed_work(cw_bat->battery_workqueue,
+			   &cw_bat->battery_delay_work,
+			   msecs_to_jiffies(cw_bat->monitor_sec));
+}
+
+static bool cw_battery_valid_time_to_empty(struct cw_battery *cw_bat)
+{
+	return cw_bat->time_to_empty > 0 &&
+		cw_bat->time_to_empty < CW2015_MASK_SOC &&
+		cw_bat->status == POWER_SUPPLY_STATUS_DISCHARGING;
+}
+
+static int cw_battery_get_property(struct power_supply *psy,
+				   enum power_supply_property psp,
+				   union power_supply_propval *val)
+{
+	int ret = 0;
+	struct cw_battery *cw_bat;
+
+	cw_bat = power_supply_get_drvdata(psy);
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = cw_bat->capacity;
+		if (cw_bat->bat_mode == MODE_VIRTUAL)
+			val->intval = CW2015_VIRTUAL_SOC;
+		break;
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = cw_bat->status;
+		if (cw_bat->bat_mode == MODE_VIRTUAL)
+			val->intval = CW2015_VIRTUAL_STATUS;
+		break;
+
+	case POWER_SUPPLY_PROP_HEALTH:
+		val->intval = POWER_SUPPLY_HEALTH_GOOD;
+		break;
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = cw_bat->voltage <= 0 ? 0 : 1;
+		if (cw_bat->bat_mode == MODE_VIRTUAL)
+			val->intval = CW2015_VIRTUAL_PRESET;
+		break;
+
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval = cw_bat->voltage * 1000;
+		if (cw_bat->bat_mode == MODE_VIRTUAL)
+			val->intval = CW2015_VIRTUAL_VOLTAGE * 1000;
+		break;
+
+	case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
+		if (cw_battery_valid_time_to_empty(cw_bat)) {
+			val->intval = cw_bat->time_to_empty;
+		} else {
+			val->intval = 0;
+		}
+		if (cw_bat->bat_mode == MODE_VIRTUAL)
+			val->intval = CW2015_VIRTUAL_TIME2EMPTY;
+		break;
+
+	case POWER_SUPPLY_PROP_TECHNOLOGY:
+		val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
+		break;
+
+	case POWER_SUPPLY_PROP_CHARGE_COUNTER:
+		val->intval = cw_bat->charge_count;
+		break;
+
+	case POWER_SUPPLY_PROP_CHARGE_FULL:
+	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
+		val->intval = cw_bat->plat_data.design_capacity * 1000;
+		break;
+
+	case POWER_SUPPLY_PROP_TEMP:
+		val->intval = CW2015_VIRTUAL_TEMPERATURE;
+		break;
+
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+		if (cw_battery_valid_time_to_empty(cw_bat)) {
+			// calculate remaining capacity
+			val->intval = cw_bat->plat_data.design_capacity * 1000;
+			val->intval = val->intval * cw_bat->capacity / 100;
+
+			// estimate current based on time to empty (in minutes)
+			val->intval = 60 * val->intval / cw_bat->time_to_empty;
+		} else {
+			val->intval = 0;
+		}
+
+		if (cw_bat->bat_mode == MODE_VIRTUAL)
+			val->intval = CW2015_VIRTUAL_CURRENT;
+		break;
+
+	default:
+		break;
+	}
+	return ret;
+}
+
+static enum power_supply_property cw_battery_properties[] = {
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_HEALTH,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW,
+	POWER_SUPPLY_PROP_TECHNOLOGY,
+	POWER_SUPPLY_PROP_CHARGE_COUNTER,
+	POWER_SUPPLY_PROP_CHARGE_FULL,
+	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
+	POWER_SUPPLY_PROP_TEMP,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+};
+
+static const struct power_supply_desc cw2015_bat_desc = {
+	.name		= "cw2015-battery",
+	.type		= POWER_SUPPLY_TYPE_BATTERY,
+	.properties	= cw_battery_properties,
+	.num_properties	= ARRAY_SIZE(cw_battery_properties),
+	.get_property	= cw_battery_get_property,
+};
+
+#ifdef CONFIG_OF
+static int cw2015_parse_dt(struct cw_battery *cw_bat)
+{
+	struct device *dev = &cw_bat->client->dev;
+	struct device_node *node = dev->of_node;
+	struct property *prop;
+	int length;
+	u32 value;
+	int ret;
+	struct cw_bat_platform_data *data = &cw_bat->plat_data;
+
+	if (!node)
+		return -ENODEV;
+
+	memset(data, 0, sizeof(*data));
+
+	/* determine the number of config info */
+	prop = of_find_property(node, PREFIX"bat-config-info", &length);
+	if (!prop)
+		return -EINVAL;
+
+	length /= sizeof(u32);
+
+	if (length > 0) {
+		size_t size = sizeof(*data->cw_bat_config_info) * length;
+
+		data->cw_bat_config_info = devm_kzalloc(dev, size, GFP_KERNEL);
+		if (!data->cw_bat_config_info)
+			return -ENOMEM;
+
+		ret = of_property_read_u32_array(node, PREFIX"bat-config-info",
+						 data->cw_bat_config_info,
+						 length);
+		if (ret < 0)
+			return ret;
+	}
+
+	cw_bat->bat_mode = MODE_BATTERY;
+	cw_bat->monitor_sec = CW2015_DEFAULT_MONITOR_SEC *
+			      CW2015_TIMER_MS_COUNTS;
+
+	prop = of_find_property(node, PREFIX"voltage-divider", &length);
+	if (prop) {
+		length /= sizeof(u32);
+		if (length != 2) {
+			dev_err(dev, "Length of voltage divider array must be "
+				"2, not %u\n", length);
+			return -EINVAL;
+		}
+		ret = of_property_read_u32_index(node, PREFIX"voltage-divider",
+						 0, &data->divider_high);
+		if (ret) {
+			dev_err(dev, "Failed to read value of high side "
+				"voltage divider resistor: %d\n", ret);
+			return ret;
+		}
+		ret = of_property_read_u32_index(node, PREFIX"voltage-divider",
+						 1, &data->divider_low);
+		if (ret) {
+			dev_err(dev, "Failed to read value of low side "
+				"voltage divider resistor: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = of_property_read_u32(node, PREFIX"divider-res2", &value);
+	if (ret < 0)
+		value = 0;
+	data->divider_low = value;
+
+	ret = of_property_read_u32(node, PREFIX"virtual-power", &value);
+	if (ret < 0)
+		value = 0;
+	cw_bat->bat_mode = value;
+
+	ret = of_property_read_u32(node, PREFIX"monitor-interval", &value);
+	if (ret < 0)
+		dev_err(dev, "monitor-interval missing!\n");
+	else
+		cw_bat->monitor_sec = value * CW2015_TIMER_MS_COUNTS;
+
+	ret = of_property_read_u32(node, PREFIX"design-capacity", &value);
+	if (ret < 0) {
+		dev_err(dev, "design-capacity missing!\n");
+		data->design_capacity = 2000;
+	} else {
+		data->design_capacity = value;
+	}
+
+	of_property_read_u8(node, PREFIX"alert-level", &cw_bat->alert_level);
+	if (cw_bat->alert_level > 100) {
+		dev_err(dev, "invalid alert_level, clamping to 100 %%\n");
+		cw_bat->alert_level = 100;
+	}
+
+	return 0;
+}
+#else
+static int cw2015_parse_dt(struct cw_battery *cw_bat)
+{
+	return -ENODEV;
+}
+#endif
+
+static int cw_bat_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	int ret;
+	struct cw_battery *cw_bat;
+	struct power_supply_config psy_cfg = {0};
+
+	cw_bat = devm_kzalloc(&client->dev, sizeof(*cw_bat), GFP_KERNEL);
+	if (!cw_bat) {
+		return -ENOMEM;
+	}
+
+	i2c_set_clientdata(client, cw_bat);
+	cw_bat->client = client;
+
+	ret = cw2015_parse_dt(cw_bat);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"failed to find cw2015 platform data\n");
+		return ret;
+	}
+
+	cw_bat->capacity = 1;
+	cw_bat->voltage = 0;
+	cw_bat->status = 0;
+	cw_bat->suspend_resume_mark = 0;
+	cw_bat->charger_mode = CW2015_NO_CHARGING;
+	cw_bat->bat_change = 0;
+
+	ret = cw_init(cw_bat);
+	if (ret) {
+		pr_err("%s cw_init error\n", __func__);
+		return ret;
+	}
+
+	psy_cfg.drv_data = cw_bat;
+
+	cw_bat->rk_bat = devm_power_supply_register(&client->dev,
+		&cw2015_bat_desc, &psy_cfg);
+	if (IS_ERR(cw_bat->rk_bat)) {
+		dev_err(&cw_bat->client->dev,
+			"power supply register rk_bat error\n");
+		return -1;
+	}
+
+	cw_bat->battery_workqueue = create_singlethread_workqueue("rk_battery");
+	INIT_DELAYED_WORK(&cw_bat->battery_delay_work, cw_bat_work);
+	queue_delayed_work(cw_bat->battery_workqueue,
+			   &cw_bat->battery_delay_work, msecs_to_jiffies(10));
+
+	dev_info(&cw_bat->client->dev,
+		 "cw2015/cw2013 driver probe success\n");
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int cw_bat_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cw_battery *cw_bat = i2c_get_clientdata(client);
+
+	ktime_get_boottime_ts64(&cw_bat->suspend_time_before);
+	cancel_delayed_work(&cw_bat->battery_delay_work);
+	return 0;
+}
+
+static int cw_bat_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cw_battery *cw_bat = i2c_get_clientdata(client);
+
+	cw_bat->suspend_resume_mark = 1;
+	ktime_get_boottime_ts64(&cw_bat->after);
+	cw_bat->after = timespec64_sub(cw_bat->after,
+				     cw_bat->suspend_time_before);
+	queue_delayed_work(cw_bat->battery_workqueue,
+			   &cw_bat->battery_delay_work, msecs_to_jiffies(2));
+	return 0;
+}
+
+static const struct dev_pm_ops cw_bat_pm_ops = {
+	.suspend  = cw_bat_suspend,
+	.resume   = cw_bat_resume,
+};
+#endif
+
+static int cw_bat_remove(struct i2c_client *client)
+{
+	struct cw_battery *cw_bat = i2c_get_clientdata(client);
+
+	dev_dbg(&cw_bat->client->dev, "%s\n", __func__);
+	cancel_delayed_work(&cw_bat->battery_delay_work);
+	return 0;
+}
+
+static const struct i2c_device_id cw_bat_id_table[] = {
+	{ "cw201x", 0 },
+	{ "cw2013", 0 },
+	{ "cw2015", 0 },
+	{}
+};
+
+static const struct of_device_id cw2015_of_match[] = {
+	{ .compatible = PREFIX"cw201x" },
+	{ .compatible = PREFIX"cw2013" },
+	{ .compatible = PREFIX"cw2015" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, cw2015_of_match);
+
+static struct i2c_driver cw_bat_driver = {
+	.driver = {
+		.name = PREFIX"cw201x",
+#ifdef CONFIG_PM
+		.pm = &cw_bat_pm_ops,
+#endif
+	},
+	.probe = cw_bat_probe,
+	.remove = cw_bat_remove,
+	.id_table = cw_bat_id_table,
+};
+
+static int __init cw_bat_init(void)
+{
+	return i2c_add_driver(&cw_bat_driver);
+}
+
+static void __exit cw_bat_exit(void)
+{
+	i2c_del_driver(&cw_bat_driver);
+}
+
+module_init(cw_bat_init);
+module_exit(cw_bat_exit);
+
+MODULE_AUTHOR("xhc <xhc@rock-chips.com>");
+MODULE_AUTHOR("Tobias Schramm <t.schramm@manjaro.org>");
+MODULE_DESCRIPTION("cw2015/cw2013 battery driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/power/cw2015_battery.h b/include/linux/power/cw2015_battery.h
new file mode 100644
index 000000000000..77c8ce17799f
--- /dev/null
+++ b/include/linux/power/cw2015_battery.h
@@ -0,0 +1,122 @@
+/*
+ * Fuel gauge driver for CellWise 2013 / 2015
+ *
+ * Copyright (C) 2012, RockChip
+ * Copyright (C) 2019, Tobias Schramm
+ *
+ * Authors: xuhuicong <xhc@rock-chips.com>
+ * Authors: Tobias Schramm <tobias@t-sys.eu>
+ *
+ * Based on rk30_adc_battery.c
+
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef CW2015_BATTERY_H
+#define CW2015_BATTERY_H
+
+#define CW2015_SIZE_BATINFO    64
+
+#define CW2015_GPIO_HIGH  1
+#define CW2015_GPIO_LOW   0
+
+#define CW2015_READ_TRIES 30
+
+#define CW2015_REG_VERSION             0x0
+#define CW2015_REG_VCELL               0x2
+#define CW2015_REG_SOC                 0x4
+#define CW2015_REG_RRT_ALERT           0x6
+#define CW2015_REG_CONFIG              0x8
+#define CW2015_REG_MODE                0xA
+#define CW2015_REG_BATINFO             0x10
+
+#define CW2015_MODE_SLEEP_MASK         (0x3<<6)
+#define CW2015_MODE_SLEEP              (0x3<<6)
+#define CW2015_MODE_NORMAL             (0x0<<6)
+#define CW2015_MODE_QUICK_START        (0x3<<4)
+#define CW2015_MODE_RESTART            (0xf<<0)
+
+#define CW2015_CONFIG_UPDATE_FLG       (0x01<<1)
+#define CW2015_ATHD(x)                 ((x)<<3)
+#define CW2015_MASK_ATHD               (0x1f<<3)
+#define CW2015_MASK_SOC                (0x1fff)
+
+#define CW2015_I2C_SPEED			100000
+#define CW2015_BATTERY_UP_MAX_CHANGE		(420 * 1000)
+#define CW2015_BATTERY_DOWN_MAX_CHANGE		(120 * 1000)
+#define CW2015_BATTERY_DOWN_CHANGE		60
+#define CW2015_BATTERY_DOWN_MIN_CHANGE_RUN	30
+#define CW2015_BATTERY_DOWN_MIN_CHANGE_SLEEP	1800
+#define CW2015_BATTERY_JUMP_TO_ZERO		(30 * 1000)
+#define CW2015_BATTERY_CAPACITY_ERROR		(40 * 1000)
+#define CW2015_BATTERY_CHARGING_ZERO		(1800 * 1000)
+
+#define CW2015_DOUBLE_SERIES_BATTERY	0
+
+#define CW2015_CHARGING_ON		1
+#define CW2015_NO_CHARGING		0
+
+#define CW2015_BATTERY_DOWN_MAX_CHANGE_RUN_AC_ONLINE 3600
+
+#define CW2015_NO_STANDARD_AC_BIG_CHARGE_MODE 1
+/* #define CW2015_SYSTEM_SHUTDOWN_VOLTAGE  3400000 */
+#define CW2015_BAT_LOW_INTERRUPT    1
+
+#define CW2015_USB_CHARGER_MODE        1
+#define CW2015_AC_CHARGER_MODE         2
+#define   CW2015_QUICKSTART         0
+
+#define CW2015_TIMER_MS_COUNTS			1000
+#define CW2015_DEFAULT_MONITOR_SEC		8
+
+/* virtual params */
+#define CW2015_VIRTUAL_CURRENT			1000
+#define CW2015_VIRTUAL_VOLTAGE			3888
+#define CW2015_VIRTUAL_SOC			66
+#define CW2015_VIRTUAL_PRESET			1
+#define CW2015_VIRTUAL_TEMPERATURE		188
+#define CW2015_VIRTUAL_TIME2EMPTY		60
+#define CW2015_VIRTUAL_STATUS			POWER_SUPPLY_STATUS_CHARGING
+
+enum bat_mode {
+	MODE_BATTERY = 0,
+	MODE_VIRTUAL,
+};
+
+struct cw_bat_platform_data {
+	u32 divider_high;
+	u32 divider_low;
+	u32 *cw_bat_config_info;
+	int design_capacity;
+};
+
+struct cw_battery {
+	struct i2c_client *client;
+	struct workqueue_struct *battery_workqueue;
+	struct delayed_work battery_delay_work;
+	struct cw_bat_platform_data plat_data;
+
+	struct power_supply *rk_bat;
+
+#ifdef CONFIG_PM
+	struct timespec64 suspend_time_before;
+	struct timespec64 after;
+	int suspend_resume_mark;
+#endif
+	int charger_mode;
+	int capacity;
+	int voltage;
+	int status;
+	int time_to_empty;
+	int alt;
+	u32 monitor_sec;
+	u32 bat_mode;
+	int bat_change;
+	int charge_count;
+	u8 alert_level;
+};
+
+#endif
-- 
2.24.0

