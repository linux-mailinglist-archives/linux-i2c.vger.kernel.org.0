Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0368790852
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 16:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbjIBO7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 10:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbjIBO7L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 10:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD45C10F3
        for <linux-i2c@vger.kernel.org>; Sat,  2 Sep 2023 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693666707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZVeMbauliYYISM20IxNeM/16/K7tsybvKpmJT8N7EWQ=;
        b=hi/sN7Du1SUmk5wRVpkYcMB0x8xMRsVGuwgxyXY/gnat2uUd/e/s/R718+gNK1uz/3WxKb
        Pa+kbpTd8FZR3+10bb39GI8MalQf6OSR8FVP9K9NtOMvqHj3FecGjEXct8oIts70C5Pv8k
        pd6g8M2+sEZ+gn4ab3p/6aFGIFG00nA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-fMXNX6NHNv-zv2aEDLqA7g-1; Sat, 02 Sep 2023 10:58:25 -0400
X-MC-Unique: fMXNX6NHNv-zv2aEDLqA7g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso3288566b.2
        for <linux-i2c@vger.kernel.org>; Sat, 02 Sep 2023 07:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693666704; x=1694271504;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVeMbauliYYISM20IxNeM/16/K7tsybvKpmJT8N7EWQ=;
        b=KXTUSG1nCD/Wl3b7Ik2XQkgIVACPvGKZc4AmT3vwuY9rWgJKtwCeqT2ryv5nkWKlaX
         iRqgjuoHH5gRdteiC2LNG9Esvx7rtmJYhm0QYgHTIdhSSWijmZb7dK3Woi72Sf4qUK1g
         qlgIKJlJxbJeTV3ClHZkeZ76EQWtq7o3Hi7+LRcI9B8yVVDWr4rH2JAkibmvLjNUHbWO
         WvK/ar8O+zNR0gbjQZFaFATqZzesAY2hW6YFPDoQZu8sXOFy61r7Isn5W3lC3rG9PXv7
         6VP5b3XpU9uJ7VW7Btsu8pYBUgS+ttldehmdbxGcAvlcRagQOC1Bl9pdJ3bAJfPehToL
         /W4Q==
X-Gm-Message-State: AOJu0YyUdyojeZxTAeUxvo1PVGoc4xQQYK68/wKDHL94LtRdIqSv9FVY
        9hgVC3du+kLgPHJX0vRPA170YqBbphRC3MHAjfvDgmoZoffDF5+0wnaQsqXp/G65UHASwChB7KG
        lu09mcfpEMOLCWq50lkw3
X-Received: by 2002:a17:906:cc12:b0:9a5:a068:553f with SMTP id ml18-20020a170906cc1200b009a5a068553fmr4064801ejb.50.1693666704239;
        Sat, 02 Sep 2023 07:58:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdk5vHDJzE7IwsoqqZLyLGYvu795ZdGGKC/ksKpLStjbO5NBBYmr9fg3ol2vHzNk9TTxqdVw==
X-Received: by 2002:a17:906:cc12:b0:9a5:a068:553f with SMTP id ml18-20020a170906cc1200b009a5a068553fmr4064772ejb.50.1693666703863;
        Sat, 02 Sep 2023 07:58:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a6-20020a170906244600b0099cce6f7d50sm3521549ejb.64.2023.09.02.07.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 07:58:23 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------Hu3v8sgYmgcWz7S6vFvyqoA4"
Message-ID: <7fc37bb5-2121-4174-fb1d-9edf49213a6c@redhat.com>
Date:   Sat, 2 Sep 2023 16:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v12 0/4] Add Intel LJCA device driver
Content-Language: en-US, nl
To:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is a multi-part message in MIME format.
--------------Hu3v8sgYmgcWz7S6vFvyqoA4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/1/23 07:36, Wentong Wu wrote:
> Add driver for Intel La Jolla Cove Adapter (LJCA) device. This is
> a USB-GPIO, USB-I2C and USB-SPI device. We add 4 drivers to support
> this device: a USB driver, a GPIO chip driver, a I2C controller
> driver and a SPI controller driver.

