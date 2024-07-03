Return-Path: <linux-i2c+bounces-4605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94451925C41
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 13:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80AD1C2097A
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 11:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95E2173336;
	Wed,  3 Jul 2024 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Clp7dwxr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FD26E5ED
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jul 2024 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004734; cv=none; b=p879siHvhN9gcToQSCuLPbIX2/hcUYTruIFYviFtK3wjLmPzaOyLOFS5xJwUgWn9B/5EWJvFrv8nBH3VcUxmOnmFlxtAFuOki1DylTA1REHkuDCB9LE+NWIO3Piim7OXJ5+lfLf0Q7Ezpu2RuLuxX95/DN6C3gWOrJrIqoO4n6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004734; c=relaxed/simple;
	bh=zeyqNqsiNS1QXxwodcCIh2SYARaX25BQv9Mtyexm1Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j3tnCLM0EGKh5VKJUsulmTMmYTpinn/33s008YeXtNgovmS41u9OW2BdyingaSsdOaHfpGsa1aQcgIQr6HtAhm188OarapOv47PqDLto/Vo9WLXW7KcngQ5+WEW4o2t62jwyHPSHzVJ8HJDhM5ARhM6LuvcUkKvXi2SeD9KxJwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Clp7dwxr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720004731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7X2f/7GAgJdqiX0ftRW2nU1oJGX9qS2gOTWFHY62kYQ=;
	b=Clp7dwxr0LsMpwY4giuKWhIH9vm1VFkxxZ7ZhuAP2uh0H32IO3HuhrEzc4V5Ku8E4fkLPs
	VbyTXgcX8ZSUGwrQovhS7lDPEwwtIk1wWRP1CxoP44oSsfH6tuE6oaAQEairWGpHJzzywH
	a5Vdgn/NRW62hEK/Lmf7taeR2EVN6Og=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-134-MAMeP5yLM7iF7OFDub5mrA-1; Wed,
 03 Jul 2024 07:05:28 -0400
X-MC-Unique: MAMeP5yLM7iF7OFDub5mrA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 380FF1954B0C;
	Wed,  3 Jul 2024 11:05:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.199])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABBFE1955BC0;
	Wed,  3 Jul 2024 11:05:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v5 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Date: Wed,  3 Jul 2024 13:05:06 +0200
Message-ID: <20240703110512.21401-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi All,

Here is v5 of my patch series to move the manual instantation of lis3lv02d
i2c_client-s for SMO88xx ACPI device from the generic i2c-i801.c code to
a SMO88xx specific dell-lis3lv02d driver.

Moving the i2c_client instantiation there has the following advantages:

1. This moves the SMO88xx ACPI device quirk handling away from the generic
i2c-i801 module which is loaded on all Intel x86 machines to a module
which will only be loaded when there is an ACPI SMO88xx device.

2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
between the i2c-i801 and dell-smo8800 drivers.

3. This allows extending the quirk handling by adding new code and related
module parameters to the dell-lis3lv02d driver, without needing to modify
the i2c-i801 code.

This series also extends the i2c_client instantiation with support for
probing for the i2c-address of the lis3lv02d chip on devices which
are not yet listed in the DMI table with i2c-addresses for known models.
This probing is only done when requested through a module parameter.

The probing support adds quite a bit of code which shows why it is good
to move the handling out of the generic i2c-i801 code.

Changes in v5:
- Make match_acpi_device_ids() and match_acpi_device_ids[] __init[const]
- Add "Depends on I2C" to Kconfig (to fix kernel-test-robot reported issues)
- Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)

Changes in v4:
- Move the i2c_client instantiation to a new dell-lis3lv02d driver instead
  of adding it to the dell-smo8800 driver
- Address a couple of other minor review comments

Changes in v3:
- Use an i2c bus notifier so that the i2c_client will still be instantiated if
  the i801 i2c_adapter shows up later or is re-probed (removed + added again).
  This addresses the main concern / review-comments made during review of v2.
- Add 2 prep patches to the i2c-core / the i2c-i801 driver to allow bus-notifier
  use / to avoid the need to duplicate the PCI-ids of IDF i2c-i801 adapters.
- Switch to standard dmi_system_id matching to check both sys-vendor +
  product-name DMI fields
- Drop the patch to alternatively use the st_accel IIO driver instead of
  drivers/misc/lis3lv02d/lis3lv02d.c

Changes in v2:
- Drop "[PATCH 1/6] platform/x86: dell-smo8800: Only load on Dell laptops"
- Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
- Add a comment documenting the IDF PCI device ids
- Keep using drivers/misc/lis3lv02d/lis3lv02d.c by default
- Rename the module-parameter to use_iio_driver which can be set to
  use the IIO st_accel driver instead
- Add a new patch adding the accelerometer address for the 2 models
  I have tested this on to dell_lis3lv02d_devices[]

Since this touches files under both drivers/i2c and drivers/platform/x86
some subsystem coordination is necessary. I think it would be best to just
merge the entire series through the i2c subsystem since this touches some
core i2c files. As pdx86 subsys co-maintainer I'm fine with doing so.

Regards,

Hans


Hans de Goede (6):
  i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
  i2c: i801: Use a different adapter-name for IDF adapters
  platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
    dell-smo8800-ids.h
  platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
    from i2c-i801 to dell-lis3lv02d
  platform/x86: dell-smo8800: Add a couple more models to
    lis3lv02d_devices[]
  platform/x86: dell-smo8800: Add support for probing for the
    accelerometer i2c address

 drivers/i2c/busses/i2c-i801.c                | 133 +-------
 drivers/i2c/i2c-core-base.c                  |  18 +-
 drivers/platform/x86/dell/Kconfig            |   1 +
 drivers/platform/x86/dell/Makefile           |   1 +
 drivers/platform/x86/dell/dell-lis3lv02d.c   | 335 +++++++++++++++++++
 drivers/platform/x86/dell/dell-smo8800-ids.h |  26 ++
 drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
 7 files changed, 384 insertions(+), 146 deletions(-)
 create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
 create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h

-- 
2.45.1


