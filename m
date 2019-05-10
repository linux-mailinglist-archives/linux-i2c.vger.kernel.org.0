Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A176619D34
	for <lists+linux-i2c@lfdr.de>; Fri, 10 May 2019 14:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfEJM1A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 May 2019 08:27:00 -0400
Received: from mail-it1-f177.google.com ([209.85.166.177]:35203 "EHLO
        mail-it1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfEJM1A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 May 2019 08:27:00 -0400
Received: by mail-it1-f177.google.com with SMTP id u186so8862651ith.0
        for <linux-i2c@vger.kernel.org>; Fri, 10 May 2019 05:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R1gypFlr3IldIGaG92jpg22WD/9Lc/LsKC4OUYz/+xQ=;
        b=pcB5oUkyDJFzFHJ0v7Q1zE2WFYQzbzISkr+O2drmLLcwueYgTbCwTPlu1cMM8zGct9
         a/UXfnbefg3Yl8EI6ro7cA+PWa1b652uic+voBqbzHRsy62+y9hHRIaqsbHy2quhY4fh
         2AGAzmVDXJpHhdsIf5c8O/sc1WLi4NgTbQvyzA/zJtPEOA5AYIrhLewYytNaJdQwwiii
         xoBx96OTn7Cl7AVCvFdb91ScZGabi/yWafMq51a0Z8LRN9D7fbAC9cAxm+GkJHuCY9+X
         bzU2y1ElMFj+dcVbWUWtAXpRUfsoffcWzeeZirVUlJJPs/fSUo1AmaMQq9YGu2K6d9h1
         5SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R1gypFlr3IldIGaG92jpg22WD/9Lc/LsKC4OUYz/+xQ=;
        b=mMa3LXOEf0C2Wp7vnoYquLjKHv4WgPgr3QiWMtQOINWoafvZ3zXm0sl8GUGzDz1iWi
         42u60YE1trNTuRbPWfOWaozidij75cjXyiRFNa/HXqq4mDBjlfYUxwvy29qJqD6u4aV7
         NZq0mAEvcGQPiBV6aR+P7MR8oXC2aPHopDRKg03nBek9F8h8JvCOd7aHj2chCDs71+eZ
         vX2iAowiVd7ZkzZxTpsFMar4Ix4RzeEtucBengOz5i3i6vPzIpD1KuQCxDhFIkVXOf7U
         97OzeBvLlgiNmYpbacznsCdbJemTtwzHKRNOVGoMsIKcy7O99vHuCtB9aFAwWsGl0b3Q
         sRYw==
X-Gm-Message-State: APjAAAXdMaaNk9A/FMq+a/ERnNgi8h3oyilvsi0CV3wTe1nbsRxqinIQ
        VbA+dp4wTua8mwWqyEX/PYxCGEx7oCjIoPwTnDAJcQ==
X-Google-Smtp-Source: APXvYqyDx3/r2jVSiDa1Olz57SehRf7j9AJMKWOrdM5mn+Oa2EAxJJLseT3e3YgGSjrY8IiYckwcgJ9WYUoMATplkBs=
X-Received: by 2002:a24:6b4e:: with SMTP id v75mr7143271itc.74.1557491219611;
 Fri, 10 May 2019 05:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190426132532.10598-1-brgl@bgdev.pl> <20190503131432.GA24385@kunai>
In-Reply-To: <20190503131432.GA24385@kunai>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 May 2019 14:26:48 +0200
Message-ID: <CAMRc=McuS7_n5YvWn6MqZbdsaLgYWMNr6_XEvN9mgpRqBLPXnQ@mail.gmail.com>
Subject: Re: [GIT PULL] at24: updates for v5.2
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pt., 3 maj 2019 o 15:14 Wolfram Sang <wsa@the-dreams.de> napisa=C5=82(a):
>
> On Fri, Apr 26, 2019 at 03:25:32PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Hi Wolfram,
> >
> > please pull the following at24 updates for v5.2. Details are in the
> > signed tag.
>
> Pulled, thanks!
>
> > Bartosz Golaszewski (1):
> >       MAINTAINERS: change my e-mail address for at24
>
> This patch was never on a list, or? May be a mileage thing, I prefer to
> send out even those patches. But as I said, everything pulled...
>

No, I didn't see the need to have this reviewed, but sure, for the
future I'll send out even e-mail changes.

Bart
