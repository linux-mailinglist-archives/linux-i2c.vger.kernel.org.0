Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E8023F000
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 17:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgHGP1p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 11:27:45 -0400
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:36959 "EHLO
        4.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgHGP1o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 11:27:44 -0400
X-Greylist: delayed 82362 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Aug 2020 11:27:43 EDT
Received: from player691.ha.ovh.net (unknown [10.110.103.118])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id 51398171D1C
        for <linux-i2c@vger.kernel.org>; Fri,  7 Aug 2020 17:27:42 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player691.ha.ovh.net (Postfix) with ESMTPSA id C355E152D3C08;
        Fri,  7 Aug 2020 15:27:32 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-100R003698b6a68-6b76-4ff7-aa52-ad9ed4f119b7,
                    B1FDDFD4E508142116FDFB9194C63E8FBE397CFD) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH] arch/powerpc: use simple i2c probe function
Date:   Fri,  7 Aug 2020 17:27:13 +0200
Message-Id: <20200807152713.381588-1-steve@sk2.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8281275292837105073
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedvgdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepteegudfgleekieekteeggeetveefueefteeugfduieeitdfhhedtfeefkedvfeefnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c probe functions here don't use the id information provided in
their second argument, so the single-parameter i2c probe function
("probe_new") can be used instead.

This avoids scanning the identifier tables during probes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 arch/powerpc/platforms/44x/ppc476.c            | 5 ++---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index cba83eee685c..07f7e3ce67b5 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -86,8 +86,7 @@ static void __noreturn avr_reset_system(char *cmd)
 	avr_halt_system(AVR_PWRCTL_RESET);
 }
 
-static int avr_probe(struct i2c_client *client,
-			    const struct i2c_device_id *id)
+static int avr_probe(struct i2c_client *client)
 {
 	avr_i2c_client = client;
 	ppc_md.restart = avr_reset_system;
@@ -104,7 +103,7 @@ static struct i2c_driver avr_driver = {
 	.driver = {
 		.name = "akebono-avr",
 	},
-	.probe = avr_probe,
+	.probe_new = avr_probe,
 	.id_table = avr_id,
 };
 
diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 0967bdfb1691..409481016928 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -142,7 +142,7 @@ static int mcu_gpiochip_remove(struct mcu *mcu)
 	return 0;
 }
 
-static int mcu_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int mcu_probe(struct i2c_client *client)
 {
 	struct mcu *mcu;
 	int ret;
@@ -221,7 +221,7 @@ static struct i2c_driver mcu_driver = {
 		.name = "mcu-mpc8349emitx",
 		.of_match_table = mcu_of_match_table,
 	},
-	.probe = mcu_probe,
+	.probe_new = mcu_probe,
 	.remove	= mcu_remove,
 	.id_table = mcu_ids,
 };
-- 
2.25.4

