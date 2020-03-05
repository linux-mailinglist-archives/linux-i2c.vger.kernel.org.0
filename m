Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31DC717A79D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 15:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgCEOgZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 09:36:25 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53578 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgCEOgY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Mar 2020 09:36:24 -0500
Received: by mail-wm1-f68.google.com with SMTP id g134so6572421wme.3;
        Thu, 05 Mar 2020 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ByZXWnJHqaW7QVpVISE1TPiyXWuEjtw6nBQAA8Pn/yI=;
        b=XcG4pFklevBZFiwQ6VxGoiuKj8EdOdh9pLAwZKRrUmgBTtXJbaREGmq0Omyy5TxaWx
         PBnDljF54O+cSB+tlHQskFAqnvwwKOmRIsulOPwUCG/k11jSzC2yrI71R3FcKCYHQEdI
         XqQoCiVfCsJUB9fZZ1cBHvtXaDPgywJl/aUo0/iJsjWMsXUbVD9AmmHOBK5wuIGTTuti
         3WojWYi8OOcBOtmfbM/hYuDhwlYvd8kEcxIdIMSeeadS7ikx1dL7DgxRKghwolx0MqiT
         r0XVg7/vWEXA4BUHG2rOU04BHOFWNQY1RmGlAPL6ixmYj9JpPEhSkTOiEIGY4PuzWK/A
         ZJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ByZXWnJHqaW7QVpVISE1TPiyXWuEjtw6nBQAA8Pn/yI=;
        b=P7A5tZ7XMXRpWjKyHyRzzsCoKcZfjPxLUHSQL1t8ctT/S2l2LAklmgSH8nyxldmf2o
         swd11v3a1HR36ccvaxO3M8RsFTOqoY12U+BNE1fMQvWIkUskoc6iH5iw5pfM6IC9rnhJ
         LEN00+lsbOb0JBAIU5T6wiNSj8mDviY4A99WpDmhl2ZfeL41x+sO97rv2phzBGVAG2Nh
         XdTm2OAl61huIRBKCJq4lLOlcYtlK1zx6raBMUT7HJhZvxb+lvRf1QXC7wfVBagwrI/X
         AnHMWBcJUuAX/mx3RnorM+jcu1ZntDcAEnmMDCM7Yz2JhLuGiMVmVfBvmBYAnNkjCegZ
         NxHg==
X-Gm-Message-State: ANhLgQ1EAT5qqU+uLoXuzAENtcsyy25lcLTIRoPxjSVWQLdCM9909LWw
        ViCwHsXcZ3oW6NOfqiTsSVq6hkWr
X-Google-Smtp-Source: ADFU+vu5AhrM5tdRcpL7UhKvY/QyM1wRgxmPaDdySYrsRaXKPbUJz5eJJdKvYOS9N2HnrUL9zq5Q6Q==
X-Received: by 2002:a1c:df45:: with SMTP id w66mr9866981wmg.171.1583418983047;
        Thu, 05 Mar 2020 06:36:23 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g201sm9365124wme.23.2020.03.05.06.36.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 06:36:22 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] dt-bindings: i2c: i2c-rk3x: add description for rk3368
Date:   Thu,  5 Mar 2020 15:36:09 +0100
Message-Id: <20200305143611.10733-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200305143611.10733-1-jbx6244@gmail.com>
References: <20200305143611.10733-1-jbx6244@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The description below is already in use for rk3368.dtsi,
but was somehow never added to a document, so add
"rockchip,rk3368-i2c", "rockchip,rk3288-i2c"
for i2c nodes on a rk3368 platform to i2c-rk3x.yaml.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 0bba39998..67cdce8fb 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - enum:
             - rockchip,rk3036-i2c
+            - rockchip,rk3368-i2c
           - const: rockchip,rk3288-i2c
       - items:
           - enum:
-- 
2.11.0

