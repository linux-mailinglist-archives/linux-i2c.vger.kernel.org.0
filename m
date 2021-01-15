Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5422F77DF
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jan 2021 12:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbhAOLoR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jan 2021 06:44:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:49406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbhAOLoR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 Jan 2021 06:44:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17D9623358;
        Fri, 15 Jan 2021 11:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610711016;
        bh=Hj1xrGgXnothbShfmnv3YV5GqPhtoi+Xda1pWAl34nM=;
        h=From:To:Cc:Subject:Date:From;
        b=q8+QBIC96lHsnW1PybDTN45ey792Ti4sow9QS3YlpQUTPvbzt+79uXXMvW68BjA14
         zLbfS/y5it2trNgCxLjryR1O/Abiw0k03L4cPAmRA0rFAY9ybC3LItg/WPwORRpu6z
         aa2knOBZ59oeEKC5gieSe4puNtcbK3xPjwicULvv+DavnW3Z/Na6+8CyiEPv/xxQjm
         cYHWQ9C5p+gRxoDgWkr5xbST/MAOzmXCA+GTBal4C8Ki8CzQzpC5Mp9XkBS/AyFAp5
         JzNC/3+NiC0KgpwlJFdBgD/+08z7Cb3H6iCfyU35Le4MEuo2lJoKKQpqARCKjzLJCG
         R8BJ/Y1+/3ClA==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH i2c-tools] remove 'eepromer' subdir
Date:   Fri, 15 Jan 2021 12:43:21 +0100
Message-Id: <20210115114321.394262-1-wsa@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

These tools are deprecated for 6 years now because we have better
alternatives. They are not built by default. I think it is time we can
remove them.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Jean, if you agree, I'll simply push this to the repo. This is why I
sent the reduced patch here.

 eepromer/.gitignore      |   2 -
 eepromer/Makefile        |  12 -
 eepromer/README          |  34 --
 eepromer/README.eeprom   |  87 -----
 eepromer/README.eepromer |  29 --
 eepromer/eeprom.8        |  64 ----
 eepromer/eeprom.c        | 299 ----------------
 eepromer/eepromer.8      |  61 ----
 eepromer/eepromer.c      | 723 ---------------------------------------
 9 files changed, 1311 deletions(-)
 delete mode 100644 eepromer/.gitignore
 delete mode 100644 eepromer/Makefile
 delete mode 100644 eepromer/README
 delete mode 100644 eepromer/README.eeprom
 delete mode 100644 eepromer/README.eepromer
 delete mode 100644 eepromer/eeprom.8
 delete mode 100644 eepromer/eeprom.c
 delete mode 100644 eepromer/eepromer.8
 delete mode 100644 eepromer/eepromer.c

diff --git a/eepromer/.gitignore b/eepromer/.gitignore
deleted file mode 100644
index 5f76592..0000000
diff --git a/eepromer/Makefile b/eepromer/Makefile
deleted file mode 100644
index b7d38f4..0000000
diff --git a/eepromer/README b/eepromer/README
deleted file mode 100644
index 392c266..0000000
diff --git a/eepromer/README.eeprom b/eepromer/README.eeprom
deleted file mode 100644
index b465d07..0000000
diff --git a/eepromer/README.eepromer b/eepromer/README.eepromer
deleted file mode 100644
index 4f0648c..0000000
diff --git a/eepromer/eeprom.8 b/eepromer/eeprom.8
deleted file mode 100644
index 0489590..0000000
diff --git a/eepromer/eeprom.c b/eepromer/eeprom.c
deleted file mode 100644
index 78f5481..0000000
diff --git a/eepromer/eepromer.8 b/eepromer/eepromer.8
deleted file mode 100644
index c3f3239..0000000
diff --git a/eepromer/eepromer.c b/eepromer/eepromer.c
deleted file mode 100644
index 1536b15..0000000
-- 
2.28.0

