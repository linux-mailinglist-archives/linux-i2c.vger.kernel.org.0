Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B3C2C856B
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgK3Nda (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgK3NdZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:25 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89174C061A4B;
        Mon, 30 Nov 2020 05:32:10 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d3so15384325wmb.4;
        Mon, 30 Nov 2020 05:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PU5pzfp9qjZchwd6gQsD9rYDZy2eDuXuRH5bJdGJC0I=;
        b=U5BTjckr0oVrRYN6a8BJ119QQdABZbwQdy24f0+UzrNFCi+R7C4G/6NODwrPu7MDtt
         KCpEwMGcMNV2PKLkKA7CVVtBqi46SBHHbCRInZs0SkyQVs1WJMFqAQ5u59viPRCOgY4F
         kWa8w2arggByNI+erKsz0V+8Dh4+gu2dBBAB2uvMHbCTlU5m9tSzdRnhIubV1HBjM4Jq
         w7bQ6C2zE0Jk9x/Z8eRcGA2s4w2jbViGjyajCUdD2mS3RwnOjywUh6AxkS7woGqkZ46x
         GzDPLz1HlQZcKrLMmqXONjniAZtdaMu1RkXvngFhrZb29ZKb66JpdC4szonBwTEkRkzi
         wCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PU5pzfp9qjZchwd6gQsD9rYDZy2eDuXuRH5bJdGJC0I=;
        b=Ilr3Ag7HJr30sPWiURNe813MbHY2IlFWXMOMvh+xpgARj2xmCOnyQy02ikIjSKlf5Y
         4A38VmnTRMqPHQaRqw3LBksQ54GnSfwhrJBBxUnIJL8HA9lmyVGW1m/DmnDxysm7bDQ0
         Pj7ELVvMePlAe5E1SMXYfrcSkmr4fsligYqqHIRg4BkiBAIpzAhgdOR0XKkpXVsK0zRY
         9LzRrKFPu45Z/QcJ0p90EVwDMJ7k3DpSr830g6iLsG2byRJUXYJMCD2CkXC7FnmaKOpP
         2z6kA3XQBWIe4BJ6IOzxphI00zEaoeQkMCHJMx9hxPeEWwJ/0G5H5EkxzeMcFHErWXgl
         ZynA==
X-Gm-Message-State: AOAM532gMQivEkY4rbMDXEu7S9aPVO5pUEkV1pcJ7WvMUqfotf+0PcSZ
        27a0wMTixu0ybSSNFw1w2MuGZRtluGrmeCyB
X-Google-Smtp-Source: ABdhPJyWcNS8XvtotcTFst6kuSUA2Ai5YGD+Pmneu3wpVLru3nUAkbKboDh9puEegNK+LTUazenVCg==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr23183796wmh.58.1606743128982;
        Mon, 30 Nov 2020 05:32:08 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:08 -0800 (PST)
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
Subject: [PATCH 11/18] media: v4l2-core: v4l2-async: Check possible match in match_fwnode based on sd->fwnode->secondary
Date:   Mon, 30 Nov 2020 13:31:22 +0000
Message-Id: <20201130133129.1024662-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Where the fwnode graph is comprised of software_nodes, these will be
assigned as the secondary to dev->fwnode. Check the v4l2_subdev's fwnode
for a secondary and attempt to match against it during match_fwnode() to
accommodate that possibility.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	- None

 drivers/media/v4l2-core/v4l2-async.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index e3ab003a6c85..6486dbde784f 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -87,6 +87,14 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	if (sd->fwnode == asd->match.fwnode)
 		return true;
 
+	/*
+	 * Check the same situation for any possible secondary assigned to the
+	 * subdev's fwnode
+	 */
+	if ((!IS_ERR_OR_NULL(sd->fwnode->secondary)) &&
+	    sd->fwnode->secondary == asd->match.fwnode)
+		return true;
+
 	/*
 	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
 	 * endpoint or a device. If they're of the same type, there's no match.
-- 
2.25.1

