Return-Path: <linux-i2c+bounces-4297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6D4914849
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 13:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6721F2118F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 11:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C463712FF8B;
	Mon, 24 Jun 2024 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZGm0FBbF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B0139D03
	for <linux-i2c@vger.kernel.org>; Mon, 24 Jun 2024 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227740; cv=none; b=d0tJbMVCVs+ZLU+4mpY06YO6ovbah7yyDqj66w/I4k8CM/Ymhcy1VXxCzMvrj6YXgiFq0/3shAQcgMoAoWuI8A65+2LYjUJWlhvxCk2wRT+l7Fq0seyv76PLnK1+Jlj+/nCtuCRJWouLNkJ2anhpmSs+6uTDLYZZx155BdKz05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227740; c=relaxed/simple;
	bh=21Pa2zMWJacHndGXe8+4giEuxwZm9MI0kin+EhGxIM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RjYQ8v0t3KAAHgJxMZj1jxVDYlVzqlg8yWVWBxnYP6BRg0I6chEAwKkeV98IjZrj0xkzLT2UAV9xkJIVzqd51PWlOU/xF9eN2U4R5raLizGCFtOtF8BiC+nxN+mMoKr7A6tVmouKYT0mRJYAqo83wPKx2ApYFt/Nz9S8mbQroBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZGm0FBbF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719227737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=52wqmJQd85KJSZYiqketgY1U0psrYJNYCEUthb3vf8I=;
	b=ZGm0FBbFSB1/09Oxfk0EsJdwMG/H0EmlYuJZRTz+wVHKD5eXw9ixlbUTLQZHndGvkwwTJP
	k59p4T8nxv9t5LCgiuwd2tKhh0rwdn2ZP8fPUHCWbfcQmvWdprRCdhhr3WppPwTCMkW6Ss
	bn2oWPkQkgtAGEg0MKUaoprK8GcHaME=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-sGGa4muLMiOy0XDqmGt10w-1; Mon,
 24 Jun 2024 07:15:34 -0400
X-MC-Unique: sGGa4muLMiOy0XDqmGt10w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC8C2195609F;
	Mon, 24 Jun 2024 11:15:29 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.82])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B7C519560AB;
	Mon, 24 Jun 2024 11:15:21 +0000 (UTC)
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
Subject: [PATCH v4 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Date: Mon, 24 Jun 2024 13:15:12 +0200
Message-ID: <20240624111519.15652-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hi All,

Here is v4 of my patch series to move the manual instantation of lis3lv02d
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
 drivers/platform/x86/dell/Makefile           |   1 +
 drivers/platform/x86/dell/dell-lis3lv02d.c   | 331 +++++++++++++++++++
 drivers/platform/x86/dell/dell-smo8800-ids.h |  26 ++
 drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
 6 files changed, 379 insertions(+), 146 deletions(-)
 create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
 create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h

-- 
2.45.1