Thanks. I've been testing this on a Lenovo X1 ThinkPad Yoga gen 8
with an ov2740 sensor connected to the LJCA device.

I needed 2 small(ish) fixes to make everything work there.
I have attached the 2 fixes here.

With these 2 fixes this series is:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> ---
> v12:
>  - switch dev_err to dev_dbg for i2c-ljca driver
>  - avoid err printing because of calling usb_kill_urb when
> attempts to resubmit the rx urb
> 
> v11:
>  - switch dev_err to dev_dbg for i2c-ljca driver
>  - remove message length check because of defined quirk structure
>  - remove I2C_FUNC_SMBUS_EMUL support
> 
> v10:
>  - remove ljca_i2c_format_slave_addr
>  - remove memset before write write w_packet
>  - make ljca_i2c_stop void and print err message in case failure
>  - use dev_err_probe in ljca_i2c_probe function
> 
> v9:
>  - overhaul usb-ljca driver to make it more structured and easy understand
>  - fix memory leak issue for usb-ljca driver
>  - add spinlock to protect tx_buf and ex_buf
>  - change exported APIs for usb-ljca driver
>  - unify prefix for structures and functions for i2c-ljca driver
>  - unify prefix for structures and functions for spi-ljca driver
>  - unify prefix for structures and functions for gpio-ljca driver
>  - update gpio-ljca, i2c-ljca and spi-ljca drivers according to usb-ljca's changes
> 
> Wentong Wu (4):
>   usb: Add support for Intel LJCA device
>   i2c: Add support for Intel LJCA USB I2C driver
>   spi: Add support for Intel LJCA USB SPI driver
>   gpio: update Intel LJCA USB GPIO driver
> 
>  drivers/gpio/Kconfig          |   4 +-
>  drivers/gpio/gpio-ljca.c      | 246 +++++++------
>  drivers/i2c/busses/Kconfig    |  11 +
>  drivers/i2c/busses/Makefile   |   1 +
>  drivers/i2c/busses/i2c-ljca.c | 326 +++++++++++++++++
>  drivers/spi/Kconfig           |  11 +
>  drivers/spi/Makefile          |   1 +
>  drivers/spi/spi-ljca.c        | 297 +++++++++++++++
>  drivers/usb/misc/Kconfig      |  14 +
>  drivers/usb/misc/Makefile     |   1 +
>  drivers/usb/misc/usb-ljca.c   | 817 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/ljca.h      | 113 ++++++
>  12 files changed, 1737 insertions(+), 105 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-ljca.c
>  create mode 100644 drivers/spi/spi-ljca.c
>  create mode 100644 drivers/usb/misc/usb-ljca.c
>  create mode 100644 include/linux/usb/ljca.h
> 

