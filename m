Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C8977C2D1
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 23:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbjHNVxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 17:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjHNVxL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 17:53:11 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475EF10D4;
        Mon, 14 Aug 2023 14:52:58 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bcd4b5ebbaso4216599a34.1;
        Mon, 14 Aug 2023 14:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692049977; x=1692654777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n1R1WXrApDTpPMiuXag0vYYD+DKTHhIsjxwdfwQF34c=;
        b=jk3BXLVMv5ObzQDZSWLhIqTNNQGbEGx8Rgvra8W02e5cIT6mTaeAlW5W6nVOgkkH2X
         YoT9e44kAM2Rl6kZB/axaZTJPbLcZ1aWBbpN6qnP5koPwNmWAdfDf/Dr6x0ucnUqu4KH
         jWncrWuKcdDqCOuIIaHOKyZhPAk0PEsOjNlftyKMnu12QOxlG6ztYprE8aOKfiCmfGeH
         J9hC7lO2eXbnOJIciOd9QhHALHvB+BNUECQjnhRJ/+vtSsHzGeu3LGkhuIBiAqxxMeXU
         JVBKBGEAS89R42bWnsSh8TVMIP7QveiCLJgoq5LQ1vZiowRfMyDxqx0kI4yRWFsUceZi
         cqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692049977; x=1692654777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1R1WXrApDTpPMiuXag0vYYD+DKTHhIsjxwdfwQF34c=;
        b=HDCe2hUm/HO5SaLkEMxa0AOd+A/pjInXrr2DN2h2r8GjOlJODjfxwmXqOoHPkfb1nL
         CQCuj85MWvMJ+NwOkoXlf92eBBYysgOb8KWZnDYOcTNRX8uRisCqJA/LS5umGTOaEgDC
         FkC6NkcNsQfLg2/TLe2y5u/yxLGjb2qU4dOnNNw4wp4hmd25Dw04chmo1/ynpgXHhRl1
         TMVk2ZpmDRWlSR6TGF4wpbHxXEqfzB0W82S3e/1gAC1yRRxshWhg4yH/KWptNKZ3hwsW
         7vfiwHZChiCZ/Z25YD3r+laA8C1D6tx1iA/mYsjZdHJzU7SoZNvzu1i3ADjyEfupduzN
         K0wA==
X-Gm-Message-State: AOJu0YzmRH+gDAt6YnYydbClXrC1cedNWGwe4g0aq0ctwUpEE5iF6iQV
        EB1S9YpbOF5rMivedi00M1I=
X-Google-Smtp-Source: AGHT+IG2wr/9xdC6isl0fE5wCJPCEXPq0xR3+yw7AWVZHY41HpkWeRE21piRGVkjhwHm8lDo3Rz7yQ==
X-Received: by 2002:a05:6870:82ab:b0:1bf:bf72:6085 with SMTP id q43-20020a05687082ab00b001bfbf726085mr12568324oae.17.1692049977418;
        Mon, 14 Aug 2023 14:52:57 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:6c34:7c96:4b56:4eca])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm10056065plb.237.2023.08.14.14.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:52:57 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/4] Start unification of of_device_id and i2c_device_id
Date:   Mon, 14 Aug 2023 14:52:48 -0700
Message-ID: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-099c9
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_device_id is using unsigned long as driver data, whereas
of_device_id is using a void pointer. Normally drivers use them both as
either a pointer or a scalar, but in some cases driver's authors chose
to treat one as a pointer and another as a scalar that is being used as
an index in array of chip-specific data, i.e. something like this:

	data = device_get_match_data(...);
	if (!data) {
		id = i2c_client_get_device_id(...);
		data = &some_array[id->driver_data];
	}

This makes it hard to turn device_get_match_data() into truly generic
function working well for ACPI and DT, as well as for legacy cases.

So let's try to switch i2c_device_id to also use a void pointer and
first switch drivers with the patterns above to it, and then the rest of
them.

I did a conversion of a couple of drivers in i2c to illustrate.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      i2c: start migrating to a pointer in i2c_device_id
      i2c: mux: ltc4306: convert to using a pointer in i2c_device_id
      i2c: mux: pca954x: convert to using a pointer in i2c_device_id
      i2c: slave-eeprom: convert to using a pointer in i2c_device_id

 drivers/i2c/i2c-core-base.c         |  2 +-
 drivers/i2c/i2c-slave-eeprom.c      | 99 ++++++++++++++++++++++++-------------
 drivers/i2c/muxes/i2c-mux-ltc4306.c |  7 ++-
 drivers/i2c/muxes/i2c-mux-pca954x.c | 28 +++++------
 include/linux/mod_devicetable.h     |  3 +-
 5 files changed, 86 insertions(+), 53 deletions(-)
---
base-commit: 21ef7b1e17d039053edaeaf41142423810572741
change-id: 20230814-i2c-id-rework-9a4742e9ee52

Best regards,
-- 
Dmitry

