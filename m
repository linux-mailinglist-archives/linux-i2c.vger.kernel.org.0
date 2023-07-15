Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2255E754756
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jul 2023 09:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjGOHxq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jul 2023 03:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbjGOHxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jul 2023 03:53:45 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AAFE35B3;
        Sat, 15 Jul 2023 00:53:44 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so26926055e9.1;
        Sat, 15 Jul 2023 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689407622; x=1691999622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMFNGkQWy0XgQD1M7WLotDgHQHKNsdR7qapEAzcCtKU=;
        b=knUXx6Q/kxZ4pQTG6QoR/jTseWzsNLa7cNz3w/haUKvCT7V8jcGBfdT4Vtl9AdxhLN
         FrW3emWhJU5V/uxjiI4UN/blsGkWrisQWuDi71lv1f2qDHJIn7JknQ2SppcyPuvKuYIp
         FEeFORjEX46EC639gaoVv6Ybmuvb4oK7gYnQ9EIkOqKSlMvc1FrdobYL60rsi/me7lUk
         tuinX7Lihv3UWMqgIjgF/88Do77GVgANMffACm23YSKFwmZ2dtuQtlHjCBHnZMK3wxhC
         tB+oQb6so7jVKz7KhcfP1r5uM0297l1gjYiFc4c5ZBdfQrQmFjMByd9mSAwkPaRa94hN
         uNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689407622; x=1691999622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMFNGkQWy0XgQD1M7WLotDgHQHKNsdR7qapEAzcCtKU=;
        b=LfgqUWjr5SbmUZZaA0b9OhWse2lLN5uJrkhNCoDRvnA62OKdHnrVtFFPRMpjpaYdg9
         yPYEoeCfyXIrxXFZfzeia22i4X7H4D9/mmXGL3SOZ98lA87t0eW1i8DMBjhD2K36A3tk
         A7HnmxMvAOxMzR+Zt8WJrOCLRD87PyQEskqfj5iQvdHCPwj9Gd9muCwTCuM3eLSjznjc
         mxJuEXWkbqs2K3ml7W7ENXWMjdR9RggE+XqPZn22DJJIPhqMOWFvJ4igj3/Nukta3Cu4
         IXtFx4wviaSBqhSnNYkNQXZGyvi0IhGzeHjGmiF/4E70+2FsymJ2JRa8nZffWq/az3cJ
         sJKg==
X-Gm-Message-State: ABy/qLbA7OPApaZ8/izeWtEs/ab+Etl6JkR6XZ7Ggs0DBy1OrClNE1qd
        KVq76Bw9Ff0I4NrwJsZnpk4=
X-Google-Smtp-Source: APBJJlFFIHburZ+jenisgWg9lxIuKcRQurMrcxImCKydDON7PN/2NPJuxM59yH38/XA/4PtDP+44BQ==
X-Received: by 2002:a5d:498d:0:b0:314:13d8:8ae7 with SMTP id r13-20020a5d498d000000b0031413d88ae7mr6239736wrq.26.1689407622586;
        Sat, 15 Jul 2023 00:53:42 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b003142eb75724sm13001271wro.24.2023.07.15.00.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 00:53:42 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Sat, 15 Jul 2023 09:53:25 +0200
Subject: [PATCH v7 3/5] kernel/reboot: add device to sys_off_handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v7-3-18699d5dcd76@skidata.com>
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Benjamin Bara <benjamin.bara@skidata.com>

If the dev is known (e.g. a devm-based sys_off_handler is used), it can
be passed to the handler's callback to have it available there.
Otherwise, cb_data might be set to the dev in most of the cases.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 include/linux/reboot.h | 3 +++
 kernel/reboot.c        | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index 2b6bb593be5b..c4cc3b89ced1 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -129,11 +129,14 @@ enum sys_off_mode {
  * @cb_data: User's callback data.
  * @cmd: Command string. Currently used only by the sys-off restart mode,
  *       NULL otherwise.
+ * @dev: Device of the sys-off handler. Only if known (devm_register_*),
+ *       NULL otherwise.
  */
 struct sys_off_data {
 	int mode;
 	void *cb_data;
 	const char *cmd;
+	struct device *dev;
 };
 
 struct sys_off_handler *
diff --git a/kernel/reboot.c b/kernel/reboot.c
index 6ebef11c8876..395a0ea3c7a8 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -55,6 +55,7 @@ struct sys_off_handler {
 	enum sys_off_mode mode;
 	bool blocking;
 	void *list;
+	struct device *dev;
 };
 
 /*
@@ -324,6 +325,7 @@ static int sys_off_notify(struct notifier_block *nb,
 	data.cb_data = handler->cb_data;
 	data.mode = mode;
 	data.cmd = cmd;
+	data.dev = handler->dev;
 
 	return handler->sys_off_cb(&data);
 }
@@ -511,6 +513,7 @@ int devm_register_sys_off_handler(struct device *dev,
 	handler = register_sys_off_handler(mode, priority, callback, cb_data);
 	if (IS_ERR(handler))
 		return PTR_ERR(handler);
+	handler->dev = dev;
 
 	return devm_add_action_or_reset(dev, devm_unregister_sys_off_handler,
 					handler);

-- 
2.34.1

