Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1541B6B6693
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 14:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjCLNWP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 09:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjCLNWO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 09:22:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B50974A;
        Sun, 12 Mar 2023 06:21:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7DC360EBA;
        Sun, 12 Mar 2023 13:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9070C433EF;
        Sun, 12 Mar 2023 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678627191;
        bh=FqCJ2YcWNJ19nY3MTswZdQnYgovepeDjwKAJl8ifYG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ImlVBCqAA3koQAyaeTLiD70vTyDpyN2uEKpbLRl44nvbK43xDNAKd0gj+HWAew0yd
         9dOXwsPcgP4gaoXTnPFDN0pfdp4NljKTDZ08AQl9UdyE845IEeQswEuRlN4uj8RneG
         CgCh1/FFJQWMOMWtp2yBvosv9xLgrrPhk1Xw4cOiQ83H39nLCZ7yKghxjPavzJSJU5
         RamnaPfujM6I0lVQRCrSSgSZR0Isx5c1yoQbW8jDWohLhSIAsOfim/JXNspDtGyb2q
         RWpOehA7fiX8Sle5tak5RDzliCH8UmMyu1xW0qq/c5iZ4ZDACF+StNmomEcmDyFgoG
         3C/uGaXPZr/ew==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 1/2] dt-bindings: i2c: Add the clock stretching property
Date:   Sun, 12 Mar 2023 14:19:32 +0100
Message-Id: <20230312131933.248715-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312131933.248715-1-andi.shyti@kernel.org>
References: <20230312131933.248715-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C specification allows for the clock line to be held low
for a specified timeout to force the slave device into a 'wait'
mode. This feature is known as 'Clock stretching' and is
optional.

In the NXP I2C specification, clock stretching is described as
the process of pausing a transaction by holding the SCL line LOW.
The transaction can only continue when the line is released HIGH
again.[*] However, most target devices do not include an SCL
driver and are therefore unable to stretch the clock.

Add the following properties:

 - i2c-scl-clk-low-timeout-ms: This property specifies the
   duration, in milliseconds, for which the clock is kept low and
   a client needs to detect a forced waiting state.

 - i2c-scl-has-clk-low-timeout: This property specifies whether
    the I2C controller implements the clock stretching property.

It's important to note that this feature should not be confused
with the SMBUS clock timeout, which serves a similar function but
specifies a timeout of 25-35ms. The I2C specification does not
recommend any specific timeout.

[*] NXP, UM10204 - I2C-bus specification and user manual
    Rev. 7.0, 1 October 2021, chapter 3.1.9.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index fc3dd7ec0445..12c311f0e831 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -45,6 +45,15 @@ wants to support one of the below features, it should adapt these bindings.
 	Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
 	specification.
 
+- i2c-scl-clk-low-timeout-ms
+	Number of miliseconds the clock line needs to be pulled down in order
+	to force a waiting state.
+
+- i2c-scl-has-clk-low-timeout
+	Boolean value that indicates whether the controller implements the
+	feature of wait induction through SCL low, with the timeout being
+	implemented internally by the controller.
+
 - i2c-sda-falling-time-ns
 	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
 	specification.
-- 
2.39.2

