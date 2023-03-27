Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733B76CAAC5
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 18:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjC0Qhj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 12:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjC0Qhi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 12:37:38 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20351A1
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 09:37:36 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id cu36so8017893vsb.7
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679935056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6RqPYalYEAGyxUFhTZgX8zf4uHQXV7aAfyU++DqjmYg=;
        b=T0i7/Pw4U47NGPVlD4f2M4I1qI+n7RU5fVjuxZebJ412pHJOGBkSaYpDXBd47tXuHK
         DD0DAl7ZDqCV0aJK98cSbCo5kbQhlzT/Es2IA41kD/04bbDFrwEE6+j/8iz0H8aWvycV
         SRCjYFS7yiVmecs6ziW2HH6h1MAZHIKXoJUf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RqPYalYEAGyxUFhTZgX8zf4uHQXV7aAfyU++DqjmYg=;
        b=v2fawVs0Xgw2DI9BXrz25jx27EyUXJIkSTuK5XQ4x4F+HXDcUoNSSl02sHDqGH6Zfp
         mJwaaSGtjBKm5tAcWNN2FomU3hWN4UTQQLBaUxsfrI/+ORJClVfkaii5Jl30cejoclts
         O1h/8R8uGix3zMTCzNX2mQipPszlIvl2Nk6iGpUAdLOrNaWdfpFQm379wyFL1ZO7NT76
         qPSrqheqwp2Txfsm1mfHSAQ2LmphF2eRB+IaljpSYRFPzAE3Ovopagy0H0P2weQf5scx
         9HVTY63a8mCFXAH03KUBmR/Ge8ZMuLIgJSwDf96S3KMQQ2EMAIAQWMyhmpUUcTF16rpK
         6HLw==
X-Gm-Message-State: AAQBX9f498VcKML0FGk1TSvooN7dL0ATYnS/0/Sr0uB4dHt5me36aY/J
        nqmY8DTXZ778ddSxfiMHDbhwz2koJC5vrD/TGmW3SQ==
X-Google-Smtp-Source: AKy350bY3PSG7cr8uHtY3xCvu0ziIlraUw6p3gbR4pFJBZxGDyVckODgmZX25TSaqOAiCG4xgwRn++uzv/8z2JsOfQ0=
X-Received: by 2002:a67:e199:0:b0:416:f1ea:1001 with SMTP id
 e25-20020a67e199000000b00416f1ea1001mr6576127vsl.5.1679935056047; Mon, 27 Mar
 2023 09:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230322210227.464-1-mario.limonciello@amd.com> <20230322210227.464-5-mario.limonciello@amd.com>
In-Reply-To: <20230322210227.464-5-mario.limonciello@amd.com>
From:   Mark Hasemeyer <markhas@chromium.org>
Date:   Mon, 27 Mar 2023 10:37:25 -0600
Message-ID: <CANg-bXBBP61c1kUSKz6fgg2NfjHBO0sgXmqvV=AzUWBket6UFQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] i2c: designware: Add doorbell support for Mendocino
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>  static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
>  {
>         struct psp_i2c_req *req;
> @@ -87,7 +101,7 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
>         req->type = i2c_req_type;
>
>         start = jiffies;
> -       ret = read_poll_timeout(psp_send_i2c_req_cezanne, status,
> +       ret = read_poll_timeout(_psp_send_i2c_req, status,
>                                 (status != -EBUSY),
>                                 PSP_I2C_REQ_RETRY_DELAY_US,
>                                 PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
The timeout error handling message after this has "acquire" and
"release" flopped.

> @@ -275,6 +291,13 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
>         if (psp_i2c_dev)
>                 return -EEXIST;
>
> +       /* Cezanne uses platform mailbox, Mendocino and later use doorbell */
> +       rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> +       if (rdev->device == 0x1630)
> +               _psp_send_i2c_req = psp_send_i2c_req_cezanne;
> +       else
> +               _psp_send_i2c_req = psp_send_i2c_req_mendocino;
Thinking about naming again, perhaps "mendocino" should be dropped
from the function name as the logic applies to all platforms except
cezanne.
