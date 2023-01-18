Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98C9671B05
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 12:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjARLpA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 06:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjARLnw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 06:43:52 -0500
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE1C654D4
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 03:02:21 -0800 (PST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-15ebfdf69adso17655320fac.0
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 03:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KuI0iwHsMdHgi9UUhJbv/FF6Zx1hDWv0kF6EEdUlD2I=;
        b=5PCGooyhPIEuUA8LfHpgz2E1NSo9q7mSLwwd+kP7a2WQx5oIObawC1SZ8b3GjlhI6w
         k+aUwf08xYT06HES1GVAUttTfmtlU/+2mUQ+E6nwI3mvpykPVqpS3CT4T1OK8Y7wh8Lh
         OxdivEq+CnvHPuPDLKxMirSIFn7kanNvD0azdCBrxVrZC626tljgU09Q5NwDlRdCl5Pm
         h30BKW+O6Gpe2j8vZBVS7nQX0CZx9F+vnTsIKQmfF0oeOZkgBCg3IFGxtjTVee8Llq3v
         VTgrTzM1eGIkuy0knsusfqmXW3O1e3iUrjIXv4sd1h2zvdReBrfi+vZn6Ejf/45OptwH
         w5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuI0iwHsMdHgi9UUhJbv/FF6Zx1hDWv0kF6EEdUlD2I=;
        b=FUFsmFZrs+W7Nf6IJdFHJjFzdyHLhfzRVpP9FDY+kO9Z+KnYOxv7ctyDyKZon83DBu
         txN5AdwOH3qCU304g3A3E9NraRAIErdoWc7jreAcMOk5Hf6DOidN18roddCHQS7eC3yo
         S/QqTi3eWuxm81HjdiD4YFkqgU3C5xC2esCMsHc0HdkzW0r341f6LsEoaVprMwkPQqN8
         vQL+Lud9FalIFQKzMLdAhM1BYAdnXbPdplq8MxRbHKLNyGzFFyHry+jn9k2Tm0G11dOv
         DTI9uz1Xrh/IA1rIbbSkLfS4gLkOzKj+FLFgXg5JJWvJvgnhs/oKwWBuMDkTdXjllY62
         Y7Wg==
X-Gm-Message-State: AFqh2kqpefd2rQSlBcBzCw+3BVLu051+5275dax4r6TdrcYzT6Au51N0
        eT77IxKn2Nv5yz6M6ofZK1VxVA==
X-Google-Smtp-Source: AMrXdXvlrp1Ed3XBrrhA3zCnrQ6Rbb/wKmg6UrVk+wIslhGo+AMwXBPpNO4DwySZY2+3rtlEwlTN+A==
X-Received: by 2002:a05:6870:c190:b0:15e:cc77:1e6d with SMTP id h16-20020a056870c19000b0015ecc771e6dmr4364085oad.13.1674039741194;
        Wed, 18 Jan 2023 03:02:21 -0800 (PST)
Received: from ?IPV6:2607:fb91:120e:1c84:8038:3fff:fe9f:cbb4? ([2607:fb91:120e:1c84:8038:3fff:fe9f:cbb4])
        by smtp.gmail.com with ESMTPSA id e19-20020a056871045300b001442fada152sm18099522oag.46.2023.01.18.03.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:02:20 -0800 (PST)
Message-ID: <efa6a8aa-466e-cfaa-0113-b85002af008e@landley.net>
Date:   Wed, 18 Jan 2023 05:14:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
        dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-sh@vger.kernel.org
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
 <7329212f-b1a0-41eb-99b3-a56eb1d23138@landley.net>
 <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
From:   Rob Landley <rob@landley.net>
In-Reply-To: <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/18/23 01:46, Geert Uytterhoeven wrote:
> Again, I think you're talking about something different.
> Does kexec work for you?

Sorry, got woken up several hours early by sirens and flashy lights this morning
(duplex on the corner caught fire, Austin has a LOT of emergency vehicles), been
a bit underclocked all day.

No, I haven't tried kexec on sh4. I'll add it to the todo heap.

>> > I tried working my way up from 2.6.22, but gave up around 2.6.29.
>> > Probably I should do this with r2d and qemu instead ;-)
>>
>> I have current running there. I've had current running there for years. Config
>> attached...
>>
>> > Both r2d and landisk are SH7751.
>>
>> Cool. Shouldn't be hard to get landisk running current then.
> 
> Current kernels work fine on landisk with an old Debian userspace
> on CF.  The 8139cp driver is a bit flaky: last time I tried nfsroot,
> that didn't work well.

I've never had luck with NFS, I was using NBD. Hadn't noticed the flake but
haven't stress tested it too hard either?

Mostly new userspace is what I'm testing...

Rob
