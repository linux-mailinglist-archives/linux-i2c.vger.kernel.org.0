Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BED210852
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 11:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgGAJgX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 05:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729266AbgGAJgU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 05:36:20 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D802BC061755
        for <linux-i2c@vger.kernel.org>; Wed,  1 Jul 2020 02:36:19 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z15so11812955wrl.8
        for <linux-i2c@vger.kernel.org>; Wed, 01 Jul 2020 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=A3Kz0NchE1g9AL+675BMfZoX2zdrniMQZ46N4imRBGA=;
        b=gxzGBaO30l0mwMzc6ub1RdYIdLgG4adijwg0Ft+4UH7YMYdw1W9bYoSw9RtN047hyE
         Lk4yPO/4wU2vkLDjx7HIJiozhIU3zXd770VSbObOqJ5j3dWm36t1B1dbyJlQCy5oQj5m
         DDbJZ4AoYRD4MD19AUZ6o6YAlTZkGq0Vtk4d6eR1alOEMEvTIsdfMr3OslPq5bfEWJky
         9nAW0PLQTbwC7uZRUJkm3DA8Vi/7Im+d61Idlj5T6Yo3Cjmh1tBjC51cWUdOy0VnUTHe
         D1Rrc8rlrEKM0TDcOomIH1jLPZ41wI4/LTlBtCuieg62LoZoHfI5OFRVz2KRnoUxTdPx
         ZVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=A3Kz0NchE1g9AL+675BMfZoX2zdrniMQZ46N4imRBGA=;
        b=h/wDxnizfCbxPAIfj30FinhFUUFyWEUcK8+oNAqJEZaRm5lLwsHMiTvnsJ9UaCoqqz
         53SfboDaMkqcmCZd+/lRzZa07BhXW4qCIiaGNObRlp0dXwLUCNssXiES/rNsmd7NTHJG
         LVr4frGiXhg4HsEvDEfkOBAeOxk129Wy+Xc9V6PvSHijY3QZKws2wkC0sv/wOGUQBLuS
         Ms8e+uZk8iJ36WvgyaUd8WTf8S/fWi8FYXkuiXKpwx6MWwSCkJ/sE5aGx+6JqtKYKlD9
         T1EaiEQpBoG0q5feKjlHVBCuzKHKr+1JvNofbToZkKQg74OcXTLo0QQZq0RxtnaS0s9s
         9EVA==
X-Gm-Message-State: AOAM530nTdhLpqe6SLY94JXJdrEK+Bhn3EBy0b6Dm5K3yLE40OKlY0xA
        /xUKBYCcvb7GwowSf8zN3x26qw==
X-Google-Smtp-Source: ABdhPJw2dae6dc2grKq8BKN4PdQ+VbgT3R4Y7a8vo1lMCWEC5UBhkcxXDuIWSm52Tku7j7tGGwCUGw==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr25752866wrt.108.1593596178621;
        Wed, 01 Jul 2020 02:36:18 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id f14sm7347174wro.90.2020.07.01.02.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:36:17 -0700 (PDT)
Date:   Wed, 1 Jul 2020 10:36:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 26/30] misc: eeprom: at24: Tell the compiler that ACPI
 functions may not be used
Message-ID: <20200701093616.GX1179328@dell>
References: <20200701083118.45744-1-lee.jones@linaro.org>
 <20200701083118.45744-27-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200701083118.45744-27-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

... as is the case when !CONFIG_ACPI.

Fixes the following W=1 kernel build warning:

 drivers/misc/eeprom/at24.c:228:36: warning: ‘at24_acpi_ids’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
- Resending to add the I2C ML and Bartosz to the conversation
  - Looks like I missed them when running get_maintainer.pl
- This patch, like all the others in the set, should go in via Misc
  - Although the patches are orthogonal, this makes life easier for Greg

 drivers/misc/eeprom/at24.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 9ff18d4961ceb..2591c21b2b5d8 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -225,7 +225,7 @@ static const struct of_device_id at24_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, at24_of_match);
 
-static const struct acpi_device_id at24_acpi_ids[] = {
+static const struct acpi_device_id __maybe_unused at24_acpi_ids[] = {
 	{ "INT3499",	(kernel_ulong_t)&at24_data_INT3499 },
 	{ "TPF0001",	(kernel_ulong_t)&at24_data_24c1024 },
 	{ /* END OF LIST */ }
