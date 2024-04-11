Return-Path: <linux-i2c+bounces-2905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123D48A22AA
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 01:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8804FB21898
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 23:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9714CDEC;
	Thu, 11 Apr 2024 23:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEwNWHMg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA8C4D58E
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 23:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712879789; cv=none; b=POdYeuXnrASPbLB52bL6ynSpHkwjyNyyuZk/giZg3nEpGxrl0OE6D7CNEqQ/HAqsGBzE2HrD3gf6SruGm1ku4hs2OyLBQwSwsYw9JW7nDHfgHbax9LEvtSSXYgur38rn00IN5J9onLi9x2+EbyNUXMO8vDDE6ZU/gMrVRfxtnGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712879789; c=relaxed/simple;
	bh=MioIrT4usEvNVbA3gUwhZR5hWnkV5a7eD0MVoAZp/Hg=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=K0buJAk9Fkik7d0SNjGn2oPMkNx3MqqrTH0Cu7QEXe60aGVz/woQ3GuL2B23a/NcZLria4izd+YgfTWnizTWrpciEJs/XUdquGADkVCQIdCc3Z6Isu3XMN6a49cyOXbFOHpr/8e3qxHuXKlY84S9j/TRjQRvtRxCw8F9hKcOm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEwNWHMg; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61814249649so5331077b3.3
        for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 16:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712879786; x=1713484586; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O0iRscBO4bdcIhUu420mbq2doNMaDlIpBi8l/p1zhKs=;
        b=tEwNWHMgGsPkrEAf0mcEWf1N2jjPeeE6xdLNTIGi0g8Jn9Ifbpd+RIV+ozrEDg189n
         PYSDstCBlKNWhvMKW1z7lr56sK5qWYf6qm4jwHjdp6P59AHldqaz629T0zzv+MTbgRnI
         4PRRdM9GEcy4V5iMHeqLbCISBDf9U+xffRpS0PdCXYIi0fgytZiiNqbOscPtAVEUcKlg
         K3C5U2Rem0rSDNvMzW0PbaPxRf5nW2jq8hxvpZ4K5eYSI/JKkGKRkpbBE0eL9I6ysKZj
         uu1D0mVp1XbkjwPLWHPTVxE7JtnM6bPYzEz4F1VyPZQVg+IWE4hMUARJP3oJIIGYa+Mm
         liiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712879786; x=1713484586;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0iRscBO4bdcIhUu420mbq2doNMaDlIpBi8l/p1zhKs=;
        b=DS5FYbZcB9V38aImHFNUTWsRJZW8d92p8+QyT6kR4tZzQa0H8gAqF9Y/fhyoSKxVat
         2bGbnIoFFUE3UcrXAuWB9JbDoTprwSs6NdV579lbRiUnZu6WE1sePGA7LKSt8cOhHA9W
         kdX8taVAHvgH6lzhQsic/w8ybI+evFZ58z0qzRFf/Qgtuz/w9Y3tBuO1O5IMwhkwI9w0
         GIykq7VknSyzjTsFMSnPHIuWMJEOLAg6e6ddFABXWD1hirq/KXz5f3aKQzSEG7pW1k3j
         t+0rjGFKjvj34u1iCkieU5H5kVCg+L9mpxuIIQZR6spCED1HBbq/TBKKjDD3czmZL1cH
         imyA==
X-Forwarded-Encrypted: i=1; AJvYcCWouebMtXkNmT0p2Xwafn69mQnPKwd5RZW1f+Y2hZpuRSgooQ3uPPMnkrtNb+ePJdJMxUydbu6t3OaNYKTZvFe5K5P0c9XNI6YO
X-Gm-Message-State: AOJu0YyxrderN99YJ+OOjzfgktmPIjcnj2XAKJEdRkuuzBMJlXnT1vb1
	mrjEitWoD9ZDHzQlWY8uOvn2BZ1VSKEAmSJg9tCcp4NWXNDklhIwr6fxAKhhpg++P+Ki2xld5Hf
	d8pnE71YKHL2O/Q==
X-Google-Smtp-Source: AGHT+IFosAoa851C7hPGmSTJhtx34QZTzAQeM/iXE6mN4LYGNHAkSwi0R89BgZ48h/lVqrxY4bUEsjpXIA52Xog=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:a472:f40c:d4ba:c29])
 (user=saravanak job=sendgmr) by 2002:a0d:ea90:0:b0:615:2ae1:6cd3 with SMTP id
 t138-20020a0dea90000000b006152ae16cd3mr215649ywe.3.1712879786349; Thu, 11 Apr
 2024 16:56:26 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:56:20 -0700
Message-Id: <20240411235623.1260061-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v3 0/2] fw_devlink overlay fix
From: Saravana Kannan <saravanak@google.com>
To: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kernel-team@android.com, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Overlays don't work correctly with fw_devlink. This patch series fixes
it. This series is now ready for review and merging once Geert and Herve
give they Tested-by.

Geert and Herve,

This patch series should hopefully fix both of your use cases [1][2][3].
Can you please check to make sure the device links created to/from the
overlay devices are to/from the right ones?

Thanks,
Saravana

Saravana Kannan (2):
  Revert "treewide: Fix probing of devices in DT overlays"
  of: dynamic: Fix overlayed devices not probing because of fw_devlink

 drivers/base/core.c       | 76 ++++++++++++++++++++++++++++++++++-----
 drivers/bus/imx-weim.c    |  6 ----
 drivers/i2c/i2c-core-of.c |  5 ---
 drivers/of/dynamic.c      |  1 -
 drivers/of/overlay.c      | 15 ++++++++
 drivers/of/platform.c     |  5 ---
 drivers/spi/spi.c         |  5 ---
 include/linux/fwnode.h    |  1 +
 8 files changed, 83 insertions(+), 31 deletions(-)

-- 
2.44.0.683.g7961c838ac-goog


