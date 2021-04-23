Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C839E3697C0
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 19:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243429AbhDWRAr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 13:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243434AbhDWRAi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 13:00:38 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63ED0C06134B
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:57 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id w6so19925436pfc.8
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gQpml6LY7Prl7t7mfNrEKr4/YWo6h583YxpHTazji+I=;
        b=CMfq2qDcrTK2b1SFUCZl8F3ujYtBndOl2TMhPVrj4aH1E2I16NvaQzc19oDJszLfid
         CxLnqp0WutR5SYYS+P2vhIfJ5ZvXrO3Ohqsd1NUL+oqydpuFunPUrOiefBS12z2zrnRu
         Ald6Uf3EfWB4GFrknG3RhT9JTBAxtA0heuUEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gQpml6LY7Prl7t7mfNrEKr4/YWo6h583YxpHTazji+I=;
        b=IRpW6hkVu6XD5z04OhC2C7djdbRCd/sU3Kb0PMhmOBiQqThElqI+ta9+KZi/2nOr05
         VjSvD/FmMJDRo2lSjzhgmvszUx1AwkQY2bPzo5OjijTLkpDP/qPehb8Z1ex7gh+JyQpp
         vryi1ku5ONOEb5jnRK251S35twoH4jZA5p7a8ShUPf+6LG7blzBjOrPGt4nCb1yiQwp/
         5KQKow25QQ6h0j8O0T8qo+dPIsMQI4P7gnYra7bL9M4VqGXtI9W5TXvav65l4GXsdlyC
         Dch0/j5meGHcIk9cO0fhRlOCiGAbg7JSVQbWaccK3ufO+9Cvrn6DH/fzSwBsLfxGjn7O
         SNLg==
X-Gm-Message-State: AOAM533RpRt0Kl44mu7h3nu3jO4u8RZO6eCg7E7oDubgIVUrbsOyIDuQ
        ks/u+4Vj5Uu+WKLOgF2PR+sYlA==
X-Google-Smtp-Source: ABdhPJzi7ZOtZAGEwKGcjvP+7f7f5ph/mFq4PXS32e6ikwdc72PRbTlZo2MGrZN8aOExRGcMm37eRw==
X-Received: by 2002:a62:e80f:0:b029:263:951f:14fb with SMTP id c15-20020a62e80f0000b0290263951f14fbmr4754352pfi.63.1619197196935;
        Fri, 23 Apr 2021 09:59:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:56 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/20] i2c: i2c-core-of: Fix corner case of finding adapter by node
Date:   Fri, 23 Apr 2021 09:59:01 -0700
Message-Id: <20210423095743.v5.15.Ib7e3a4af2f3e2cb3bd8e4adbac3bcfc966f27791@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The of_find_i2c_adapter_by_node() could end up failing to find an
adapter in certain conditions. Specifically it's possible that
of_dev_or_parent_node_match() could end up finding an I2C client in
the list and cause bus_find_device() to stop early even though an I2C
adapter was present later in the list.

Let's move the i2c_verify_adapter() into the predicate function to
prevent this. Now we'll properly skip over the I2C client and be able
to find the I2C adapter.

This issue has always been a potential problem if a single device tree
node could represent both an I2C client and an adapter. I believe this
is a sane thing to do if, for instance, an I2C-connected DP bridge
chip is present. The bridge chip is an I2C client but it can also
provide an I2C adapter (DDC tunneled over AUX channel). We don't want
to have to create a sub-node just so a panel can link to it with the
"ddc-i2c-bus" property.

I believe that this problem got worse, however, with commit
e814e688413a ("i2c: of: Try to find an I2C adapter matching the
parent"). Starting at that commit it would be even easier to
accidentally miss finding the adapter.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
This commit is sorta just jammed into the middle of my series. It has
no dependencies on the earlier patches in the series and I think it
can land independently in the i2c tree. Later patches in the series
won't work right without this one, but they won't crash. If we can't
find the i2c bus we'll just fall back to the hardcoded panel modes
which, at least today, all panels have.

I'll also note that part of me wonders if we should actually fix this
further to run two passes through everything: first look to see if we
find an exact match and only look at the parent pointer if there is no
match. I don't currently have a need for that and it's a slightly
bigger change, but it seems conceivable that it could affect someone?

(no changes since v1)

 drivers/i2c/i2c-core-of.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 3ed74aa4b44b..de0bf5fce3a2 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -124,6 +124,14 @@ static int of_dev_or_parent_node_match(struct device *dev, const void *data)
 	return 0;
 }
 
+static int of_i2c_adapter_match(struct device *dev, const void *data)
+{
+	if (!of_dev_or_parent_node_match(dev, data))
+		return 0;
+
+	return !!i2c_verify_adapter(dev);
+}
+
 /* must call put_device() when done with returned i2c_client device */
 struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
 {
@@ -146,18 +154,13 @@ EXPORT_SYMBOL(of_find_i2c_device_by_node);
 struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
 {
 	struct device *dev;
-	struct i2c_adapter *adapter;
 
 	dev = bus_find_device(&i2c_bus_type, NULL, node,
-			      of_dev_or_parent_node_match);
+			      of_i2c_adapter_match);
 	if (!dev)
 		return NULL;
 
-	adapter = i2c_verify_adapter(dev);
-	if (!adapter)
-		put_device(dev);
-
-	return adapter;
+	return to_i2c_adapter(dev);
 }
 EXPORT_SYMBOL(of_find_i2c_adapter_by_node);
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

