Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE281D7906
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 14:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgERMxL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 08:53:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:43928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbgERMxK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 May 2020 08:53:10 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97F6C20787;
        Mon, 18 May 2020 12:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589806390;
        bh=8GLIs34nZZnF9Zwpy48l6Q69nZOjRQeAvh4rHYxlgEM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SdChjss5sexPx09tjw2Ucwq/BKruq/QAThbm5a3AbjDUGWJ+GIXGBi3LHat7YHQXm
         wl22kJdJgRjqf+OLTKE0b2p0CF0wk0Pq2ndhTmlaVcx3VWrgE1cGb1NW26wWtQoCIS
         W8lWRIAHy4+V5ujNKzBS0WPyy1ZTtun+inb9msAI=
Date:   Mon, 18 May 2020 14:53:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mfd: ensure that AXP20X_I2C will have the right
 deps on X86
Message-ID: <20200518145302.56642b22@coco.lan>
In-Reply-To: <aa23c170-f4e8-e1f0-5c7f-35e51ec84533@redhat.com>
References: <cover.1589801950.git.mchehab+huawei@kernel.org>
        <cfbb80f220bba5051640d92fc00825bdaa2ec877.1589801950.git.mchehab+huawei@kernel.org>
        <aa23c170-f4e8-e1f0-5c7f-35e51ec84533@redhat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Em Mon, 18 May 2020 14:17:06 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
> 
> On 5/18/20 1:42 PM, Mauro Carvalho Chehab wrote:
> > The axp20x I2C driver can be used on X86, but also on ARM
> > platforms.
> > 
> > Yet, for X86, it has to be builtin and need ACPI OpRegion
> > support enabled.
> > 
> > So, the dependency chain is diferent for X86 and for other
> > archs.
> > 
> > Change the dependency chain to take this into consideration,
> > ensuring that everything will be set as it should.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Hmm, last time we tried something like this (it was tried before,
> but in a bit different way) we ran into all kind of dependency /
> select cycles / issues.

Yeah, changes like that could cause troubles, specially where
select is used. With the approach I took, there's just one
new select for "IOSF_MBI".

I double-checked that, on most places, this feature is selected.
After this patch, there will be only three "depends on IOSF_MBI",
that could likely be also converted to "select":

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0ad7ad8cf8e1..d99ad532e17a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -740,7 +740,8 @@ config THINKPAD_ACPI_HOTKEY_POLL
 
 config INTEL_ATOMISP2_PM
 	tristate "Intel AtomISP2 dummy / power-management driver"
-	depends on PCI && IOSF_MBI && PM
+	depends on PCI && PM
+	select IOSF_MBI
 	help
 	  Power-management driver for Intel's Image Signal Processor found on
 	  Bay Trail and Cherry Trail devices. This dummy driver's sole purpose
@@ -1185,7 +1186,8 @@ config TOUCHSCREEN_DMI
 
 config INTEL_IMR
 	bool "Intel Isolated Memory Region support"
-	depends on X86_INTEL_QUARK && IOSF_MBI
+	depends on X86_INTEL_QUARK
+	select IOSF_MBI
 	---help---
 	  This option provides a means to manipulate Isolated Memory Regions.
 	  IMRs are a set of registers that define read and write access masks
diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
index dc1c1381d7fa..f4a3f110c720 100644
--- a/drivers/powercap/Kconfig
+++ b/drivers/powercap/Kconfig
@@ -21,7 +21,8 @@ config INTEL_RAPL_CORE
 
 config INTEL_RAPL
 	tristate "Intel RAPL Support via MSR Interface"
-	depends on X86 && IOSF_MBI
+	depends on X86
+	select IOSF_MBI
 	select INTEL_RAPL_CORE
 	---help---
 	  This enables support for the Intel Running Average Power Limit (RAPL)

The one for INTEL_IMR could even be dropped, as config 
X86_INTEL_QUARK already selects it too.

> With that said I'm fine with giving this another try, maybe let
> the test builders / rand config builds play with it for a while
> and see what happens?

Yeah, it makes sense to me.

Thanks,
Mauro
