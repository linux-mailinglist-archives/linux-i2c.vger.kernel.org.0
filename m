Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D472C396
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 11:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfE1JyH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 05:54:07 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38326 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfE1JyH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 05:54:07 -0400
Received: by mail-wm1-f65.google.com with SMTP id t5so2105272wmh.3;
        Tue, 28 May 2019 02:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wavQKAaZlm/iIjYxZKtyOMMht1yPCJBkEwO/joXQjcI=;
        b=V65J7dUE4gePRaZXnBkmWHBHnv5WoQ6Tl2vZQKIUDSCop6Z7Qzj13xIsihBcBkNG3I
         Izukl50QuguXCNdsUHPHFjlrJ1aV6zYd3onr/RtvnytQ46SXkXy9hkBkFcCe7axYqnfu
         H0a5H2gM5xqMfo1lEqGB3aZHgKH+H9LOg8kAXaUVc6mcoLDryUguWRrClm6jALCDwxeR
         jnf4TdBVe17duzSAl7ghh9Z3geGp+O6+h+UoaVun3rQhHD3LB4hSZpLCj5NNH7PsPEKU
         Qkak847xFsCbHnsPio3rzyICfujTDTEgiVoaOK78QgyHJkTKppxaPgFq9Oqividsr5fb
         BcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wavQKAaZlm/iIjYxZKtyOMMht1yPCJBkEwO/joXQjcI=;
        b=lGVEKB743dkTo04TvkdBSzBtG3ubrEWMEKJh3u6HqA3XbJU5TbhLIP2BnpfPPtf9Xc
         SflU+3t3ucO+T9umv9v9XhevN9R21INPIavqppEs6TzKYnSk5Yvvr/Tg2AFKrSlZeUxQ
         EcmFF+JgjuHYtfAZWUQW68Wb7/lYwT/d7qJwWaFI3NVxHzCOfJZAIY3DEPN9PiIP7fjy
         1ld94mwuClj+U28IeqfIdeCXh8adCWWk/yPcjZaZ1Mj/x6099dItCiJeUrWZvstIb7sY
         Uc2S1S+6Rhg7JDdZPgRvXrRCVMsB58YtgaZ2JzYrPu9RAhS5TbgVJbqWed7jSr7DPucw
         7EAA==
X-Gm-Message-State: APjAAAX5vU77Goztv+oxzS/kJ+c9Qmfo17wPjaN+MLhOUwJh5GYToDNv
        Km2pxeO54vAfsYPAr4iUBEs=
X-Google-Smtp-Source: APXvYqwJvo6vV004tGrrhhcNqruGg/IuK5BZdCuD54kucsJAJcgjfrkqIMZF1O3kS/l0cpLBfNGMeA==
X-Received: by 2002:a05:600c:1109:: with SMTP id b9mr2405687wma.107.1559037244888;
        Tue, 28 May 2019 02:54:04 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id l13sm2396608wme.37.2019.05.28.02.54.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2019 02:54:04 -0700 (PDT)
Date:   Tue, 28 May 2019 11:54:02 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
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
Message-ID: <20190528095402.hlnqfon6jk452one@pali>
References: <CAHp75Vf=-RQvCtS684Q5+X=YKmZXgP_1kr0to8BGZX0jQAsuZw@mail.gmail.com>
 <20180212153012.vffvjmz26ifyxbj5@pali>
 <CAHp75VfF+qwCXcr3yuayE-Z+UG9wuMOKfGzLhdyPk79daEi9gQ@mail.gmail.com>
 <20180213150004.5d2v7y7wwuure4io@pali>
 <CAHp75VfxgbFiDxyrqyMRE8s85L1_EzkVvrA1NGYA5_su=5oGVQ@mail.gmail.com>
 <20180213165023.xmzovx7fd3gdljxw@pali>
 <20180226203255.lnnzipipjz5l2itz@ninjato>
 <20190528111953.0e5415f4@endymion>
 <20190528094132.ytsittb5hcgthoy2@pali>
 <1559037015.6521.3.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1559037015.6521.3.camel@suse.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tuesday 28 May 2019 11:50:15 Jean Delvare wrote:
> On Tue, 2019-05-28 at 11:41 +0200, Pali Rohár wrote:
> > This is not a problem. lis3lv02d provides two things:
> > 
> > 1) 3 axes accelerometer
> > 2) optional interrupt and signal it to userspace via misc device
> > 
> > dell-smo8800 does not call any parts of lis2lv02d module. It just
> > provides for userspace same misc device API as lis3lv02d.
> > 
> > As lis3lv02d has misc device optional, registered i2c device from
> > i2c-i801 does not enable it.
> > 
> > So technically it is one device, but their functionality divided into
> > two modules. One which reports accelerometer axes and one which signals
> > disk fall interrupt. These two modules and functionalities does not have
> > to interact, so it is safe to have them separated.
> 
> OK, thanks for the explanation. But assuming that we now instantiate
> the lis2lv02d device from i2c-i801 for exactly all the same machines,
> can't we just *enable* the freefall misc device feature of lis2lv02d
> and kill the dell-smo8800 driver completely? Seems more simple to
> maintain going forward.

I though about it and I already wrote that is it not practical. For ACPI
drivers there is easy way to get that interrupt number from ACPI tables.
From i2c-i801 PCI driver it is hard to get interrupt number for
particular ACPI device...

That is way I preferred simple solution: ACPI driver for ACPI device and
i2c driver for i2c device.

-- 
Pali Rohár
pali.rohar@gmail.com
