Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B109169A8B
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2020 23:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgBWWxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Feb 2020 17:53:31 -0500
Received: from mout.gmx.net ([212.227.15.15]:55955 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgBWWxb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 23 Feb 2020 17:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582498402;
        bh=lX0n9jDT/rTGkJoUxyhX6kgnQK3cOIOcFwzlQ4mraLw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Q5xBGs4v2gE3QSr/LSGYwGPc7TmwOY2Y5JV603xTb1e6LJOA+h/uRMG6NxKQgm8do
         I9L3GYFFyZwzhq8Cx8QokuK7WTa+r5T5EGmaIrqBdQzWLEbNyOi6ouIX2kJrntIbC1
         nds0Yo/gJwq8AEVABvh6cW64cVEmn6S9K7z8MM0w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.117]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mnpns-1jlRc33zSM-00pNzV; Sun, 23 Feb 2020 23:53:22 +0100
Received: by corona.crabdance.com (Postfix, from userid 1001)
        id DA63D6E85605; Sun, 23 Feb 2020 14:53:02 -0800 (PST)
From:   Stefan Schaeckeler <schaecsn@gmx.net>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>
Cc:     Stefan Schaeckeler <schaecsn@gmx.net>,
        Stefan Schaeckeler <sschaeck@cisco.com>
Subject: [PATCH 1/1] i2c: imc: Add support for Intel iMC SMBus host controller.
Date:   Sun, 23 Feb 2020 14:51:10 -0800
Message-Id: <1582498270-50674-2-git-send-email-schaecsn@gmx.net>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1582498270-50674-1-git-send-email-schaecsn@gmx.net>
References: <1582498270-50674-1-git-send-email-schaecsn@gmx.net>
X-Provags-ID: V03:K1:6pi1BIOxpk3eZZdnrXZy+2rbKEwmaPcjDP1hd1kubeFqqkY1XQn
 uxu3xwAD3LPIUmRRbXdrR67CqL+UoeHjJtzuk6cXLNCxkcCU6LpsdMpQlgj1hebhVMUypp/
 v2n18Y527T4XFB5nAkTRaS+c7/d2jJcu4z0XuYxVv/E3UPnn1gYxOb07J0jmFwZ4Li8wT2k
 Mbs/urxh2YseLOgW3c6OA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7rfvEE0nZQw=:GXBOlJ94JFruq07xTAwdLM
 901n9EHXIQpeDzzZh3K62jOfs7aO8RDtIRYnOb64Y6U2Y/ZNSHiAnpiR8yBB0rT2Ka90H44KT
 EGGNC8TY42B5fYbiAaMXbEoIX/2wrmxPAX4YziWbL/NGRqKYB/rZ3PDiN4L9pQ8fVwwSWNaNu
 G/nDvYtHokNVGz8qXGJaIYv8WnRb1OYAkoNU465alL6hWJiGjj8xEip66u2iO4gHuKceLT70O
 +7yOXOW8a67vrHOB7XU6bMBu8LdhglYUPghjzzgKreCeBTWtO43kZh14tuQvLPzKKnlFfmRkQ
 61Ne35gH8r/fr0XB6zqHP2gLs7hOKcRcG2Nr6eeU/aHGKUjSIYrhdz45+gi+nhw9RQzIOMYxl
 jBLToXuJNzafuBLvPsIp1okdZiV5ohFAQSk2MubkckG48f0gqgYyr6KqEE2klSwxHOWg2VLFZ
 LOksjP7Ohz/ZBqB8cvicD09HXfQqO+DfIjHSKtowb+I9pxLLCCzSFwTSgU1g9+EU6cNcrjZv2
 GQ3jB0PZ0qGUUtvNMqyQE8o/lGPKtJQtlD1krJv+O4CXs7EejmGBKv9DvSNf4/kZUWv9ZHQiF
 Z7oFImM2m6pMJtu6OXIlmHvzAsx3jOnZM3U6N7ttxq5mL8gFkkWZ0JU8aedMHqKt2Lc79gt6E
 lfmkis9+GAReVYif7uot7t3JbrtCRaYU1jd7RsEqoqSHj3y99vGhGOW63R0tHpd++pdAHk3Ls
 AnonvHqZ8dcYRx95wSVOBibnhqwaLhJhLk70bS4ajydLc3+YFPCLJZlkeoj+AvKAMmMI31wpH
 pidyyJMeuddq1mrLVO6kbOVUsyApYiKtC/o2+R/0FjPl0RG5FirFDy7jgcZHY+XR592GwaEEg
 qTMqeCa4QDgLKTdaAaUwDWRCPcZp0rDXuOBBU4DAtTbuQxCsBhvCHH/0WZB3z74uqHbVDvekV
 5MT76ZlHDY7x0R+pcMdLC7KU4HjmQHg3EyOO/2KZJkvzmdilwFdhGrIpjCJ/tWbOCxIRukJGL
 rRDyG55XBVtYmF8OK+WYN3M6kI5TAitKVRAS2Dr1CnkwSHcOcRJj9Lc1b7xUEFUhbtsF5uz8f
 7vTmuRjAxKKlN7PI4FYZsWHu/7kOWwUDzxUglQmcgjXPc8WLKvpZqL3uOpVsgf/Wx+4WHDHP1
 TFPwiRHGji833J1AcF8LRJHCwR6spii6OI36D5R0Z+V6vYuJFnYEBvdUdPT15b/4kkPU0d5SF
 +cci20MtNngOOuhSY
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Modern Intel memory controllers have an SMBus connection to DIMMs and thei=
r
eeproms and thermal sensors.

