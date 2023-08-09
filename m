Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4D27776AE8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 23:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjHIVZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 17:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjHIVZs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 17:25:48 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC78810DC
        for <linux-i2c@vger.kernel.org>; Wed,  9 Aug 2023 14:25:44 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58667d06607so4391447b3.1
        for <linux-i2c@vger.kernel.org>; Wed, 09 Aug 2023 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691616344; x=1692221144;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f9IA4VRf5s9KilAL2p48TkUCprDEkC/a1VvexeDrj98=;
        b=dOATPQ7iS0JO1AkunR0tNZolLIVjYX20xMbVpRiVQxbFjNbwKDpDUwmUHtnq1rRLIs
         rRbW5LuSwKJTXSY3xDE4OLA4ayGjaxlEhEuoRE3YlPGi11TT57pSZtPSHr8godYXp0kw
         BWXwerfHy7E1qgSv0FlTrmk7Kem16dJ5by84hFfYhgNuhblD0JRUa8g5aFywyUAP4jl+
         ZQSLz5U7Wi2slTxcm15/0rbtNUiCuryagC6MkITnPK9FwsVOkSRcOV49s34S6+sTspd3
         FcTALFpb6ZrZHorIUhL0kpB9RRzfRqu09Z0Hl/XZLsxu6y4Bd6aJasAzoITLI2Z6DOl0
         mNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616344; x=1692221144;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9IA4VRf5s9KilAL2p48TkUCprDEkC/a1VvexeDrj98=;
        b=CSuoDaTGR0mPY46WYEaXQhxE7d1pxpTV5hsfl3gd2tkX8UZuag3ihBxw6irbgqzCz6
         IDRmPrFQtsXpiWyE/q4MznicT7HUbaVev0ToqwaiTiyt7zpsGy/9EkmsYipZZe9oya6a
         D2ig3n/tY/RdHoOmghF8FuImbI/iuJ8zL6laQPBL525v0XdWhw/AjUP/ZjvuWpqNO9p3
         z7p00dO5DUAStaqlVkH3+pjkoqUhVzA81b37jYY//L8uqcFu1o5gSHYk9MCwAymsgqtg
         7a10zXVyLAluz5cKSrzaWCO0EWEzdkpeHS+ZESzKO/QU7wEpx59GPHGIZYyBd6J5/uY4
         id3w==
X-Gm-Message-State: AOJu0YyQTzK0n7sdogPkYUAQjsdwUiHX4cWc/TVd3hXb/6Taeuwo7Grh
        Jab+xoABl+zQIYIcsywpAV4obSuPWfcDMouxhg==
X-Google-Smtp-Source: AGHT+IHmWhQRw7zjLbA6uwLJAyfMzKym8d1VFdTg3xFVzdhsVwo+jvguNBI/0YxEPsma+8E69eIZjuvHAaG/iklJmw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:ae5d:0:b0:555:cd45:bc3a with SMTP
 id g29-20020a81ae5d000000b00555cd45bc3amr7686ywk.9.1691616344006; Wed, 09 Aug
 2023 14:25:44 -0700 (PDT)
Date:   Wed, 09 Aug 2023 21:25:34 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE4E1GQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwNL3eSkHF1DSwNj3URzA0NzA0sTUwtTYyWg8oKi1LTMCrBR0bG1tQC XJFjoWgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691616342; l=752;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=FtW6hZH73XFuu5e5Bpu5qUCSAUpxVZ9gts49xFeXa4Y=; b=584daAHzX1kV9qkGHNMgA2HBkKPc5hKMsPR4KiLUys8HQpD5yUnwspzdsha0Gy6gZR7BdvZkB
 p8rXNK6PBvFCdqmnguTz/nBrsuZILkc2amvwPxEbIFpSco/Odd6npVK
X-Mailer: b4 0.12.3
Message-ID: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
Subject: [PATCH 0/2] i2c: fix -Wvoid-pointer-to-enum-cast warnings
From:   Justin Stitt <justinstitt@google.com>
To:     Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
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

This patch series fixes two instances of -Wvoid-pointer-to-enum-cast
warnings present when building with W=1

Link: https://github.com/ClangBuiltLinux/linux/issues/1903
Link: https://github.com/ClangBuiltLinux/linux/issues/1904
Link: https://github.com/ClangBuiltLinux/linux/issues/1910

---
Justin Stitt (2):
      i2c: i2c-bcm-iproc: fix -Wvoid-pointer-to-enum-cast warning
      i2c: i2c-rcar: fix -Wvoid-pointer-to-enum-cast warning

 drivers/i2c/busses/i2c-bcm-iproc.c | 2 +-
 drivers/i2c/busses/i2c-rcar.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: c1a515d3c0270628df8ae5f5118ba859b85464a2
change-id: 20230809-cbl-1903-a70170945853

Best regards,
--
Justin Stitt <justinstitt@google.com>

