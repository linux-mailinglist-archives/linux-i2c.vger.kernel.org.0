Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C070226DE9D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 16:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgIQOpd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 10:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgIQOdA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 10:33:00 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2C7C061356;
        Thu, 17 Sep 2020 07:02:46 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j34so1415578pgi.7;
        Thu, 17 Sep 2020 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4Gu/kgZ0T3sU+bTVTX8rTeW8dj7wNAAwtv+uUkf6kT8=;
        b=W8C8nlyDEfLcq8xNbPQymtNUOjR2CD9bMw+KXSxoMB5NpZZhP6vwLJixC1VAm2dV1v
         L1bDc9dJOQGh3KEttZgduxUfUHwgxNPRqAhrEmAaHi5fiDf+JMOjK8aIQDp/EdLhqljF
         wbfkurtCOLD/G/Pc2NruSFfGFjwFN78wnrQ/MPvn0TCiNJI5hzI4B1R4N4w2NHiTHJOA
         yV9xBeK0QNbS9TVcx6fpnLq/AlbGjWb7af4irM4bY1MxbdzBFPEtpWU1wutLg1xPu/pB
         q4DIsZiwQIiwSRF5mMz9GGuxxMkphfuRl5n1hXpV868O+xj1kAqxNehTFobUit/mJ9O1
         KALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4Gu/kgZ0T3sU+bTVTX8rTeW8dj7wNAAwtv+uUkf6kT8=;
        b=ii8vqtA9eYPfs1V6h5i4DjP0fCzYVxKJ44E/vqMQpZ6tXfVd/A6qPQt7657/G2qdXv
         hxk1RSXeO30iB8Rh8O3i5F5XRJyvJahpovXL2+Z1ngMbcGWWPqgu/g2rNYk50gPdnBsE
         EAm3jBclLlGAPYHGpLNRzzOTvQqdG9zTVkpEYdgd6rO/1r3dARrM2sWbid5l7o7TYfIN
         +JpXrherWvqas8Z1EpUd4Qigebw/6pwSSqDWowCDrgpjwLxbA+JlnWXelkqcZjC77Vhg
         BYoH+3/7XT4ieM6uMhJmqYoimsD/QwrXAVrrGWDNBPlf1nhbTpjVO5ZR81Reedwx58jC
         NgRw==
X-Gm-Message-State: AOAM530EjWssT8bN6lOL/Oa+Nkr/AOAC12/CiW/GlTSAZt59/D7Lh43g
        zz4l8V28N0RU3tk52bY4zBMVqdU8lm8xYFPJtkY=
X-Google-Smtp-Source: ABdhPJzL0WbFlMWT+trYKVIQchuNiS5/67KAavRNKcvBaRPIE4bxwTY61woA83l+unmcuVq6USWtd7OWlTJ0nqv1770=
X-Received: by 2002:a63:c543:: with SMTP id g3mr23083908pgd.203.1600351365583;
 Thu, 17 Sep 2020 07:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200917052256.5770-1-sultan@kerneltoast.com>
In-Reply-To: <20200917052256.5770-1-sultan@kerneltoast.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 17:02:27 +0300
Message-ID: <CAHp75Vea8=WchmWVOGndgarjehv+sYQh7CNUrQYqmG8hGJCzHA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] i2c-hid: Save power by reducing i2c xfers with
 block reads
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Pavel Balan <admin@kryma.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 17, 2020 at 8:26 AM Sultan Alsawaf <sultan@kerneltoast.com> wro=
te:
>
> From: Sultan Alsawaf <sultan@kerneltoast.com>
>
> This is a fixed resubmission of "[PATCH 0/2] i2c-hid: Save power by reduc=
ing i2c
> xfers with block reads". That original patchset did not have enough fixes=
 for
> the designware i2c adapter's I2C_M_RECV_LEN feature, which is documented
> extensively in the original email thread.
>
> Here is the original cover letter, which still applies:
> "I noticed on my Dell Precision 15 5540 with an i9-9880H that simply putt=
ing my
> finger on the touchpad would increase my system's power consumption by 4W=
, which
> is quite considerable. Resting my finger on the touchpad would generate r=
oughly
> 4000 i2c irqs per second, or roughly 20 i2c irqs per touchpad irq.
>
> Upon closer inspection, I noticed that the i2c-hid driver would always tr=
ansfer
> the maximum report size over i2c (which is 60 bytes for my touchpad), but=
 all of
> my touchpad's normal touch events are only 32 bytes long according to the=
 length
> byte contained in the buffer sequence.
>
> Therefore, I was able to save about 2W of power by passing the I2C_M_RECV=
_LEN
> flag in i2c-hid, which says to look for the payload length in the first b=
yte of
> the transfer buffer and adjust the i2c transaction accordingly. The only =
problem
> though is that my i2c controller's driver allows bytes other than the fir=
st one
> to be used to retrieve the payload length, which is incorrect according t=
o the
> SMBus spec, and would break my i2c-hid change since not *all* of the repo=
rts
> from my touchpad are conforming SMBus block reads.
>
> This patchset fixes the I2C_M_RECV_LEN behavior in the designware i2c dri=
ver and
> modifies i2c-hid to use I2C_M_RECV_LEN to save quite a bit of power. Even=
 if the
> peripheral controlled by i2c-hid doesn't support block reads, the i2c con=
troller
> drivers should cope with this and proceed with the i2c transfer using the
> original requested length."

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for I=C2=B2C DesignWare patches.

>
> Sultan
>
> Sultan Alsawaf (4):
>   i2c: designware: Fix transfer failures for invalid SMBus block reads
>   i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads
>   i2c: designware: Allow SMBus block reads up to 255 bytes in length
>   HID: i2c-hid: Use block reads when possible to save power
>
>  drivers/hid/i2c-hid/i2c-hid-core.c         |  5 ++++-
>  drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++------
>  2 files changed, 13 insertions(+), 7 deletions(-)
>
> --
> 2.28.0
>


--=20
With Best Regards,
Andy Shevchenko
