Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137C67C9BF4
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Oct 2023 23:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjJOVe3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Oct 2023 17:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjJOVe2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Oct 2023 17:34:28 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C51C1;
        Sun, 15 Oct 2023 14:34:26 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9bf0ac97fdeso168508066b.2;
        Sun, 15 Oct 2023 14:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697405665; x=1698010465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jw1z4BrIqqDR/qVvxdVmgbHJcCH5Xlnp6mfEh+8shys=;
        b=N5pa/hDOgmoHD2nR0Sy2EdiU5INlC6hvK3MO2CsGILvIfmGG2F+XJMf71FXFaPY65r
         5mcFLxqKXdDRj2FDac2jpSsZaGniHK2gRZPbQb4DszsRzaFaaz6agfzdZM0VMx2gBMw6
         0EhUVg4rQG/WPaALPna4UVOq+UvWjdtsPnSr1CGEiMgEfzvcSfbKCtoMHjdxRTnmA3bd
         RK+DMoDizCbJRNXumiW43mw4PtShTVfsbrvV19I/nhUikz9IXSUIFtLUuFO9N5Py96fa
         /c7gZa+7pLWx6LZvNO/+x9Kwlo6lNWu2wcCgwPJ19M6FVEexg3adHs4/b6kaOR4JHN8a
         N4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697405665; x=1698010465;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jw1z4BrIqqDR/qVvxdVmgbHJcCH5Xlnp6mfEh+8shys=;
        b=QpNfs9HWys/gtvBtOxX2KFn9yOa8ibEU8QAzecvt9PBt5NJYyPDDvvEQi39xaSm3kG
         Svv3XpGfz+eo2hVxErvYoNp8uzeqwA47n500YYxJbGeml2JnxcxtIQ0b8TxtoXkVFEmo
         DkCDXhtsGRMvUwgZlk6cTH9TqvPjmqaO6h0sZGYXqCfwOoUM+0feRwyHGiapKO3Hh/lQ
         aFY6HoehDcIduPshD1aweTXo2m3CGZGHf6QA7rVdguWNHU+Mp/xOAw0+PYDfowmShAzr
         i/vbIlrCkFUX0mNwW0wU5Mz73BQOd3a9V+mWPvs7Scr+9WZPuaD+/aq73YYHqDDxrtbR
         AlQQ==
X-Gm-Message-State: AOJu0YxFeNTlYZctOtieuK5kuStqOXORFegS2yDx2IglcOHiE5ygb8pQ
        2dNpLcRWnyxS/Tx3yKKNZ6I3GdSUAIk=
X-Google-Smtp-Source: AGHT+IH5HQCS8LnexBhkgTKkk1wZZRlchbVEBOx468Hm0RhlCpeA30vA9HYEeZEXd5pQcbf35zMQpg==
X-Received: by 2002:a17:907:360b:b0:9bd:a73a:7a0d with SMTP id bk11-20020a170907360b00b009bda73a7a0dmr5684711ejc.13.1697405665032;
        Sun, 15 Oct 2023 14:34:25 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b8cd:6500:313f:61c6:6f63:8859? (dynamic-2a01-0c23-b8cd-6500-313f-61c6-6f63-8859.c23.pool.telefonica.de. [2a01:c23:b8cd:6500:313f:61c6:6f63:8859])
        by smtp.googlemail.com with ESMTPSA id vl9-20020a170907b60900b0099bccb03eadsm2685462ejc.205.2023.10.15.14.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 14:34:24 -0700 (PDT)
Message-ID: <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
Date:   Sun, 15 Oct 2023 23:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] ACPI: Add helper acpi_use_parent_companion
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In several drivers devices use the ACPI companion of the parent.
Add a helper for this use case to avoid code duplication.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/acpi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index ba3f601b6..89efb1658 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1541,4 +1541,9 @@ static inline void acpi_device_notify(struct device *dev) { }
 static inline void acpi_device_notify_remove(struct device *dev) { }
 #endif
 
+static inline void acpi_use_parent_companion(struct device *dev)
+{
+	ACPI_COMPANION_SET(dev, ACPI_COMPANION(dev->parent));
+}
+
 #endif	/*_LINUX_ACPI_H*/
-- 
2.42.0


