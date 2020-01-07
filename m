Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89C441322F2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgAGJvB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:51:01 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40589 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgAGJvB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:51:01 -0500
Received: by mail-lj1-f195.google.com with SMTP id u1so54008393ljk.7
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7lwQwuwfM1iPF6iRTO0yd0IE/lAHtvYOS2zEBwR6gvo=;
        b=ESsRaSk7d2JY56/cgt/nXnrxJgfTupQnEmZZv8fV6TQ7hRK0Q5KWNLW//AWecNq6h9
         Zuk595JfYWxqRW7TXSk1CndHashtdTijfRIWJPHdaW7xPsbvpTL1Y1BZ7Gn4nDMncf8+
         nAedTzlJLdg1/g+osMgihw1mhBQCjIFs9LiyOoAkli5A6O4Qkzril5A2CpjkA3ciGwWl
         AkjWUcUerXOj01PMyJNuFVH5BIRcJY0KA5GIK296ubZhlxOff7rpN1nUxjHNyEc3C6hA
         L+xdcykZQbzzmTl3/zW9ddGJoYMGRGpcG3WeDSQiHSC5+31ioGivnMVPF7/M4v8utBug
         0EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7lwQwuwfM1iPF6iRTO0yd0IE/lAHtvYOS2zEBwR6gvo=;
        b=n2fiO7uOsfxS/JCu95x4Hi/Q1u+DG/AOAODAjmTVjj1FgPIUJ8Jqqzjr9HLjjQ2e+i
         ptK88WPKCzcWYc19RdFhsZd4lSH4FND1t5aSNHeY9YkOQs8H44MW9ri7xMmz6m/7nYWz
         GAbx5TAJYZeE3fmb4qeuojK2EGe/co4+pgVsWo/8M9hsG88qKQIh2QETpH1P5TT0JTIa
         oZHhVX2nC6fc2ZibUMlNYYR81787km2fEkP9mQj0/yAPvMNcn0DVY8ksf3tdZhPay7jf
         bGkXBO/UbrMd2MNZ7/jTrmlqEweP4amd56QOG/+3xJhj1oCcUWCn6wqSh3ntqIKzMM/m
         W9rg==
X-Gm-Message-State: APjAAAUD0BPx9nfyv4f5ObDSRZ1nyGFlRvAB5eIo+db3D6f5qNN7LYi6
        RhHAMnsocHUD5SJRZTHtbNUvnSClDNnS/AgGF2o2JlemKwM=
X-Google-Smtp-Source: APXvYqylGF4/dGdkzkEMlIlEa1r7p28w7YxwevYK0M9wNzYKRMpP+8bfkSDdksAZIgT2FP8fUZHLxVLt/i4WOnPkXbU=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr60234687ljh.42.1578390659474;
 Tue, 07 Jan 2020 01:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com> <20200107092922.18408-2-ktouil@baylibre.com>
In-Reply-To: <20200107092922.18408-2-ktouil@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:50:48 +0100
Message-ID: <CACRpkdZQUzqzHovO6qb7ExGFraTx8ovYgeAaYKADhZPH86hKBw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: nvmem: new optional property wp-gpios
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

On Tue, Jan 7, 2020 at 10:29 AM Khouloud Touil <ktouil@baylibre.com> wrote:

> Several memories have a write-protect pin, that when pulled high, it
> blocks the write operation.
>
> On some boards, this pin is connected to a GPIO and pulled high by
> default, which forces the user to manually change its state before
> writing.
>
> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
>
> Add a new optional property to the device tree binding document, which
> allows to specify the GPIO line to which the write-protect pin is
> connected.
>
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
