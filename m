Return-Path: <linux-i2c+bounces-1181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B0826081
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5FA11F23D56
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DCC8498;
	Sat,  6 Jan 2024 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gr352ZMq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F28495
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704557387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=krEyvDdmungdj9thTPeBJ8vUUrGzrmBq18aadwXqG6c=;
	b=Gr352ZMqWQnZdXR3If/EtAAnauvJ5im4NBGzzNoZappDF21QgLpDCbuugHWjm4pN2VdRTZ
	kVV01h2nNlsLXFcmz0PFvhLakuLpv+fTI1TKZIEN3FzCvMt78A6NVLjrZW9brQ08PxqQwB
	gGwX4ZMWiuKehUad4mrS69YxgcZCJ5g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-VMQHEYFEMKmq7qcrMeGGdQ-1; Sat, 06 Jan 2024 11:09:44 -0500
X-MC-Unique: VMQHEYFEMKmq7qcrMeGGdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F3F985A58B;
	Sat,  6 Jan 2024 16:09:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB2E13C27;
	Sat,  6 Jan 2024 16:09:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/6] i2c-i801 / dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Date: Sat,  6 Jan 2024 17:09:27 +0100
Message-ID: <20240106160935.45487-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Hi All,

Here is a patch series which implements my suggestions from:
https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
to improve the lis3lv02d accel support on Dell laptops.

Jean, Andi the actual move is in patch 2/6 after 1 small prep patch on
the dell-smo8800 side. My plan for merging this is to create an immutable
branch based on 6.8-rc1 (once it is out) + these 6 patches and then send
a pull-request for this. Can I have your Ack for the i2c-i801 changes in
patch 2/6?

I think you'll like the changes there since they only remove code
on the i2c-i801.c side :)

Changes in v2:
- Drop "[PATCH 1/6] platform/x86: dell-smo8800: Only load on Dell laptops"
- Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
- Add a comment documenting the IDF PCI device ids
- Keep using drivers/misc/lis3lv02d/lis3lv02d.c by default
- Rename the module-parameter to use_iio_driver which can be set to
  use the IIO st_accel driver instead
- Add a new patch adding the accelerometer address for the 2 models
  I have tested this on to dell_lis3lv02d_devices[]

Regards,

Hans


Hans de Goede (6):
  platform/x86: dell-smo8800: Change probe() ordering a bit
  platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
    from i2c-i801 to dell-smo8800
  platform/x86: dell-smo8800: Pass the IRQ to the lis3lv02d i2c_client
  platform/x86: dell-smo8800: Allow using the IIO st_accel driver
  platform/x86: dell-smo8800: Add support for probing for the
    accelerometer i2c address
  platform/x86: dell-smo8800: Add a couple more models to
    dell_lis3lv02d_devices[]

 drivers/i2c/busses/i2c-i801.c            | 122 --------
 drivers/platform/x86/dell/dell-smo8800.c | 341 +++++++++++++++++++++--
 2 files changed, 319 insertions(+), 144 deletions(-)

-- 
2.43.0


