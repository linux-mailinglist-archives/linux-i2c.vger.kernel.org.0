Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317462C8586
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgK3NdV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgK3NdT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:19 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FBFC061A49;
        Mon, 30 Nov 2020 05:32:07 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h21so25172414wmb.2;
        Mon, 30 Nov 2020 05:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkjtpuVB3caYnMIACCsSyZ57OV1NCqyYvqb38eMikT8=;
        b=GqMT/RMnWZAbeKEBXyR2jAXpmfIZnGU+oC+bb63+ape3x2Vh8p3/6MqOZ3mNCT0vAq
         gf5dU+aXbnyaLa1e14gT6Wj2RfJXrDqnASeRpyKPxc3+PENIHlM2wzjdan05XOOqDFkS
         F+liFzChojXT+rwa30YFUY0qPOABajn9ep6aN8A77rTe77QxNF9/rYGqFtTP4vMQmNve
         SQXEROCwzHvMTgEUrFi3gs55lGMHXEbBKtmu2cTLUN10R119VDiMkRHqFwmNd0OxZEN2
         uMgBeuy8aUqw+60XQGp8kof+NLaSgGfsgWeheQ7Kj8vtl78TrJxY4ysVAu8HeSuGExcu
         GCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkjtpuVB3caYnMIACCsSyZ57OV1NCqyYvqb38eMikT8=;
        b=DjLtIeDV1RMftNYMsY0Nq8p2nonTlNOfG+3V7qQbHdMnCVuGSTCt5/spVSqTxkuC0m
         Zbf5fMpLQxN0oPlyx5vn9uUPpw7FEs4+x5xtPd28VAGsoz8jXtf+sry+EgQ5h2DBLFHp
         2wuUhpxZzUf/Ovys7SbpkWcLCmiojdhWjPiaFSQJ0j9ZmhEKthKjaLLsL37ppqQYPgSb
         aUkA37hT2Oe3L0MpHWN9jHCbYEOK+ADk4bHqmH8Iy301CBGz4DX8bC36oKTKByt/u4hy
         UXOiryN39yR5JqG3QkD++bRO7liNos6w6ZO6A9jb1x9lQIw8BfQmodIuDRXtVv1OyN7N
         sNIA==
X-Gm-Message-State: AOAM532pjcB6IUgtsobzQv60hKVWt649zmhOctFBEfTE/tZGQKAeplPm
        LuxsXu2j95WaWxz6SB/+Jf0JdUbOXNzHbBN5
X-Google-Smtp-Source: ABdhPJz1vJSOOkD6d9W1EvlioA+pIqkPYCN2O5X8bSU4tLQTitlvde+GyrVb8QOnLlSlqBjuYGRRfA==
X-Received: by 2002:a1c:9901:: with SMTP id b1mr23284287wme.18.1606743125982;
        Mon, 30 Nov 2020 05:32:05 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:05 -0800 (PST)
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
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 09/18] ipu3-cio2: Add T: entry to MAINTAINERS
Date:   Mon, 30 Nov 2020 13:31:20 +0000
Message-Id: <20201130133129.1024662-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Development for the ipu3-cio2 driver is taking place in media_tree, but
there's no T: entry in MAINTAINERS to denote that - rectify that oversight

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	- None

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3a828249c8c..9702b886d6a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8930,6 +8930,7 @@ M:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
 F:	drivers/media/pci/intel/ipu3/
 
-- 
2.25.1