--------------Hu3v8sgYmgcWz7S6vFvyqoA4
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-ljca-Fix-picking-the-ACPI-companion-for-the-I2C-.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-ljca-Fix-picking-the-ACPI-companion-for-the-I2C-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjNDNmNzMwMTRjNjUyYTY2MTZiMzYwZWRjMmJlNTgyMDk4OTYwMzgyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBTYXQsIDIgU2VwIDIwMjMgMTI6MDg6MTYgKzAyMDAKU3ViamVjdDogW1BB
VENIIDEvNF0gdXNiOiBsamNhOiBGaXggcGlja2luZyB0aGUgQUNQSSBjb21wYW5pb24gZm9y
IHRoZSBJMkMKIGNvbnRyb2xsZXJzCgpUaGUgbGpjYSBJTy1leHBhbmRlciBoYXMgMiBJMkMg
Y29udHJvbGxlcnMsIHdoaWNoIGJvdGggaGF2ZQp0aGUgc2FtZSBBUEkgSElELCBlLmcuICJJ
TlRDMTA5NyIgb24gYSBMZW5vdm8gWDEgVGhpbmtQYWQgWW9nYSBnZW4gOC4KClRha2luZyB0
aGUgZmlyc3QgQUNQSSBjb21wYW5pb24gd2hpY2ggbWF0Y2hlcyB0aGUgSElEIHJlc3VsdHMg
aW4gYm90aApJMkMgY29udHJvbGxlcnMgZ2V0dGluZyBhc3NpZ25lZCB0aGUgc2FtZSBBQ1BJ
IGNvbXBhbmlvbi4KCkFkZCBhbiBBQ1BJIFVJRCBjaGVjayB0byBhc3NpZ24gdGhlIHJpZ2h0
IGNvbXBhbmlvbiB0byBib3RoCkkyQyBjb250cm9sbGVycy4gVGhpcyBmaXhlcyBubyBpMmMt
Y2xpZW50IGdldHRpbmcgaW5zdGFudGlhdGVkIGZvcgp0aGUgb3YyNzQwIHNlbnNvciBvbiBh
IExlbm92byBYMSBUaGlua1BhZCBZb2dhIGdlbiA4LgoKTm90ZSBzb21lIERTRFRzIGhhdmUg
b25seSAxIEFDUEkgY29tcGFuaW9uIGZvciB0aGUgMiBJMkMgY29udHJvbGxlcnMKYW5kIHRo
ZXNlIGRvbid0IHNldCBhIFVJRCBhdCBhbGwuIE9uIHRoZXNlIG1vZGVscyBvbmx5IHRoZSBm
aXJzdCBJMkMKY29udHJvbGxlciBpcyB1c2VkLiBTbyBpZiBhIEhJRCBtYXRjaCBoYXMgbm8g
VUlEIHVzZSAiMCIgZm9yIHRoZSBISUQuCmFzc2lnbmluZyB0aGUgQUNQSSBjb21wYW5pb24g
dG8gdGhlIGZpcnN0IEkyQyBjb250cm9sbGVyLgpBbiBleGFtcGxlIGRldmljZSB3aXRoIHRo
aXMgc2V0dXAgaXMgdGhlIERlbGwgTGF0aXR1ZGUgOTQyMC4KClNpZ25lZC1vZmYtYnk6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy91c2IvbWlz
Yy91c2ItbGpjYS5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9taXNjL3VzYi1samNhLmMgYi9kcml2ZXJzL3VzYi9taXNjL3Vz
Yi1samNhLmMKaW5kZXggNGIwYTc3NzI1YmRkLi44MmI4ZTFlYTZiYmIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdXNiL21pc2MvdXNiLWxqY2EuYworKysgYi9kcml2ZXJzL3VzYi9taXNjL3Vz
Yi1samNhLmMKQEAgLTM0OSw2ICszNDksNyBAQCBFWFBPUlRfU1lNQk9MX05TX0dQTChsamNh
X3VucmVnaXN0ZXJfZXZlbnRfY2IsIExKQ0EpOwogI2lmZGVmIENPTkZJR19BQ1BJCiBzdHJ1
Y3QgbGpjYV9tYXRjaF9pZHNfd2Fsa19kYXRhIHsKIAljb25zdCBzdHJ1Y3QgYWNwaV9kZXZp
Y2VfaWQgKmlkczsKKwljb25zdCBjaGFyICp1aWQ7CiAJc3RydWN0IGFjcGlfZGV2aWNlICph
ZGV2OwogfTsKIApAQCAtMzc5LDIzICszODAsMzQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBh
Y3BpX2RldmljZV9pZCBsamNhX3NwaV9oaWRzW10gPSB7CiBzdGF0aWMgaW50IGxqY2FfbWF0
Y2hfZGV2aWNlX2lkcyhzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYsIHZvaWQgKmRhdGEpCiB7
CiAJc3RydWN0IGxqY2FfbWF0Y2hfaWRzX3dhbGtfZGF0YSAqd2QgPSBkYXRhOworCWNvbnN0
IGNoYXIgKnVpZCA9IGFjcGlfZGV2aWNlX3VpZChhZGV2KTsKIAotCWlmICghYWNwaV9tYXRj
aF9kZXZpY2VfaWRzKGFkZXYsIHdkLT5pZHMpKSB7Ci0JCXdkLT5hZGV2ID0gYWRldjsKLQkJ
cmV0dXJuIDE7Ci0JfQorCWlmIChhY3BpX21hdGNoX2RldmljZV9pZHMoYWRldiwgd2QtPmlk
cykpCisJCXJldHVybiAwOwogCi0JcmV0dXJuIDA7CisJaWYgKCF3ZC0+dWlkKQorCQlnb3Rv
IG1hdGNoOworCisJaWYgKCF1aWQpCisJCXVpZCA9ICIwIjsKKworCWlmIChzdHJjbXAodWlk
LCB3ZC0+dWlkKSkKKwkJcmV0dXJuIDA7CisKK21hdGNoOgorCXdkLT5hZGV2ID0gYWRldjsK
KwlyZXR1cm4gMTsKIH0KIAogLyogYmluZCBhdXhpbGlhcnkgZGV2aWNlIHRvIGFjcGkgZGV2
aWNlICovCiBzdGF0aWMgdm9pZCBsamNhX2F1eGRldl9hY3BpX2JpbmQoc3RydWN0IGxqY2Ff
YWRhcHRlciAqYWRhcCwKIAkJCQkgIHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphdXhkZXYs
Ci0JCQkJICB1NjQgYWRyKQorCQkJCSAgdTY0IGFkciwgdTggaWQpCiB7CiAJc3RydWN0IGxq
Y2FfbWF0Y2hfaWRzX3dhbGtfZGF0YSB3ZCA9IHsgMCB9OwogCXN0cnVjdCBhY3BpX2Rldmlj
ZSAqcGFyZW50LCAqYWRldjsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBhZGFwLT5kZXY7CisJ
Y2hhciB1aWRbNF07CiAKIAlwYXJlbnQgPSBBQ1BJX0NPTVBBTklPTihkZXYpOwogCWlmICgh
cGFyZW50KQpAQCAtNDIxLDYgKzQzMyw4IEBAIHN0YXRpYyB2b2lkIGxqY2FfYXV4ZGV2X2Fj
cGlfYmluZChzdHJ1Y3QgbGpjYV9hZGFwdGVyICphZGFwLAogCQlicmVhazsKIAljYXNlIExK
Q0FfSTJDMV9BQ1BJX0FEUjoKIAljYXNlIExKQ0FfSTJDMl9BQ1BJX0FEUjoKKwkJc25wcmlu
dGYodWlkLCBzaXplb2YodWlkKSwgIiVkIiwgaWQpOworCQl3ZC51aWQgPSB1aWQ7CiAJCXdk
LmlkcyA9IGxqY2FfaTJjX2hpZHM7CiAJCWJyZWFrOwogCWNhc2UgTEpDQV9TUEkxX0FDUElf
QURSOgpAQCAtNDQ5LDcgKzQ2Myw3IEBAIHN0YXRpYyB2b2lkIGxqY2FfYXV4ZGV2X2FjcGlf
YmluZChzdHJ1Y3QgbGpjYV9hZGFwdGVyICphZGFwLAogI2Vsc2UKIHN0YXRpYyB2b2lkIGxq
Y2FfYXV4ZGV2X2FjcGlfYmluZChzdHJ1Y3QgbGpjYV9hZGFwdGVyICphZGFwLAogCQkJCSAg
c3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmF1eGRldiwKLQkJCQkgIHU2NCBhZHIpCisJCQkJ
ICB1NjQgYWRyLCB1OCBpZCkKIHsKIH0KICNlbmRpZgpAQCAtNDg5LDcgKzUwMyw3IEBAIHN0
YXRpYyBpbnQgbGpjYV9uZXdfY2xpZW50X2RldmljZShzdHJ1Y3QgbGpjYV9hZGFwdGVyICph
ZGFwLCB1OCB0eXBlLCB1OCBpZCwKIAlpZiAocmV0KQogCQlnb3RvIGVycl9mcmVlOwogCi0J
bGpjYV9hdXhkZXZfYWNwaV9iaW5kKGFkYXAsIGF1eGRldiwgYWRyKTsKKwlsamNhX2F1eGRl
dl9hY3BpX2JpbmQoYWRhcCwgYXV4ZGV2LCBhZHIsIGlkKTsKIAogCXJldCA9IGF1eGlsaWFy
eV9kZXZpY2VfYWRkKGF1eGRldik7CiAJaWYgKHJldCkKLS0gCjIuNDEuMAoK
--------------Hu3v8sgYmgcWz7S6vFvyqoA4
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-i2c-ljca-Call-acpi_dev_clear_dependencies.patch"
Content-Disposition: attachment;
 filename="0002-i2c-ljca-Call-acpi_dev_clear_dependencies.patch"
