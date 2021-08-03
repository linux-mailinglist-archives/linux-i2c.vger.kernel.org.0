Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC3C3DF203
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Aug 2021 18:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhHCQBM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Aug 2021 12:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31497 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230362AbhHCQBL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Aug 2021 12:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628006460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=q9zI909jUmBKlCDhY1zjUy3yeKmNmxzBA19zg0e+vEg=;
        b=KnDKZfBQ8rs9XquH/LtjMOU9fi0ap8Di0PorB4NOozF7hX/pL/k2AFhRu8ITObo9Z55d2W
        sLzwugv251xaN35//T1XdQKdksueADpBvdcnRV7phu2DcGB26g5QbIzPsYpYMFKSCJ1r/p
        IvbxkftKH+F5CPvkCaWfgJQcomjIZ1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-ifHoCoGiPO6cHAfR4C6mvQ-1; Tue, 03 Aug 2021 12:00:49 -0400
X-MC-Unique: ifHoCoGiPO6cHAfR4C6mvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 865FE1009600;
        Tue,  3 Aug 2021 16:00:47 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.193.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AB53A60C05;
        Tue,  3 Aug 2021 16:00:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH 0/4] i2c/pdx86: Add an i2c_acpi_client_count() helper function
Date:   Tue,  3 Aug 2021 18:00:40 +0200
Message-Id: <20210803160044.158802-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

This patch-set adds a new i2c_acpi_client_count() helper function
to remove a bunch of code-duplication.

Since 3 of the 4 patches touch files under drivers/platform/x86 and
also since the drivers/platform/x86/dual_accel_detect.h file is new
in pdx86/for-next I believe that it would be best to just merge the
entire series through my pdx86 tree.

Mika + WSA, may I have your ack for merging the entire series through
the pdx86 tree (or please let me know if you want to proceed in a
different way) ?

Regards,

Hans


Hans de Goede (4):
  i2c: acpi: Add an i2c_acpi_client_count() helper function
  platform/x86: dual_accel_detect: Use the new i2c_acpi_client_count()
    helper
  platform/x86: i2c-multi-instantiate: Use the new
    i2c_acpi_client_count() helper
  platform/x86: intel_cht_int33fe: Use the new i2c_acpi_client_count()
    helper

 drivers/i2c/i2c-core-acpi.c                   | 32 +++++++++++++++++++
 drivers/platform/x86/dual_accel_detect.h      | 26 +--------------
 drivers/platform/x86/i2c-multi-instantiate.c  | 27 +---------------
 .../intel/int33fe/intel_cht_int33fe_common.c  | 29 +----------------
 include/linux/i2c.h                           |  5 +++
 5 files changed, 40 insertions(+), 79 deletions(-)

-- 
2.31.1

