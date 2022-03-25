Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D554E7C1E
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 01:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbiCYVJs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 17:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiCYVJr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 17:09:47 -0400
X-Greylist: delayed 16201 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Mar 2022 14:08:12 PDT
Received: from 15.mo584.mail-out.ovh.net (15.mo584.mail-out.ovh.net [91.121.62.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974EA17ECDB
        for <linux-i2c@vger.kernel.org>; Fri, 25 Mar 2022 14:08:12 -0700 (PDT)
Received: from player695.ha.ovh.net (unknown [10.110.115.188])
        by mo584.mail-out.ovh.net (Postfix) with ESMTP id 31CE722182
        for <linux-i2c@vger.kernel.org>; Fri, 25 Mar 2022 16:19:27 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player695.ha.ovh.net (Postfix) with ESMTPSA id C9F4628AAD10E;
        Fri, 25 Mar 2022 16:19:23 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-102R004ceb7d065-e90c-401e-ab9e-18557b73c586,
                    1702D5D0C6B5DF16716081994498F990499A02DA) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH] docs: i2c: reference simple probes
Date:   Fri, 25 Mar 2022 17:19:10 +0100
Message-Id: <20220325161910.1202539-1-steve@sk2.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16973785521511499398
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeetgedugfelkeeikeetgeegteevfeeufeetuefgudeiiedthfehtdeffeekvdeffeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrheileehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of documenting old-style probes, reference "simple probes" and
document the i2c_match_id function. This might help reduce the use of
two-argument probes in new code.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/i2c/writing-clients.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index 978cc8210bf3..e3b126cf4a3b 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -46,7 +46,7 @@ driver model device node, and its I2C address.
 	},
 
 	.id_table	= foo_idtable,
-	.probe		= foo_probe,
+	.probe_new	= foo_probe,
 	.remove		= foo_remove,
 	/* if device autodetection is needed: */
 	.class		= I2C_CLASS_SOMETHING,
@@ -155,8 +155,7 @@ those devices, and a remove() method to unbind.
 
 ::
 
-	static int foo_probe(struct i2c_client *client,
-			     const struct i2c_device_id *id);
+	static int foo_probe(struct i2c_client *client);
 	static int foo_remove(struct i2c_client *client);
 
 Remember that the i2c_driver does not create those client handles.  The
@@ -165,8 +164,12 @@ handle may be used during foo_probe().  If foo_probe() reports success
 foo_remove() returns.  That binding model is used by most Linux drivers.
 
 The probe function is called when an entry in the id_table name field
-matches the device's name. It is passed the entry that was matched so
-the driver knows which one in the table matched.
+matches the device's name. If the probe function needs that entry, it
+can retrieve it using
+
+::
+
+	const struct i2c_device_id *id = i2c_match_id(foo_idtable, client);
 
 
 Device Creation
-- 
2.27.0

