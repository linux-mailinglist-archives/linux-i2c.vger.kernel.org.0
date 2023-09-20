Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010737A7A0A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 13:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbjITLHo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 07:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbjITLHn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 07:07:43 -0400
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com [IPv6:2607:f8b0:4864:20::24a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F16B4
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 04:07:36 -0700 (PDT)
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-3ade1002692so3199865b6e.1
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695208056; x=1695812856; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u02BBGPGfX0yPbijfRs1PCNnIlPGBgpzZObvNQnBP78=;
        b=RagfjL065TwaUxB9dZe+bGjXa6J93nA+UGkrkn86LVHZ/VXYUm9+UdT0Fqt+xTjCLK
         7ASs3TDnYc4r87Sbsa5/vX7PcH6brxFrleTUloyOnaFTYeW17oXQqjtKFBfrbkCKH4vb
         DWiv5m25KppF71ndrg48hy/9+2sqVuseLovaXqw2l246du178d9hz38PhlGy0HnlqdDG
         HCFlcAQ+0MkXoecyURbvIYjvq6UE2xrN+MYYsrMHraQqOo+9GfHBNBBoNRVxCrZt0Fc9
         dZNWKKsuTkXJMONmCnxQmMiA1Tdd2Ma4KTMbMBqHj0twv39bN8mihKUInDQYQVYCL4/a
         VTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695208056; x=1695812856;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u02BBGPGfX0yPbijfRs1PCNnIlPGBgpzZObvNQnBP78=;
        b=rzmZM2/3YI2BfrIn0gzMO/NysC/vC7BoLuk7MR9z2okBH2q+wNxhYDWb4OO3XjbYm4
         YjiaakEb/MizXfqcVF7u1PDlNZ3kXUfWo5UJc3B5lecOTKjWDy1iBeDgkGGcbKj/2c1k
         AKSydQxww2A6hvQojRsEmCBxPOzGLHqbXcH1JBq5irs/nZU0SC0UiZEgwasGhzBapZaZ
         2jgLyuWDHn/w5IUbgu/449UvZjU75XktOFZW2LubmKBK9grcm0Z8rtQfTIPGiFs+Mni2
         qLRmwXVj5U47Fpa0tKY6hkGTtFXNIrlpAGIAKgeBm+N6JnPBFPhfXDaPCnMvc8drO9Zr
         QoFA==
X-Gm-Message-State: AOJu0YztM6AG6QHxl5F/B3Ps4VU8ozzFWAd9jQjkL2cnVv4jKwVNbn6S
        HGD2fWvKda6N+M8CDh7AopTmJX9Iar8+P0zqaQ==
X-Google-Smtp-Source: AGHT+IE115b88HcBODPWahXYHJ0j40viadxpeRWbQ4t1GGOfk/djKEXImG98c+ybEVTBRw5IQmhnWJpaXy8orLNGFQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6808:19a8:b0:3a7:7e66:2197 with
 SMTP id bj40-20020a05680819a800b003a77e662197mr1072227oib.2.1695208055987;
 Wed, 20 Sep 2023 04:07:35 -0700 (PDT)
Date:   Wed, 20 Sep 2023 11:07:35 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHbSCmUC/yWNuw7CMAwAf6XyjKUkCKrwK4ghdQ310DSy6QNV/
 Xci2O6Wux2MVdjg1uygvIjJlKv4UwM0pPxilL46BBfOLgaH9tZM5YO9ysJqKIGwm834j2VaWcd ESJjixfm2u8bWe6i9ovyU7fe6P47jC9mtn657AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695208054; l=1809;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=43KHe364FJHinbfAf5b51PqpKyrOTl6pEsGjXdoYGGk=; b=eHtC0NjEj+DC+VenI5onyQtBNvqXdaXL9USn7KK2KyrqhUYYw7P14M/xRG/+v1dI6/SLaffNx
 BstvDQQ+GdLAUG418aw8Fsrorxtz2WZN/2c296ApqokqUhaW/aQjr8p
X-Mailer: b4 0.12.3
Message-ID: <20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-v1-1-0a3e9a107f8a@google.com>
Subject: [PATCH] i2c: replace deprecated strncpy
From:   Justin Stitt <justinstitt@google.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

`info.type` is expected to be NUL-terminated judging by its use in
`i2c_new_client_device()` wherein it is used to populate `client->name`:
|	strscpy(client->name, info->type, sizeof(client->name));

NUL-padding is not required and even if it was, `client` is already
zero-initialized.

Considering the two points from above, a suitable replacement is
`strscpy` [2] due to the fact that it guarantees NUL-termination on the
destination buffer without unnecessarily NUL-padding.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/i2c/busses/i2c-powermac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 4996a628fdae..8e57ebe595be 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -231,7 +231,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	struct i2c_board_info info = {};
 	struct i2c_client *newdev;
 
-	strncpy(info.type, type, sizeof(info.type));
+	strscpy(info.type, type, sizeof(info.type));
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))

---
base-commit: 2cf0f715623872823a72e451243bbf555d10d032
change-id: 20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-a95017b69711

Best regards,
--
Justin Stitt <justinstitt@google.com>

