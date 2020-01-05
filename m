Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13E130A7D
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jan 2020 23:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgAEWvj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 17:51:39 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:44712 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727189AbgAEWvi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 17:51:38 -0500
Received: from [37.160.42.38] (port=5507 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioEkB-00GSqI-BC; Sun, 05 Jan 2020 23:51:35 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 16/26] docs: i2c: smbus-protocol: fix kernel-doc function syntax
Date:   Sun,  5 Jan 2020 23:50:02 +0100
Message-Id: <20200105225012.11701-16-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200105225012.11701-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This clarifies these are functions (and would/will adds a hyperlink to the
function documentation if/when documented).

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/i2c/smbus-protocol.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 997945e90419..3c0fb3a2044d 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -118,7 +118,7 @@ byte. But this time, the data is a complete word (16 bits)::
 
 Functionality flag: I2C_FUNC_SMBUS_READ_WORD_DATA
 
-Note the convenience function i2c_smbus_read_word_swapped is
+Note the convenience function i2c_smbus_read_word_swapped() is
 available for reads where the two data bytes are the other way
 around (not SMBus compliant, but very popular.)
 
@@ -152,7 +152,7 @@ specified through the Comm byte.::
 
 Functionality flag: I2C_FUNC_SMBUS_WRITE_WORD_DATA
 
-Note the convenience function i2c_smbus_write_word_swapped is
+Note the convenience function i2c_smbus_write_word_swapped() is
 available for writes where the two data bytes are the other way
 around (not SMBus compliant, but very popular.)
 
-- 
2.24.1

