Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D48107279
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 13:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfKVMxU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 07:53:20 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39921 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfKVMxU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 07:53:20 -0500
Received: by mail-lf1-f66.google.com with SMTP id f18so5429827lfj.6
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2019 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8R7NEDueibHtXFqup1VmL6iM+bPcC4QfocIAUJQOdI=;
        b=aUmmmSwS2BYNFlhTaRJt05gbgpUdl9bPc4u0dViAnMhe+39FKwYcZ5ZbeMtu0YMR1h
         IMtow+JySIg9ZfoOQcJsSD/0nbQjROkqD6bY4pZTUS3tDkGvX6a01RAXLscAvxSzD0nA
         QSwbypkiAWDMoz1jmGm5iQLWssZx0ubVG0s79UqJYD4tV/dLycPSBlAe2pOFK1fOICeb
         9M95KnzCyYm10ONh5r8//OSi9ZBVIVnqYEKeCycfswYit/q0p8sEk1NafChgug73axNQ
         iJJITbdBMZAhgOUSLghwYkJFa37E99WBLRwet4NYoBaWRLBNqWoXFbu2MaVgLIcX2UbL
         RVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8R7NEDueibHtXFqup1VmL6iM+bPcC4QfocIAUJQOdI=;
        b=sbLa7NaIsczuTw/aD5m9hBghq1x9Fk0GMWteqtSbNLROnjesLi8vBBTx0b3qAwzksW
         33M+qnebATkNKSGzYtISmu4XysRc1BAyNx0hZHgtcClJ8MDRrvYoxEmM163ntk9YuQu6
         T6j/2LjWy/flDzg4MIQ2AzrAAII+S6m0iG/w9KPj1+avkfCxQ8ROpgwEKfAjbCEO7HcW
         w/kYePHM5q0LopGTScM5zkb/dflMisdMIjvgINi4d3WVb4Ga2tgaS+C9nwltY75WACpQ
         PIsuexZakmYEpPeD/kgq/YlK00OrJjsQ3Ue26esJFcb32AQLioHyH6hU625MUnwVnacd
         7H+Q==
X-Gm-Message-State: APjAAAVLfg6m8g3y2qRRzB7amp3M8WkU99IYRAwx7JVMKc5nFTDtn8ak
        J8DheZzHQFUsdqubdFxSoleAy1Z4KlAKfLQyDINZcw==
X-Google-Smtp-Source: APXvYqzhVgwHKTyzMPjQyHHyWrIQkpIHO0Ex+y6b1ZbPxxQDU2ZwtOXL6oUU6aMJgcHt3uty1B7pTB2/1uRI8XbC7yM=
X-Received: by 2002:a19:f701:: with SMTP id z1mr6862942lfe.133.1574427198426;
 Fri, 22 Nov 2019 04:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20191120142038.30746-1-ktouil@baylibre.com> <20191120142038.30746-2-ktouil@baylibre.com>
 <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com> <CAMpxmJWSgYjcGdR7Zrj-=nA+H8cYfZUriHQPxN=8zgPDvD-wTA@mail.gmail.com>
In-Reply-To: <CAMpxmJWSgYjcGdR7Zrj-=nA+H8cYfZUriHQPxN=8zgPDvD-wTA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 13:53:07 +0100
Message-ID: <CACRpkdaW82pgQivc0VVgqqVv4fgXxMyGD3Lo8YHcMK7aGPDKaw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Khouloud Touil <ktouil@baylibre.com>,
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

On Fri, Nov 22, 2019 at 1:47 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> what about the existing bindings for at24 that don't mandate the
> active-low flag? I'm afraid this would break the support for this
> specific chip or lead to code duplication if we had this in both nvmem
> and at24 with different logic.

Hm yeah I realized this when I read patches 3 & 4.

I would to like this:

1. Add a new generic property
   writeprotect-gpios that mandates to use GPIO_ACTIVE_LOW
   and use this in the new example

2. Deprecate wp-gpios in the binding, keep it around but deprecated.

3. Add a quirk to gpiolib-of in the manner of the other quirks there
   (like for SPI) so that if we are dealing with some EEPROM node
   like at24 and the flag is zero, tag on GPIO_ACTIVE_LOW on
   the descriptor.

The driver will now handle the semantic of both cases
with gpiolib-of providing a quirk for the old binding.

This is how we solved this type of problem before.

Yours,
Linus Walleij
