Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1955B392947
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 10:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbhE0IN4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 04:13:56 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:54278 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbhE0INz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 May 2021 04:13:55 -0400
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 May 2021 04:13:55 EDT
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E34F42190B
        for <linux-i2c@vger.kernel.org>; Thu, 27 May 2021 08:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622102824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=vbJE52BduG7aVa6MclSAhBK1BiIBjZC4Cuk5Sfma9iQ=;
        b=AaCb6crJSSsashnbv/ZSCdhZKJt/rE2kRXpYbQeGKf186gH1z3qwLrhRq6j++6s18B4U1Y
        UBeM5mwttpyJls8TLCFHVutuATiiOmhzPeVvBcf5fQ8FLH1UfDU1dY/9yHikCfVkZYm91h
        litUa0UBDccJSdpIuxbrzh21WNHBQRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622102824;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=vbJE52BduG7aVa6MclSAhBK1BiIBjZC4Cuk5Sfma9iQ=;
        b=5PS5WtneGOXU7HD+tUZf9NNs8HSUwjSbQXMmCUc/XqdlXdFFraUgCDKCZ9KS5i7vyo4o8s
        Im2ylEmi4jC1mYDg==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
        by imap.suse.de (Postfix) with ESMTPSA id C184011A98
        for <linux-i2c@vger.kernel.org>; Thu, 27 May 2021 08:07:04 +0000 (UTC)
Date:   Thu, 27 May 2021 10:07:03 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2cdetect: Sort the bus list by number
Message-ID: <20210527100703.71519bbe@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The bus list (option -l) will be easier to read once sorted, as
typically this will group the buses by driver.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Why did I not do that earlier... I don't know.

 tools/i2cbusses.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

--- i2c-tools.orig/tools/i2cbusses.c	2020-09-17 14:29:28.275299253 +0200
+++ i2c-tools/tools/i2cbusses.c	2021-05-27 10:00:04.864407042 +0200
@@ -129,6 +129,14 @@ static struct i2c_adap *more_adapters(st
 	return new_adapters;
 }
 
+static int sort_i2c_busses(const void *a, const void *b)
+{
+	const struct i2c_adap *adap1 = a;
+	const struct i2c_adap *adap2 = b;
+
+	return adap1->nr - adap2->nr;
+}
+
 struct i2c_adap *gather_i2c_busses(void)
 {
 	char s[120];
@@ -314,6 +322,9 @@ struct i2c_adap *gather_i2c_busses(void)
 	closedir(dir);
 
 done:
+	/* Sort by bus number for convenience */
+	qsort(adapters, count, sizeof(struct i2c_adap), sort_i2c_busses);
+
 	return adapters;
 }
 


-- 
Jean Delvare
SUSE L3 Support
