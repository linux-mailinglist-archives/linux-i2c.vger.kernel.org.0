Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 806EA95C71
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 12:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbfHTKnA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 06:43:00 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45411 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbfHTKnA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Aug 2019 06:43:00 -0400
Received: from [192.168.1.110] ([95.117.23.32]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Ma1HG-1hnu891uyK-00Vx1h; Tue, 20 Aug 2019 12:42:29 +0200
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     acooks@rationali.st, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
References: <20190802145109.38dd4045@endymion>
 <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
 <db725a3b-7b6e-ac79-ef1c-e601ff45c0f2@rationali.st>
 <9019cce9-837f-97fc-0f3b-7503b8fc3717@metux.net>
 <20190819185334.GA9762@kunai>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <82cd0682-91db-6afd-855c-2c2f4b329eda@metux.net>
Date:   Tue, 20 Aug 2019 12:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190819185334.GA9762@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:zT4OfnddwnA2IENScT3HmM3VE7IgCU9EdenYHdbXeMMSyKCzmED
 rrb204KVbOHlsdDcb5ZVN306oxoEoC8k470Frfbew/etKnQHooCdugwXHBjktmZzIjyeHgN
 mW+dJ/lxnBSVqsD6QTME8UUx/n/F1csdCCKwSdCA5WijfPpRfG1rLSktz2IV7sT9VQHTHSV
 xYOEzHmP06AAJqW46IyMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XO1wNFqlyiQ=:yHlIl9BEzkY2TjZCT9lSZM
 sgxgPY2chG7g/6nFo8EB+nY40XiI62Esap4wxJXY9qCDTBXFYqCIZu9c4dOj4XcYaDR4lBPl5
 akKccGWJyMoGIfaYoF65aUdSHKX5TN3RVYPg1vlOvfAjx9x+v/JOGGrFtqqfNzPovpLfMUK4g
 FnfEEY8I//GsbW6MWU7RcN9DL0pzyNCjCDDdV8ezjjmfU7kVbIocGduI2bHSI3Ca0WVCjrliI
 BCJJVuPcBl8CrNVXBAk3oLKkMl9ITDkyVisg14UZXLpgncueL/YP0W3+qUV2C8ykEtzcP5FIu
 dJIAHgKc2USJObJ9OMV/acZn51Hi3lfPHuTK674jmoNpkFuUn3qrWzzmH62NhG2sWMFAb+iPZ
 H4B78ZmSIv3WbiRxpWJt33Yuw9gLK6hr+Xoam373+0gRkzMCFvhIB74xhBQBdDHBcEvJKxJYU
 MQ8CQVTPfRZsPhBgOJfC/2lTAXU3vMIePwhnUaLkltJa/m/p+2yd1+HDoNA/PJRr/maHJBCyw
 TxSUf75Z8p0MS8nDbEOUYHR1CvGLKqK22U5qLAJ93l/nZAVnMfyEzeGcDNdp2asWtNRzYToaL
 m1WC38dDJVFvAHIRlTKbl341L4Hh5IqigcieAwxAk323/BJNUWReEXl4rGIEM90hl365al0WF
 gbf6kw1rzQ9LOwmr+jsLkRbhs1aGrPItg/+HoKzYmKDM1C9TZS38lk9tgpzylEfa0Q4CVS1Ql
 ZMguNVUpk/0D/lRDXwbAEvTqExq3PwLc8KFGpUSOY8hr01GfiPdxTQfgeeZnZuWFfCUJCMwlq
 amyUp+UQl0KOYL2f3NVvXVO1gw04Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19.08.19 20:53, Wolfram Sang wrote:
> 
> Just so I get this correct: This is all about instantiating the devices
> sitting on the SMBus,

Yes, I'm struggling to find out which devices are connected to the
smbus, in case there're some already inside the SoC (instead of just
entirely board specific).

> but you are okay with Jean's patches? Or is this
> discussion affecting patch 3? (/me knows not much about ACPI'n'stuff)

I'm fine with them, just wondered whether BIOS needs to add some extra
support for the probing, that is not already somehow coming w/ aegesa.

Unfortunately, we cannot rely on board vendors to do that right and
cope w/ old and incomplete firmware. (that's also the reason why I'm
*not* using acpi gpio entries for the apu2+ board family).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
