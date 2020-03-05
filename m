Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E74D217A7A2
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 15:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgCEOg1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 09:36:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52237 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgCEOgZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Mar 2020 09:36:25 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so6591524wmc.2;
        Thu, 05 Mar 2020 06:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mCH9YHInPZQLUJIgoZ+Jrv9Nn/fRbaxSS8/HO6x7hpw=;
        b=GyZZk7OM0/i1zI5EJ7c+Jhk8G0o7+uPmKPSFGtBj3Bht2so53Qcl86r2AQyqVfbE+1
         0piRPnamkrxeS75tAvY2JEsK9NllAQk9Q9GCwEP8L8/SJotWKXyCWUCadJUeeEqbtR/r
         5aowbLfbI0/Ugvnv84/t+Kp3uUAn1VdQqOjd/uWQ+4tF07vieos/zBjEYjE5hTT26hMt
         GhvZjzB4vyGDnXFJgdxNc/6d6Na9+j2iyr0iWT4Hc4zK+xhZMNVfJEnUxa95E6BUpkRe
         6K98RYFD5dhf0JWNbdP+dF4HfiuZ98zCXh1MMJ1JEAm9fBIrnknCs7MofNyIG/KHN+2q
         9ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mCH9YHInPZQLUJIgoZ+Jrv9Nn/fRbaxSS8/HO6x7hpw=;
        b=cgkV5vqsXxndL5ioqYlGIYPcgBY5Fkv8KfA8a+DGQnrYqahJFKmTGvZUUE8wj72+NJ
         vd175hHrEZRTJOSlQSvufub+W5Wq3q5oukncBo/uMdejuOn4UUqzyM4/L1PeVyZOlsD9
         qWZ9nK1l4rlO5YYzBExMYBU/TYJtDC6giu98fapqB9qpAhlDnNaQtu3ijx7UY0BSiu8u
         M/4p5Yy7XZHDXgFqVUGsCzHMa8RaseaZCZ62JC3N5HhezUGcLe0Ky6uehg9D2MojfRbH
         jWw8F6r6jmaRBLay2dslgkaRFj78PxFnMZOOIOLV0oE3hb6X5l2FDYEFq9XjM8bkZ0KL
         ooow==
X-Gm-Message-State: ANhLgQ08TH/OgZVc4T5yf4hgR1yb/tWtoE0Sla1VSa5a6ZJnfwlNS6CK
        J5WZHFR4GOjruiC/+4p0EB0=
X-Google-Smtp-Source: ADFU+vuknS7SONcB9xzTRRWjWLA1MdvgPbwXlAe5hfTyTdIIx7WB7/x+ArwiI/4tRTwd9a1fgqWEOg==
X-Received: by 2002:a1c:5f43:: with SMTP id t64mr9767121wmb.2.1583418984037;
        Thu, 05 Mar 2020 06:36:24 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g201sm9365124wme.23.2020.03.05.06.36.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 06:36:23 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] dt-bindings: i2c: i2c-rk3x: add description for rk3308
Date:   Thu,  5 Mar 2020 15:36:10 +0100
Message-Id: <20200305143611.10733-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200305143611.10733-1-jbx6244@gmail.com>
References: <20200305143611.10733-1-jbx6244@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The description below is already in use for rk3308.dtsi,
but was somehow never added to a document, so add
"rockchip,rk3308-i2c", "rockchip,rk3399-i2c"
for i2c nodes on a rk3308 platform to i2c-rk3x.yaml.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 67cdce8fb..edee8f699 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -33,6 +33,7 @@ properties:
           - const: rockchip,rk3288-i2c
       - items:
           - enum:
+            - rockchip,rk3308-i2c
             - rockchip,rk3328-i2c
           - const: rockchip,rk3399-i2c
 
-- 
2.11.0

