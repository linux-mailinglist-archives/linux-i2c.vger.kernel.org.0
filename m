Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D542A7870
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 09:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgKEIAX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 03:00:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59355 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729490AbgKEIAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 03:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604563221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7jXlk9odBRKRYbgd27QDkTiXL3HhvfI1QYTHmgthYKc=;
        b=YNidzD89qL3V1lvK39o+sh0eJQoDaiFax5dKGtJtKTxXXLFFLmlzKunbSUjBZ5ugVEk19a
        CymYiT0BSWnWkF2yx0PjZ2n6a3E5Wn9bu7AlHnPvwgd4wcljoOfbJouQpFd2P+qSt75VXY
        wvK++iu109kdW/8XcmI7BqRN50PiOJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-E90e-SFuPBejwxB3nD_1uA-1; Thu, 05 Nov 2020 03:00:19 -0500
X-MC-Unique: E90e-SFuPBejwxB3nD_1uA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A95A1084CA6;
        Thu,  5 Nov 2020 08:00:17 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-73.ams2.redhat.com [10.36.113.73])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AC5C65DA76;
        Thu,  5 Nov 2020 08:00:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated i2c-clients
Date:   Thu,  5 Nov 2020 09:00:10 +0100
Message-Id: <20201105080014.45410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

As the subject says this series is mostly about passing the ACPI fwnode to
i2c-clients instantiated by the i2c-multi-instantiate code.

As discussed here:
https://bugzilla.kernel.org/show_bug.cgi?id=198671

BOSC0200 ACPI devices may sometimes describe 2 accelerometers in a single
ACPI device, while working on this I noticed that BOSC0200 ACPI nodes
contain ACCEL_MOUNT_MATRIX info (unlike all the other ACPI ids for bmc150
accelerometers). Which is why I wanted to pass the fwnode so that we
could use this info in the bmc150-accel driver.

The plan was to use i2c-multi-instantiate for this, but doing so will
change the modalias and /lib/udev/hwdb.d/60-sensor.hwdb matches on
the modalias for various quirks setting ACCEL_MOUNT_MATRIX. So then the
plan became to first add support for the mount-matrix provided inside
the BOSC0200 ACPI node, making the udev info unnecessary. But for at
least 1 model (and probably more) the BOSC0200 ACPI node and hwdb info
does not match and since the hwdb info is added by users of the actual
devices we can assume it is correct, so it seems that we cannot always
trust the ACPI provided info.  This is ok, the hwdb info overrides it
(iio-sensor-proxy prefers the udev provided mount-matrix over the
one provided by the driver) but this means that we MUST keep the
existing hwdb matches working, which means that we cannot use
i2c-multi-instantiate for this.

Instead I will dust of an old patch for this from Jeremy Cline:
https://patchwork.kernel.org/project/linux-iio/patch/010001602cf53153-39ad69f1-1b39-4e6d-a748-9455a16c2fbd-000000@email.amazonses.com/

Which deals with there being 2 accelerometers inside the bmc150-accel
driver.

But before coming to the conclusion that i2c-multi-instantiate
would not work I had already written this series. Since this might
be useful for some other case in the future I'm sending this out
as a RFC now, mostly so that it gets added to the archives.

Regards,

Hans

p.s.

The 4th patch is not related to the fwnode passing, but was also
necessary for the BOSC0200 case.

