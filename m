Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBA32C8541
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgK3Ncj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgK3Nch (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:32:37 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2452C0613D3;
        Mon, 30 Nov 2020 05:31:56 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r3so16245414wrt.2;
        Mon, 30 Nov 2020 05:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pBmA2HioX2UOik7KR00ouIZb6c9//C/JEc7oIKLhFcY=;
        b=JVUuwkGJ4NaNb4HLNMLQMgIDISYvV/gUvh2+I8ROZLZfa2ArJ02t4klczA1AVqGmKA
         8BhgJocg2bdn/9CLqAn59pwI/chqAFBGJitzVjZuNhPJokxYZvuiSwGIvR1kGAEPufBB
         9h6zoAoKp0eoCsNVxTcNHvpcHUL1l4uT26DAtqXXhKdb3YhxrsJsn9nMR44YSaGuGqey
         gHJ/5b4FDD0yej47dY1G6SnhFpjVsCh4GkYVE16P9aI/K+sJ5wacNAoDQ2SnVzADnfSo
         QHY8qBwE9OdR/xrPm6iYuwsjLoNx2YrFmN/la1JTAMUNhTbAE+Qvr13cCPgSktyLSJ5C
         zZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pBmA2HioX2UOik7KR00ouIZb6c9//C/JEc7oIKLhFcY=;
        b=UdF883nmhtYuFVlF4Fcei2VMg36joPnDTyJjXFpMlsDP0OLXygeFWqGGUHeSg7az1v
         Sz4wc57iGS1z2xhuftBKujQHtRH3gbpbAyuqetsY7TPYlmLDbSEpZfghD0BHIgaUQeCG
         csMrnp4o7V8Dx42GY99TRg9NDkWGZDede4zwybAQBBWk3747RPd6/OtAbJft0vupzQDK
         M07o+9UhqHoeHMOLcpcEhFEGwdalNxG+q+tvcAnctIgWgLb1t4Hga/X5b3czcoCKjYj8
         XgXXEwkc+EzNBylL/kLFXu5CRFTKvQ5O7xsZ6RNwcPVPZFMXNbaGx2eNtjRA5YxxUCDk
         BIiQ==
X-Gm-Message-State: AOAM5305HypKY2gFPuu2M+xF82HKllm8bPdjYB+52qEkP62gr1V8o0xm
        LZ6ymfcrfaRNGgzQawKEGWNBVn1zQDdYNQoW
X-Google-Smtp-Source: ABdhPJwJReLGmQDmMBx5sI3o4Ddyr/ckN/oTbfZCoRx7mDtrmB/TSoplbGx15zWUvGD03E8J9yGkhA==
X-Received: by 2002:adf:916e:: with SMTP id j101mr29144408wrj.55.1606743115428;
        Mon, 30 Nov 2020 05:31:55 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:31:54 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: [PATCH 02/18] property: Add support for calling fwnode_graph_get_endpoint_by_id() for fwnode->secondary
Date:   Mon, 30 Nov 2020 13:31:13 +0000
Message-Id: <20201130133129.1024662-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This function is used to find fwnode endpoints against a device. In
some instances those endpoints are software nodes which are children of
fwnode->secondary. Add support to fwnode_graph_get_endpoint_by_id() to
find those endpoints by recursively calling itself passing the ptr to
fwnode->secondary in the event no endpoint is found for the primary.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	Patch introduced. In discussion in the last submission I noted
	that the CIO2 device doesn't have an ACPI fwnode - that turns
	out to be true for _some_ devices but not others, so we need
	this function to check the secondary too.

 drivers/base/property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index a5ca2306796f..4ece6b086e36 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1162,6 +1162,10 @@ fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
 		best_ep_id = fwnode_ep.id;
 	}
 
+	if (!best_ep && fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
+		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
+						       endpoint, flags);
+
 	return best_ep;
 }
 EXPORT_SYMBOL_GPL(fwnode_graph_get_endpoint_by_id);
-- 
2.25.1

