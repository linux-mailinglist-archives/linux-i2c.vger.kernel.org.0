Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E63AA39A
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 14:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732028AbfIEM5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 08:57:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:46778 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731008AbfIEM5L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 08:57:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 02D67B11B;
        Thu,  5 Sep 2019 12:57:09 +0000 (UTC)
Date:   Thu, 5 Sep 2019 14:57:16 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Xu, Lingyan (NSB - CN/Hangzhou)" <lingyan.xu@nokia-sbell.com>
Cc:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>,
        "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Message-ID: <20190905145716.137e155a@endymion>
In-Reply-To: <a6cd1872effd46c7ba088f28402b32b8@nokia-sbell.com>
References: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
        <20190828155822.7cb13a7b@endymion>
        <a6cd1872effd46c7ba088f28402b32b8@nokia-sbell.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 3 Sep 2019 02:15:52 +0000, Xu, Lingyan (NSB - CN/Hangzhou) wrote:
> Thanks a lot for your comments. And, yes, it is dangerous that clear all interrupt bit here based my local test. And about the interrupt flood, I will show you in attached file. And I agree with you that add SMBALERT interrupt handler if possible, but I have no idea about what action is need in this handler because that it seams that i801 can not clear salve chip's status bit directly.

The whole idea of SMBus alert is that the slave lets the master know
that it needs attention. The master's driver should then let the
slave's driver know that its baby is crying for attention, and it is
the slave driver's job to figure out what the exact problem is. Struct
i2c_driver has an "alert" field (callback function) for that purpose.
For a real example of how this can be implemented, see
drivers/i2c/busses/i2c-parport.c for the master side and
drivers/hwmon/lm90.c for the slave side. These are the 2 drivers I used
to initially add the functionality to the kernel.

Now the question is, in your system, which slave device pulls the alert?

If this is of any value to you, I tried implementing it in i2c-i801 a
few days ago. I can't really test it though as I don't have any device
which triggers an alert on my system, but I am sharing it with you if
you want to give it a try. You would still need to write the code in
the slave driver.

---
 drivers/i2c/busses/i2c-i801.c |   77 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 8 deletions(-)

--- linux-5.2.orig/drivers/i2c/busses/i2c-i801.c	2019-08-28 15:58:52.725828215 +0200
+++ linux-5.2/drivers/i2c/busses/i2c-i801.c	2019-08-28 16:50:09.212696037 +0200
@@ -196,6 +196,7 @@
 
 /* Host Notify Command register bits */
 #define SMBSLVCMD_HST_NTFY_INTREN	BIT(0)
+#define SMBSLVCMD_SMBALERT_DIS		BIT(2)
 
 #define STATUS_ERROR_FLAGS	(SMBHSTSTS_FAILED | SMBHSTSTS_BUS_ERR | \
 				 SMBHSTSTS_DEV_ERR)
@@ -281,6 +282,10 @@ struct i801_priv {
 	 */
 	bool acpi_reserved;
 	struct mutex acpi_lock;
+
+	/* SMBus alert */
+	struct i2c_smbus_alert_setup alert_data;
+	struct i2c_client *ara;
 };
 
 #define FEATURE_SMBUS_PEC	BIT(0)
@@ -289,6 +294,7 @@ struct i801_priv {
 #define FEATURE_I2C_BLOCK_READ	BIT(3)
 #define FEATURE_IRQ		BIT(4)
 #define FEATURE_HOST_NOTIFY	BIT(5)
+#define FEATURE_SMBUS_ALERT	BIT(6)
 /* Not really a feature, but it's convenient to handle it as such */
 #define FEATURE_IDF		BIT(15)
 #define FEATURE_TCO_SPT		BIT(16)
@@ -301,6 +307,7 @@ static const char *i801_feature_names[]
 	"I2C block read",
 	"Interrupt",
 	"SMBus Host Notify",
+	"SMBus Alert",
 };
 
 static unsigned int disable_features;
@@ -310,7 +317,8 @@ MODULE_PARM_DESC(disable_features, "Disa
 	"\t\t  0x02  disable the block buffer\n"
 	"\t\t  0x08  disable the I2C block read functionality\n"
 	"\t\t  0x10  don't use interrupts\n"
-	"\t\t  0x20  disable SMBus Host Notify ");
+	"\t\t  0x20  disable SMBus Host Notify\n"
+	"\t\t  0x40  disable SMBus Alert ");
 
 /* Make sure the SMBus host is ready to start transmitting.
    Return 0 if it is, -EBUSY if it is not. */
