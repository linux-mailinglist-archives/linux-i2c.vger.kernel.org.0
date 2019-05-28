Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF1272CACB
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 17:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfE1P6C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 11:58:02 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:37825 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfE1P6C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 11:58:02 -0400
Received: by mail-it1-f196.google.com with SMTP id m140so4729668itg.2
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2019 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g3S8V898KrtaLMYYer30d+6LM21W+xCw3zo/Db9YNw4=;
        b=roT870VFUPQ0MNzilTwWdOiUBmWnMAZbgQJRtn8kcd8z75FP+0T8PW0FZFjEFqJHuG
         5cSnKsgdL0p30g9WudUhWBtnkLkreenvPUIgHLqL/0hqfp2CeVfL+mbEKzw2jqxbgCO8
         1YSdhMUjhWcOS20bd6/9nSMYpDy31XBjWJRYfIIw7bCyxrO6tjXwuGZk9fxnpfM7ea0f
         wGuB5dNj97tR0j8XxpERzD9dWwkaGPus0TO8b8kuRG+gR0eRCiwwxhCtPoJRsDXCswQo
         fcqKAdIKfD/JQV/PIdRSIj2SChv9pRQMbh4i27q7JhXjIliKYeURlC2sEnIU8DoWb9lB
         cX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g3S8V898KrtaLMYYer30d+6LM21W+xCw3zo/Db9YNw4=;
        b=r9mK7IOnsfExTPaMcd9PCHNxIIra86XmiPgwDvVx0MjCwDgnHbjBVm+nQlpO/m/IzU
         CE456JDVV3iR9iTPItn6G5p4w5JIoWdlyJDTrHUpb24rMoFHa7U46Zi5Tvm4gbzt5RTh
         AlLIQhM9R7JIuJ3jwHClGLjGDcoSvQSbdWPAwMumi8K7eaagZXBulvjQomprQ8bmkx3Y
         pg0ecccc9onvSIYK0rBEWXXgW9aWg/Ygn73Ufk1xWZOdPiJj5QWJu8/fF1fB3LWlXRIr
         fCfXctkoHmGwV3PQvUQAPrh1oO/KH3DMQJZOmpH7dsqOjFBhRfT2unNOrMfyhE8XpmfF
         WNMw==
X-Gm-Message-State: APjAAAVMLCqodFShemkakd8HMxzUHo+pScI8Cze2CBdO/xGdSQWAXCEp
        fnuCjAlDYW+ijNnGCcaZaRueGWvDETWrKi/jLM8B8Q==
X-Google-Smtp-Source: APXvYqyiignG339gUzN02NFeFY66ElaccoOh5CWmax+f/WhuJDVJM0kEGWSiDE+SCy+BkUpUsrYkAERmmg6qFpXCca0=
X-Received: by 2002:a05:660c:917:: with SMTP id s23mr3632489itj.166.1559059081244;
 Tue, 28 May 2019 08:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190520071042.21072-1-brgl@bgdev.pl> <20190520071042.21072-2-brgl@bgdev.pl>
 <20190520130837.iglqohsyi5kyj55y@katana>
In-Reply-To: <20190520130837.iglqohsyi5kyj55y@katana>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 28 May 2019 17:57:50 +0200
Message-ID: <CAMRc=MdcY0Qx2ZDM7ogwc8BH-cT61ovukg=U6G8k9ZDgR488UQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] eeprom: at24: use devm_i2c_new_dummy_device()
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pon., 20 maj 2019 o 15:08 Wolfram Sang <wsa@the-dreams.de> napisa=C5=82(a):
>
> On Mon, May 20, 2019 at 09:10:41AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Now that it's upstream, use the resource managed version
> > of i2c_new_dummy_device().
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Looks good now (not tested, though):
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks!
>

Applied.

Bart
