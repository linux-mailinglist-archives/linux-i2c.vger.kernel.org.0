Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42096C518D
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 18:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCVRCZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 13:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjCVRCW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 13:02:22 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B113B3F9
        for <linux-i2c@vger.kernel.org>; Wed, 22 Mar 2023 10:01:57 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id n17so13119367uaj.10
        for <linux-i2c@vger.kernel.org>; Wed, 22 Mar 2023 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679504515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yS/9N+AwBllIqXlokv2Xx7Y2kyB9tDNA/jGFzKjANCg=;
        b=mW2WtieZf51QiA7C2qYiyhqafWdEew+rgGMoPwgDiraQIfknm5W23/Zm4uuSjZR8RJ
         2II8inYioRr6KA5Qe52A1cDUPKGRb16lcZJB/vnY2QHi2o1JKiuDNT8GTy8O4e4UDExT
         GsNtUoPziCykWHBM5NJxSkTCmF7t+XZLe4YYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679504515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yS/9N+AwBllIqXlokv2Xx7Y2kyB9tDNA/jGFzKjANCg=;
        b=U9Bnx/siFNqk5fa2JFqnxKe/SGDAT/wJPbAUDixldaMddppFuYufyTKsvNDJY04DNk
         gUWKkQBz5eVKvHqBsXmwh5shoGpzkVGITysaOBhnCrcmzEpdyblZqFibDM3QpcdZnZG0
         h9c7CDWz8NYO+PiDGVXr0BiHA1tWJFZAqbHaEFGxK38kJQ057Sl+6aMPR/m5WiEYDdk/
         3pZhI53sraKGhHMWdK9rRYvQzJE+juCNMH7xdYut60drUWsF1ZkfhHuBvYrJuxAZ5fuV
         W9ijYNs/EnR1lHuyFux3EZ/4hyPbjcH9C/vdVZm7uQtQn6x9PDD/cIrYZnbvYatjWcat
         5CJQ==
X-Gm-Message-State: AAQBX9cz/60JhUkqLgAtq86m7ts6BPT0CCmz1OvkvbTfqK+gm587MK3n
        O6V2iSyEyGJaAT0OKxofCP4FKycAYMnbr2JnRVQ/MA==
X-Google-Smtp-Source: AKy350ZPt124UGqenEATMXxRuvuhLKLkeDtjNRbYNtr/KSNGcur0gxee8ufCHtlRVPN8q9G2RRzfeaGAf+ns/JpCTcU=
X-Received: by 2002:ab0:3c8c:0:b0:68a:8f33:9567 with SMTP id
 a12-20020ab03c8c000000b0068a8f339567mr4186778uax.2.1679504515355; Wed, 22 Mar
 2023 10:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230321212822.5714-1-mario.limonciello@amd.com> <20230321212822.5714-4-mario.limonciello@amd.com>
In-Reply-To: <20230321212822.5714-4-mario.limonciello@amd.com>
From:   Mark Hasemeyer <markhas@chromium.org>
Date:   Wed, 22 Mar 2023 11:01:44 -0600
Message-ID: <CANg-bXANgkrF4T4X_VgeVejA2wH3GrUiFORyRC4AZfgYrE+7DQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] i2c: designware: Add doorbell support for Mendocino
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Held Felix <Felix.Held@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> +static int psp_send_i2c_req_mendocino(enum psp_i2c_req_type i2c_req_type)
> +{
> +       int status, ret;
> +
> +       ret = read_poll_timeout(psp_ring_platform_doorbell, status,
> +                               (status != -EBUSY),
> +                               PSP_I2C_REQ_RETRY_DELAY_US,
> +                               PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
> +                               0, i2c_req_type);
> +       if (ret)
> +               dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
> +                       (i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
> +                       "release" : "acquire");
> +
> +       return ret ? ret : status;
> +}

I think we need the value of the PSP_CMDRESP_STS field returned to the caller
and its status checked like in psp_send_i2c_req_cezanne. Otherwise the function
won't continue to poll when the PSP_I2C_REQ_STS_BUS_BUSY bit is set.

FYI - there's a test on ChromeOS to stress test I2C bus arbitration:
https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/tast-tests/src/chromiumos/tast/local/bundles/cros/hwsec/tpm_contest.go
I can try to run it assuming the ToT kernel runs on skyrim.
