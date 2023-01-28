Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30BD567FA68
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jan 2023 20:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbjA1TVO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Jan 2023 14:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjA1TVN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Jan 2023 14:21:13 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AB76A7B;
        Sat, 28 Jan 2023 11:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=9X5fnKvj0J96e64hU3Ho9oSUCRavGnoZ2ETS0FJ7eDo=; b=GRZAr5fe/w7grCuqpdMDwTXCr/
        Pua73eDiTEomfDyV8/UvEy/uJU2ryL+2IPo0GMrxOjQRn14g1HjW6ZMKImN4kGvVu/rZQzsyAZTzU
        AWnCvUosKPcBxYSgN2R062F2DEmuuFZAhC7Njs8SdOCtfXTbxGlRkKcXXmWAa/7Uy9+8PNTgQ6qLd
        nzFiwWelZ7DQv3wIpG8SM5QZs69Xu2QsD/4HUznLcWDZhOXgAqD2FM3/WH/AEUyJrgs7Q4DaGoe0m
        OU9Sr5kguchKeOnPJIT9GZNaAm3uJ7jZnbjS08ptEeyaJK5MeibyZawSukyGdCeT8m5RF0gMa/Klh
        BCXLtNjg==;
Received: from [2601:1c2:d00:6a60::9526] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pLqlC-000a3B-1Y; Sat, 28 Jan 2023 19:21:10 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 11/35 v2] Documentation: i2c: correct spelling
Date:   Sat, 28 Jan 2023 11:21:09 -0800
Message-Id: <20230128192109.31127-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Correct spelling problems for Documentation/i2c/ as reported
by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
v2: add correction for "an other" -> "another"

 Documentation/i2c/gpio-fault-injection.rst |    2 +-
 Documentation/i2c/smbus-protocol.rst       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -- a/Documentation/i2c/gpio-fault-injection.rst b/Documentation/i2c/gpio-fault-injection.rst
--- a/Documentation/i2c/gpio-fault-injection.rst
+++ b/Documentation/i2c/gpio-fault-injection.rst
@@ -93,7 +93,7 @@ bus arbitration against another master i
 ------------------
 
 This file is write only and you need to write the duration of the arbitration
-intereference (in µs, maximum is 100ms). The calling process will then sleep
+interference (in µs, maximum is 100ms). The calling process will then sleep
 and wait for the next bus clock. The process is interruptible, though.
 
 Arbitration lost is achieved by waiting for SCL going down by the master under
diff -- a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -238,7 +238,7 @@ This is implemented in the following way
 * I2C bus drivers trigger SMBus Host Notify by a call to
   i2c_handle_smbus_host_notify().
 * I2C drivers for devices which can trigger SMBus Host Notify will have
-  client->irq assigned to a Host Notify IRQ if noone else specified an other.
+  client->irq assigned to a Host Notify IRQ if no one else specified another.
 
 There is currently no way to retrieve the data parameter from the client.
 
