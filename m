Return-Path: <linux-i2c+bounces-914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A91381A412
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 17:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC5461C2316F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 16:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD22481A0;
	Wed, 20 Dec 2023 16:11:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3947F47;
	Wed, 20 Dec 2023 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.molgen.mpg.de (g40.guest.molgen.mpg.de [141.14.220.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 235EB61E5FE35;
	Wed, 20 Dec 2023 17:10:16 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] =?UTF-8?q?i2c:=20i801:=20Add=200x29=20as=20I=C2=B2C?= =?UTF-8?q?=20address=20for=20lis3lv02d=20in=20Dell=20XPS=2015=207590?=
Date: Wed, 20 Dec 2023 17:10:02 +0100
Message-ID: <20231220161003.68310-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
References: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Dell XPS 15 7590/0VYV0G, BIOS 1.24.0 09/11/2023, Linux prints the
warning below.

    i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration

Following the same suggestions by Wolfram Sang as for the Dell Precision
3540 [1], the accelerometer can be successfully found on I²C bus 2 at
address 0x29.

    $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-2/new_device
    lis3lv02d 0x29
    $ dmesg | tail -5
    [  549.522876] lis3lv02d_i2c 2-0029: supply Vdd not found, using dummy regulator
    [  549.522904] lis3lv02d_i2c 2-0029: supply Vdd_IO not found, using dummy regulator
    [  549.542486] lis3lv02d: 8 bits 3DC sensor found
    [  549.630022] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input35
    [  549.630586] i2c i2c-2: new_device: Instantiated device lis3lv02d at 0x29

So, the device has that accelerometer. Add the I²C address to the
mapping list, and test it successfully on the device.

[1]: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de/

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index cb9660f84117..3932e8d96a17 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1233,6 +1233,7 @@ static const struct {
 	{ "Precision 3540",     0x29 },
 	{ "Vostro V131",        0x1d },
 	{ "Vostro 5568",        0x29 },
+	{ "XPS 15 7590",        0x29 },
 };
 
 static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
-- 
2.43.0


