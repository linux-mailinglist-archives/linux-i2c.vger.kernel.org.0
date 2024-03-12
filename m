Return-Path: <linux-i2c+bounces-2339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22895879C44
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 20:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F6742839F8
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 19:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E353014263A;
	Tue, 12 Mar 2024 19:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hoehnp@gmx.de header.b="iSJSyajB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C62E85C;
	Tue, 12 Mar 2024 19:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710271968; cv=none; b=MerYO+W6W/gLjz5Ma7Mcfzhc/OIu2QP2PFSNMfVHgnD9UOydE2xi1GWaObq4PL67A6F4HVJ96sIBzZfLTmCHPtPLpfqtd758Mo3hZJ+yWBH4a/MHpxI/niJZjcoBUpY49ykNr/gjXZ3eXhLwbtOXn0YFYFa/qBnqxCndJ2jgV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710271968; c=relaxed/simple;
	bh=WHsFLYe3izAm3bdxyupw+0wOzYbmQP/tb380HfmcaaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m/CP41DCLJn3zUoBs0Y5A15rpEKrTGPVKJ9S9bHGsASUyfi+nm20DBKr2mgeLlZ7vZuWQT4+lJRXj0UT3xtMS9NB8g+4mdKpyGaT6sM13gCS8U02fulImxqLHDyUTiFYGiV0Mjk8ZgL9CnojGEybKv0c+eTyPEDFZP6s6GfRSU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hoehnp@gmx.de header.b=iSJSyajB; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1710271958; x=1710876758; i=hoehnp@gmx.de;
	bh=WHsFLYe3izAm3bdxyupw+0wOzYbmQP/tb380HfmcaaQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=iSJSyajBRiw9WXnTGQ2Tu0S1F6mfoEeGS/T1hIMxs7XYbN3JsjlLXj2/BcYKnQCg
	 t7IrFlGWCrmXH6bXsxr46MksHOoZp45FpHhdS6VquGEqMqnxlcf4vRQshvqT6YDy5
	 lkn5wjebxQVzeR4kuWuD9J9IQTkdOTDE9nAG9ds9fG9q6zp0klJeukNdrN2fB5wDo
	 Pg1DYu+DPMQH/HcUeO5X1xqxdVcj4OU2BUIbd5NnpvS9iPXFO6DL4bW5cYnLmQ7Yh
	 h54wFkHZ+ggcQ+Uw2xuaR4Rf/2Y+mSemAHQJhLpZyA/mpGyFiUiEjHpP2/Ur8EXGg
	 Ek9DEDGMl8M8hj/Nog==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from patrick-dell.lan ([31.18.168.131]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mjj8D-1r4yQn1N1P-00lDg8; Tue, 12
 Mar 2024 20:32:38 +0100
From: =?UTF-8?q?Patrick=20H=C3=B6hn?= <hoehnp@gmx.de>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	=?UTF-8?q?Patrick=20H=C3=B6hn?= <hoehnp@gmx.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: i801: Add lis3lv02d for Dell Precision M6800
Date: Tue, 12 Mar 2024 20:31:31 +0100
Message-ID: <20240312193132.26518-1-hoehnp@gmx.de>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wHut0w3UEgHaJn/ZKEMFpHb+Bff1z1Ll8Kr9oVZmLoj1RqcDPDh
 jqC6OmCgDJ/uu7HMN4xqIx31kjDnFMh9WoPWfSwC8z0rv9nUYAVhA17x06HCT/EYaavqXLf
 d8qivBLJ5U94WvDtM//vFSwdgGMT0lYN6tDZ2sYApBoxZOcFwkocJIZcq2aIPXqEfqT/Lhm
 EMvcDci1kAcYXRvgCCx/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Nj5kLxCHHaM=;DaBy0diapkw+edhrKBHaZeNj8o7
 3Bu2sWDwpHXG2CjMVgm0klacyj9N9tUR/48KZrUBoGc/YdWYzFvyR4K9uKWmvF72OqlVI9SJq
 1CUtQ6tUXZI+RJzcrvyNkD7FPleddJEn75Q6jzR5OXp7/1TUbZglhJQRLt6fO6E8i6BuAUJ5K
 In7tQyB5ta1bSAX0ULhs1E8Gvz7pLeBFdJptXIVX4jpeuLHnHUCANy4Pg9kbIs6Ont7yO3PX/
 tqTXqw1ClpQCPlWvgftL4hj/vhlQNyw3xzoSTG2M0eB+SzZkdnqhNUv+/7Almr7NffI3Of1zs
 WL0B3BdBS5Q0hXN02PVyX4wFsH9sN8dPRbQR6pP1qjQEI6rnXCf5kI4Cr/o4XdtJycTwH3A9G
 RWhzRW57Z28ZahFtm/wf6qJnYV7wqP++ahl7Nwr73lWNfbX+WG/WZLDrf6ZTSJo9ZJ7ivkmIv
 unsg8nsLBv6ZSXrfoLRc8SAj8iOeU/ahi0xJSL8K/Zy7MJ0o8voFLZVP10/B+j+OSiUAPeGpZ
 omeW2BJjtzS9zPTUBhLutx/n1BrfH/7tYFowuPhURVzhhSVLfm43H7G3njiX4zyZUCZTgNNjv
 QKFjat+ETUvFQnuJaIBFXx7e8VSjZtOTK+7cbCLfO65JcjBjqCm7SQ/1uLsJYrw2GFv70sRLi
 6FwIUyNKrf/SSTQxZbjv/74lpr2z0gXxalbuz7tkCz3jwXhWKJM5PkVySdRQcaK+EE1IkZ1mq
 PtZD4Yw/s1UHKoz156vqwLt7qUkAuF93nrlPtUr3HYH30q1QYA2Byyvd9aFH5/XzU216Li0Mw
 aZfKepXyLrEQCjc8D/FOdjcIxS4NfNp62Vgh7G7N09qTo=

On the Dell Precision M6800/OXD1M5, BIOS A26 06/13/2029, Linux prints the
warning below.

    i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus b=
ut its address is unknown, skipping registration

Following the same suggestions by Wolfram Sang as for the Dell Precision
3540 [1], the accelerometer can be successfully found on I2C bus 0 at
address 0x29.

    $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-0/new_device
    lis3lv02d 0x29
    $ dmesg | tail -5
    [1185.385204] lis3lv02d_i2c 0-0029: supply Vdd not found, using dummy =
regulator
    [1185.385235] lis3lv02d_i2c 0-0029: supply Vdd_IO not found, using dum=
my regulator
    [1185.399689] lis3lv02d: 8 bits 3DC sensor found
    [1185.449391] input: ST LIS3LV02DL Accelerometer as /devices/platform/=
lis3lv02d/input/input371
    [1185.449577] i2c i2c-0: new_device: Instantiated device lis3lv02d at =
0x29

So, the device has that accelerometer. Add the I2C address to the
mapping list, and test it successfully on the device.

[1]: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca826=
f@molgen.mpg.de/
Signed-off-by: Patrick H=C3=B6hn <hoehnp@gmx.de>
=2D--
 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 2c36b36d7d51..c1fee2c61da1 100644
=2D-- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1231,6 +1231,7 @@ static const struct {
 	 */
 	{ "Latitude 5480",      0x29 },
 	{ "Precision 3540",     0x29 },
+	{ "Precision M6800",    0x29 },
 	{ "Vostro V131",        0x1d },
 	{ "Vostro 5568",        0x29 },
 	{ "XPS 15 7590",        0x29 },
=2D-
2.43.2


