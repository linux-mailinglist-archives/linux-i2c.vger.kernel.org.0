Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3C22C854C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgK3Ncq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgK3Ncj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:32:39 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70490C0613D4;
        Mon, 30 Nov 2020 05:31:58 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id z7so16225475wrn.3;
        Mon, 30 Nov 2020 05:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mt2fBAtoQbvZ5hTUX8F9k24XA25dZdnBW06oRQeyp3I=;
        b=dFB1ezxPwnCdWAf6tGcY9k4y1dMIQqV37aQcyTmKo+ChI4FAn8cddNVe0AGbAj5wVR
         nDSpSflBBGbemqkqKuAXsJBShrEB6yCD/7EEtaxB2YxiRSq3GEmuAy0xlerjftl8yaoT
         DgpKgRwk8m6W/+m+FFx0FPZwsy6LTl7ciuxSUvSvWku6slFkRPkpz83vRSxhSNfEcf6M
         m82SxlujXi6iMuANT8L3zlBzEz3f/STr8RfWVhjRbA0AkhoXNuSHDbQavOqdRRSiRgMl
         9RTBoTebF3JgtQ45dng1RpuoEULMrKQFqzLT5mco1X/+RPLSleXuW+UXdNVA/iLxKpgx
         GODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mt2fBAtoQbvZ5hTUX8F9k24XA25dZdnBW06oRQeyp3I=;
        b=r+gWCC254ZW5yabiLoCJY+O/9bRO9ORqS+1Y29Sr1Bj+0rTRve27HUeWvzsCmFHpLK
         h+brq/0rtaVHFKsRbUuV+yCbTIEFqAcKpJ3FK/iUDypsoC+8gWp3EI6Eaji5BMpuXjkr
         89VFOYGeEO6rPzoVT4ucE6Z8vzF2fR+UKewm+TTyAPoBIgMFFsCt34y3/Qtvp3h4gl9O
         RrwR56dL45p40Rh32OkgZiPg4WHl15YzACeX4bEhSGt/iFrwNBB538bHIDoFT85ms2eI
         wsgpgQ3CcOcp3nUtmu5sK7xWE/Pp8hTbZd2R+nPSxbbXeIqKo5OPPsgFZI8lb2VGBMlM
         ZsCw==
X-Gm-Message-State: AOAM5313/PCo6TaP6N3g/qiGTwaPmYUtFWYnkdEfQM8WWyJnUllK9plH
        sDnBiObgv6N+z16r8e79izhpEzY40xnuPzkl
X-Google-Smtp-Source: ABdhPJyz97co4wzGWBGHdxBJZB5BhplZYCrWZgDWR717m1Ny05GyKxudg6DzlyUYknC3K2O2brL7nA==
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr28182991wrp.91.1606743116927;
        Mon, 30 Nov 2020 05:31:56 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:31:56 -0800 (PST)
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
Subject: [PATCH 03/18] software_node: Fix failure to put() and get() references to children in software_node_get_next_child()
Date:   Mon, 30 Nov 2020 13:31:14 +0000
Message-Id: <20201130133129.1024662-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The software_node_get_next_child() function currently does not hold
references to the child software_node that it finds or put the ref that
is held against the old child - fix that.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	Put reference to previous child.

 drivers/base/swnode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 010828fc785b..615a0c93e116 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -443,14 +443,18 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
 	struct swnode *c = to_swnode(child);
 
 	if (!p || list_empty(&p->children) ||
-	    (c && list_is_last(&c->entry, &p->children)))
+	    (c && list_is_last(&c->entry, &p->children))) {
+		fwnode_handle_put(child);
 		return NULL;
+	}
 
 	if (c)
 		c = list_next_entry(c, entry);
 	else
 		c = list_first_entry(&p->children, struct swnode, entry);
-	return &c->fwnode;
+
+	fwnode_handle_put(child);
+	return fwnode_handle_get(&c->fwnode);
 }
 
 static struct fwnode_handle *
-- 
2.25.1

