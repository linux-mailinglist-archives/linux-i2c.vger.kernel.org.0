Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD5011FF70
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 09:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfLPIKI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 03:10:08 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:36643 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfLPIKF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 03:10:05 -0500
Received: by mail-vk1-f193.google.com with SMTP id i4so1377691vkc.3
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2019 00:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OaW5Hnc1v0arti4eZTySZ/4BhiMhUg3N5njmRM9tic4=;
        b=y8bMJA3mew2fcZQ7cpXVf/KhayFi/B2k/6eZ6N9Sv26pXuVqEg0g0meW5SHvNxQfq1
         CXwOdlE68eobeKxZqVXVuPhvmAKrGBZ00op1yOHOqf2RzzZdbivN1O9T7iqMgHbtag1E
         VwmOxqjG6r1lXxi/Bd4ob/QiGnbJlx+9Lu8ssLMLyoKWTFehEF3qpaCr65WL/1kTblAG
         9beDIfbJ4JyuJkm7MsuQyUcsPH+1zGPW3RNrZr2X6/HicmoX3P81W77kszgcHAAcSs8G
         McuF9QkoLFHowla+BmUpoKkQvBWQlDRfJ3F6f+bUotqCHKyHtS6h6fzgLXT6tDAI0Da1
         FeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OaW5Hnc1v0arti4eZTySZ/4BhiMhUg3N5njmRM9tic4=;
        b=Jg2VjxnmXnSYYtz7PqhCwidB4M7ArszLHdeHImhWH6ovg+1VSRZFq/bRM5h+FHx3Zh
         HOKfg8m4DwigDaUYz/Eopo9sGIW7uzMsSigQbmdidYvw2XH7TZBSCjIrkuMhsBZ6gWo9
         7uqOhIqypBxn923J241U+QAK4Ij4JGJ1E3TyOVFGVCCSZJ8+bubwzQRqqSNQNRy5r2kS
         WEaB96L1AoV3YrNJ6usk7eOP2qOytApKh74RcOZ+4E8iYLw7bIi6PZsi0ygYWb7w+r6T
         YTjxhpM8J27os5vC+aai/DmXhZY5LSSU9jB9aTNiSquTOUB0f3r0OoZyShtjmg4Aef9Z
         X5BA==
X-Gm-Message-State: APjAAAVdcVAKZ21xMFyOKzBovBISobfIxU1fb1N7FPTx8hZyuXmFvG7d
        Cm5hS76jyUj6pXBEPt7Gugh6MPOCXyF6qGmPWIGTaw==
X-Google-Smtp-Source: APXvYqxrAb1mbxQGpITUr96izDI9QHkdc32NxrkBD2ZJlXCzk+6QUM2DiUNw2b1ZYAJSZRzpOYold++C0qlU8ALpepg=
X-Received: by 2002:a1f:add3:: with SMTP id w202mr1458047vke.30.1576483803676;
 Mon, 16 Dec 2019 00:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20191210154157.21930-1-ktouil@baylibre.com> <20191210154157.21930-3-ktouil@baylibre.com>
In-Reply-To: <20191210154157.21930-3-ktouil@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:09:52 +0100
Message-ID: <CACRpkdZPO+nBA=H0qJUiSq2iA0BDg=n3Ez5wPgnrtLc3MYdpJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] nvmem: add support for the write-protect pin
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 10, 2019 at 4:42 PM Khouloud Touil <ktouil@baylibre.com> wrote:

> The write-protect pin handling looks like a standard property that
> could benefit other users if available in the core nvmem framework.
>
> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
>
> There was a suggestion for introducing the gpiodesc from pdata, but
> as pdata is already removed it could be replaced by adding it to
> nvmem_config.
>
> Reference: https://lists.96boards.org/pipermail/dev/2018-August/001056.html
>
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>

This is consistent IMO, we just specify that WP is active high
as in "when it is high, it actively protects against writing", so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
