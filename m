Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16D822C381
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 11:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfE1JuT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 05:50:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:53812 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726203AbfE1JuS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 May 2019 05:50:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 67666AF38;
        Tue, 28 May 2019 09:50:17 +0000 (UTC)
Message-ID: <1559037015.6521.3.camel@suse.de>
Subject: Re: [PATCH v2] i2c: i801: Register optional lis3lv02d i2c device on
 Dell machines
From:   Jean Delvare <jdelvare@suse.de>
To:     Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
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
Date:   Tue, 28 May 2019 11:50:15 +0200
In-Reply-To: <20190528094132.ytsittb5hcgthoy2@pali>
References: <CAHp75VdU1OMTqLcDuzhQMHuX9rMhjw6p3CkSWaW5Y4kOy8ggqg@mail.gmail.com>
         <20180131120348.azy25aqvn5wrdkeh@pali>
         <CAHp75Vf=-RQvCtS684Q5+X=YKmZXgP_1kr0to8BGZX0jQAsuZw@mail.gmail.com>
         <20180212153012.vffvjmz26ifyxbj5@pali>
         <CAHp75VfF+qwCXcr3yuayE-Z+UG9wuMOKfGzLhdyPk79daEi9gQ@mail.gmail.com>
         <20180213150004.5d2v7y7wwuure4io@pali>
         <CAHp75VfxgbFiDxyrqyMRE8s85L1_EzkVvrA1NGYA5_su=5oGVQ@mail.gmail.com>
         <20180213165023.xmzovx7fd3gdljxw@pali>
         <20180226203255.lnnzipipjz5l2itz@ninjato>
         <20190528111953.0e5415f4@endymion> <20190528094132.ytsittb5hcgthoy2@pali>
Organization: Suse Linux
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2019-05-28 at 11:41 +0200, Pali Rohár wrote:
> This is not a problem. lis3lv02d provides two things:
> 
> 1) 3 axes accelerometer
> 2) optional interrupt and signal it to userspace via misc device
> 
> dell-smo8800 does not call any parts of lis2lv02d module. It just
> provides for userspace same misc device API as lis3lv02d.
> 
> As lis3lv02d has misc device optional, registered i2c device from
> i2c-i801 does not enable it.
> 
> So technically it is one device, but their functionality divided into
> two modules. One which reports accelerometer axes and one which signals
> disk fall interrupt. These two modules and functionalities does not have
> to interact, so it is safe to have them separated.

OK, thanks for the explanation. But assuming that we now instantiate
the lis2lv02d device from i2c-i801 for exactly all the same machines,
can't we just *enable* the freefall misc device feature of lis2lv02d
and kill the dell-smo8800 driver completely? Seems more simple to
maintain going forward.

-- 
Jean Delvare
SUSE L3 Support
