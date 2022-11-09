Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A080C622DF1
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Nov 2022 15:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbiKIOaX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Nov 2022 09:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbiKIOaS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Nov 2022 09:30:18 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADB41F9F1
        for <linux-i2c@vger.kernel.org>; Wed,  9 Nov 2022 06:30:17 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id a13so27574962edj.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Nov 2022 06:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2exQy+rK75dSnSRHEgsdoD6BiAMCjOGrIjHxqTi8vw=;
        b=La/BxWHk8ROJTnqh+alVNyjVhDtcjF54svcmA4LRv5ein3C1o6WooKgtVzjD9KPM+S
         lHsePGRdzx09xAaL1RA/cLSmw863sKTjbadSWQgBaBSgUaf3dQ4lk8K+TicfLTF6QAmA
         zfdBo1VSmOO/dtBWyXlaDGhAeR8IdoN9i18q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2exQy+rK75dSnSRHEgsdoD6BiAMCjOGrIjHxqTi8vw=;
        b=OO2XJOIrTmBdDqaxTti5OqtaLT84T0LyeV5Olfjn7jc1SxObSvV1tuAz8GvRGCKM/c
         B08RfP6oPxI2wtv8BvEwqojD1npNiVuLuwAo1T/CkGT4cpw79luZj1+1UDCi7QvpjIOS
         or2nE4Oh5fFY0xeoIEfnSo8+2ZoIFkQytQ6iTFbVR68giLUutzqrT8E1jVkwFSQV2Wij
         D20E3gI8GRxyaeuBRXjsV7UODYYr0vvijiUKOoeNfxQGhEet+nMiuHL6Yu85yiVJwctH
         7J3S6m9VoXox2JuphYtjZIMLMFEJGMFoBHnlV5wNhwemoWi3PduT+vv3X7wO0P2V73WM
         Xzpg==
X-Gm-Message-State: ACrzQf3TZ64Ht5xJXyCbVbwHs6AHhXuJwKApGwnYBykYUYCMCCsENYAM
        X5RFT7y9Rfi1PxqyrV4CEDYdlw==
X-Google-Smtp-Source: AMsMyM7aUwjCf+C8yDIHmZIsPvh34XMRkaxpyHP0OUKIZ+Uab+LY9HrEA0Z2wS9nOpwxuzB2oFmtUg==
X-Received: by 2002:a05:6402:241d:b0:463:e963:5149 with SMTP id t29-20020a056402241d00b00463e9635149mr1002227eda.219.1668004215769;
        Wed, 09 Nov 2022 06:30:15 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:7487:46db:8e12:c768])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7c1d9000000b0044dbecdcd29sm7020389edp.12.2022.11.09.06.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:30:15 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 09 Nov 2022 15:29:48 +0100
Subject: [PATCH v1 1/1] i2c: Restore initial power state on probe failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221109-i2c-waive-v1-1-ed70a99b990d@chromium.org>
References: <20221109-i2c-waive-v1-0-ed70a99b990d@chromium.org>
In-Reply-To: <20221109-i2c-waive-v1-0-ed70a99b990d@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hidenori Kobayashi <hidenorik@google.com>,
        linux-i2c@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=1/gktLwGWXSrMTHDXZfZ00iimvdmig+4+JGVMAVIz7Q=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBja7lzqyjfbDUAGMHNNT7NQ7twdE6AbLSE7O8hZuYl
 tEjAuk6JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY2u5cwAKCRDRN9E+zzrEiHo6EA
 CQYTIX9z3Ju3O8mosQxqNKSgBYv9P8StVftkoZPRbyuDFjYgXctjFV4Z3esFDbQDEIbpotXxS1AYE+
 pIFtqDLl0kz4MROqac1FgiQVtQ3NOfjE8Pb4Xc/SbuJ3LMPC66NJ5nPqZIaEDw5dpWPgJ0Qy0GxgdI
 sdgyWKjJfAJHNtCkV+f/Ek7qyoAnv/t5f+1aLB2hY2QbX7fagaw5qii5YYJgkzqW4WuW5tgvLjYFTu
 OWFK7fW5Hiexp+X0+qp2DIaNSn1UWT89GitU8HjuwQLH0K/hIxAFZc1BJawoguqJq+WzZXvcor2QgJ
 dj2aYF99PWcVr5aHRmSXJD9Y+eey5Y3DVl21dWEunTkCFRWApG+Gy2u8aly27bEliBpAc7frOpxkmg
 /cTIkVz4POeUQhxe6WZCNIxpM+c7TIINyb92oJsK4424lI0Zlx96oktkcZ/WgRIm8QtoDrQ+O+D98u
 Zwz8fRcnih9Mo1aM0K/2v1Ai5UfaYb69lYZruludBz7Kx2XKTcWZPbKuoASt4d9Gp+0nkmMkPln3TY
 XZJLgc9mr22X65Y7uJvFmBw6CaoOv9PP4Qsl5jxizY0fT8oEQY9/kxe2F4ilrrAUqfM30FUP0uxIc4
 1QEEA8M9mhE9S+XP7mwlduSRzsIpoIBm8EejZDtsZy6skz2ddhJWdnfGMzjw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A driver that supports I2C_DRV_ACPI_WAIVE_D0_PROBE is not expected to
power off a device that it has not powered on previously.

For devices operating in "full_power" mode, the first call to
`i2c_acpi_waive_d0_probe` will return 0, which means that the device
will be turned on with `dev_pm_domain_attach`.

If probe fails, the second call to `i2c_acpi_waive_d0_probe` will return
1, which means that the device will not be turned off. This is, it will
be left in a different power state. Lets fix it.

Fixes: b18c1ad685d9 ("i2c: Allow an ACPI driver to manage the device's power state during probe")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b4edf10e8fd0..be59c40f5beb 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -467,6 +467,7 @@ static int i2c_device_probe(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
 	struct i2c_driver	*driver;
+	bool do_power_on;
 	int status;
 
 	if (!client)
@@ -545,8 +546,8 @@ static int i2c_device_probe(struct device *dev)
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
-	status = dev_pm_domain_attach(&client->dev,
-				      !i2c_acpi_waive_d0_probe(dev));
+	do_power_on = !i2c_acpi_waive_d0_probe(dev);
+	status = dev_pm_domain_attach(&client->dev, do_power_on);
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -585,7 +586,7 @@ static int i2c_device_probe(struct device *dev)
 err_release_driver_resources:
 	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
+	dev_pm_domain_detach(&client->dev, do_power_on);
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);

-- 
b4 0.11.0-dev-d93f8
