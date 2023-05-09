Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 831F16FCE37
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 21:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbjEITDy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 15:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234959AbjEITDp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 15:03:45 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB9C4201;
        Tue,  9 May 2023 12:03:40 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-966400ee79aso631858866b.0;
        Tue, 09 May 2023 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683659019; x=1686251019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX5R8Ja4/uQ1bZhivXwMqgCiLJVs+CVwud3ONCpJxg4=;
        b=s3/JyypJhOLprfB5qLzC/3u3JxM2Qm9MfuueSbMua157cqQO9vFJRafYM7+nr3WGQN
         Zmxe5ilXRu18zAkWwenKRiH5ly/tsRgRXzfTYjp0li6qwAgz6kzorHxhnIYZ9oWHhG3a
         +tHLPRuAfbaWYYoXZS8KhMaRqX/jYzUNMNEGK8WWI6oiX9YxrSiWMxRzz/fqcCFLOjxm
         G2rKzN1+yFkLJbMDXuE7Gd/mPh3sR/QAttNgs9buDSlsDf4DtD1XZxFuyywe4/1LEuPY
         5gZ99ytLogoS/crM7Uvzp+ry0QqdixlDeVqij2uG3cLbiRKT7KvYkc371OP5q+YYFOoE
         jsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659019; x=1686251019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX5R8Ja4/uQ1bZhivXwMqgCiLJVs+CVwud3ONCpJxg4=;
        b=VnK2JUhmiwqPsQftzDtKVE+ZL71svw6E6ktA3oU/Jck1+GtzGy07JWHcCDPpvn2qyo
         ETtPXtBLpCyU/sX+pu5XHPFfZ2hcEl2zc0ejt2t8yU2VaN0X5d8e8PRryn4zO3ObIqvA
         kah0CWcUILaXfBbG2wA5ksfry69YT4FU+k5F14aP/nDMNtJv6o0Z9MEavru36kLHiiQb
         /+gQd1JJQWAT7VLjlZT1y7natDjMZjmh3wII3u5y5bxK3Vksrj5NOHM6l7fOQTV3q4Pu
         9K0sXXmmdRQfjZZ/l7mZz8zk0x6xvc5htfsmudO9PrQPR5orKdhgBqmh455VLe/IIuAw
         X19Q==
X-Gm-Message-State: AC+VfDwySyXO0osuH7jxxCWmwQ9U9HNC7w8y5zemzx4z0kMs+nFE27vV
        f52KFvoMYoWMvjcrPaX6IwmTMETX70jEChmX
X-Google-Smtp-Source: ACHHUZ4N9Cw7QXnfUCKm9htZoVdj+Co7WubEXVF1adu9SzJ+miBh5FHrk9VJot7LX2j+iIODsr3nPA==
X-Received: by 2002:a17:907:e8f:b0:94e:e082:15b9 with SMTP id ho15-20020a1709070e8f00b0094ee08215b9mr14861016ejc.77.1683659018329;
        Tue, 09 May 2023 12:03:38 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906c00200b009697aa5acfcsm1640232ejz.122.2023.05.09.12.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:03:38 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 09 May 2023 21:03:01 +0200
Subject: [PATCH v6 3/5] kernel/reboot: add device to sys_off_handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v6-3-af44a4cd82e9@skidata.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
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

