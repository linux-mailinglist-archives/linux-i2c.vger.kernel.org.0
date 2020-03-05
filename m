Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9BB17A7A5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 15:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgCEOgb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 09:36:31 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39653 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgCEOg1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Mar 2020 09:36:27 -0500
Received: by mail-wm1-f66.google.com with SMTP id j1so5988351wmi.4;
        Thu, 05 Mar 2020 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QlXzIeykIQUpEBdYcwxd+wvAWmRVIxL3eGhm6mPv2tU=;
        b=bLCvUgvqw8iVKbPkM4EtHEjlr9hoXI6ts2HiI7NyS33acPByckia3FvdKNdmCw+shk
         dzqU7y7L3wfAuvNZSkXea2DmXqj9gOftfhhf3HnhWtGd5rQgdfsWBmyIvQpcTFftHPYr
         Yy2JE8V7sk/cTfBwh0xdC4AX7qlqgQAqPpUyOikjfX4/zrT0gDtySOja6ziWgHJZS7TF
         THFlRkQYf2xwcxogTqSRleSo5Tsxrdc5y+ksVnpEU38JWpZVU4NbBZH+hSfcYeqZ3oto
         inPT+91oHpIhwEjHmow5anaiUDsBUjQPRKyQv7iJ+9RFwOB7JR28vmSJIx7EqUGuay9f
         X79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QlXzIeykIQUpEBdYcwxd+wvAWmRVIxL3eGhm6mPv2tU=;
        b=KVy8ZaYAnP6yoPhwdk1sC6ZAHsAUN3ZgAaedb5uF16FzJaCyh/W2WpsNLtGzh8JUir
         UtOP93zCdL77Iux8rGbMQpiwbXRjTUcPBU0f0NM/k6kP4NfoAMNFdEFKNOjCrJw8h/eT
         Ujf2hzVfwtkFWFOOtBpo+GvgnP5oHcPoKcCT9ehUUrJDM4v9bXMlT/W/WscfTOClsb9X
         Gq4yxqjI4Ja3iFOyQ6+mWw3YZkynArSSEjzRZlg+Ac4TNqsICFznfZeHQUDkgVVvYJqY
         ShAc1nL9lnqTxbSFuMYzcKBxfUDUjYVPaoDVsy/6qRZSHtHgvjdRRM+pk1vVADc6DGOe
         rv0Q==
X-Gm-Message-State: ANhLgQ3UZZlj4X4P/J+vcXUDbyfjt4NT5VGO+7QFmjVA5AeeQq5w2Ism
        HRESlNWdBhi9dhOrk40oTpo=
X-Google-Smtp-Source: ADFU+vsdfwf4i6qjYFXBcYbvtQoEzb0ZAfQyCvkvWDrzRecAr1kQ48Dp8uEzHOKDHtF8X0uY5u9yIg==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr4123131wmj.102.1583418984953;
        Thu, 05 Mar 2020 06:36:24 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g201sm9365124wme.23.2020.03.05.06.36.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 06:36:24 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] dt-bindings: i2c: i2c-rk3x: add description for px30
Date:   Thu,  5 Mar 2020 15:36:11 +0100
Message-Id: <20200305143611.10733-5-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200305143611.10733-1-jbx6244@gmail.com>
References: <20200305143611.10733-1-jbx6244@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The description below is already in use for px30.dtsi,
but was somehow never added to a document, so add
"rockchip,px30-i2c", "rockchip,rk3399-i2c"
for i2c nodes on a px30 platform to i2c-rk3x.yaml.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index edee8f699..61eac76c8 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -33,6 +33,7 @@ properties:
           - const: rockchip,rk3288-i2c
       - items:
           - enum:
+            - rockchip,px30-i2c
             - rockchip,rk3308-i2c
             - rockchip,rk3328-i2c
           - const: rockchip,rk3399-i2c
-- 
2.11.0

