Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD28D2C601
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 13:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbfE1L7i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 07:59:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43285 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbfE1L7i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 07:59:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id z5so17407623lji.10
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2019 04:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+or866nusWv4sIZAHRqBmPt7yJXa7/be8EsGR10LEm8=;
        b=VshVblWVa8bBpOKLD1nlhbSgP7XvLRsdjffLU59Xbt+lrg42lWiHBq3sFNPwzwxYiC
         51y4aQj/Eil5ih2XZV8i/R0NSJOi8NcSUWIfpm9ICzJBoNCzIh6zBpzoyt4asPQQMeIX
         2oQHj48gWAdhGAW2dM2KB0PNVvPqfxTss9NfV+zGbhR5VU7QGBvhCEugB3VIqrdFuttH
         dtvEDujFr1oAMvcmdHsigyTN34jrW8GIqrrVslcj1ZmcRTzqqc7vBNmwnSBdjhn3S3O2
         91xSR6v8qJWF+msox/ZeTcGrXU52utJRkpA6qCEMLN2v8GXnmmmCIca9shIKBXU2BR6L
         Xrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+or866nusWv4sIZAHRqBmPt7yJXa7/be8EsGR10LEm8=;
        b=X5UHiWOZY7fSqy2cIo9dBTJsbhG57N5oXzTtHRYi1nSjzAaz9axBwhHOBdKcJ2ydfq
         yFlbWxSZjfgFmnucVJ/CSrxP2zkoGCKWmLmAlZVf2yIoQGrgCJ4YYlNbK7tqYH5TnT0m
         M/sISUBgiwem1XHwJd88eOQhRW0dgiVO0t3ri6ReXMiD4BxCT2Mqyf7ABqL09qYt4l6D
         JZeUZ3u8rHnY4F8TKoNStY1AQ+PGW1yRtIDJut6lWVMjx7HaG5PqR9d/STV2LEZZtCKJ
         hDg9dAH8o21xsozkvtUGHwY0dF7Ok/0RddktEgiAud3w7cv7Ju2fI/FIlgG4xb/bcodK
         0D5A==
X-Gm-Message-State: APjAAAUgw1FaTtHv73IHaLC9LTae7q6hKz1t4lgchR+X3pLlyiqkebB7
        uV4rNQSnMLUoVkgkc8OzaIt1fAPUNCqSHFvTKBExcRf+
X-Google-Smtp-Source: APXvYqyxBMj2RX54aqttzirIb6LKh0hs5CrIZypA2bJ5dInIZSVvqwJsryS8pV4YU5/ob64LgpBMPki6YntwhXJKick=
X-Received: by 2002:a2e:2b8f:: with SMTP id r15mr32444998ljr.196.1559044776905;
 Tue, 28 May 2019 04:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190521082137.2889-1-wsa@the-dreams.de> <20190521082137.2889-5-wsa@the-dreams.de>
In-Reply-To: <20190521082137.2889-5-wsa@the-dreams.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 May 2019 13:59:25 +0200
Message-ID: <CACRpkdYUA_tOFLpk7GEnAfqp+vyLCu6PDGLngCYG1E0F6RUkow@mail.gmail.com>
Subject: Re: [PATCH 4/8] MAINTAINERS: add I2C DT bindings to Nomadik/U300 platforms
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 10:21 AM Wolfram Sang <wsa@the-dreams.de> wrote:

> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
