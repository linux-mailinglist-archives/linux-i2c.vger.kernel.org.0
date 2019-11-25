Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C261A109349
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 19:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbfKYSJZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 13:09:25 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40698 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfKYSJZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 13:09:25 -0500
Received: by mail-ed1-f67.google.com with SMTP id p59so13622081edp.7
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8k9NL1wzPDm3lyi5ftkOv0GY++AVKfR4SbL9MgMbNCg=;
        b=XQYfeqnqTmxDAu3JGyN9kyojY1pRl0Q3NusiT8XASycZxpFrtPd8ERwaV2X/Tr47M3
         qnjtiB6OhHdZjVuwfi08WAVjWzOM/wPG6/+nIBCvmln3bEQDbQgz2n63tLQx75HT8D27
         eDnvZPq1zk3vr57dDLdi6rkvciiyPWNK+3/zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8k9NL1wzPDm3lyi5ftkOv0GY++AVKfR4SbL9MgMbNCg=;
        b=kRqDFK3loMNwpeeFdMYIaRKaBbhHOxvinWWqnR3Ylr4T+N+s4Vzk0cP1vwmYghfjrg
         eKW2jeD+bOVtJ0tgmQl5Q7uDqVHiRtwm8+0D3qE6gxHFSRmSnlGi87SfsGsQl/F7oZNm
         gzEbDgYAxhh5SKdbF9whR1p9D2rvAiecUpxKtV8Y48LX4n/iTIxyo5qgKH/xDAOctGYg
         Mn/A1w4+oZ1pUY2Kbhq5e6Wy/y9Ak1NUNKGnLB067JnEpHSCrewR4CzCPs/9eeCjc6JZ
         8ZxO1ZwtAEYXFPlix2+UuQ0d7lNXXvtrU3jv+cF5QgWVvzX6Fv0D1RV3eu7H51dZL6Gg
         ZqhA==
X-Gm-Message-State: APjAAAXH3HV5MNVUpajtE3dE6hYO8r/mIxTXbTF+RlA9q8k62X5EwVUk
        ZLem/oRpbKh+NC16J8D94ntYgWUxEQ4=
X-Google-Smtp-Source: APXvYqxYe+JrLdFVUOYWdAm4s6HeHE1FpJPd7zK8F7dJbB4U8w1qFTyVn45fCrEr88sw81PmXYv0xA==
X-Received: by 2002:aa7:d2cf:: with SMTP id k15mr19990335edr.267.1574705363956;
        Mon, 25 Nov 2019 10:09:23 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id v5sm282875edd.90.2019.11.25.10.09.22
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2019 10:09:23 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id t2so19320198wrr.1
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 10:09:22 -0800 (PST)
X-Received: by 2002:a5d:5224:: with SMTP id i4mr32928062wra.303.1574705362276;
 Mon, 25 Nov 2019 10:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20191121090620.75569-1-akshu.agrawal@amd.com>
In-Reply-To: <20191121090620.75569-1-akshu.agrawal@amd.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 25 Nov 2019 11:09:11 -0700
X-Gmail-Original-Message-ID: <CAHQZ30DB4E3SY8QQdL=jTp+Zx2OvjW6ih6kCSBiaRpiy5Wcj6g@mail.gmail.com>
Message-ID: <CAHQZ30DB4E3SY8QQdL=jTp+Zx2OvjW6ih6kCSBiaRpiy5Wcj6g@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-cros-ec-tunnel: Fix slave device enumeration
To:     Akshu Agrawal <akshu.agrawal@amd.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 21, 2019 at 2:06 AM Akshu Agrawal <akshu.agrawal@amd.com> wrote:
>
> During adding of the adapter the slave device registration
> use to fail as the acpi companion field was not populated.
>
> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
> ---
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> index c551aa96a2e3..aca8070393bd 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -273,6 +273,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
>         bus->adap.dev.parent = &pdev->dev;
>         bus->adap.dev.of_node = np;
>         bus->adap.retries = I2C_MAX_RETRIES;
> +       ACPI_COMPANION_SET(&bus->adap.dev, ACPI_COMPANION(&pdev->dev));
>
>         err = i2c_add_adapter(&bus->adap);
>         if (err)
> --
> 2.17.1
>

Acked-by: Raul E Rangel <rrangel@chromium.org>
