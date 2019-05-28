Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00662C36D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 11:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfE1Jlo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 05:41:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42017 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfE1Jln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 05:41:43 -0400
Received: by mail-wr1-f67.google.com with SMTP id l2so19441439wrb.9;
        Tue, 28 May 2019 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nuWHP0KCLbEcStlDo67uXQld37difakRdwP8GRXDv1M=;
        b=LEB4O2G7oj05dH7SnfFW/IcrLtJMfrfCjhVMU6cA2kz3lUC+d2LebfFNWqPEV3CF7f
         IpWPy4yespMEkwpc6AkwCuo7yxlgydyJuzTyS85sGnXQmkVMGRoxDjvddtXTLuTPlgUk
         7OGtr0bi+sV0tAUEie7rW3Qjx4C56Wc8VMveYnPPdZVO15Lp98yItiwmoPoILEeSWRSV
         0SccKyxBelLEF1lE3GZMixzCrwY5GH1VDeFHPIWGBreelgu7MCA1kT76FnDxrIiP/Q3m
         a0VossSUfqnZS5XaaGENEw1o2KartdQ+AAF9/VE0ZrUgeZsuNs1Zho1lPnjHJzmrgm9j
         IXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nuWHP0KCLbEcStlDo67uXQld37difakRdwP8GRXDv1M=;
        b=mnj/fk2LkDDzVhj3u8y3MUmp65LWh2a/34t1So7oGunaudAl04sNChP+1+rfOsb0Mh
         XJO4exqC5FyC0HE4EesE1YQsuqPrzniuiIQOihwhFvPhaTunRSYZlvt/bv2m1OKf8x5q
         cDCN+FcnEL5WTIKNMluOA1pkq4HCdiV+/HMNBSv1XTPoo1Y+V3U1q8KulpVIsnzu91YB
         iOAWrErYMAR2mYxOtUqzurbI4YgvSYQGaTvoY5YMkLZOdYJ+rS7oktZMpM1Pw1L/Z6Rj
         aB/3bDUg3UIDdv82Uj3lub7COAZErp/aUhcrMwj9TUPoUPo9A9JXLGgcdVAvbBKWYt+3
         +WJw==
X-Gm-Message-State: APjAAAWxRDXdShQbtfflTh2SQ/M02Iu5HQZYfk/mSdzU6Mpt/d4QLdre
        WMCoP+dwhGa9QrwlOVUnr5I=
X-Google-Smtp-Source: APXvYqyR5eGMGs3tGvQ49xfiafG98XP7zQKl/RKHeq5PGtIuoT8o6mDhxZnsA9F+N/A4ZvwsjKycaA==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr5862293wrs.289.1559036501044;
        Tue, 28 May 2019 02:41:41 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id f197sm2241462wme.39.2019.05.28.02.41.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2019 02:41:40 -0700 (PDT)
Date:   Tue, 28 May 2019 11:41:32 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
        Steven Honeyman <stevenhoneyman@gmail.com>,
        Valdis Kletnieks <Valdis.Kletnieks@vt.edu>,
        Jochen Eisinger <jochen@penguin-breeder.org>,
        Gabriele Mazzotta <gabriele.mzt@gmail.com>,
        Andy Lutomirski <luto@kernel.org>,
        Mario Limonciello <Mario_Limonciello@dell.com>,
        Alex Hung <alex.hung@canonical.com>,
        Takashi Iwai <tiwai@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Register optional lis3lv02d i2c device on
 Dell machines
Message-ID: <20190528094132.ytsittb5hcgthoy2@pali>
References: <CAHp75VdU1OMTqLcDuzhQMHuX9rMhjw6p3CkSWaW5Y4kOy8ggqg@mail.gmail.com>
 <20180131120348.azy25aqvn5wrdkeh@pali>
 <CAHp75Vf=-RQvCtS684Q5+X=YKmZXgP_1kr0to8BGZX0jQAsuZw@mail.gmail.com>
 <20180212153012.vffvjmz26ifyxbj5@pali>
 <CAHp75VfF+qwCXcr3yuayE-Z+UG9wuMOKfGzLhdyPk79daEi9gQ@mail.gmail.com>
 <20180213150004.5d2v7y7wwuure4io@pali>
 <CAHp75VfxgbFiDxyrqyMRE8s85L1_EzkVvrA1NGYA5_su=5oGVQ@mail.gmail.com>
 <20180213165023.xmzovx7fd3gdljxw@pali>
 <20180226203255.lnnzipipjz5l2itz@ninjato>
 <20190528111953.0e5415f4@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190528111953.0e5415f4@endymion>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi! Thank you finally for response!

On Tuesday 28 May 2019 11:19:53 Jean Delvare wrote:
> On Mon, 26 Feb 2018 21:32:55 +0100, Wolfram Sang wrote:
> > > I'm not maintainer of i2c-i801.ko, Jean Delvare & Wolfram Sang are.
> > > Therefore instructing future contributors would be up to them.  
> > 
> > This is really Jean's realm.
> 
> Sorry for the delay. As a general rule I'm all in favor of
> instantiating I2C devices from i2c-i801 when we can, as it makes the
> user's life easier. However I agree with Andy that:
> 1* We want to have an explicit list of supported ACPI device IDs, not a
>    just a prefix.
> 2* We don't want to over-engineer it with a common header file or an
>    exported symbol. I see no problem with duplicating the lists if 2
>    drivers happen to be needed on the same set of devices. This is
>    easily managed by adding a comment before each list that the other
>    list may need to be kept in sync. It also gives us the flexibility
>    to *not* keep them in sync if needed.

Ok, I will then make list of supported ACPI devices and put them into
two places with comment about syncing.

> Instantiating the I2C device from dell-smo8800 doesn't seem practical
> because that driver has no idea about the i2c subsystem in the first
> place.

Yes. And in same way instantiating ACPI driver dell-smo8800 from
i2c-i801 is not practical too.

> What worries me is that we seem to have 2 drivers binding to the same
> device (the accelerometer), one natively (lis3lv02d), and one through
> an ACPI layer (dell-smo8800). I don't really understand why this is
> needed (don't they serve the same purpose?) nor how it can be safe
> (what guarantees that both drivers won't attempt to access the hardware
> at the same time?)

This is not a problem. lis3lv02d provides two things:

1) 3 axes accelerometer
2) optional interrupt and signal it to userspace via misc device

dell-smo8800 does not call any parts of lis2lv02d module. It just
provides for userspace same misc device API as lis3lv02d.

As lis3lv02d has misc device optional, registered i2c device from
i2c-i801 does not enable it.

So technically it is one device, but their functionality divided into
two modules. One which reports accelerometer axes and one which signals
disk fall interrupt. These two modules and functionalities does not have
to interact, so it is safe to have them separated.

-- 
Pali Rohár
pali.rohar@gmail.com
