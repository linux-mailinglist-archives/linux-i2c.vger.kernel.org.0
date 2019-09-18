Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C4FB6B8A
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2019 21:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbfIRTDj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Sep 2019 15:03:39 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38455 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbfIRTDi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Sep 2019 15:03:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id u28so470957lfc.5
        for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2019 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FIxcmAv8Po+czY66H7vvvtaXyWmCwGyyWI4O3j01+mA=;
        b=EsmVEzq19JVOk1cxULtjZcJs4Iioe/J/ot0dhBe+67+Wr5xqdgNOOOV43ylIRXSwPW
         RWYcYMVP0sfHCohLpBDidM7I6SBijQg1LVQ/B/7pSoAc+t/JKz6Z5HSOR4oP8Q04+rwA
         ANqiISTCEEC4qcWcXT0n988u0ONPsMOZrgrd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIxcmAv8Po+czY66H7vvvtaXyWmCwGyyWI4O3j01+mA=;
        b=Zi4nbtTg9/ol513014scj92n/e/SDjEbuRpFp8sU8dj2HdOPyyCUE+jj4kfg9Is2JX
         Bjrhma8mT7kVs7w6nDWrlwGqzMMsMG9GCmcz4NNr0P8f/wMQgwTR4+iucf6oNOP0a936
         YJ9w64AfringU7b8Ih14u7KloLj43+ReAtGareuamSWUZD5LhCFTpV3GsgyKW8REerAp
         CP2ZXn7lOpjwU1fLQS9N7g41kr/8IQPDc37uVMsKObcvgJ5lP6d8zOo7A3sIydgvOyZU
         PQYif8W5TIt359n4gMFNqwOT9h6ptqxdFFxYNCmgAR0lb0gzE4/3SmXXB2Mr5XS7OEJY
         Zy7Q==
X-Gm-Message-State: APjAAAW3ugKKsg1mGbvPqF9shLj0gCXcUFWias4xefnCWCpaBzvfreS9
        yjvzIxROuY3krD1caSiMycXspgMGzd8=
X-Google-Smtp-Source: APXvYqwj9vZeUF1LUe//gaSAZ/gLHh4mCycBP3AfkfuobDFRe5LDlN7VWkTNSRTe9laxC+eOHRbQkA==
X-Received: by 2002:a05:6512:14c:: with SMTP id m12mr2800671lfo.27.1568833415387;
        Wed, 18 Sep 2019 12:03:35 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 196sm1176055ljj.76.2019.09.18.12.03.34
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2019 12:03:35 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id y23so1031834ljn.5
        for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2019 12:03:34 -0700 (PDT)
X-Received: by 2002:a2e:8943:: with SMTP id b3mr3094106ljk.165.1568833413723;
 Wed, 18 Sep 2019 12:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190918170952.GT2596@sirena.co.uk> <20190918185257.GC1933777@kroah.com>
In-Reply-To: <20190918185257.GC1933777@kroah.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 18 Sep 2019 12:03:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whreYmsU_AQtzDS5gd3yamYJ72gBo+YekYSyJLPQ1Qo-A@mail.gmail.com>
Message-ID: <CAHk-=whreYmsU_AQtzDS5gd3yamYJ72gBo+YekYSyJLPQ1Qo-A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 18, 2019 at 11:53 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 18, 2019 at 06:09:52PM +0100, Mark Brown wrote:
> >
> > After merging the driver-core tree, today's linux-next build
> > for arm64 allmodconfig failed like this:
>
> Wait, I thought Linus said this fixup was now resolved.  What went
> wrong?

I think this is purely a linux-next build failure.

I do full allmodconfig builds between each merge I do, and what
happened is that as part of the LED merge, I removed the
no-longer-used 'i2c_acpi_find_match_adapter()' to resolve that build
warning.

Then linux-next presumably merged my tree with the driver-core tree,
and that re-instated the use of i2c_acpi_find_match_adapter() - which
was now gone.

But when *I* merged the driver-core tree, I did the merge fixup
correctly to actually re-instate not only the use, but also re-instate
the removed function that now had a use again.

> Linus, should I submit a fix for this?

My tree should be fine, and I really think this is just a temporary
linux-next effect from the above. I think linux-next only handled the
actual syntactic conflicts, not the semantic conflict of "function had
been removed to avoid build error from previous merge, and needed to
be brought back"

Knock wood.

              Linus
