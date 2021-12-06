Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D27E46A352
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 18:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244232AbhLFRq2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 12:46:28 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:40945 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245015AbhLFRqI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 12:46:08 -0500
Received: by mail-ot1-f51.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so14593688otj.7;
        Mon, 06 Dec 2021 09:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AbndXfdUqpyPQteYDfKjE1VIDsx2qwSU9ZClP6riQdE=;
        b=TiQCCe1cLB5jtzfRpSFSbokw1GgX35Es3FE85sMF7bWcwOTgCgvbm5SB0NvZUDS3Q1
         Gt+sXM1XtTWNJRQMuMUNujBtXARJXOd6XgRzYa+8Mu+xIquPJeBPL4JvshfSxSS0Oz/b
         UPdyjVjQYXjEdvZHP//KlSvgDJDsrLAhgiVeyj7w9P/MuFiuUXlJOoc1dTkfnFUTbKIG
         XxT/WdbmGTER+7a1nQKbzf9hTv0xMk00jm5ZV5YuFjKTQhLgiyRLrPBatugu/siJdlXu
         NMB8s1MhyTTvXibkzNIWDnCtA02iAErO4yq8rhBrsaYWuIRQStvB6mMpfGga9V3+lBbb
         G2/g==
X-Gm-Message-State: AOAM533mYl8F3rAUUFhvo7pAkGRukk//5W0/VDU6iWlK2hB98iepxCAy
        RFP83TY5Yr+i0TUapUkDgQ==
X-Google-Smtp-Source: ABdhPJzRIALyGrYVn7vIW3KpfiJT2LlB6/qH5jyCFoTtpMhgKtFla0ts7XKqa5lxJaRE1k7QLXD+DA==
X-Received: by 2002:a05:6830:1bc3:: with SMTP id v3mr30400158ota.276.1638812559197;
        Mon, 06 Dec 2021 09:42:39 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id b17sm2494489ots.66.2021.12.06.09.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 09:42:38 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rayn Chen <rayn_chen@aspeedtech.com>
Cc:     devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: aspeed: Drop stray '#interrupt-cells'
Date:   Mon,  6 Dec 2021 11:42:37 -0600
Message-Id: <20211206174237.2298580-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

'#interrupt-cells' is not documented which causes a warning when
'unevaluatedProperties' is implemented. Unless the I2C controller is
also an interrupt controller, '#interrupt-cells' is not valid. This
doesn't appear to be the case from the driver, so just remove it from
the example.

Cc: Brendan Higgins <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Rayn Chen <rayn_chen@aspeedtech.com>
Cc: linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index ea643e6c3ef5..f597f73ccd87 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -63,7 +63,6 @@ examples:
     i2c0: i2c-bus@40 {
       #address-cells = <1>;
       #size-cells = <0>;
-      #interrupt-cells = <1>;
       compatible = "aspeed,ast2500-i2c-bus";
       reg = <0x40 0x40>;
       clocks = <&syscon ASPEED_CLK_APB>;
-- 
2.32.0

