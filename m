Return-Path: <linux-i2c+bounces-1258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A661682A205
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 21:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9453C1C22774
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 20:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDC95810B;
	Wed, 10 Jan 2024 20:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4dl1DBc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C158103
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 20:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2bdc3a3c84so108147266b.0
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 12:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704917683; x=1705522483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r6p3qOItLuY2UixPprsZ8WxGQ4HjbFMSwgZxlGyvdZU=;
        b=M4dl1DBcx/f5QxUaVmDkdT3oMgZU0/WbV0rVWp39CEhVtRl8407lWagHWWjcIn184T
         vXH4vH+fYecTnVKzZioELD075WmONpMqXOUVTAE7tF+X8IjEDqvZc8rSeXhO234zP8uG
         Rj3/GFpFADxubRypNWfM8Vk/BURnxNhAWsoPLlXj9KE49JO/97H84Y0IGz7jhzk2jsMe
         QaebRfFhKZhBWarBS6sCGdoHNQXRXS1VeLAmOqE1ieDkOCrK4zKRPDdG5XW09FfZwP2W
         0C8EoCofvrap3P6Dl7lFRe2qtM76XO+n5kNe4P9AMiGTpUuyOkA5fhts3u7TPh97Zpk+
         TfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704917683; x=1705522483;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6p3qOItLuY2UixPprsZ8WxGQ4HjbFMSwgZxlGyvdZU=;
        b=CzsZEys2297Y/bgWEQyy07gK01Ee5RbOfLf4CEXDg0Oxzl/GbEmrzbS5t4ZtYeZJhV
         fIjJjgGuCXx1kybxqTTUVMTqDng/IqV3rWTAxMLyykHqzFzApYE3k3yJKsgY6MWN5xuk
         cOnSCpXU1KomRyeYosKd095J3uSyRdWSMIY7ES7JqmERF4Mz/gWtCzmudJIGxQfHECPW
         u3/bfBD8tKys47OcRBA6ISxZYpW5zVF9hYJIkq2yGUnLDfsoTpDc3rEOLabcaxgfq/gi
         VgXAMoi/8OrDEO68V1/+zA09/cWGOp2qR5W8cxBLqkMgQkPP6Symec6TheyQBdFWAh8T
         LHqA==
X-Gm-Message-State: AOJu0YyMLXqnu1fG3DC7BA3dtZLnSApKG5stclgJ76OQu1Sr+PlOY8R1
	egWqs+POAWtRXwpu7sjgFwE=
X-Google-Smtp-Source: AGHT+IHbfWK3FDkeuocXjBkw4VYw3/ORLIECPqWuaoH8IYMkE4vKHpegA98VIgw3l1XmV70x8vIVnA==
X-Received: by 2002:a17:906:b42:b0:a23:4e3f:a2fd with SMTP id v2-20020a1709060b4200b00a234e3fa2fdmr39772ejg.5.1704917683146;
        Wed, 10 Jan 2024 12:14:43 -0800 (PST)
Received: from ?IPV6:2a01:c23:bd4e:3500:5df0:e74e:ef8d:49d1? (dynamic-2a01-0c23-bd4e-3500-5df0-e74e-ef8d-49d1.c23.pool.telefonica.de. [2a01:c23:bd4e:3500:5df0:e74e:ef8d:49d1])
        by smtp.googlemail.com with ESMTPSA id lk19-20020a170906cb1300b00a2c20c5f444sm264915ejb.6.2024.01.10.12.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 12:14:42 -0800 (PST)
Message-ID: <53e5c71a-d954-4211-91a1-de067451d532@gmail.com>
Date: Wed, 10 Jan 2024 21:14:42 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] i2c: mux: add basic support for calling i2c_register_spd
 on muxed bus segments
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <fc057deb-49f9-49cf-9549-13b2538ed92b@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <fc057deb-49f9-49cf-9549-13b2538ed92b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This extension allows mux drivers to instruct i2c_mux_add_adapter to
call i2c_register_spd. First user of this feature will be gpio mux.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-mux.c   | 4 ++++
 include/linux/i2c-mux.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 57ff09f18..ada9c764f 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -22,6 +22,7 @@
 #include <linux/acpi.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
+#include <linux/i2c-smbus.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -429,6 +430,9 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	dev_info(&parent->dev, "Added multiplexed i2c bus %d\n",
 		 i2c_adapter_id(&priv->adap));
 
+	if (muxc->register_spd)
+		i2c_register_spd(&priv->adap);
+
 	muxc->adapter[muxc->num_adapters++] = &priv->adap;
 	return 0;
 
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 98ef73b7c..ec51d9bc4 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -21,6 +21,7 @@ struct i2c_mux_core {
 	unsigned int mux_locked:1;
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
+	unsigned int register_spd:1;
 
 	void *priv;
 
-- 
2.43.0



