Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA443DCBF7
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhHAOY4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbhHAOY4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:24:56 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D263C06175F
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:48 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id h14so18190712wrx.10
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M8jq2GSwxUyQHPbFcbHhL19hRaynArgfI2wbsJp+rRM=;
        b=ms8DDCHxgHTgTL4xhcrbDL9/wkqiNPnyc+i/yVe+U68xwTH1JkzUh2cE1m8RSlRcA8
         X2LPnsfye4ennPOFOhFo8AISry+ViECtmZ/ibn1yWBmFi8W270asj++gL/okck8Id0pM
         92BJbnS9aQftFAvcU/65icFXBbZbJkMSJeN4okllPSF+uBu2al9ZiB0KLJNplbq1IkIT
         7Nc6ptQCgRIi/ylSaSrNqS6CfvOT8UkYh2xqj1R0pEwAFQmABD42vx/tlmsFoHXhS6+a
         MGiUUu3esuCshGNJLqzGH+Fbwu7m+6BpxzCmkJgwL6Q9ZwCAkHKrXASFoaJgUADhF1ds
         SPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M8jq2GSwxUyQHPbFcbHhL19hRaynArgfI2wbsJp+rRM=;
        b=kg9YaGn8DNJjaDTFXRvghd70Xvy22gJxlvym4s8jUpTm4B2ggYA9K+YsTbs5boc6iA
         ih9jQjSS823ryrjdUR1BTh+9hN42yuokXGZHg0hrt97ITQ2xJs53L6HVn6Xb3GcqhdDc
         vrkweUKMTYjXAjngwKy+QrXaH7d9IDhwoK9XrQKwG0bW+8JuFaVHODc7m7KZ2kkRMlYn
         apr8D5MBbL7PKjH/iMX2mVPLgASTBMYRWSIGoSk9e8ILS/TLjyOl7pHeYoY97nLgUm42
         pRExj+pf6Bn62L4+nlTSnTO0P4WRxeOR1WooW1V2j6bItKJklMHqlKf4HXo7mHLojWr2
         lzTg==
X-Gm-Message-State: AOAM532t9WQpRe8/lDh93BEctjSjzpD3wYSQL7REaevr+JvHYwF0M/GZ
        1kWZAsu+AKvjU7yp0C4qPuWEtwirtaB5AQ==
X-Google-Smtp-Source: ABdhPJzn4ztkBn4/Sa2p6xm1+MFmTPki0WPuWQm7U4YhTIpRcLdDzFU1sZhGrJSR9H641xr0Cnt3hg==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr12934920wrn.362.1627827885879;
        Sun, 01 Aug 2021 07:24:45 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id i7sm8509841wre.64.2021.08.01.07.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:45 -0700 (PDT)
Subject: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com>
Date:   Sun, 1 Aug 2021 16:16:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drivers should not call pm_runtime_allow(), see
Documentation/power/pci.rst. Therefore remove the call and leave this
to user space. Also remove the not needed call to pm_runtime_forbid().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 92ec291c0..362e74761 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1891,7 +1891,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
 	pm_runtime_use_autosuspend(&dev->dev);
 	pm_runtime_put_autosuspend(&dev->dev);
-	pm_runtime_allow(&dev->dev);
 
 	return 0;
 }
@@ -1900,7 +1899,6 @@ static void i801_remove(struct pci_dev *dev)
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
-	pm_runtime_forbid(&dev->dev);
 	pm_runtime_get_noresume(&dev->dev);
 
 	i801_disable_host_notify(priv);
-- 
2.32.0


