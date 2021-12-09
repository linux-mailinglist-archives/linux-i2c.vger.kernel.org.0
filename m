Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E4C46EB5F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbhLIPiJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhLIPiI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 10:38:08 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3183C061746;
        Thu,  9 Dec 2021 07:34:34 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id r25so20397693edq.7;
        Thu, 09 Dec 2021 07:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v7q+b8ru+Ky6lO25qRsnx8MdjQIu6CL1OnWNn18j9rA=;
        b=CKUdXy3kgh5kOICc3cQf8Jmegb7VQw0+KBnTRYoNebDTfC5UxxgRzbmDvpxAktKFeK
         NKy7BcU1YI7AHWjgUVcT7siUYtEkr0oEbqiqTFTGVcu/WR7AcxGs2aYBHIpEKuPEp263
         jXdWJEsFZbIwWrup+zP8mIHtn7swj3o2HjRdCfjAKXmZN25AnGcSn1PKyH5McF+m/C/l
         nWy+KShSstXIV1bA3bikl/TB61SQdsvOrcgrikSkddBnDx0gMNK/7WYXcRNdQnV7nIQu
         PnxvlErkDP2puHqlJ/d7cPeBhq5lcfcp+JK7IrDguPTNELhDqhCGKxqx7KDlfO0DSAH/
         ydIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v7q+b8ru+Ky6lO25qRsnx8MdjQIu6CL1OnWNn18j9rA=;
        b=DD9EonJKQ3RNXfZaeeZjUIv6ksHsiGo6IGGHD0psVs4drmGvn5Fs6tGIIRYYadBglV
         K3vwYlbOR/Ia5mmSvVzuFELHNXJZeiF0G3nMhgMB/qYctr04YBUhJfsNlQ8QbTp+Wjqj
         EfytYb9cWzTn1zWM6yhC6ywHmZNQU+b16GYrKe619WKcpf7IilRMqgOphamBnFWkRiSy
         j4hxLMEyxdix8gMXcVfjY+88osDcFgbFMTWLd8wES+cOYIXiBKDpV9sHt6eI98c9FQyW
         NiM5Mal8X7oIB3lxKo2gUm3vAqsd8g7RsZ5hEMcwqWyojujJbQTYeFclYCSnYzTH8j+v
         iZjQ==
X-Gm-Message-State: AOAM533RxExMq1VVYFxspxKwmO9e9eixVlntzVTxvcIqqQ0EM9gfYVr8
        hBVX/3YwuW8S49Rcl1NSRUbNFNuRtAbHOYlL9Xd5pVoVC2Du3w==
X-Google-Smtp-Source: ABdhPJyWpLtmhRm6GMN81/OCA7635jv2GlCrohxEtBVOLvosfETIwBbIKp5yfLk3RuimXXe/lW1fNxtfojs8t86sG3Q=
X-Received: by 2002:a17:906:bccc:: with SMTP id lw12mr15968050ejb.128.1639063946054;
 Thu, 09 Dec 2021 07:32:26 -0800 (PST)
MIME-Version: 1.0
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com> <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Dec 2021 17:30:53 +0200
Message-ID: <CAHp75VeP_9P+GaD=vXZdQdOjZpdWxUWp+0=yPy0zJefi=qh=oA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: tegra: Add SMBus feature properties
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 9, 2021 at 5:05 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Tegra I2C can use a gpio as an smbus-alert. Document the usage of
> the same.

...

> +optional properties:

Optional

> +- smbalert-gpio: Must contain an entry for the gpio to be used as smbus alert.

-gpios (the suffix in plural form, the singular is a legacy one)

> +  It will be used only if optional smbus-alert property is present.

-- 
With Best Regards,
Andy Shevchenko
