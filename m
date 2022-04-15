Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B779B502E14
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 19:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356038AbiDORCd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 13:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356062AbiDORCb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 13:02:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF8049F0C
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:00 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id u15so16214885ejf.11
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=4EUc5eu3+xvolXArykyKoCVeF73qdK5q1IIqR9wkbGM=;
        b=k7Rn0Dh5HF/+ZQdbHoa4XeQB9O/ghHpSjNNhgFc5cjpqo43wM/5aAVUTQvS9tTKuTM
         31sK/xO+xUrjYO5XUbAcBaFjV0aOF+zKGjCoALa5vML/jDZOgWDY/VAI7SzdbvOwzUkI
         26Ds9E8QW8c/E4s9HrLq37m7LUwqRN9yFWV22y1Fg0k30CzBCA16SvvPbmu6lJtkMK5c
         OHJcg7FR4NIK0bI9mH/KpaIIbydchbGOuutbAQaFyXw/YIuTqljQTlw+68HMWbUgc/QX
         3iz1rmEJuQJNp1L3Gn98QtTqdG6Y5t4pPgImXsWUJqePn5yX/a8LfC5/lW9JQRNwHVIV
         TFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=4EUc5eu3+xvolXArykyKoCVeF73qdK5q1IIqR9wkbGM=;
        b=w4lQ12jqRL+IH1d8v6ZfHDXyHE0aTBflD2SIcpZRVTcwZ8AZtJYikZVWR97pffRqMT
         uB8ERfDtpFaDBh3jbcF6wslhlxr7R0GG0QWSldbY7Z/qeH4IJRQqZl210z44evAiCYQA
         KH6xphmq/8qheAm6aDvq3Mk6tuim0ZwziG4cAJ3UJIfh6Tit/r79kKr5wM/VT5dtvH2b
         z9vZa+azURLlcsvi3julmLvD4Feki5EKSQ3IiunrVq0ZmjeuKg/X0jQb7RBlDwKHUtUJ
         h44/Bf8pPfukV6t6YpPm/IByySQldw5Sk7e6QdwdEApyrtXzd4wIcVVCtw4K2o7SEOO6
         534g==
X-Gm-Message-State: AOAM532eosaY0z0xM58+638hWviTytvX68dZKrbw9dEum4hLA9j/b1F1
        XtIjY0e2C63wY+eFEiM7KmlIBhfm9Is=
X-Google-Smtp-Source: ABdhPJwejEF4sKkrfMsbiUcSh5Ix12v2AZF9My27cpvMnaBMqMA1eE1QPzhbdIfHxlmncgLuetkdyg==
X-Received: by 2002:a17:906:944a:b0:6e8:ac79:2b6e with SMTP id z10-20020a170906944a00b006e8ac792b6emr35194ejx.377.1650041999539;
        Fri, 15 Apr 2022 09:59:59 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id oz20-20020a170906cd1400b006e872188edbsm1849621ejb.104.2022.04.15.09.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 09:59:58 -0700 (PDT)
Message-ID: <08ccd96f-deca-72b9-e14e-917434736ca3@gmail.com>
Date:   Fri, 15 Apr 2022 18:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 2/8] i2c: i801: make FEATURE_HOST_NOTIFY dependent on
 FEATURE_IRQ
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
In-Reply-To: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Host notification uses an interrupt, therefore it makes sense only if
interrupts are enabled. Make this dependency explicit by removing
FEATURE_HOST_NOTIFY if FEATURE_IRQ isn't set.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index c481f121d..eccdc7035 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1756,6 +1756,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dev_info(&dev->dev, "SMBus using %s\n",
 		 priv->features & FEATURE_IRQ ? "PCI interrupt" : "polling");
 
+	if (!(priv->features & FEATURE_IRQ))
+		priv->features &= ~FEATURE_HOST_NOTIFY;
+
 	i801_add_tco(priv);
 
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
-- 
2.35.3


