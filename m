Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAE562C304
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 11:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfE1JT7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 05:19:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:48302 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725943AbfE1JT7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 May 2019 05:19:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id ACD4CAFE8;
        Tue, 28 May 2019 09:19:57 +0000 (UTC)
Date:   Tue, 28 May 2019 11:19:53 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
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
Message-ID: <20190528111953.0e5415f4@endymion>
In-Reply-To: <20180226203255.lnnzipipjz5l2itz@ninjato>
References: <CAHp75VdWA-0a_FeicHSi_FfWurQ9EvkdW0raqgoRVySTyxDJ0Q@mail.gmail.com>
        <20180128144509.pobnj7cayc4psgrj@pali>
        <CAHp75VdU1OMTqLcDuzhQMHuX9rMhjw6p3CkSWaW5Y4kOy8ggqg@mail.gmail.com>
        <20180131120348.azy25aqvn5wrdkeh@pali>
        <CAHp75Vf=-RQvCtS684Q5+X=YKmZXgP_1kr0to8BGZX0jQAsuZw@mail.gmail.com>
        <20180212153012.vffvjmz26ifyxbj5@pali>
        <CAHp75VfF+qwCXcr3yuayE-Z+UG9wuMOKfGzLhdyPk79daEi9gQ@mail.gmail.com>
        <20180213150004.5d2v7y7wwuure4io@pali>
        <CAHp75VfxgbFiDxyrqyMRE8s85L1_EzkVvrA1NGYA5_su=5oGVQ@mail.gmail.com>
        <20180213165023.xmzovx7fd3gdljxw@pali>
        <20180226203255.lnnzipipjz5l2itz@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 26 Feb 2018 21:32:55 +0100, Wolfram Sang wrote:
> > I'm not maintainer of i2c-i801.ko, Jean Delvare & Wolfram Sang are.
> > Therefore instructing future contributors would be up to them.  
> 
> This is really Jean's realm.

Sorry for the delay. As a general rule I'm all in favor of
instantiating I2C devices from i2c-i801 when we can, as it makes the
user's life easier. However I agree with Andy that:
1* We want to have an explicit list of supported ACPI device IDs, not a
   just a prefix.
2* We don't want to over-engineer it with a common header file or an
   exported symbol. I see no problem with duplicating the lists if 2
   drivers happen to be needed on the same set of devices. This is
   easily managed by adding a comment before each list that the other
   list may need to be kept in sync. It also gives us the flexibility
   to *not* keep them in sync if needed.

Instantiating the I2C device from dell-smo8800 doesn't seem practical
because that driver has no idea about the i2c subsystem in the first
place.

What worries me is that we seem to have 2 drivers binding to the same
device (the accelerometer), one natively (lis3lv02d), and one through
an ACPI layer (dell-smo8800). I don't really understand why this is
needed (don't they serve the same purpose?) nor how it can be safe
(what guarantees that both drivers won't attempt to access the hardware
at the same time?)

-- 
Jean Delvare
SUSE L3 Support
