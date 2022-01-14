Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CA948EB15
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 14:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241436AbiANNtQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 08:49:16 -0500
Received: from foss.arm.com ([217.140.110.172]:33622 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236966AbiANNtP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jan 2022 08:49:15 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91938101E;
        Fri, 14 Jan 2022 05:49:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D4A03F774;
        Fri, 14 Jan 2022 05:49:15 -0800 (PST)
From:   Ross Burton <ross.burton@arm.com>
To:     linux-i2c@vger.kernel.org
Cc:     jdelvare@suse.de
Subject: [PATCH] py-smbus/setup.py: use setuptools instead of distutils
Date:   Fri, 14 Jan 2022 13:49:10 +0000
Message-Id: <20220114134910.3994688-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As per [1], distutils is deprecated in Python 3.10 and will be removed
entirely in Python 3.12.

As setuptools is essentially an enhanced version of distutils, it's
trivial to port to that.

[1] https://docs.python.org/3/whatsnew/3.10.html#distutils-deprecated

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 py-smbus/setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/py-smbus/setup.py b/py-smbus/setup.py
index 28a4500..26db33a 100644
--- a/py-smbus/setup.py
+++ b/py-smbus/setup.py
@@ -1,6 +1,6 @@
 #!/usr/bin/env python
 
-from distutils.core import setup, Extension
+from setuptools import setup, Extension
 
 setup(	name="smbus",
 	version="1.1",
-- 
2.25.1