@@ -620,8 +628,24 @@ static irqreturn_t i801_host_notify_isr(
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t i801_smbus_alert_isr(struct i801_priv *priv)
+{
+	struct i2c_client *ara = priv->ara;
+
+	if (ara) {
+		dev_dbg(&ara->dev, "SMBus alert received\n");
+		i2c_handle_smbus_alert(ara);
+	} else
+		dev_dbg(&priv->adapter.dev,
+			"SMBus alert received but no ARA client!\n");
+
+	/* clear SMBus Alert bit and return */
+	outb_p(SMBHSTSTS_SMBALERT_STS, SMBHSTSTS(priv));
+	return IRQ_HANDLED;
+}
+
 /*
- * There are three kinds of interrupts:
+ * There are four kinds of interrupts:
  *
  * 1) i801 signals transaction completion with one of these interrupts:
  *      INTR - Success
@@ -635,6 +659,8 @@ static irqreturn_t i801_host_notify_isr(
  *    occurs for each byte of a byte-by-byte to prepare the next byte.
  *
  * 3) Host Notify interrupts
+ *
+ * 4) SMBus Alert interrupts
  */
 static irqreturn_t i801_isr(int irq, void *dev_id)
 {
@@ -653,6 +679,12 @@ static irqreturn_t i801_isr(int irq, voi
 			return i801_host_notify_isr(priv);
 	}
 
+	if (priv->features & FEATURE_SMBUS_ALERT) {
+		status = inb_p(SMBHSTSTS(priv));
+		if (status & SMBHSTSTS_SMBALERT_STS)
+			return i801_smbus_alert_isr(priv);
+	}
+
 	status = inb_p(SMBHSTSTS(priv));
 	if (status & SMBHSTSTS_BYTE_DONE)
 		i801_isr_byte_done(priv);
@@ -1006,9 +1038,35 @@ static void i801_enable_host_notify(stru
 	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
 }
 
-static void i801_disable_host_notify(struct i801_priv *priv)
+static void i801_enable_smbus_alert(struct i2c_adapter *adapter)
 {
-	if (!(priv->features & FEATURE_HOST_NOTIFY))
+	struct i801_priv *priv = i2c_get_adapdata(adapter);
+
+	if (!(priv->features & FEATURE_SMBUS_ALERT))
+		return;
+
+	priv->ara = i2c_setup_smbus_alert(adapter, &priv->alert_data);
+	if (!priv->ara) {
+		dev_warn(&adapter->dev, "Failed to register ARA client\n");
+
+		/* Disable SMBus Alert interrupts */
+		if (!(SMBSLVCMD_SMBALERT_DIS & priv->original_slvcmd))
+			outb_p(SMBSLVCMD_SMBALERT_DIS | priv->original_slvcmd,
+			       SMBSLVCMD(priv));
+		return;
+	}
+
+	if (SMBSLVCMD_SMBALERT_DIS & priv->original_slvcmd)
+		outb_p(~SMBSLVCMD_SMBALERT_DIS & priv->original_slvcmd,
+		       SMBSLVCMD(priv));
+
+	/* Clear SMBus Alert bit to allow a new notification */
+	outb_p(SMBHSTSTS_SMBALERT_STS, SMBHSTSTS(priv));
+}
+
+static void i801_restore_slvcmd(struct i801_priv *priv)
+{
+	if (!(priv->features & (FEATURE_HOST_NOTIFY | FEATURE_SMBUS_ALERT)))
 		return;
 
 	outb_p(priv->original_slvcmd, SMBSLVCMD(priv));
@@ -1823,8 +1881,8 @@ static int i801_probe(struct pci_dev *de
 		outb_p(inb_p(SMBAUXCTL(priv)) &
 		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
 
-	/* Remember original Host Notify setting */
-	if (priv->features & FEATURE_HOST_NOTIFY)
+	/* Remember original Host Notify and SMBus Alert setting */
+	if (priv->features & (FEATURE_HOST_NOTIFY | FEATURE_SMBUS_ALERT))
 		priv->original_slvcmd = inb_p(SMBSLVCMD(priv));
 
 	/* Default timeout in interrupt mode: 200 ms */
@@ -1875,6 +1933,7 @@ static int i801_probe(struct pci_dev *de
 	}
 
 	i801_enable_host_notify(&priv->adapter);
+	i801_enable_smbus_alert(&priv->adapter);
 
 	i801_probe_optional_slaves(priv);
 	/* We ignore errors - multiplexing is optional */
@@ -1897,8 +1956,10 @@ static void i801_remove(struct pci_dev *
 	pm_runtime_forbid(&dev->dev);
 	pm_runtime_get_noresume(&dev->dev);
 
-	i801_disable_host_notify(priv);
+	i801_restore_slvcmd(priv);
 	i801_del_mux(priv);
+	if (priv->ara)
+		i2c_unregister_device(priv->ara);
 	i2c_del_adapter(&priv->adapter);
 	i801_acpi_remove(priv);
 	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
@@ -1916,7 +1977,7 @@ static void i801_shutdown(struct pci_dev
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
 	/* Restore config registers to avoid hard hang on some systems */
-	i801_disable_host_notify(priv);
+	i801_restore_slvcmd(priv);
 	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
 }
 


-- 
Jean Delvare
SUSE L3 Support
