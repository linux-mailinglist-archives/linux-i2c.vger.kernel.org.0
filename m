Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2BD654D37A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 23:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349696AbiFOVQl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 17:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346840AbiFOVQk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 17:16:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715995536F;
        Wed, 15 Jun 2022 14:16:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 020D36167F;
        Wed, 15 Jun 2022 21:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80540C3411A;
        Wed, 15 Jun 2022 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655327799;
        bh=/Vj4u9n3ZRCHUvVHrFcwD14SDzRSCTu97ChaXCYKhCE=;
        h=From:To:Cc:Subject:Date:From;
        b=PjOtNa/y21qVgvjZJgugqaxxtYulaufs4P2c3oN/jdihIVqSoaP9Cnyy04ferkxEJ
         ukkbdgDy4svo6MlGOeDtGgDtHRhN0vINX1xfDI6uihfRGmwLNICO3R653AunDz4X5r
         iUWwkDhAdPeFO7tLMQcA+e5oiZ5a1wBvvUsbCE72k4nJg0Hmo8EnehofWpFkeBN8HS
         znLYJlN4b0KFi6BSv7NKNq0dVSJ1NVrcANEgUw1Ot4OyR+bP3agLg6EGNqXk2N20eW
         k191qxPCZP4W74jEGIm7QLt138zg8iJn2Goxh+Xw3Mc0atguIsSI7mTw7+6shqAw1p
         0Cv/I4JLRzlzw==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-hwmon@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH] dt-bindings: hwmon: move ibm,p8-occ bindings to proper folder
Date:   Wed, 15 Jun 2022 23:16:19 +0200
Message-Id: <20220615211619.6742-1-wsa@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It accidently ended up in i2c, but it should be in the hwmon folder.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 .../devicetree/bindings/{i2c => hwmon}/ibm,p8-occ-hwmon.txt       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{i2c => hwmon}/ibm,p8-occ-hwmon.txt (100%)

diff --git a/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt b/Documentation/devicetree/bindings/hwmon/ibm,p8-occ-hwmon.txt
similarity index 100%
rename from Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
rename to Documentation/devicetree/bindings/hwmon/ibm,p8-occ-hwmon.txt
-- 
2.35.1

