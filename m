Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C806D0D52
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 20:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbjC3SFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 14:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjC3SFK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 14:05:10 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B92EB5C;
        Thu, 30 Mar 2023 11:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=Rz2AoL7LGg/4iMrao4MT/5InmUnB9nRTmdXgr2Ab1Ok=; b=mV4JKDBX8Zx3bEA950oD0sKCsI
        sQiI0ieQR6IaQmH0EOsr8VOUNGPBd/BUNyMb5JgYM2bAknI5OXZ3UImDNSUuh+deZ8Y7WHKJ4YWqQ
        tYLsrYhC6VDcRjNZWLKDver+bYtlsWH1cpWC8M1f3i0TfPuweT36IYOAuXHHmBWwao98G4dRyFVjA
        7q/1zAW1GSwry/vI/ALiFgiqDK2MgSBIXBOc3TkMC33e5uF7ENPXPEaxcJZt2YbMIeGGYaQ280Ntd
        X8J8uJUm9Wx/T1AogZOzulPbd2HHzoTass8+b4Z9Y9XfnLBQ0E9VJ1pxexdTRPYqpZv8jYaiKL9Qz
        eSxUywAA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1phwe0-0003Lr-1L; Thu, 30 Mar 2023 20:05:04 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1phwdz-0004Kt-FU; Thu, 30 Mar 2023 20:05:03 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/2] dt-bindings: i2c: cadence: Document reset property
Date:   Thu, 30 Mar 2023 11:04:47 -0700
Message-Id: <20230330180448.269635-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26859/Thu Mar 30 09:24:22 2023)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Cadence I2C controller has an external reset that needs to be
de-asserted before the I2C controller can be accessed.

Document the `resets` devicetree property that can be used to describe how
the reset signal is connected.

While the reset signal will always be present in hardware the devicetree
property is kept optional for backwards compatibility with existing systems
that do not specify the reset property and where the reset signal might not
be controlled by operating system.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index 9187015d9702..76e2b9a10de8 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -24,6 +24,9 @@ properties:
   clocks:
     minItems: 1
 
+  resets:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
-- 
2.30.2

