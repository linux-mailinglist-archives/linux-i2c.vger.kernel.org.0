Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7B8071F88A
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jun 2023 04:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjFBCk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 22:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbjFBCk2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 22:40:28 -0400
X-Greylist: delayed 2384 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Jun 2023 19:40:26 PDT
Received: from 14.mo582.mail-out.ovh.net (14.mo582.mail-out.ovh.net [46.105.56.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFD818D
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 19:40:26 -0700 (PDT)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.138.54])
        by mo582.mail-out.ovh.net (Postfix) with ESMTP id 1F125265AD
        for <linux-i2c@vger.kernel.org>; Fri,  2 Jun 2023 01:21:28 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bfv4l (unknown [10.110.171.66])
        by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 819151FD29;
        Fri,  2 Jun 2023 01:21:27 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
        by ghost-submission-6684bf9d7b-bfv4l with ESMTPSA
        id 2v2iGxdEeWTvfgAAGiRBww
        (envelope-from <andi@etezian.org>); Fri, 02 Jun 2023 01:21:27 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-107S0012fe09296-2dee-4931-85f9-54a50bae429e,
                    4713972021F309B5AB1BC406E8630D37EAE49029) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.216
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2] MAINTAINERS: Add myself as I2C host drivers maintainer
Date:   Fri,  2 Jun 2023 03:21:00 +0200
Message-Id: <20230602012100.1096488-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601190427.21388-1-andi.shyti@kernel.org>
References: <20230601190427.21388-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4906671797058079303
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelvddggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepkeejgfelledvudegvdeludfhfeettdevtefgiedugeekuddtueekjedtjeelvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpohiilhgrsghsrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeekrddvfeekrddujedvrddvudeipdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I will help Wolfram out with the i2c controllers patches.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Hi,

in this v2 just changing the status from Odd Fixes to Maintained.
I forgot to set it before.

Andi

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 74aeae10a1516..a3ceec0007832 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9732,8 +9732,9 @@ F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
 
 I2C SUBSYSTEM HOST DRIVERS
+M:	Andi Shyti <andi.shyti@kernel.org>
 L:	linux-i2c@vger.kernel.org
-S:	Odd Fixes
+S:	Maintained
 W:	https://i2c.wiki.kernel.org/
 Q:	https://patchwork.ozlabs.org/project/linux-i2c/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
-- 
2.40.1

