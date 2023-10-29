Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19F2F7DADF6
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 20:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjJ2Tl7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 15:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJ2Tl7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 15:41:59 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78F39B
        for <linux-i2c@vger.kernel.org>; Sun, 29 Oct 2023 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=LD5O2IAfdD+Yr5
        4vXUyuQYqnYv5r+rMuDe76FqaDQBQ=; b=g363FmIK5lLbFCaHcaXanA/JeXa07r
        wevHqTpsBpmWJCz4jrrq0At2xH5KOyXrGDrbU+ftM4uwP4cMZbQ3HeTOWOq0Istd
        hXO6tLH+hT3uHYgNOJ1gGrY0Yc7XqvRVRlteKimOWBKsK0VcNf9OEbbcJ04TCvfC
        7p2DytQ+canICv53uZku+ZUF9zgf1zUbtqmDUX8zw16uRTkeL7rbQ1BRivvfIUj6
        3RlRjhIm4CyBMh9KyLXJfcugOUFJL28k0rVpsfKKVYdIeC79BgMrD+MkYsayvHc+
        gwM2tNujwIZAVatD6PXEUDrEUDaFveinli9kd6j0F7uS2UbIyG4axljg==
Received: (qmail 3891171 invoked from network); 29 Oct 2023 20:41:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Oct 2023 20:41:55 +0100
X-UD-Smtp-Session: l3s3148p1@mNwjHeAIyOxehhre
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] Documentation: i2c: add fault code for not supporting 10 bit addresses
Date:   Sun, 29 Oct 2023 20:41:43 +0100
Message-Id: <20231029194143.22512-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the specific fault code when 10 bit addresses cannot be
supported. It is used for years, only the documentation slipped through
the cracks.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The original RFC was from late 2014...

 Documentation/i2c/fault-codes.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/i2c/fault-codes.rst b/Documentation/i2c/fault-codes.rst
index 80b14e718b52..b0864d1268bd 100644
--- a/Documentation/i2c/fault-codes.rst
+++ b/Documentation/i2c/fault-codes.rst
@@ -39,6 +39,10 @@ Also, codes returned by adapter probe methods follow rules which are
 specific to their host bus (such as PCI, or the platform bus).
 
 
+EAFNOSUPPORT
+	Returned by I2C adapters not supporting 10 bit addresses when
+	they are requested to use such an address.
+
 EAGAIN
 	Returned by I2C adapters when they lose arbitration in master
 	transmit mode:  some other master was transmitting different
-- 
2.35.1

