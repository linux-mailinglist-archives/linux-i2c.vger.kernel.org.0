Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97397188789
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 15:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgCQOdI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 10:33:08 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:38762 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgCQOdI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 10:33:08 -0400
Received: by mail-il1-f196.google.com with SMTP id p1so5446872ils.5
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A16GKmGMQWpRq+C/pSuTHqsjWsmIXgAuO5lJtoXiC5Q=;
        b=qqWQiotn5sHUFeq/EZSUci/cJTumNXaJzM+4NCGpIavzOOC1vtdduNrHZQ+2KeCHq+
         zGqz4TZIsNxUBA3xm5dNyOaQYibvZDrs8+bHQW8N/1nzErK42Fnt+6fwdjTX4mUoly9l
         Mz094tkzcLMYSTKpNWZ8GP68mMOaVy2upg0/U5i/JV1XHS6ovhtOh3ssme9nIogkfqnJ
         ea72EXipKtu9cFfzXEX3+1gMV6+yit68H0JAzCDxfcguSxOFBkdwPeRp+Ka0c83tfDYV
         DNzjB1nf3J/0vWH00IP7IfPjng/AbnUAh3gMVCpdhge4xQYnNYSxjJ9RVB1c/9c3p3mT
         08rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A16GKmGMQWpRq+C/pSuTHqsjWsmIXgAuO5lJtoXiC5Q=;
        b=YPgRJogU+ZzjFjTsReZnpMqwWi2bGF/W/HQ0frcAU6Pu9rXnUz0XSg9KOpuU8G6CUy
         UQDAdmK33Zk5R2+JOUkxWdgGYK+IKRv9/JtisPwmTpfG1XIhRYpSLYKoQFXbmk3PjeWm
         Gy7jH9v7CTYD9XQR0+3BDuAX0AfptM5ZOWzAi3X831hZlQrCgeEbwcMcOvxKQ1JZT+Rw
         vGAntf1JNT0lsfS5G3q7h6vBHMelShf1Ov0YKRKUdhrGktWMJ/Ln7+fwtbUsLQHMVVYb
         qWS4YJjnvKHuChHu937tA+wolqycrROUxVFxDcgJFjJgr5BPjDirvTR8hGXtLt1GBF3t
         2SwQ==
X-Gm-Message-State: ANhLgQ17xxyL3DxF4xj06YEsMSswOxgzjGyFgTbw8BaEw46z87a0nUSi
        scAHQqCPL0gbKq5HvT3zRHdpSOSbxgFzZyA+7Lwv8w==
X-Google-Smtp-Source: ADFU+vvv1qz1/uhOnuPtILwnBcDhqFuA505eK/TJanPszXasPoyHEc3ARvpOkyEZKK15hx8d4UYnuqqX03viV7vQ01U=
X-Received: by 2002:a92:d78c:: with SMTP id d12mr5529078iln.287.1584455586881;
 Tue, 17 Mar 2020 07:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200317151409.7940926c@endymion>
In-Reply-To: <20200317151409.7940926c@endymion>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Mar 2020 15:32:56 +0100
Message-ID: <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
Subject: Re: VAIO EEPROM support in at24
To:     Jean Delvare <jdelvare@suse.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wt., 17 mar 2020 o 15:14 Jean Delvare <jdelvare@suse.de> napisa=C5=82(a):
>
> Hi all,
>
> As the legacy eeprom driver is being phased out, I am reviewing all its
> use cases to ensure that the at24 driver will be a suitable replacement.
>
> One issue I have found is the handling of specific EEPROMs found on the
> SMBus of some Sony VAIO laptops. The legacy eeprom driver would expose
> them to user-space, read-only for all users. It would also recognize
> them as VAIO EEPROMs and would hide some bytes from non-root users
> because these bytes contain the BIOS password in a lightly encoded form.
>
> In order to keep the same level of functionality, we would have to offer
> the same with the at24 driver. At this time, the user has to
> instantiate a "24c02" device manually from user-space. By default this
> device has permissions 600, which is insufficient for users, and
> dangerous for root, so a quick chmod 444 is needed.
>
> Without the password issue, I would just document the procedure and
> live with it. However in order to protect the password from being read
> by random users, the driver itself needs to know that it is dealing
> with a specific type of EEPROM. It seems that we need to introduce a
> new device flavor to the at24 driver for this purpose.
>
> I see that we already have a number of specific flags (AT24_FLAG_SERIAL
> and AT24_FLAG_MAC) so I suppose we could add something similar for
> these VAIO EEPROMs. Something like:
>
> /* Some Sony VAIO laptops have a 24c02 at 0x57 with product info */
> AT24_CHIP_DATA(at24_data_sony_vaio, 2048 / 8,
>         AT24_FLAG_READONLY | AT24_FLAG_IRUGO | AT24_FLAG_SONY_VAIO);
>
> Then I suppose it's only a matter of conditionally zeroing a selected
> range in at24_read() before it returns, to hide the password from
> non-root users.
>
> Before I start implementing the idea above, I would like to know if
> anyone objects to it, or has a better idea?
>

Sounds good to me in general but isn't it something we could
generalize a bit more?

For instance we could make at24_chip_data struct look something like this:

struct at24_chip_data {
    u32 byte_len;
    u8 flags;
    struct resource masked;
};

And we could introduce a new macro called AT24_CHIP_DATA_MASKED that
would automacially set the AT24_FLAG_MASKED_RANGE flag and take
another argument that would contain the address and size of the masked
register range (we'd put it into the "masked" resource)?

Other ideas are welcome too. I just think that making it
SONY_VAIO-specific may be a bit limiting in the future.

Best regards,
Bartosz Golaszewski
