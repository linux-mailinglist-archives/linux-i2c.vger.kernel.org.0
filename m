Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0D255E70
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 04:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfFZCdN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 25 Jun 2019 22:33:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60724 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfFZCdM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 22:33:12 -0400
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1hfxkE-0005K4-Ge
        for linux-i2c@vger.kernel.org; Wed, 26 Jun 2019 02:33:10 +0000
Received: by mail-wm1-f69.google.com with SMTP id y127so46476wmd.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2019 19:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2/ZHlWC5YNQjm9JD+S58TuCvob2sXAmvXNIrsp942FI=;
        b=iVsMOQKM72Q6e6gORDL4vdnQGUpfowQ8ZChhSYSEXXS5kIRwghs2w4E8EQ4oqs5c44
         P7y+m9xC9pXsy54iSB/zXQa7H2sDA5zvNWnyJl5PnzujjkyvGpFkVFiYZ1TQtm+NZtAu
         YbQgd5/8/zJFFcxVewfzwpy2klSWOg7mY/RA/55nHBFfxZYynofd/kB+1A43HHMSgwS7
         mbcc6M0DXgweuXpTq9a+hlJCoIybF2Yq70831ZgFwPjV4BqA0SKhWFaEPELEbJK6gVog
         eUKmsFdGwQ4de5T7hf/Q9aKcS+nw4Cr7uoxAnSMKnFhU3C+tKJkImI8hkzAZPG0588yk
         DBuQ==
X-Gm-Message-State: APjAAAXKH/BGKsFPB31rZhwgnXV1V9SPzQP+/gPZv788y4pq551H11l0
        F6bH2V0ujf04ABxney/ghaQYD4cMCaIYtaGLjnT9zyvLn2+Lt+rUzmDaJiaNgUy4lE1+l1QGGQ5
        RhmLsWuFpqdfAyt3IreusVmRD+lctJreDaIg3+PoOI+TICIs9hO23ow==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr621725wme.51.1561516390046;
        Tue, 25 Jun 2019 19:33:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxI/DpGooLHNgpl6l5PwE9OiC7DQxK+YjjCY08iIvhMTHxZHOv0G3aEyMV2InGX1Z6lhWeJMIMmgVZGb2QR9R0=
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr621691wme.51.1561516389693;
 Tue, 25 Jun 2019 19:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190625083051.30332-1-acelan.kao@canonical.com> <a3469010-829c-16dc-be83-6fe9b3021530@linux.intel.com>
In-Reply-To: <a3469010-829c-16dc-be83-6fe9b3021530@linux.intel.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Wed, 26 Jun 2019 10:32:57 +0800
Message-ID: <CAFv23QnaKMs9bjS9ry_L4K7wskUqNR2AsgDG-v+fah2XO7EpKw@mail.gmail.com>
Subject: Re: [PATCH] i2c: designware: Add disable runtime pm quirk
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Adding I2C_HID_QUIRK_NO_RUNTIME_PM quirk doesn't help on this issue.
Actually, Goodix touchpad already has that PM quirk in the list for other issue.
        { I2C_VENDOR_ID_GOODIX, I2C_DEVICE_ID_GOODIX_01F0,
               I2C_HID_QUIRK_NO_RUNTIME_PM },
I also modify the code as you suggested, but no luck.

It's not Goodix takes time to wakeup, it's designware I2C controller.
Designware doesn't do anything wrong here, it's Goodix set the interrupt timeout
that leads to the issue, so we have to prevent designware from runtime
suspended.

Jarkko Nikula <jarkko.nikula@linux.intel.com> 於 2019年6月25日 週二 下午9:38寫道：
>
> On 6/25/19 11:30 AM, AceLan Kao wrote:
> > Dell machines come with goodix touchpad IC suffer from the double click
> > issue if the Designware I2C adapter enters runtime suspend.
> >
> > It's because the goodix re-assert the interrupt if host doesn't read the
> > data within 100ms and designware takes a longer time to wake up from
> > runtime suspend. In the case, it got a second interrupt during
> > resuming, so it thinks it's a double click.
> >
> > There is no simple way to fix this, it's a firmware issue and goodix
> > agrees to fix this in their firmware on next release, but this issue
> > still affects the machines that don't come with an updated firmware. So,
> > add a quirk to mark those machines and avoid the designware from
> > entering runtime suspend.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=202683
> >
> > Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-master.c | 30 ++++++++++++++++++++--
> >   1 file changed, 28 insertions(+), 2 deletions(-)
> >
> I think better place to have this fixed is in
> drivers/hid/i2c-hid/i2c-hid-core.c by forcing the adapter device active
> when communicating with such touchpad.
>
> In that way only bus where touchpad is connected stays active, not all
> and makes sure issue is handled also if that touchpad is ever connected
> to any other I2C adapter than Designware.
>
> I did something similar in the commit 72bfcee11cf8 ("i2c: Prevent
> runtime suspend of adapter when Host Notify is required"). Not exactly
> same issue but similar idea.
>
> By looking at i2c-hid-core.c I saw a few i2c-hid devices have
> I2C_HID_QUIRK_NO_RUNTIME_PM. Could you test how does this Goodix behave
> if only i2c-hid device runtime PM is prevented not I2C adapter?
>
> A very quick test would be to comment out those lines below:
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c
> b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 90164fed08d3..bd3e6570c45e 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1156,8 +1156,8 @@ static int i2c_hid_probe(struct i2c_client *client,
>                 goto err_mem_free;
>         }
>
> -       if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> -               pm_runtime_put(&client->dev);
> +//     if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> +//             pm_runtime_put(&client->dev);
>
>         return 0;
>
> @@ -1183,8 +1183,8 @@ static int i2c_hid_remove(struct i2c_client *client)
>         struct i2c_hid *ihid = i2c_get_clientdata(client);
>         struct hid_device *hid;
>
> -       if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> -               pm_runtime_get_sync(&client->dev);
> +//     if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> +//             pm_runtime_get_sync(&client->dev);
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
>         pm_runtime_put_noidle(&client->dev);
>
> --
> Jarkko
