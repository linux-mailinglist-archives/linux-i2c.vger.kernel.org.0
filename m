Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05AA94ED95
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 19:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfFURME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 13:12:04 -0400
Received: from mout.gmx.net ([212.227.15.19]:35235 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbfFURME (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jun 2019 13:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561137110;
        bh=pikR5/KXF+9GO3cS9XFX/uRd/MsXY9NL3Y1lHICzUUk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=FJXxyzw+/1XB/g0RUfao91CSG+l1ICS3cdsJHBdgdb6Trm0BllQJ2xom71hIsqmRP
         FkcVpO0dRFtQo6qCOvvk8tgezQ+yxVYVl4mg9eYJaKjLjt2GZTLOpYAZLYKGY5bSyh
         hJnmnxp1pWXb4wj1ZL2q25nqT+LGTNiTy2TerMxU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.111]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LaXEN-1iJUzq3X9L-00mIa6; Fri, 21
 Jun 2019 19:11:49 +0200
Subject: Re: [PATCH v2 0/2] i2c: bcm2835: Fixes for clock changes in probe
 function
To:     Annaliese McDermond <nh6z@nh6z.net>, eric@anholt.net,
        f.fainelli@gmail.com, wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     team@nwdigitalradio.com
References: <20190621105250.19858-1-nh6z@nh6z.net>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <7d23a83f-4e3a-5186-78b2-2183e636b0af@gmx.net>
Date:   Fri, 21 Jun 2019 19:11:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621105250.19858-1-nh6z@nh6z.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:taiXKuJGyrqz/BHoKI9wPQvzZ/He7P42vNLrqNR/za/dm564A3Y
 mRGIFBrcnHMAo0vByONnKinbDRLSetzaePSTdZjCHPtexJGtB47g5JshdyVuA87vW1xzYqO
 49HOPhzRHZWKYw6TW8Wk7JciWSBiPl6s9swQ+7w9QwnXMITgbdma50acDpD+jGm0+CzRzzd
 dlBU5Qj4MW3XflcwOe65w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XqbpE/Gjd04=:hg1BHGqyph7ozZl2spYdEE
 kVBMb1xhXyEzsgRZruYhs78JOZ4PUIkhbxWTPE5ITXagKTKQh46ZN3mXLPLd07klwifBxm2rY
 YtEPEnan3/+2y0Uw1/n374bFeG8UdgJy+uSg8IUI6gso6NSBk0L5HZ4vo/3tk5GkHJUnvFlzT
 je+2f0CFw11oYwoX8Jji1xuU1QZaD/inaW4SUoCupr1yDrBJSd+Tz1AfMRPEqNmP8Y5FkOgV8
 kPZNOrvo8ZOWaCrStWiSIgVHWPssAsDE1twdAOY7F/o5GkiQ+enFlKDa1qrGp158SoBuPXKcr
 IInDTOFNCHPwmu6zKV8njVek9q5G2xNdMZ+rA56H3xyrTyWdnXlKkZd51HMSEzabBd37Wgmqy
 EpAF197obWmWSqJQyDM2vFElITyKbCXEyufncZ8cZV+1/eABkopZDx/RWT8YeVK2BEXgDGOZh
 aLFMz4gpybewx+7CucVU94Q5dcPI2qT6cOGG4GfbjQA6YXOuIK4mJ9knRkpFUw+J+Jb3tB0p+
 1wjdWrkGSEleqknh+JY3tFuGsAPHMpVfp99j5OHrMaQw8AQuXyn81Rwrv7icIpzvaDtqJ+1X1
 ZQTUimozgGsts5FipE0ycPnOyi01jZP/tntZVgWqlrOeh9IETRKvRNDhBGMQBYevQWFSMpgBV
 QXoRzWz6wUWryC7PrJdRIO5swRb7c7UxPjG9kSU/luoDTRowwcWZQDY9MUuOWjnyL6Pu344GK
 hPHnM8fFI0VSu6l1DZUknKQkWTABcTX2zStr2RfJ2VPzeY6NbNMAweyJEe/oQkQLfI2oTWnXU
 Xd8Mn/tAFXwGcFIzYdgpAci3iItkAW6SwlJk89bTz00Wg5bQC8QtwBf5esTnxVATZ39W3tKKD
 FrOQx/OUA8hWcja12eJi5t3M3UBUA85FYQAIaNcLC5m4jSKlY/4w+oX/QFKSiAHubvbAJ0s6w
 lgbp4TLe4Q8RfrfYHglCnGDFCb82kLUIQ6bgDcV1+CqisunHQLAVq
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am 21.06.19 um 12:52 schrieb Annaliese McDermond:
> An issue was reported in [1] and [2] that the latest version of the i2c
> driver was not properly loading.  After analysis it was determined that
> the new clock code was failiing because the i2c driver was trying to
> load before the bcm2835-clk driver when not loaded as a module. This is
> fixed by actually attempting to grab a reference to the clock and failing
> out with a EPROBE_DEFER if it's not there.  This gives the other drivers
> an opportunity to load.
>
> This series also fixes a related bug where the clock setup code in the
> probe function could cause an issue where the IRQ would be requested
> by the driver and never freed in case of some clock setup failure.  The
> patch moves this IRQ code to the end of the probe function where it will
> not cause this issue.
>
> [1] - https://www.raspberrypi.org/forums/viewtopic.php?f=44&t=242856
> [2] - https://archlinuxarm.org/forum/viewtopic.php?f=23&t=13719

This whole series is:

Acked-by: Stefan Wahren <wahrenst@gmx.net>

