Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E076E5F6D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 13:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjDRLKx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 07:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjDRLKn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 07:10:43 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DE27EE5;
        Tue, 18 Apr 2023 04:10:28 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u3so20144661ejj.12;
        Tue, 18 Apr 2023 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681816226; x=1684408226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX5R8Ja4/uQ1bZhivXwMqgCiLJVs+CVwud3ONCpJxg4=;
        b=dEWUK2L/qiMDsvLULfsZ414bpwpYpTDmkHTWlleST4Bklyia1xTBu53xFuzjgyzmBD
         Rx63//4AOelp6qS8ms7b8XbegUpcKFr8f1Rl1RPaxCcBK/toaVjoAMoojmJRsczndzUx
         GDZPPOSRAeAKhFCszcWYxfQwYKU2CY+L7EfXaH72qAFdAuRSHl4OwBJYv5DqmTQh7NaT
         UhVISvzH5ILgN18fJtWr4PJaBNSDdtR+XyKDpvy7rb1TbvE5mO4V0BU+dqV1hfk1HgFw
         o2syFzneCf5xRlr2aqiF8peZnlIebzPsOWhDiRgcvkadPHN7w+aZHXan0q83MmVtEJbN
         wJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681816226; x=1684408226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX5R8Ja4/uQ1bZhivXwMqgCiLJVs+CVwud3ONCpJxg4=;
        b=LjV7VqA5ZIdv6855NYpZg3tTT77X8qCvUd8HRwp1lPMh5SzvhQPM23WcO20E79prfV
         RyN6Y6UGOxV6k6l82Y7cs/Ru7qHb2ogLPdaByrJs/C/GjsdcnPWiqQRDxavDR5IMXR1X
         uVPAyOdGemlknXIwk5J5Stthb/FnycmP1YC7GwUqe3zAcWaYiJuDxQBslSntom+ZeoiX
         4NihNoyabokmF39EJp9tmENnscfaYh4XuquWOTDHX6PJmYcg1/CUywkmJ7gAdDktrLUu
         oM+cJKK0MIcxvHuxMEKUOaM8cxpN4A4AdulU/r4EBAYbvVFjba7AGebaxWxuaDfm625E
         XUQw==
X-Gm-Message-State: AAQBX9dkHnA7Y/RJLiQj+Z/HOZk7+DYru7sSzjTRr05QBu8pDIGMO3q+
        uABic8LIWLHpmKAk2LgAp/FkwME02cvcVxln
X-Google-Smtp-Source: AKy350ajtZ8vLoqucYqQMFTZaUzvE9MwMljTvcwfiUagc47PMCdndDAPNrFr2Cl7UkFSgr4HIrbePA==
X-Received: by 2002:a17:907:78cd:b0:94e:5b0b:7bd1 with SMTP id kv13-20020a17090778cd00b0094e5b0b7bd1mr9561393ejc.74.1681816226432;
        Tue, 18 Apr 2023 04:10:26 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906379a00b0094eef800850sm5954554ejc.204.2023.04.18.04.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 04:10:26 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 18 Apr 2023 13:10:02 +0200
Subject: [PATCH v5 3/6] kernel/reboot: add device to sys_off_handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v5-3-ab090e03284d@skidata.com>
References: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
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