Initially support Broadwell memory controllers and DIMM thermal sensors,
only.

Automatically expose the thermal sensors.

Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>
=2D--
 MAINTAINERS                  |   5 +
 drivers/i2c/busses/Kconfig   |  15 ++
 drivers/i2c/busses/Makefile  |   1 +
 drivers/i2c/busses/i2c-imc.c | 515 ++++++++++++++++++++++++++++++++++++++=
+++++
 4 files changed, 536 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-imc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4beb8dc4c7eb..8de6bffd4772 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7895,6 +7895,11 @@ F:	drivers/i2c/busses/i2c-sis96x.c
 F:	drivers/i2c/busses/i2c-via.c
 F:	drivers/i2c/busses/i2c-viapro.c

+I2C/SMBUS IMC DRIVER
+M:	Stefan Schaeckeler <sschaeck@cisco.com>
+L:	linux-i2c@vger.kernel.org
+F:	drivers/i2c/busses/i2c-imc.c
+
 I2C/SMBUS INTEL CHT WHISKEY COVE PMIC DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ddca08f8a76..87c5f8055ca4 100644
=2D-- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -150,6 +150,21 @@ config I2C_I801
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.

+config I2C_IMC
+	tristate "Intel iMC SMBus Controller"
+	depends on PCI && X86 && SENSORS_JC42
+	help
+	  If you say yes to this option, support will be included for the Intel
+	  iMC SMBus host controller.
+
+	  Currently, there is support for Broadwell, only.
+
+	  Behind the iMC SMBus are DIMMs with eeproms and temperature sensors.
+	  This driver is also instantiating the temperature sensors.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called i2c-imc.
+
 config I2C_ISCH
 	tristate "Intel SCH SMBus 1.0"
 	depends on PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 25d60889713c..31446bdcf9c3 100644
=2D-- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_I2C_AMD756_S4882)	+=3D i2c-amd756-s4882.o
 obj-$(CONFIG_I2C_AMD8111)	+=3D i2c-amd8111.o
 obj-$(CONFIG_I2C_CHT_WC)	+=3D i2c-cht-wc.o
 obj-$(CONFIG_I2C_I801)		+=3D i2c-i801.o
+obj-$(CONFIG_I2C_IMC)		+=3D i2c-imc.o
 obj-$(CONFIG_I2C_ISCH)		+=3D i2c-isch.o
 obj-$(CONFIG_I2C_ISMT)		+=3D i2c-ismt.o
 obj-$(CONFIG_I2C_NFORCE2)	+=3D i2c-nforce2.o
