Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEBF101EC8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 09:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfKSI4u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 03:56:50 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45027 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfKSI4t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Nov 2019 03:56:49 -0500
Received: by mail-ot1-f68.google.com with SMTP id c19so17161934otr.11;
        Tue, 19 Nov 2019 00:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3Iq2A2za3LRkXVrjN2ctAH16mhQC1NN0zdxdgyGUSpw=;
        b=QVZqXxIujhcRQBmxlGsAODnAZDBV/wZb3e2f4GxyKxkEsDr3msrq42Zo5s1MIITgwa
         exjNuLeI5Zz3dBgda+AND+YoFEIbZOw2yVZmofV6tf1YgKrEQFynNXJte1AeKUTy+QYk
         NpkVjqt0bih3OO689TFWKOz+X/qn3qeImyPbsanweNjSyCUbMTuoC75ZdfCHBG5IopEI
         2ukbA1y0LMEi6FyePT+MEQB8xHjFnyr7P3GU6tXRPCmYAbhbTiPm+Na2DNJwPFgBTqfG
         m1ybl7PDAk67o/DzSKhDUDDUmB6P+6pERReituXTrFWWLrjp5+hZ+G+M9G+evSyfnKS8
         XFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3Iq2A2za3LRkXVrjN2ctAH16mhQC1NN0zdxdgyGUSpw=;
        b=FSlBRpiG2Eh8tr5nylRYLBJE9ki0oiHS/LvMaL59RBBtm9w7WImom20Kx2Rb4FCLOj
         TbbkXdBphRfRaSKSL6E0mthw5YssqWBwT/LWloF0CiwzAr0n9SshuckeD8QYJM2exaR1
         t+egm4ee+xu6sUYAmsDZ5I9dQvhO4mXesFzMOiyYv0X5kHcM3npKqTxzYJmqy4LLsnyc
         b8shxVKZvt72FRQ0CDt3Ajmp5ELz7ZDOj0UgJH4qWV3t22JZ9n7kTB9rMHeNCdLYB9hg
         Hvly8bhAUYM8M+LvVQvuEL59ju9/skuoPzKQnMV2R1ReAKub2MV/heeJ13ibk2vUs/H5
         dXUA==
X-Gm-Message-State: APjAAAXUVhcRSY1Bpz24NByqhdSdihbKVL7m/1k4h/9zSfOgeljK7O4H
        GAebKB7YJGKuTBXAs9acUFI=
X-Google-Smtp-Source: APXvYqzHUGh6OUnm8C32TSJ8dlR7JWh+4KF65K4wPyfLARH9bbwT+qssv8cUFzERJITVIn4G/0L9ag==
X-Received: by 2002:a9d:6f87:: with SMTP id h7mr2918368otq.216.1574153808967;
        Tue, 19 Nov 2019 00:56:48 -0800 (PST)
Received: from localhost ([32.97.110.55])
        by smtp.gmail.com with ESMTPSA id k9sm6955406oik.18.2019.11.19.00.56.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 00:56:48 -0800 (PST)
From:   Lei YU <mine260309@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lei YU <mine260309@gmail.com>
Subject: [PATCH] docs: i2c: Fix return value of i2c_smbus_xxx functions
Date:   Tue, 19 Nov 2019 16:56:18 +0800
Message-Id: <1574153778-59977-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In i2c/dev-interface.rst it said

> All these transactions return -1 on failure

But actually the i2c_smbus_xxx functions return negative error numbers
on failure, instead of -1.

Fix the document.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 Documentation/i2c/dev-interface.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index 69c23a3..73b77c3 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -163,8 +163,8 @@ for details) through the following functions::
   __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
                                    __u8 *values);
 
-All these transactions return -1 on failure; you can read errno to see
-what happened. The 'write' transactions return 0 on success; the
+All these transactions return negative value on failure; you can read errno to
+see what happened. The 'write' transactions return 0 on success; the
 'read' transactions return the read value, except for read_block, which
 returns the number of values read. The block buffers need not be longer
 than 32 bytes.
-- 
2.7.4

