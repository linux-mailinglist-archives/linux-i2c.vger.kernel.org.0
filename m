Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27ADC390A51
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 22:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhEYUJB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 16:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhEYUJB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 16:09:01 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BB6C061756
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:07:29 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j14so31738379wrq.5
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=uGXuQSOJsjAaVr0sDt1k63gACINGt4GRMWEoZs4TWyE=;
        b=DXGreGWdzF/7BMoYbt+OeRYyTbONpfVio7AlHg6oVbY0SfhRnomqIiKrxWEEdOHuCj
         /sqgK/hQKWNwahdx2wd3eB1xVmZ2R27GSxi6FuELZxQzeY8AlwhZN6xqsQz+r/i1vIUe
         e1hZlacSSknQgKXw/3m2sMRBaYqew3ANQ/DnVUXhShczpqc9LT60N+/k6nVhOtpXX2km
         PO0hxZ0an47F8NQJRc3FxQzbmsy/YEuy4gPHwwxGKqsyMcxy1pkgfQUE4aND49MKlRjq
         aIMO7qQw+wZskgmo0Xt6Mwn1rQ+Rnex+tJdCgwZN0lZ9R/03i5yIgxgSi9P5OreQnnv0
         UUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=uGXuQSOJsjAaVr0sDt1k63gACINGt4GRMWEoZs4TWyE=;
        b=jDOwO444x9RlsWcpVu1D92s4GK8f+oMg6HDhQSkOzPugYHY0GsNCYqp4mY9mfuEuwj
         5w8NTbdOZ6FFhYefGbxZD4pB+uHxhQd/kyWwxHKsmQBPi2mUmgVe+YiOapIyRh0T7PZj
         PFfadKl4ZGloHMCFWi9TEfXouxokgGrtxZebGfJZdKwgrVjd9mOBELDgBsZcrrEFiAIg
         Wdt2r5mWIMcfS8v1eAh4eqy6qkEdGu17YlAWKAWn2oYB7//JjMT9TEHADhc12/gaJVsg
         lGupyZKS2Nc02/Nf5hqeC/YYsZ1LMD1u3lPez/Pjsj79xmlVmdg+hp9sOw7ccJdysVTJ
         0GqA==
X-Gm-Message-State: AOAM531pn4gvBw7Pz0QlJOltiLM/hL0rI3CrFrHxGUL0sStcg1AlrUUW
        SPDAxidVXl3gACV3BdcMfuvKec3Xbr4=
X-Google-Smtp-Source: ABdhPJzAo1XYKuQAVQWc4E3mjGxY9e0IcpSNPOSkg4+DSbNkIObix4xU1cXmEpn8y8nWFGTxJR+Rqg==
X-Received: by 2002:a5d:5688:: with SMTP id f8mr29246363wrv.237.1621973247778;
        Tue, 25 May 2021 13:07:27 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:a053:ef5d:7e3e:e120? (p200300ea8f384600a053ef5d7e3ee120.dip0.t-ipconnect.de. [2003:ea:8f38:4600:a053:ef5d:7e3e:e120])
        by smtp.googlemail.com with ESMTPSA id w25sm12181619wmk.25.2021.05.25.13.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 13:07:27 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Simplify initialization of i2c_board_info in
 i801_probe_optional_slaves
Message-ID: <c2c797f9-7c5c-9545-0cac-675a191c7e40@gmail.com>
Date:   Tue, 25 May 2021 22:01:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Why shall we bother to open-code something that the compiler can do for us.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 9588d5bcf..0c08cfec5 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1291,11 +1291,11 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
 		return;
 
 	if (apanel_addr) {
-		struct i2c_board_info info;
+		struct i2c_board_info info = {
+			.addr = apanel_addr,
+			.type = "fujitsu_apanel"
+		};
 
-		memset(&info, 0, sizeof(struct i2c_board_info));
-		info.addr = apanel_addr;
-		strlcpy(info.type, "fujitsu_apanel", I2C_NAME_SIZE);
 		i2c_new_client_device(&priv->adapter, &info);
 	}
 
-- 
2.31.1