Content-Transfer-Encoding: base64

RnJvbSBkZmEzYmIzZDVmNDAzYjM2Yjc3OTUwOWI5ZGNmYmYxMTE0ZWViZWUyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBGcmksIDEgU2VwIDIwMjMgMTk6NDc6NDggKzAyMDAKU3ViamVjdDogW1BB
VENIIDIvNF0gaTJjOiBsamNhOiBDYWxsIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcygp
CgpDYWxsIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcygpIHRvIG1hcmsgX0RFUCBBQ1BJ
IGRlcGVuZGVuY2llcyBvbgp0aGUgSTJDIGNvbnRyb2xsZXIgYXMgc2F0aXNmaWVkIHNvIHRo
YXQgYWNwaV9kZXZfcmVhZHlfZm9yX2VudW1lcmF0aW9uKCkKZm9yIHRoZSBJMkMgZGV2aWNl
IG5vZGVzIGluIEFQQ0kgd2lsbCByZXR1cm4gdHJ1ZSBvbmNlIHRoZSBJMkMgY29udHJvbGxl
cgppcyByZWdpc3RlcmVkLgoKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWxqY2EuYyB8IDkg
KysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1samNhLmMgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWxqY2EuYwppbmRleCAzNTcyMzQ4OTRkZWEuLjNhZmY0ZGU1
MjkyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1samNhLmMKKysrIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1samNhLmMKQEAgLTMwMyw3ICszMDMsMTQgQEAgc3Rh
dGljIGludCBsamNhX2kyY19wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4ZGV2
LAogCQkJCSAgICAgImkyYyBpbml0IGZhaWxlZCBpZDogJWRcbiIsCiAJCQkJICAgICBsamNh
X2kyYy0+aTJjX2luZm8tPmlkKTsKIAotCXJldHVybiBkZXZtX2kyY19hZGRfYWRhcHRlcigm
YXV4ZGV2LT5kZXYsICZsamNhX2kyYy0+YWRhcCk7CisJcmV0ID0gZGV2bV9pMmNfYWRkX2Fk
YXB0ZXIoJmF1eGRldi0+ZGV2LCAmbGpjYV9pMmMtPmFkYXApOworCWlmIChyZXQpCisJCXJl
dHVybiByZXQ7CisKKwlpZiAoaGFzX2FjcGlfY29tcGFuaW9uKCZsamNhX2kyYy0+YWRhcC5k
ZXYpKQorCQlhY3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoQUNQSV9DT01QQU5JT04oJmxq
Y2FfaTJjLT5hZGFwLmRldikpOworCisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9pZCBsamNhX2kyY19pZF90YWJsZVtdID0gewotLSAK
Mi40MS4wCgo=

--------------Hu3v8sgYmgcWz7S6vFvyqoA4--

