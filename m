Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9687A4A473C
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 13:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377752AbiAaMej (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 07:34:39 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:59484 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377681AbiAaMei (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 07:34:38 -0500
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1643632477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xJWvr65dKavzLpT9wk8poZEoprQ5XoEoPP+pD1dTjoU=;
        b=Z/KGWakY3YQlkXWWU17c/U6IyXfQ2ddGu2eAM1wSlkX5J3cDhZ/2sw01mwLlFcckDsouWb
        6DQIC8M/NmorkRzCyc4PAaOaZAUR9X3K7NumnAmRwAAbUUktaHsL8Ya2glWuNNY3Ner0R+
        B624oJtvIdvwqA0J4mJNppn96yQ04dJ7PtlWVG1SLpP68xYftg6aTWuZaFVXM62pEfN/wo
        +ivNf1zd/2FL3+dtp1JTFrpaBsBtgkC5eww1zsh1fzhS4Uz7bJNeJAqDQDXfdoFkqEKaFM
        +NQflqvo3TspLnpeEAgXit6O7IiqKmpVYpn4KdJDfHic9T8O2PEGqOYKf32EBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1643632477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xJWvr65dKavzLpT9wk8poZEoprQ5XoEoPP+pD1dTjoU=;
        b=1FiRpdEpOIKmEaDN1Ok6OZsrGcwa2CFIdZD9jXw4HkbjamLiJUBykx5vbsIIS/XPmAktwm
        /+0hNxq/DdZqnyDg==
To:     greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
Date:   Mon, 31 Jan 2022 13:34:01 +0100
Message-Id: <20220131123404.175438-5-bigeasy@linutronix.de>
In-Reply-To: <20220131123404.175438-1-bigeasy@linutronix.de>
References: <20220131123404.175438-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

generic_handle_irq() is invoked from a regular interrupt service
routine. This handler will become a forced-threaded handler on
PREEMPT_RT and will be invoked with enabled interrupts. The
generic_handle_irq() must be invoked with disabled interrupts in order
to avoid deadlocks.

Instead of manually disabling interrupts before invoking use
generic_handle_irq_safe() which can be invoked with enabled and disabled
interrupts.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/misc/hi6421v600-irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
index 1c763796cf1fa..caa3de37698b0 100644
--- a/drivers/misc/hi6421v600-irq.c
+++ b/drivers/misc/hi6421v600-irq.c
@@ -117,8 +117,8 @@ static irqreturn_t hi6421v600_irq_handler(int irq, void=
 *__priv)
 			 * If both powerkey down and up IRQs are received,
 			 * handle them at the right order
 			 */
-			generic_handle_irq(priv->irqs[POWERKEY_DOWN]);
-			generic_handle_irq(priv->irqs[POWERKEY_UP]);
+			generic_handle_irq_safe(priv->irqs[POWERKEY_DOWN]);
+			generic_handle_irq_safe(priv->irqs[POWERKEY_UP]);
 			pending &=3D ~HISI_IRQ_POWERKEY_UP_DOWN;
 		}
=20
@@ -126,7 +126,7 @@ static irqreturn_t hi6421v600_irq_handler(int irq, void=
 *__priv)
 			continue;
=20
 		for_each_set_bit(offset, &pending, BITS_PER_BYTE) {
-			generic_handle_irq(priv->irqs[offset + i * BITS_PER_BYTE]);
+			generic_handle_irq_safe(priv->irqs[offset + i * BITS_PER_BYTE]);
 		}
 	}
=20
--=20
2.34.1

