Return-Path: <linux-i2c+bounces-11434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B44BAD8DAE
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE2913BBD98
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D28E2DCBEC;
	Fri, 13 Jun 2025 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WN7asIzB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AE19CD0B;
	Fri, 13 Jun 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822539; cv=none; b=e0cc4jLs7s+pBw4s3p1eYxJ5StdYoBbRnzpWDDpYXIKuOIcuHBEiDhDRaFyIxI4ma32jGSijYWpdLULdGsLfBj737BnC3TBb/Peq8wUQLZcG1PFH27+sJ9swmZnEzxysK6GTzHPS7cqWT2j8e5JpEN2e8NJPfp40LIr28t/TmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822539; c=relaxed/simple;
	bh=NVER4HtZBVq3g1XAxNFzIag3WdbXkOjNf2ubft0lD4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkXKT97oXOjehwGTUwpmFf0HkwgxmglfDGNybNxt8BQuCCW6L+EOnZoxw0djV3iihSZXQL9ahjNHDSgxMuFhvRxxeFwOG1dQtqUlU6607obxR0L7o2PhE1a6TPrr1D8yRzoaN3oTE2VVuv+KwndvpgAcgWSqFxASjjv1e5Cidls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WN7asIzB; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 30A0F42E77;
	Fri, 13 Jun 2025 13:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zi73o7nhI1WC2DkCllvWg4ecgcB270UmBhN9Ujfl6x8=;
	b=WN7asIzBvwg0yi+qMYSziSSRMBFol91HuEQgKmHClBGYRbmZNu5LptYE836x0JvUel36zT
	H2trTJAiZELDnYlYEFsr7p/t04S1CpirT+hrJ9QWomYA9aFfWGw/nDbqfNjh1UutBJ4hbU
	0VM/C1legKyKGRHoVtO4Nn39u1ejYK89t7/xBJPVKdcJiKanwRONKtZuTf/eaVAew3CIf6
	dkGaAQqT12xJBbfZTCATjBVl2NpJcMdEJQYGQEkxb3QFEB40a+8xTJoj9f8FZxzPuILDBu
	hqTMquh/zZfDRbhmetRNPmTuofHMCGHw9RzSl/mQbl4gfrm+Z6nsdx2TExE6QQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 04/28] driver core: Avoid warning when removing a device while its supplier is unbinding
Date: Fri, 13 Jun 2025 15:47:44 +0200
Message-ID: <20250613134817.681832-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeelpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhr
 ghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

During driver removal, the following warning can appear:
   WARNING: CPU: 1 PID: 139 at drivers/base/core.c:1497 __device_links_no_driver+0xcc/0xfc
   ...
   Call trace:
     __device_links_no_driver+0xcc/0xfc (P)
     device_links_driver_cleanup+0xa8/0xf0
     device_release_driver_internal+0x208/0x23c
     device_links_unbind_consumers+0xe0/0x108
     device_release_driver_internal+0xec/0x23c
     device_links_unbind_consumers+0xe0/0x108
     device_release_driver_internal+0xec/0x23c
     device_links_unbind_consumers+0xe0/0x108
     device_release_driver_internal+0xec/0x23c
     driver_detach+0xa0/0x12c
     bus_remove_driver+0x6c/0xbc
     driver_unregister+0x30/0x60
     pci_unregister_driver+0x20/0x9c
     lan966x_pci_driver_exit+0x18/0xa90 [lan966x_pci]

This warning is triggered when a consumer is removed because the links
status of its supplier is not DL_DEV_DRIVER_BOUND and the link flag
DL_FLAG_SYNC_STATE_ONLY is not set.

The topology in terms of consumers/suppliers used was the following
(consumer ---> supplier):

      i2c -----------> OIC ----> PCI device
       |                ^
       |                |
       +---> pinctrl ---+

When the PCI device is removed, the OIC (interrupt controller) has to be
removed. In order to remove the OIC, pinctrl and i2c need to be removed
and to remove pinctrl, i2c need to be removed. The removal order is:
  1) i2c
  2) pinctrl
  3) OIC
  4) PCI device

In details, the removal sequence is the following (with 0000:01:00.0 the
PCI device):
  driver_detach: call device_release_driver_internal(0000:01:00.0)...
    device_links_busy(0000:01:00.0):
      links->status = DL_DEV_UNBINDING
    device_links_unbind_consumers(0000:01:00.0):
      0000:01:00.0--oic link->status = DL_STATE_SUPPLIER_UNBIND
      call device_release_driver_internal(oic)...
        device_links_busy(oic):
          links->status = DL_DEV_UNBINDING
        device_links_unbind_consumers(oic):
          oic--pinctrl link->status = DL_STATE_SUPPLIER_UNBIND
          call device_release_driver_internal(pinctrl)...
            device_links_busy(pinctrl):
              links->status = DL_DEV_UNBINDING
            device_links_unbind_consumers(pinctrl):
              pinctrl--i2c link->status = DL_STATE_SUPPLIER_UNBIND
              call device_release_driver_internal(i2c)...
                device_links_busy(i2c): links->status = DL_DEV_UNBINDING
                __device_links_no_driver(i2c)...
                  pinctrl--i2c link->status is DL_STATE_SUPPLIER_UNBIND
                  oic--i2c link->status is DL_STATE_ACTIVE
                  oic--i2c link->supplier->links.status is DL_DEV_UNBINDING

The warning is triggered by the i2c removal because the OIC (supplier)
links status is not DL_DEV_DRIVER_BOUND. Its links status is indeed set
to DL_DEV_UNBINDING.

It is perfectly legit to have the links status set to DL_DEV_UNBINDING
in that case. Indeed we had started to unbind the OIC which triggered
the consumer unbinding and didn't finish yet when the i2c is unbound.

Avoid the warning when the supplier links status is set to
DL_DEV_UNBINDING and thus support this removal sequence without any
warnings.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/base/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 8fead097c404..ce367c44f642 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1494,7 +1494,8 @@ static void __device_links_no_driver(struct device *dev)
 		if (link->supplier->links.status == DL_DEV_DRIVER_BOUND) {
 			WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
 		} else {
-			WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
+			WARN_ON(link->supplier->links.status != DL_DEV_UNBINDING &&
+				!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
 			WRITE_ONCE(link->status, DL_STATE_DORMANT);
 		}
 	}
-- 
2.49.0


