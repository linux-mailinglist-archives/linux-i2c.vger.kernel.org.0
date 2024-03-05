Return-Path: <linux-i2c+bounces-2201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2008728BA
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 21:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2505E1F2B413
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 20:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF7512AAE7;
	Tue,  5 Mar 2024 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZCe/x6z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A4712AAD1;
	Tue,  5 Mar 2024 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709670491; cv=none; b=NZ9r3s/I4RNNUkMAnRySPlH+mD9GiGwfXrDchSJ++SafjGcwf6LJpIsv+0ap7GVSUkehsoehjB92/0MeSthywve+557WPk0IxUDMQCQUlsGQxyYZIsxQAuOiYvw1b/8eObABXY1k54OWdmzHZCL3SRNLywRvUNfKFOjP5yMSdqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709670491; c=relaxed/simple;
	bh=kmcLJ6/b62wSq5EQn6v8rPVZtXbnK2V9uQJaCAkUcWY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=fd4orpPWE09ipuzH8FdgoWqUWQ1fU3MtlD0QBuExUdUgFboahACmRgB3jUaRUlp5yTWcvFwUgxbZI1DzKnWnGhiY/hfUffMhwjAPmazZpHyXzl4EYc86YklZJWxTDuE30DnddR4FkzlmXybTNF9OSMAU1gnxCo0bXq/YjOqCF9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZCe/x6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE164C43390;
	Tue,  5 Mar 2024 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709670490;
	bh=kmcLJ6/b62wSq5EQn6v8rPVZtXbnK2V9uQJaCAkUcWY=;
	h=Date:From:Subject:To:Cc:From;
	b=LZCe/x6zPDcpQInwf5Zar2XFu8uevkHE3//EVlby9MGw1NT4rgKdXRpxxG8Yy7L4M
	 AgVDzoc8Z8npDTf2sWxGwqM+WLColNrJxceWRYsVBbA2vFx+cULioe1dPHcKOfi1qN
	 v0HC7ATJ7cRoXqXZ7byjqVquIfBZDoeqcIhNgceb8I77Fui7jw8K62pe9YlayuHGRU
	 FKbBU8cQd7dxPM849L+Pj9yR+NnKNn5k3ukgdntbq8GSwGGzMenbW6Hy77KpTx1YDt
	 Uss4Syk1u1mg9BJLXppmsvFBOslD70YmhItw/SZlpMWI8b3DUZpi+HdPuP+NuMRyVK
	 gT0wQ2pPMX4Hw==
Message-ID: <39119bd7-f0f0-4171-937a-b92b6e50a673@kernel.org>
Date: Tue, 5 Mar 2024 21:28:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkall@kernel.org>
Subject: [PATCH RFT] i2c: i801: Call i2c_register_spd for muxed child segments
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

So far i2c_register_spd() is supported only on systems with up to
8 memory slots. Reason is that on a single SMBus only 8 SPD EEPROMS
can be addressed. The following patch adds support for calling
i2c_register_spd() on multiplexed SMBUS segments.

Out-of-the-box only certain ASUS Z8 systems are supported.
See mux_dmi_table[] in the i801 driver.
These systems seem to be quite rare nowadays, so I'd appreciate
if the owner of such a system could test the patch.

For each DIMM module a message like the following should appear in dmesg.
i2c i2c-11: Successfully instantiated SPD at 0x50
A response including the full dmesg log would be perfect.

For other systems with >8 memory slots, where the SMBUS is GPIO-muxed,
it should be possible to add an appropriate entry to mux_dmi_table[].
Then the patch should work as expected on such a system too.

Note: This patch is applicable only after 8821c8376993 ("i2c: smbus:
Prepare i2c_register_spd for usage on muxed segments").
This patch showed up in linux-next from March 5th 2024.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 8f225cd7b..4b9d04f20 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -105,6 +105,7 @@
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
+#include <linux/i2c-mux.h>
 #include <linux/i2c-smbus.h>
 #include <linux/acpi.h>
 #include <linux/io.h>
@@ -291,6 +292,7 @@ struct i801_priv {
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
 	struct platform_device *mux_pdev;
 	struct gpiod_lookup_table *lookup;
+	struct notifier_block mux_notifier_block;
 #endif
 	struct platform_device *tco_pdev;
 
@@ -1388,6 +1390,23 @@ static const struct dmi_system_id mux_dmi_table[] = {
 	{ }
 };
 
+static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
+			      void *data)
+{
+	struct i801_priv *priv = container_of(nb, struct i801_priv, mux_notifier_block);
+	struct device *dev = data;
+
+	if (action != BUS_NOTIFY_ADD_DEVICE ||
+	    dev->type != &i2c_adapter_type ||
+	    i2c_root_adapter(dev) != &priv->adapter)
+		return NOTIFY_DONE;
+
+	/* Call i2c_register_spd for muxed child segments */
+	i2c_register_spd(to_i2c_adapter(dev));
+
+	return NOTIFY_OK;
+}
+
 /* Setup multiplexing if needed */
 static void i801_add_mux(struct i801_priv *priv)
 {
@@ -1425,6 +1444,9 @@ static void i801_add_mux(struct i801_priv *priv)
 	gpiod_add_lookup_table(lookup);
 	priv->lookup = lookup;
 
+	priv->mux_notifier_block.notifier_call = i801_notifier_call;
+	if (bus_register_notifier(&i2c_bus_type, &priv->mux_notifier_block))
+		return;
 	/*
 	 * Register the mux device, we use PLATFORM_DEVID_NONE here
 	 * because since we are referring to the GPIO chip by name we are
@@ -1443,6 +1465,7 @@ static void i801_add_mux(struct i801_priv *priv)
 
 static void i801_del_mux(struct i801_priv *priv)
 {
+	bus_unregister_notifier(&i2c_bus_type, &priv->mux_notifier_block);
 	platform_device_unregister(priv->mux_pdev);
 	gpiod_remove_lookup_table(priv->lookup);
 }
-- 
2.44.0


