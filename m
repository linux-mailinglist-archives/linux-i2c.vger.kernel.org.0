Return-Path: <linux-i2c+bounces-913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85581A405
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 17:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F71CB25ED4
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 16:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF14643B;
	Wed, 20 Dec 2023 16:10:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62A3FB33;
	Wed, 20 Dec 2023 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.molgen.mpg.de (g40.guest.molgen.mpg.de [141.14.220.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 753F161E5FE01;
	Wed, 20 Dec 2023 17:10:14 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] =?UTF-8?q?i2c:=20i801:=20Add=200x29=20as=20I=C2=B2C?= =?UTF-8?q?=20address=20for=20lis3lv02d=20in=20Dell=20Precision=203540?=
Date: Wed, 20 Dec 2023 17:10:01 +0100
Message-ID: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Dell Precision 3540/0M14W7, BIOS 1.7.4 05/12/2020, Linux prints
the warning below.

    i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration

With the help of Wolfram Sang, the test to probe it on I²C bus 6 at address
0x29 was successful.

    $ cd /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4
    $ ls -d i2c-?
    i2c-6
    $ sudo i2cdetect 6
    WARNING! This program can confuse your I2C bus, cause data loss and worse!
    I will probe file /dev/i2c-6.
    I will probe address range 0x08-0x77.
    Continue? [Y/n] Y
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         08 -- -- -- -- -- -- --
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- --
    30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
    40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
    50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    70: -- -- -- -- -- -- -- --

    $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-6/new_device
    $ sudo dmesg
    […]
    [ 2110.787000] i2c i2c-6: new_device: Instantiated device lis3lv02d at 0x29
    [ 2110.791932] lis3lv02d_i2c 6-0029: supply Vdd not found, using dummy regulator
    [ 2110.791981] lis3lv02d_i2c 6-0029: supply Vdd_IO not found, using dummy regulator
    [ 2110.809233] lis3lv02d: 8 bits 3DC sensor found
    [ 2110.900668] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input23

So, the device has that accelerometer. Add the I2C address to the
mapping list.

Link: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de/
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 070999139c6d..cb9660f84117 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1230,6 +1230,7 @@ static const struct {
 	 * Additional individual entries were added after verification.
 	 */
 	{ "Latitude 5480",      0x29 },
+	{ "Precision 3540",     0x29 },
 	{ "Vostro V131",        0x1d },
 	{ "Vostro 5568",        0x29 },
 };
-- 
2.43.0


