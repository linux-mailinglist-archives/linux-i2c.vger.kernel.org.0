Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE7D48178C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhL2XO7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:14:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38321 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232885AbhL2XO4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DU22RCxjuVTVlGee8OwmLJSj5phjJoM55XWXdVZhIcw=;
        b=Aim8oQO/usMBSh45bFjALh0I5dmSyQl+7HAs7m3CePJtI+c8SUGSJcZWddMuEp0Fj2n+QI
        Bt4dv6nTaLaR5gYWzdHV5JwCGS8s3ONmquhjF1kiO2X5FzxyErP+1MjFW6LVw0xb1cNGFI
        BvMipS5Xo86DD3hUwfcEIks09hPHlss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-ko3jiTlpOcK0RmT08FfIYA-1; Wed, 29 Dec 2021 18:14:52 -0500
X-MC-Unique: ko3jiTlpOcK0RmT08FfIYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DB931023F50;
        Wed, 29 Dec 2021 23:14:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7DBE1037F5B;
        Wed, 29 Dec 2021 23:14:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: [PATCH 05/12] platform/x86: x86-android-tablets: Add support for PMIC interrupts
Date:   Thu, 30 Dec 2021 00:14:24 +0100
Message-Id: <20211229231431.437982-6-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Crystal Cove PMIC has a pin which can be used to connect the IRQ of
an external charger IC. On some boards this is used so we need a way to
look this up.

Note that the Intel PMICs have 2 levels of interrupts and thus
2 levels of IRQ domains all tied to a single fwnode.

Level 1 is the irqchip which demultiplexes the actual PMIC interrupt into
interrupts for the various MFD cells. Level 2 are the irqchips used in the
cell drivers which themselves export IRQs, such as the crystal_cove_gpio
driver, which de-multiplexes the level 2 interrupts for the GPIOs into
individual per GPIO IRQs.

The crystal_cove_charger driver registers an irqchip with a single IRQ for
the charger driver to consume. Note the MFD cell IRQ cannot be consumed
directly because the level 2 interrupts must be explicitly acked.

To allow finding the right IRQ domain when looking up the IRQ for
the charger, the crystal_cove_charger driver sets a DOMAIN_BUS_WIRED token
on its IRQ domain.

Add support for looking up the IRQ from the crystal_cove_charger driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index ea033d7f4439..44138882bc9f 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -17,6 +17,7 @@
 #include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/string.h>
@@ -31,11 +32,13 @@ enum x86_acpi_irq_type {
 	X86_ACPI_IRQ_TYPE_NONE,
 	X86_ACPI_IRQ_TYPE_APIC,
 	X86_ACPI_IRQ_TYPE_GPIOINT,
+	X86_ACPI_IRQ_TYPE_PMIC,
 };
 
 struct x86_acpi_irq_data {
-	char *chip;   /* GPIO chip label (GPIOINT) */
+	char *chip;   /* GPIO chip label (GPIOINT) or PMIC ACPI path (PMIC) */
 	enum x86_acpi_irq_type type;
+	enum irq_domain_bus_token domain;
 	int index;
 	int trigger;  /* ACPI_EDGE_SENSITIVE / ACPI_LEVEL_SENSITIVE */
 	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
@@ -48,9 +51,14 @@ static int x86_acpi_irq_helper_gpiochip_find(struct gpio_chip *gc, void *data)
 
 static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
 {
+	struct irq_fwspec fwspec = { };
+	struct irq_domain *domain;
+	struct acpi_device *adev;
 	struct gpio_desc *gpiod;
 	struct gpio_chip *chip;
 	unsigned int irq_type;
+	acpi_handle handle;
+	acpi_status status;
 	int irq, ret;
 
 	switch (data->type) {
@@ -86,6 +94,27 @@ static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
 			irq_set_irq_type(irq, irq_type);
 
 		return irq;
+	case X86_ACPI_IRQ_TYPE_PMIC:
+		status = acpi_get_handle(NULL, data->chip, &handle);
+		if (ACPI_FAILURE(status)) {
+			pr_err("error could not get %s handle\n", data->chip);
+			return -ENODEV;
+		}
+
+		acpi_bus_get_device(handle, &adev);
+		if (!adev) {
+			pr_err("error could not get %s adev\n", data->chip);
+			return -ENODEV;
+		}
+
+		fwspec.fwnode = acpi_fwnode_handle(adev);
+		domain = irq_find_matching_fwspec(&fwspec, data->domain);
+		if (!domain) {
+			pr_err("error could not find IRQ domain for %s\n", data->chip);
+			return -ENODEV;
+		}
+
+		return irq_create_mapping(domain, data->index);
 	default:
 		return 0;
 	}
-- 
2.33.1

