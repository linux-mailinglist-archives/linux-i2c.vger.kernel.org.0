Return-Path: <linux-i2c+bounces-983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DE081DC8E
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D181281D5B
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 21:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28515EEDC;
	Sun, 24 Dec 2023 21:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="egFk+l+5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05FEAFD
	for <linux-i2c@vger.kernel.org>; Sun, 24 Dec 2023 21:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703453807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YHH+dYFiAZRBdYkQReDHV20DrDgbD63aPu4W4Tm4x5M=;
	b=egFk+l+5EJiGr18/13JjlU5IWtOVrS0iorsumY18P7XYGCJFr/uxggzyr4Mn72ut70rEPX
	xK8O62SNR4gjYKbph+cyFteuHCnpju5hfsE+s0Z3VE1aAkSD0ZcxpgI38T2xgEWCbl7jGk
	ZNLqGmxJn3Oh/Jh+2Td0YOPLUBKxoLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-QL1ZsS3WNUaz8INWDZ0K6w-1; Sun, 24 Dec 2023 16:36:42 -0500
X-MC-Unique: QL1ZsS3WNUaz8INWDZ0K6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7E80832D60;
	Sun, 24 Dec 2023 21:36:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22F5F2026D66;
	Sun, 24 Dec 2023 21:36:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 0/6] i2c-i801 / dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Date: Sun, 24 Dec 2023 22:36:16 +0100
Message-ID: <20231224213629.395741-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Hi All,

Here is a patch series which implements my suggestions from:
https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
to improve the lis3lv02d accel support on Dell laptops.

Jean, Andi the actual move is in patch 3/6 after some small prep patches
on the dell-smo8800 side. My plan for merging this is to create
an immutable branch based on 6.8-rc1 (once it is out) + these 6 patches and
then send a pull-request for this. Can I have your Ack for the i2c-i801
changes in patch 3/6? I think you'll like the changes there since they only
remove code :)

Regards,

Hans


Hans de Goede (6):
  platform/x86: dell-smo8800: Only load on Dell laptops
  platform/x86: dell-smo8800: Change probe() ordering a bit
  platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
    from i2c-i801 to dell-smo8800
  platform/x86: dell-smo8800: Pass the IRQ to the lis3lv02d i2c_client
  platform/x86: dell-smo8800: Instantiate an i2c_client for the IIO
    st_accel driver
  platform/x86: dell-smo8800: Add support for probing for the
    accelerometer i2c address

 drivers/i2c/busses/i2c-i801.c            | 122 --------
 drivers/platform/x86/dell/dell-smo8800.c | 337 +++++++++++++++++++++--
 2 files changed, 316 insertions(+), 143 deletions(-)

-- 
2.43.0


