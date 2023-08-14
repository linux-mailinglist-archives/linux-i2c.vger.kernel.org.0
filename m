Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F87477C2CE
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 23:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbjHNVxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 17:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbjHNVxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 17:53:12 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C107E110;
        Mon, 14 Aug 2023 14:52:59 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bc0d39b52cso29423805ad.2;
        Mon, 14 Aug 2023 14:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692049979; x=1692654779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErgZTsUwfqdgH6PT40mXFD/nQxIBR8WLnzNxCoXWjK4=;
        b=RJdNvY1f9I1BtI8sV0sMl4Eb42DKVZPFjPf9Cr9/YoNUN7PCQ3aOV9W1ALK4celB43
         +8dZM7EvQVBExS1Kz5vFQOtY+OmOfc5FL3Kodm6WouLcaGqE9aQQyjbCDMKjjPuKuHY3
         /335eAsXcheUkGoB3WOcEEWKqmNaxdECa4LYNhstlWJBXUsgENQyY4wLX4ICuQckx2Ed
         Fr3uV/ygcN1z3PfmV/BelQTkEWlVsxz3O7RQiFVpPTW9mnlLwHXkQ3MNk8pY1nhuV3VW
         iI2HscxZ036zWX0AR3wW9LUiblkpZ55utxA5poaOc8pNyqbkKQ1dWZ3p870xERXeAOPT
         mVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692049979; x=1692654779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErgZTsUwfqdgH6PT40mXFD/nQxIBR8WLnzNxCoXWjK4=;
        b=TyNJwJRyKDU1KJ7hw4enNVQTmSkjdXLN9wZsGNhtHiOpv7jhLpYWb2rQxejkCkZbTy
         iskKoy+2UIyS+hWhHVSOsU0CNu5AxPGx5p+4lpMy+33+Khwx8iXn2Rd2CHWT/1KXQggl
         3xX7hutbvqIIlPN/rnoVxy3/fKPUCPnKCHJ0xCphvUatQntT9+HBzqGCUhoEQNOsXixp
         OHRgpvgPW5PxNF66gJYv4TSQ4IK4nzJtCSXFQIVSWgS7Ft/5CAHX7uiWovOvaKVIfSjl
         xy13+yCcKv18nf5jPp7UTup1S8VOVdo5zL6p6r6GppklDYJTO+YU8jOXOWOLynRUWcQG
         O8JA==
X-Gm-Message-State: AOJu0Yy8TniN43CTKYWkQ/GGUAEeTqMn1lj6M+Asp49Fb9mRdIwcaWCf
        5RfM5cKywgiHujcKoUQzYm7LV65qp2E=
X-Google-Smtp-Source: AGHT+IEVw7epAZaGmdKs4S4+6bnGSCjZvUmKj71sKSJdD67WcJnHn4gnF0UzRNsj8Pkw81yfC3qGRQ==
X-Received: by 2002:a17:902:d481:b0:1bc:69d0:a024 with SMTP id c1-20020a170902d48100b001bc69d0a024mr12124180plg.33.1692049978951;
        Mon, 14 Aug 2023 14:52:58 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:6c34:7c96:4b56:4eca])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm10056065plb.237.2023.08.14.14.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:52:58 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/4] i2c: start migrating to a pointer in i2c_device_id
Date:   Mon, 14 Aug 2023 14:52:49 -0700
Message-ID: <20230814-i2c-id-rework-v1-1-3e5bc71c49ee@gmail.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
References: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
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

The of_device_id structure uses a void pointer to associate additional
driver-private data with device id, most commonly used to refer to a
structure containing additional characteristics of a particular chip.
However i2c_device_id uses an unsigned long. While it can easily be
converted to a pointer, several drivers use it to store a scalar (and it
is possible to use a pointer in of_device_id to store a scalar value as
well). The worst case comes when OF part of a driver uses pointers,
while legacy part is using scalars, causing constructs like:

	data = device_get_match_data(...);
	if (!data)
		data = &some_array[i2c_match_id(...)->data];
	...

To avoid this introduce a const void "data" pointer to i2c_device_id as
well, so that we can convert drivers one by one, and drop driver_data
member in the end.

The end goal is to clean up all helpers and make device_get_match_data()
work universally for all ACPI, DT, and legacy variants.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/i2c/i2c-core-base.c     | 2 +-
 include/linux/mod_devicetable.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..75d12d79d8f1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -126,7 +126,7 @@ const void *i2c_get_match_data(const struct i2c_client *client)
 		if (!match)
 			return NULL;
 
-		data = (const void *)match->driver_data;
+		data = match->data ?: (const void *)match->driver_data;
 	}
 
 	return data;
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index b0678b093cb2..21ac2a96e828 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,7 +477,8 @@ struct rpmsg_device_id {
 
 struct i2c_device_id {
 	char name[I2C_NAME_SIZE];
-	kernel_ulong_t driver_data;	/* Data private to the driver */
+	kernel_ulong_t driver_data;	/* This field is obsolete */
+	const void *data;		/* Data private to the driver */
 };
 
 /* pci_epf */

-- 
2.41.0.694.ge786442a9b-goog

