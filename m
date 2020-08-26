Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF54252B7A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 12:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgHZKiO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 06:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbgHZKiL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 06:38:11 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042CAC061574;
        Wed, 26 Aug 2020 03:38:11 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id v16so695127plo.1;
        Wed, 26 Aug 2020 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0Y6Q0TCirrZ7EH7PZeLiKVtJktRjRtt1OK24qTlq+Tg=;
        b=q4iia6oAcCDyfqStFnxBNCBzGRak3z0/HjQpNbWUTi75n+svBiFnAk5Pd//YjhWoAg
         eK0lM69r9MpxcZuQRBrwtmPAnx4O8xY42SOMJBjpoDDwD+hX1jtc9S9uB5Dxgxc/9dM+
         5wU8+P64Q709QhQdlsRDorJ9ru6fUKcYdmYvh8Bh6ytuf1/Gs7B3QDF8iovxd/OL7qU8
         r92ZpuTQZWxcf68lewVbhDH0BqCOcgGBlgagxgzd+rneZuFB2r7VlBEj1p9I8PmL8mj5
         7oG7H5Lk5V+kG+1Ei8HdQrjFxs5yZuEDc42/yX96McVHc5M/sNsEhwwNewwVrX99/fhy
         OAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Y6Q0TCirrZ7EH7PZeLiKVtJktRjRtt1OK24qTlq+Tg=;
        b=ZKmXO5lMAvv+ssfAmqOtXGNW7G/4uh/LLa5ypLqNEw524EdhhiNtHRvB3DtpxuD2UE
         lEhWxBxLgdgBOcNcTSPYH/c7JUcyMF0ytOuLzzk4frbknQk4FcXu0PbWeO5L3+IXlX53
         cZLS63ff7UIro/V+WIgGkUFkjIYtzTyuXyhumhVxGbHnP87OEWDIsq5IZVBcRWJQ9fCT
         ECEko6+f0MG+aCGYA/Q5zRTIaLtpAcXFawjNe/RWDPcJQYmJAIo6YMQonfTLHNzv7LgF
         nyM6xEmE9aOjCvoYVYjW/qfrlEsSPBUAkT3oaWQk7NJDK1cCRuotghGeAXAqQINrRFFR
         5bRA==
X-Gm-Message-State: AOAM531/SJgWD8lxlAy9JBNbTz+zO8Dwc26mIVaDF098FufkR691Y7RR
        ixxOozYzIFH9wpHVfVLDn3k=
X-Google-Smtp-Source: ABdhPJzrzFNcD02aszag+XQSJiPTd/D4SiK/bs8h9jBRb5o0aQ7ahzpSU2+Pd+s1VDWjbqrMNAi2UA==
X-Received: by 2002:a17:90b:4a46:: with SMTP id lb6mr5590574pjb.107.1598438290449;
        Wed, 26 Aug 2020 03:38:10 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id p20sm1752956pjz.49.2020.08.26.03.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 03:38:09 -0700 (PDT)
Date:   Wed, 26 Aug 2020 19:38:07 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826103807.GD8849@jagdpanzerIV.localdomain>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
 <20200826095356.GG1891694@smile.fi.intel.com>
 <20200826095617.GH1891694@smile.fi.intel.com>
 <20200826102411.GC8849@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826102411.GC8849@jagdpanzerIV.localdomain>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/08/26 19:24), Sergey Senozhatsky wrote:
> > But then the question is why we have this code in the ->probe() at all?
> > ->match() is run before probe by bus core, no?
> 
> That's a good question.

Everything seem to be working OK on my test board with this patch:

---

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5ec082e2039d..77eea5c0bc71 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -475,17 +475,6 @@ static int i2c_device_probe(struct device *dev)
 
 	driver = to_i2c_driver(dev->driver);
 
-	/*
-	 * An I2C ID table is not mandatory, if and only if, a suitable OF
-	 * or ACPI ID table is supplied for the probing device.
-	 */
-	if (!driver->id_table &&
-	    !acpi_driver_match_device(dev, dev->driver) &&
-	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
-		status = -ENODEV;
-		goto put_sync_adapter;
-	}
-
 	if (client->flags & I2C_CLIENT_WAKE) {
 		int wakeirq;
 