diff --git a/drivers/i2c/busses/i2c-imc.c b/drivers/i2c/busses/i2c-imc.c
new file mode 100644
index 000000000000..653684b9c4c7
=2D-- /dev/null
+++ b/drivers/i2c/busses/i2c-imc.c
@@ -0,0 +1,515 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Intel Memory Controller iMC SMBus Driver to DIMMs.
+ *
+ * Copyright (c) 2013-2016 Andrew Lutomirski <luto@kernel.org>
+ * Copyright (c) 2020 Stefan Schaeckeler <sschaeck@cisco.com>, Cisco Syst=
ems
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/pci.h>
+#include <linux/i2c.h>
+
+/* iMC Main, PCI dev 0x13, fn 0, 8086.6fa8 */
+#define PCI_DEVICE_ID_INTEL_BROADWELL_IMC_TA 0x6fa8
+
+/* Register offsets for channel pairs 0+1 and 2+3 */
+#define SMBSTAT(i)                 (0x180 + 0x10*(i))
+#define SMBCMD(i)                  (0x184 + 0x10*(i))
+#define SMBCNTL(i)                 (0x188 + 0x10*(i))
+
+/* SMBSTAT fields */
+#define SMBSTAT_RDO                (1U << 31)      /* Read Data Valid */
+#define SMBSTAT_WOD                (1U << 30)      /* Write Operation Don=
e */
+#define SMBSTAT_SBE                (1U << 29)      /* SMBus Error */
+#define SMBSTAT_SMB_BUSY           (1U << 28)      /* SMBus Busy State */
+#define SMBSTAT_RDATA_MASK         0xffff          /* Result of a read */
+
+/* SMBCMD fields */
+#define SMBCMD_TRIGGER             (1U << 31)      /* CMD Trigger */
+#define SMBCMD_WORD_ACCESS         (1U << 29)      /* Word (vs byte) acce=
ss */
+#define SMBCMD_TYPE_READ           (0U << 27)      /* Read */
+#define SMBCMD_TYPE_WRITE          (1U << 27)      /* Write */
+#define SMBCMD_SA_SHIFT            24
+#define SMBCMD_BA_SHIFT            16
+
+/* SMBCNTL fields */
+#define SMBCNTL_DTI_MASK           0xf0000000      /* Slave Address low b=
its */
+#define SMBCNTL_DTI_SHIFT          28              /* Slave Address low b=
its */
+#define SMBCNTL_DIS_WRT            (1U << 26)      /* Disable Write */
+#define SMBCNTL_TSOD_PRES_MASK     0xff            /* DIMM Present mask *=
/
+
+/* For sanity check: bits that might randomly change if we race with firm=
ware */
+#define SMBCMD_OUR_BITS            (~(u32)SMBCMD_TRIGGER)
+#define SMBCNTL_OUR_BITS           (SMBCNTL_DTI_MASK)
+
+
+/* System Address Decoder, PCI dev 0xf fn 5, 8086.6ffd */
+#define PCI_DEVICE_ID_INTEL_BROADWELL_IMC_SAD 0x6ffd
+
+/* Register offsets */
+#define SADCNTL                    0xf4
+
+/* SADCNTL fields */
+#define SADCNTL_LOCAL_NODEID_MASK  0xf             /* Local NodeID of soc=
ket */
+
+
+/* Power Control Unit, PCI dev 0x1e fn 1, 8086.6f99 */
+#define PCI_DEVICE_ID_INTEL_BROADWELL_IMC_PCU 0x6f99
+
+/* Register offsets */
+#define TSODCNTL                   0xe0
+
+/* TSODCNTL fields */
+
+
+/* DIMMs hold jc42 thermal sensors starting at i2c address 0x18 */
+#define DIMM_SENSOR_DRV            "jc42"
+#define DIMM_SENSOR_BASE_ADR       0x18
+
+
+#define sanitycheck 1
+
+struct imc_channelpair {
+	struct i2c_adapter adapter;
+	bool can_write, cltt;
+};
+
+struct imc_pcu {
+	struct pci_dev *pci_dev;
+	u32 tsod_polling_interval;
+	struct mutex mutex; /* see imc_channelpair_claim() */
+};
+
+struct imc_priv {
+	struct pci_dev *pci_dev;
+	struct imc_channelpair channelpair[2];
+	struct imc_pcu pcu;
+	bool suspended;
+};
+
+static int imc_channelpair_claim(struct imc_priv *priv, int i)
+{
+	if (priv->suspended)
+		return -EIO;
+
+	/*
+	 * i2c controllers need exclusive access to a psu register and wait
+	 * then for 10ms before starting their transaction.
+	 *
+	 * Possible optimization: Once an i2c controller modified the psu
+	 * register and waits, the other controller does not need to wait for
+	 * the whole 10ms, but then only this other controller has to clean up
+	 * the psu register.
+	 */
+	mutex_lock(&priv->pcu.mutex);
+
+	if (priv->channelpair[i].cltt) {
+		pci_write_config_dword(priv->pcu.pci_dev, TSODCNTL, 0);
+		usleep_range(10000, 10500);
+	}
+	return 0;
+}
+
+static void imc_channelpair_release(struct imc_priv *priv, int i)
+{
+	if (priv->channelpair[i].cltt) {
+		/* set tosd_control.tsod_polling_interval to previous value */
+		pci_write_config_dword(priv->pcu.pci_dev, TSODCNTL,
+				       priv->pcu.tsod_polling_interval);
+	}
+	mutex_unlock(&priv->pcu.mutex);
+}
+
+static bool imc_wait_for_transaction(struct imc_priv *priv, int i, u32 *s=
tat)
+{
+	int j;
+	static int busywaits =3D 1;
+
+	/*
+	 * Distribution of transaction time from 10000 collected samples:
+	 *
+	 * 70us: 1, 80us: 12, 90us: 34, 100us: 132, 110us: 424, 120us: 1138,
+	 * 130us: 5224, 140us: 3035.
+	 *
+	 */
+	usleep_range(131, 140);
+
+	/* Don't give up, yet */
+	for (j =3D 0; j < 20; j++) {
+		pci_read_config_dword(priv->pci_dev, SMBSTAT(i), stat);
+		if (!(*stat & SMBSTAT_SMB_BUSY)) {
+			if (j > busywaits) {
+				busywaits =3D j;
+				dev_warn(&priv->pci_dev->dev,
+					 "Discovered surprisingly long transaction time (%d)\n",
+					 busywaits);
+			}
+			return true;
+		}
+		udelay(9);
+	}
+	return false;
+}
+
+/*
+ * The iMC supports five access types. The terminology is rather inconsis=
tent.
+ * These are the types:
+ *
+ * "Write to pointer register SMBus": I2C_SMBUS_WRITE, I2C_SMBUS_BYTE
+ *
+ * Read byte/word: I2C_SMBUS_READ, I2C_SMBUS_{BYTE|WORD}_DATA
+ *
+ * Write byte/word: I2C_SMBUS_WRITE, I2C_SMBUS_{BYTE|WORD}_DATA
+ */
+
+static u32 imc_func(struct i2c_adapter *adapter)
+{
+	int i;
+	struct imc_channelpair *cp;
+	struct imc_priv *priv =3D i2c_get_adapdata(adapter);
+
+	i =3D (adapter =3D=3D &priv->channelpair[0].adapter ? 0 : 1);
+	cp =3D &priv->channelpair[i];
+
+	if (cp->can_write)
+		return I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA;
+	else
+		return I2C_FUNC_SMBUS_READ_BYTE_DATA |
+			I2C_FUNC_SMBUS_READ_WORD_DATA;
+}
+
+static s32 imc_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+			  unsigned short flags, char read_write, u8 command,
+			  int size, union i2c_smbus_data *data)
+{
+	int ret, i;
+	u32 cmd =3D 0, cntl, stat;
+#ifdef sanitycheck
+	u32 final_cmd, final_cntl;
+#endif
+	struct imc_channelpair *cp;
+	struct imc_priv *priv =3D i2c_get_adapdata(adap);
+
+	i =3D (adap =3D=3D &priv->channelpair[0].adapter ? 0 : 1);
+	cp =3D &priv->channelpair[i];
+
+	/* Encode CMD part of addresses and access size */
+	cmd |=3D ((u32)addr & 0x7) << SMBCMD_SA_SHIFT;
+	cmd |=3D ((u32)command) << SMBCMD_BA_SHIFT;
+	if (size =3D=3D I2C_SMBUS_WORD_DATA)
+		cmd |=3D SMBCMD_WORD_ACCESS;
+
+	/* Encode read/write and data to write */
+	if (read_write =3D=3D I2C_SMBUS_READ) {
+		cmd |=3D SMBCMD_TYPE_READ;
+	} else {
+		cmd |=3D SMBCMD_TYPE_WRITE;
+		cmd |=3D (size =3D=3D I2C_SMBUS_WORD_DATA
+			    ? swab16(data->word)
+			    : data->byte);
+	}
+
+	ret =3D imc_channelpair_claim(priv, i);
+	if (ret)
+		return ret;
+
+	pci_read_config_dword(priv->pci_dev, SMBCNTL(i), &cntl);
+	cntl &=3D ~SMBCNTL_DTI_MASK;
+	cntl |=3D ((u32)addr >> 3) << SMBCNTL_DTI_SHIFT;
+	pci_write_config_dword(priv->pci_dev, SMBCNTL(i), cntl);
+
+	cmd |=3D SMBCMD_TRIGGER;
+	pci_write_config_dword(priv->pci_dev, SMBCMD(i), cmd);
+
+	if (!imc_wait_for_transaction(priv, i, &stat)) {
+		dev_warn(&priv->pci_dev->dev, "smbus transaction did not complete.\n");
+		ret =3D -ETIMEDOUT;
+		goto xfer_out_release;
+	}
+
+#ifdef sanitycheck /* This is a young driver. Keep the checks for now */
+	pci_read_config_dword(priv->pci_dev, SMBCMD(i), &final_cmd);
+	pci_read_config_dword(priv->pci_dev, SMBCNTL(i), &final_cntl);
+	if (((cmd ^ final_cmd) & SMBCMD_OUR_BITS) ||
+	    ((cntl ^ final_cntl) & SMBCNTL_OUR_BITS)) {
+		dev_err(&priv->pci_dev->dev,
+			"Access to channel pair %d-%d raced with hardware: cmd 0x%08X->0x%08X,=
 cntl 0x%08X->0x%08X\n",
+			2*i, 2*i+1, cmd, final_cmd, cntl, final_cntl);
+		ret =3D -EIO;
+		goto xfer_out_release;
+	}
+#endif
+
+	if (stat & SMBSTAT_SBE) {
+		/*
+		 * While SBE is set hardware TSOD polling is disabled. This is
+		 * very bad as this bit is RO-V and will only be cleared after
+		 * a further software initiated transaction finishes
+		 * successfully.
+		 */
+		dev_err(&priv->pci_dev->dev,
+			"smbus error: sbe is set 0x%x\n", stat);
+		ret =3D -ENXIO;
+		goto xfer_out_release;
+	}
+
+	if (read_write =3D=3D I2C_SMBUS_READ) {
+		if (!(stat & SMBSTAT_RDO)) {
+			dev_warn(&priv->pci_dev->dev,
+				 "Unexpected read status 0x%08X\n", stat);
+			ret =3D -EIO;
+			goto xfer_out_release;
+		}
+		/*
+		 * The iMC SMBus controller thinks of SMBus words as being
+		 * big-endian (MSB first). Linux treats them as little-endian,
+		 * so we need to swap them.
+		 */
+		if (size =3D=3D I2C_SMBUS_WORD_DATA)
+			data->word =3D swab16(stat & SMBSTAT_RDATA_MASK);
+		else
+			data->byte =3D stat & 0xFF;
+	} else {
+		if (!(stat & SMBSTAT_WOD)) {
+			dev_warn(&priv->pci_dev->dev,
+				 "Unexpected write status 0x%08X\n", stat);
+			ret =3D -EIO;
+		}
+	}
+
+xfer_out_release:
+	imc_channelpair_release(priv, i);
+
+	return ret;
+}
+
+static const struct i2c_algorithm imc_smbus_algorithm =3D {
+	.smbus_xfer	=3D imc_smbus_xfer,
+	.functionality	=3D imc_func,
+};
+
+static void imc_instantiate_sensors(struct i2c_adapter *adapter, u8 prese=
nce)
+{
+	struct i2c_board_info info =3D {};
+
+	strcpy(info.type, DIMM_SENSOR_DRV);
+	info.addr =3D DIMM_SENSOR_BASE_ADR;
+
+	/*
+	 * Presence is a bit vector. Bits from right to left map into i2c slave
+	 * addresses starting 0x18.
+	 */
+	while (presence) {
+		if (presence & 0x1)
+			i2c_new_device(adapter, &info);
+	    info.addr++;
+	    presence >>=3D 1;
+	}
+}
+
+static int imc_init_channelpair(struct imc_priv *priv, int i, int socket)
+{
+	int err;
+	u32 val;
+	struct imc_channelpair *cp =3D &priv->channelpair[i];
+
+	i2c_set_adapdata(&cp->adapter, priv);
+	cp->adapter.owner =3D THIS_MODULE;
+	cp->adapter.algo =3D &imc_smbus_algorithm;
+	cp->adapter.dev.parent =3D &priv->pci_dev->dev;
+
+	pci_read_config_dword(priv->pci_dev, SMBCNTL(i), &val);
+	cp->can_write =3D !(val & SMBCNTL_DIS_WRT);
+
+	/*
+	 * A TSOD polling interval of > 0 tells us if CLTT mode is enabled on
+	 * some channel pair.
+	 *
+	 * Is there a better way to check for CLTT mode? In particular, is
+	 * there a way to distingush the mode on a channel pair basis?
+	 */
+	cp->cltt =3D (priv->pcu.tsod_polling_interval  > 0);
+
+	snprintf(cp->adapter.name, sizeof(cp->adapter.name),
+		 "iMC socket %d for channel pair %d-%d", socket, 2*i, 2*i+1);
+	err =3D i2c_add_adapter(&cp->adapter);
+	if (err)
+		return err;
+
+	/* For reasons unknown, TSOD_PRES_MASK is only set in CLTT mode. */
+	if (cp->cltt) {
+		dev_info(&priv->pci_dev->dev,
+			 "CLTT is enabled on channel pair %d-%d. Thermal sensors will be autom=
atically enabled\n",
+			 2*i, 2*i+1);
+	} else {
+		dev_info(&priv->pci_dev->dev,
+			 "CLTT is disabled on channel pair %d-%d. Thermal sensors need to be m=
anually enabled\n",
+			 2*i, 2*i+1);
+	}
+
+	imc_instantiate_sensors(&cp->adapter, val & SMBCNTL_TSOD_PRES_MASK);
+
+	return 0;
+}
+
+static void imc_free_channelpair(struct imc_priv *priv, int i)
+{
+	struct imc_channelpair *cp =3D &priv->channelpair[i];
+
+	i2c_del_adapter(&cp->adapter);
+}
+
+static struct pci_dev *imc_get_related_device(struct pci_bus *bus,
+					      unsigned int devfn, u16 devid)
+{
+	struct pci_dev *dev =3D pci_get_slot(bus, devfn);
+
+	if (!dev)
+		return NULL;
+
+	if (dev->vendor !=3D PCI_VENDOR_ID_INTEL || dev->device !=3D devid) {
+		pci_dev_put(dev);
+		return NULL;
+	}
+	return dev;
+}
+
+static int imc_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	int i, j, err;
+	struct imc_priv *priv;
+	struct pci_dev *sad;  /* System Address Decoder */
+	u32 sadcntl;
+
+	/* Sanity check. This device is always at 0x13.0 */
+	if (dev->devfn !=3D PCI_DEVFN(0x13, 0))
+		return -ENODEV;
+
+	priv =3D devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->pci_dev =3D dev;
+	pci_set_drvdata(dev, priv);
+
+	/*
+	 * From sad, we learn the local node id of the socket.
+	 *
+	 * The socket will not change at runtime and so we throw away sad.
+	 */
+	sad =3D imc_get_related_device(dev->bus, PCI_DEVFN(0x0f, 5),
+				     PCI_DEVICE_ID_INTEL_BROADWELL_IMC_SAD);
+	if (!sad) {
+		err =3D -ENODEV;
+		goto probe_out_free;
+	}
+	pci_read_config_dword(sad, SADCNTL, &sadcntl);
+	pci_dev_put(sad);
+
+	/*
+	 * From pcu, we access the CLTT polling interval.
+	 *
+	 * The polling interval is set by BIOS. We assume it will not change at
+	 * runtime and cache the initial value.
+	 */
+	priv->pcu.pci_dev =3D imc_get_related_device(dev->bus, PCI_DEVFN(0x1e, 1=
),
+					 PCI_DEVICE_ID_INTEL_BROADWELL_IMC_PCU);
+	if (!priv->pcu.pci_dev) {
+		err =3D -ENODEV;
+		goto probe_out_free;
+	}
+	pci_read_config_dword(priv->pcu.pci_dev, TSODCNTL,
+			      &priv->pcu.tsod_polling_interval);
+
+	mutex_init(&priv->pcu.mutex);
+
+	for (i =3D 0; i < 2; i++) {
+		err =3D imc_init_channelpair(priv, i,
+					   sadcntl & SADCNTL_LOCAL_NODEID_MASK);
+		if (err)
+			goto probe_out_free_channelpair;
+	}
+
+	return 0;
+
+probe_out_free_channelpair:
+	for (j =3D 0; j < i; j++)
+		imc_free_channelpair(priv, j);
+
+	mutex_destroy(&priv->pcu.mutex);
+
+probe_out_free:
+	kfree(priv);
+	return err;
+}
+
+static void imc_remove(struct pci_dev *dev)
+{
+	int i;
+	struct imc_priv *priv =3D pci_get_drvdata(dev);
+
+	for (i =3D 0; i < 2; i++)
+		imc_free_channelpair(priv, i);
+
+	/* set tosd_control.tsod_polling_interval to initial value */
+	pci_write_config_dword(priv->pcu.pci_dev, TSODCNTL,
+			       priv->pcu.tsod_polling_interval);
+
+	mutex_destroy(&priv->pcu.mutex);
+}
+
+static int imc_suspend(struct pci_dev *dev, pm_message_t mesg)
+{
+	struct imc_priv *priv =3D pci_get_drvdata(dev);
+
+	/* BIOS is in charge. We should finish any pending transaction */
+	priv->suspended =3D true;
+
+	return 0;
+}
+
+static int imc_resume(struct pci_dev *dev)
+{
+	struct imc_priv *priv =3D pci_get_drvdata(dev);
+
+	priv->suspended =3D false;
+
+	return 0;
+}
+
+static const struct pci_device_id imc_ids[] =3D {
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL,
+		     PCI_DEVICE_ID_INTEL_BROADWELL_IMC_TA) },
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, imc_ids);
+
+static struct pci_driver imc_pci_driver =3D {
+	.name		=3D "imc_smbus",
+	.id_table	=3D imc_ids,
+	.probe		=3D imc_probe,
+	.remove		=3D imc_remove,
+	.suspend	=3D imc_suspend,
+	.resume		=3D imc_resume,
+};
+
+static int __init i2c_imc_init(void)
+{
+	return pci_register_driver(&imc_pci_driver);
+}
+module_init(i2c_imc_init);
+
+static void __exit i2c_imc_exit(void)
+{
+	pci_unregister_driver(&imc_pci_driver);
+}
+module_exit(i2c_imc_exit);
+
+MODULE_AUTHOR("Stefan Schaeckeler <sschaeck@cisco.com>");
+MODULE_DESCRIPTION("iMC SMBus driver");
+MODULE_LICENSE("GPL v2");
=2D-
2.11.0

