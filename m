Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D70DE2E294
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 18:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfE2Qyj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 12:54:39 -0400
Received: from gateway22.websitewelcome.com ([192.185.47.79]:13280 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726140AbfE2Qyj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 May 2019 12:54:39 -0400
X-Greylist: delayed 1425 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 May 2019 12:54:39 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id E38D6397A
        for <linux-i2c@vger.kernel.org>; Wed, 29 May 2019 11:30:53 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id W1TZhkeN32PzOW1TZh6u7O; Wed, 29 May 2019 11:30:53 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=50828 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hW1TY-001z7k-O5; Wed, 29 May 2019 11:30:52 -0500
Date:   Wed, 29 May 2019 11:30:52 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] eeprom: at24: use struct_size() in devm_kzalloc()
Message-ID: <20190529163052.GA29158@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hW1TY-001z7k-O5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:50828
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
    int stuff;
    struct boo entry[];
};

size = sizeof(struct foo) + count * sizeof(struct boo);
instance = devm_kzalloc(dev, size, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = devm_kzalloc(dev, struct_size(instance, entry, count), GFP_KERNEL);

Notice that, in this case, variable at24_size is not necessary, hence it
is removed.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/misc/eeprom/at24.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index ba8e73812644..78ba6b1917a8 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -568,7 +568,6 @@ static int at24_probe(struct i2c_client *client)
 	unsigned int i, num_addresses;
 	struct at24_data *at24;
 	struct regmap *regmap;
-	size_t at24_size;
 	bool writable;
 	u8 test_byte;
 	int err;
@@ -652,8 +651,8 @@ static int at24_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	at24_size = sizeof(*at24) + num_addresses * sizeof(struct at24_client);
-	at24 = devm_kzalloc(dev, at24_size, GFP_KERNEL);
+	at24 = devm_kzalloc(dev, struct_size(at24, client, num_addresses),
+			    GFP_KERNEL);
 	if (!at24)
 		return -ENOMEM;
 
-- 
2.21.0

