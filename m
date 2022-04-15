Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4264C502E13
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 19:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356033AbiDORCc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 13:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356054AbiDORC3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 13:02:29 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C648B3E5C9
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 09:59:59 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b15so10519294edn.4
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=J0MymH7xtuu9E48UR9lg1o6xdrHIesht/4b5Wb50scs=;
        b=ChFHSrLLHfk+v+xhFOgz0Ou9lj2yJJPnZvBJTZS4hXK6BnWm8urfGusOKe8X6uP6vv
         OYBjb4TOpWkwDKCQpNti3z2aI3VY3xwapCtEI66T+5vF9orNkREca0xzmEddL1yAK62L
         P7WzJETBQePvFtc1iBmDWxMVgCt4auHjeHhu4/swWCNhgNQPobNK5+TgSXg/IXSPaoUt
         Fl9Zrtkl85GXyJV1dUSBOnDqvAEkYYeEEoaHARWY7hQLk7154xN2utnQsBfwHpQBHrN5
         XI3+ezGDagGKDpW/dpZzSj+xnOvzki6b7OsWGL/Wi2cg41NVNjT4PiPOsuju6xZAa30J
         ak5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=J0MymH7xtuu9E48UR9lg1o6xdrHIesht/4b5Wb50scs=;
        b=rU4DlNVd6s0cyQJBhnizU3rlDuVa9NJvu5k85YJ5qM+ToQWkS9+4jLYIxlexI9R4Mm
         PHNL5y7wF17ep/OlnpMzhakkucjoxyZkWm8s6SENvUq1ic2linwOmk5bNeNxhUwNohr4
         AtayzlBzwp1iZyulQwqWGURDvuuAgbDLzm/9S7j2YQpgvV8wzrD5HWQbgmjcMgJWMIPK
         SDq9n16cHU2G7grBBvNVIc4AHY9EDzSTygwzPl4ZdrlR92iAorpUkKmeO2tLWgHru0EV
         SFa5puCDKKuGYWIHYER8OmdnbJ4q3chpDjWafUk3P2vsFnmS9+z9DpLzZPib+iK1V8NL
         bPPg==
X-Gm-Message-State: AOAM531kFT3Zlcmaosyzcy6YzcCDahuGL72Bhn5SOQcbR96EDNbZcXNz
        FMcpeSMjbjGKMspx4Ghlam8DmT8c9Qk=
X-Google-Smtp-Source: ABdhPJwa0P0d7u/ram1ThJ5YXF2F281QeMBTG3sctlUeBBES5l36Oj7uZ5aN0kNhIVi1Uh7HIg6xDA==
X-Received: by 2002:aa7:c793:0:b0:408:4a69:90b4 with SMTP id n19-20020aa7c793000000b004084a6990b4mr194081eds.58.1650041998274;
        Fri, 15 Apr 2022 09:59:58 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id 10-20020a170906310a00b006e834953b55sm1803245ejx.27.2022.04.15.09.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 09:59:57 -0700 (PDT)
Message-ID: <05bec021-6958-0157-b825-619ac21ddd41@gmail.com>
Date:   Fri, 15 Apr 2022 18:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 1/8] i2c: i801: improve interrupt handler
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

Not sure if it can happen, but better play safe: If SMBHSTSTS_BYTE_DONE
and an error flag is set, then don't trust the result and skip calling
i801_isr_byte_done(). In addition clear status bit SMBHSTSTS_BYTE_DONE
in the main interrupt handler, this allows to simplify the code a
little.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ff706349b..c481f121d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -556,9 +556,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 		/* Write next byte, except for IRQ after last byte */
 		outb_p(priv->data[++priv->count], SMBBLKDAT(priv));
 	}
-
-	/* Clear BYTE_DONE to continue with next byte */
-	outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
 }
 
 static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
@@ -588,7 +585,6 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
  *      BUS_ERR - SMI# transaction collision
  *      FAILED - transaction was canceled due to a KILL request
  *    When any of these occur, update ->status and signal completion.
- *    ->status must be cleared before kicking off the next transaction.
  *
  * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
  *    occurs for each byte of a byte-by-byte to prepare the next byte.
@@ -613,23 +609,18 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	}
 
 	status = inb_p(SMBHSTSTS(priv));
-	if (status & SMBHSTSTS_BYTE_DONE)
+	if ((status & SMBHSTSTS_BYTE_DONE) && !(status & STATUS_ERROR_FLAGS))
 		i801_isr_byte_done(priv);
 
 	/*
-	 * Clear remaining IRQ sources: Completion of last command, errors
-	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
-	 * assertion independently of the interrupt generation being blocked
-	 * or not so clear it always when the status is set.
-	 */
-	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
-	if (status)
-		outb_p(status, SMBHSTSTS(priv));
-	status &= ~SMBHSTSTS_SMBALERT_STS; /* SMB_ALERT not reported */
-	/*
-	 * Report transaction result.
-	 * ->status must be cleared before the next transaction is started.
+	 * Clear IRQ sources: SMB_ALERT status is set after signal assertion
+	 * independently of the interrupt generation being blocked or not
+	 * so clear it always when the status is set.
 	 */
+	status &= STATUS_FLAGS | SMBHSTSTS_SMBALERT_STS;
+	outb_p(status, SMBHSTSTS(priv));
+
+	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 	if (status) {
 		priv->status = status;
 		complete(&priv->done);
-- 
2.35.3


