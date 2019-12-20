Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEEA2127293
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2019 01:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLTAxV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 19:53:21 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:56311 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfLTAxV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 19:53:21 -0500
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1ii6Xf-0006Hc-FB
        for linux-i2c@vger.kernel.org; Fri, 20 Dec 2019 00:53:19 +0000
Received: by mail-wr1-f69.google.com with SMTP id b13so3046980wrx.22
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 16:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=r6cmxM6rKUa5WEmp8g58JXaLKMxJgyJXFiTAqkjbopM=;
        b=VLjOWDnHpK58YXv2WbV58E5GlfSMtz7HP8aqu56gFgt1p3d1N548p+OYTqvVXkmuBN
         pulOXxKzWYjl/WzTebL7RE6YlEXxeE7KIz/nj5MR/jr9xw9J05et82FRvx7EwGDW4aVJ
         ZiwQQcJ6O+0jyMejegOzybUN05852p3YpprTi0zGe/lORaDbxwWY2JaSfAjLxIQIP4w9
         mu3D+v6KrLKlP9rNgYpeONNKV4fc338NUrwrP0Low2AYJVJjgnlXVNkSR7rqNrhLJMuE
         +iSOJSSXzF1xXiIfy9Kgg1VFn9P+ngfTLxz80X18cjCezuXkljSA0HIo8Y8eyZj9sd0O
         Us/Q==
X-Gm-Message-State: APjAAAVs6OkeYNxZb6pFj7gcSSwGp7h3G0lrfxb288Cr6Kn+CScEI3Ah
        6TAB96EToN0tATOP9wnhSoSMhuBBudGyKgDW0a2L6FHVC7w5gURvsmGe2ECD+GTH85SzMs9LoN9
        jsgkoFxdzmQhY02NCzAizHpXKqpG+x2vnMcZwu8SvQ4zFNGkAHh6t+Q==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr12180183wru.40.1576803199227;
        Thu, 19 Dec 2019 16:53:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzdzISWMi9U/prGwTLelorymmIjBxwo5jgA4FzcqLgluj1X1BdArbNRcI00mT67dWeDZDlIovXopF27WYfHnxA=
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr12180172wru.40.1576803198993;
 Thu, 19 Dec 2019 16:53:18 -0800 (PST)
MIME-Version: 1.0
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Fri, 20 Dec 2019 08:53:08 +0800
Message-ID: <CAFv23Qnh2AD-Mgr=v1Ojxaob4aBjUTD+-oLdmyXzBPe0oS6vtw@mail.gmail.com>
Subject: In power saving mode i2c_nvidia_gpu modules affect power consumption
 a lot
To:     Ajay Gupta <ajayg@nvidia.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

We encountered an issue that while switching to power saving mode(use
iGPU), the power consumption goes up to 40 Watt, and after removed
i2c_nvidia_gpu, it becomes 5 Watt.

I've tried to check the driver to see if it can tell it's under power
saving mode and found that the first time you call
gpu_i2c_check_status(), it got 0 from readl(), and the second and the
following readl(), it returns 0xe0000000. It looks like an error code
combined with I2C_MST_CNTL_STATUS_NO_ACK and
I2C_MST_CNTL_STATUS_TIMEOUT.

Moreover, i2c_nvidia_gpu module seems depends on intel_lpss driver
since it provides i2c interface. So if we can to use the above
behavior to check its status, the system have to load intel_lpss
first. But currently, it seems not possible to load modules in our
order.

So, I'm wondering if we have other method to check and not load
i2c_nvidia_gpu module or if it's possible to check why loading
i2c_nvidia_gpu affects power consumption a lot.

Thanks.

Best regards,
AceLan Kao.
