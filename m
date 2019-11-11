Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E721F7278
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 11:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKKse (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 05:48:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47089 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726832AbfKKKse (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Nov 2019 05:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573469313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=YdIT962GCAwcSC7fh9K24svsozd9yyf+AStxNGzz8/A=;
        b=DuFmbBUergyFajpewz3/YN29/EALp+o+S7UI9hkpf9wF6f6aQfBeM+V+3EZFuNDyVSUeAU
        iCSrGWFOodR6EW0e8Xi4ueB23ncYz1yTjtEGvNxhwp8a7p+lfspkzlA8YXt4VCBkHVLZ9S
        4YYays3yZHsGQNACTM18mrzlhH7SV9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-sm4QEhkBPvyrxkE1fso8HA-1; Mon, 11 Nov 2019 05:48:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A30A8017E0;
        Mon, 11 Nov 2019 10:48:31 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-121.ams2.redhat.com [10.36.117.121])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D216A5DD73;
        Mon, 11 Nov 2019 10:48:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, youling 257 <youling257@gmail.com>
Subject: [PATCH] i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is present
Date:   Mon, 11 Nov 2019 11:48:27 +0100
Message-Id: <20191111104827.3713-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: sm4QEhkBPvyrxkE1fso8HA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Many cheap devices use Silead touchscreen controllers. Testing has shown
repeatedly that these touchscreen controllers work fine at 400KHz, but for
unknown reasons do not work properly at 100KHz. This has been seen on
both ARM and x86 devices using totally different i2c controllers.

On some devices the ACPI tables list another device at the same I2C-bus
as only being capable of 100KHz, testing has shown that these other
devices work fine at 400KHz (as can be expected of any recent I2C hw).

This commit makes i2c_acpi_find_bus_speed() always return 400KHz if a
Silead touchscreen controller is present, fixing the touchscreen not
working on devices which ACPI tables' wrongly list another device on the
same bus as only being capable of 100KHz.

Specifically this fixes the touchscreen on the Jumper EZpad 6 m4 not
working.

Reported-and-tested-by: youling 257 <youling257@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/i2c-core-acpi.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 9cb2aa1e20ef..420c356eba06 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -39,6 +39,7 @@ struct i2c_acpi_lookup {
 =09int index;
 =09u32 speed;
 =09u32 min_speed;
+=09u32 force_speed;
 };
=20
 /**
@@ -285,6 +286,19 @@ i2c_acpi_match_device(const struct acpi_device_id *mat=
ches,
 =09return acpi_match_device(matches, &client->dev);
 }
=20
+static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] =3D =
{
+=09/*
+=09 * These Silead touchscreen controllers only work at 400KHz, for
+=09 * some reason they do not work at 100KHz. On some devices the ACPI
+=09 * tables list another device at their bus as only being capable
+=09 * of 100KHz, testing has shown that these other devices work fine
+=09 * at 400KHz (as can be expected of any recent i2c hw) so we force
+=09 * the speed of the bus to 400 KHz if a Silead device is present.
+=09 */
+=09{ "MSSL1680", 0 },
+=09{}
+};
+
 static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 =09=09=09=09=09   void *data, void **return_value)
 {
@@ -303,6 +317,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle ha=
ndle, u32 level,
 =09if (lookup->speed <=3D lookup->min_speed)
 =09=09lookup->min_speed =3D lookup->speed;
=20
+=09if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) =3D=
=3D 0)
+=09=09lookup->force_speed =3D 400000;
+
 =09return AE_OK;
 }
=20
@@ -340,7 +357,12 @@ u32 i2c_acpi_find_bus_speed(struct device *dev)
 =09=09return 0;
 =09}
=20
-=09return lookup.min_speed !=3D UINT_MAX ? lookup.min_speed : 0;
+=09if (lookup.force_speed)
+=09=09return lookup.force_speed;
+=09else if (lookup.min_speed !=3D UINT_MAX)
+=09=09return lookup.min_speed;
+=09else
+=09=09return 0;
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_find_bus_speed);
=20
--=20
2.23.0

