Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0936C1022F3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 12:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbfKSLYH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 06:24:07 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44047 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfKSLYH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Nov 2019 06:24:07 -0500
Received: by mail-oi1-f194.google.com with SMTP id s71so18530041oih.11;
        Tue, 19 Nov 2019 03:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=foLbo4FhWsfvSxf6E0K1e5ebB32o3UrCOtNHya/IrFU=;
        b=KdIKO9pCf81iOhb7bziSDZWytYLg/7Po4rtluV5V4jZPHOtVcScftLcOfXCKmH9hcy
         iMbUFQsaj9u+5yJkNY2y/nnMBnbRT1++EQRUXhIzF/X+CYrmjzB3bEx2NInCAyJBKhlf
         zzMtRJphK6Qo1EyXFonxvpAUuc8SIfsASH95ByjN9kGHXh3BEqdkVGVU8D0oSIbZttgG
         pB0NhT/FTmYBiIgAK/S8dBsQ8T+dIZiKJbhiUic/kp3NJnrCEFa5F6ASIWS/bREVJuQZ
         KziSAd0sR+Uwl8rUI6qoKStGEUGr8ZdMfl0ihllDJ3CIWiEC7jOsAhgzsJ/pxPstlEKf
         1caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=foLbo4FhWsfvSxf6E0K1e5ebB32o3UrCOtNHya/IrFU=;
        b=B3igHOiZJWgv4LP2y5y8QBpeT40yLRtBA7ezDxPJbnDOOQDH3QTa8ihK908KTKbfEF
         CLubdEynEpirLrYbnw1qRNPz4lFsFV2SJAE52aiT7lCP01zUDSpwtjpxHrBnOcQOQRvo
         WLDwlUDdkMOm2YqSwqFYq3paJik76sH5B+gPm+MLhlT4RfXHIn9ZRxGJ8qEvS0cSjpr8
         y1ps/HHp8x2IyhI48SvERVwh6kfJ6/mp11kvDiFQVwpUgzxrsXVgDjfZWG2ps+wbXs7c
         jiVZxBUusyi0atj4UpkzsP/3RIHtyfYNtGRYqqSjB0WSm5zJNS6jhb4aGmZt8eddXoyE
         BAQg==
X-Gm-Message-State: APjAAAUVONWZlAScH+4LHdw4a4e8CxiQ/CsidIe1kDAITSlV+IzLS1IL
        exav3xcy0EtZs+lUSj3Sx6Q=
X-Google-Smtp-Source: APXvYqy9LYGPcfG3dRU1DjrF/nxmk8SfWJIb+IaREh9ZK5aIpPSj+d6p0SXalPFlTPkqcVO4bUJmBQ==
X-Received: by 2002:a05:6808:7c2:: with SMTP id f2mr3492525oij.139.1574162645962;
        Tue, 19 Nov 2019 03:24:05 -0800 (PST)
Received: from localhost ([32.97.110.52])
        by smtp.gmail.com with ESMTPSA id h39sm7370263oth.9.2019.11.19.03.24.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 03:24:05 -0800 (PST)
From:   Lei YU <mine260309@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lei YU <mine260309@gmail.com>
Subject: [PATCH v2] docs: i2c: Fix return value of i2c_smbus_xxx functions
Date:   Tue, 19 Nov 2019 19:23:52 +0800
Message-Id: <1574162632-65848-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In i2c/dev-interface.rst it said

> All these transactions return -1 on failure

But actually the i2c_smbus_xxx functions return negative error numbers
on failure, instead of -1.

Fix the document and remove the following sentence.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 Documentation/i2c/dev-interface.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index 69c23a3..f2f2b28 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -163,11 +163,10 @@ for details) through the following functions::
   __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
                                    __u8 *values);
 
-All these transactions return -1 on failure; you can read errno to see
-what happened. The 'write' transactions return 0 on success; the
-'read' transactions return the read value, except for read_block, which
-returns the number of values read. The block buffers need not be longer
-than 32 bytes.
+All these transactions return a negative error number on failure.
+The 'write' transactions return 0 on success; the 'read' transactions
+return the read value, except for read_block, which returns the number
+of values read. The block buffers need not be longer than 32 bytes.
 
 The above functions are made available by linking against the libi2c library,
 which is provided by the i2c-tools project.  See:
-- 
2.7.4

