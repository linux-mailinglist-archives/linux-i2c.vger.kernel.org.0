Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5735411FF7B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 09:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfLPINc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 03:13:32 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:45869 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfLPINc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 03:13:32 -0500
Received: by mail-ua1-f66.google.com with SMTP id 59so1749691uap.12
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2019 00:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xn4dNigwlhxAQyKm9gOJN6QkFcnPQMlJTzy6sb2QOwk=;
        b=Io/Hf5q7xSuHylwL4OacRp4P2PsiZyoZaYrdRYlxqQKP0mShYWfBf+OMhO/2Np5ORk
         fbAabr9vNzYuqtaPzEs9468vWGCNFq6L07CpSEQEZDdQry1M0dq7J63v6z64SWxPOAwf
         aBsKNENdCTw1nW9p7XIYQuyMxASCHpUlj5HAzZvecr+WMA9OvIhKR8QH6qkSHxJvT/sV
         8QWyZr0vsXuIHqdImqYvcvVW/I2GLZFBKq/RBYiJ/t94ixC6bqbpO5tBZVkMH5O/SwID
         fpTlS9kNGShue2P7WPTC5Xv2q8hEBVLvMg4kHJ1x4kG+jy4ihbaykjFCICEm8rKO27mI
         0ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xn4dNigwlhxAQyKm9gOJN6QkFcnPQMlJTzy6sb2QOwk=;
        b=PMfXmNxRJQ6AgvqDwsk+Oni06BHR8CeNJQ/dr8Fd6AjpLiVWCc1zpPAHj6Y7twayp7
         m9c92YYFh4m/bsS3znAHCZXWeUafM32fCeNhDAz1U/e621WT0iJWPqewlbM6zq22BJ8O
         XqaiPXXkhREDFiA325LkBlH98ZUylfPea7clWTyVrx6Q1lsuMAAIHe7mIfUKHiXv3Pnk
         FtfmAL+GJujfiB1Z7R7iXIVAXnNrjDaIARv0wW+Dk/R0+N9n3kKsRhoNaCeRSdDsYPb0
         NYMR+zbCB44NMD7p0HaR6DtjYaehuIAO5dag41fWrVBNbBiKJ9hk3MsrCslt3C/hE/wD
         7kqg==
X-Gm-Message-State: APjAAAVZFHqgC+SEOncih0I1WkOIxnYPhhFM6EBi6invz2KaOf48PqVm
        zebHfkE49Acf9+lZj6Kl/R2+rgmK9DzhdK0kd13Qiy6P/5w=
X-Google-Smtp-Source: APXvYqzf6JCyaHJwxPnWzJiB8wq7OgYE7mfA/OKhvFmoPueU8tPGA+C3vAw/23I1YgLjMrghbr0yx4mgW9xyWoMeQRY=
X-Received: by 2002:ab0:1c0a:: with SMTP id a10mr22253217uaj.140.1576484011659;
 Mon, 16 Dec 2019 00:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20191210154157.21930-1-ktouil@baylibre.com> <20191210154157.21930-5-ktouil@baylibre.com>
In-Reply-To: <20191210154157.21930-5-ktouil@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:13:20 +0100
Message-ID: <CACRpkdbHLv2R+XvCjCaEgaztUqpmHWCmSAqHABkkstJREkmfVw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] eeprom: at24: remove the write-protect pin support
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

> NVMEM framework is an interface for the at24 EEPROMs as well as for
> other drivers, instead of passing the wp-gpios over the different
> drivers each time, it would be better to pass it over the NVMEM
> subsystem once and for all.
>
> Removing the support for the write-protect pin after adding it to the
> NVMEM subsystem.
>
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>

I wonder if this needs to be in the same patch that adds it to
the NVMEM subsystem, so as to avoid both code paths being
taken between the two patches (bisectability..)

However that is not the biggest thing in the universe and I'm
no bisectability-perfectionist, so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
