Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C512D47F33E
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Dec 2021 13:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhLYMjc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Dec 2021 07:39:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhLYMjc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Dec 2021 07:39:32 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF66AC061401;
        Sat, 25 Dec 2021 04:39:31 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id h21so5794710ljh.3;
        Sat, 25 Dec 2021 04:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to;
        bh=Y0EGtTyg3mP/YEUrMu8z7SNmBjPe8bhxbkpOT3BOeas=;
        b=FAw2w5mkf4GyZVPcTl/9WFDhDByOcf0b0ENsT4B7lq6vxaPGpg5OjXmXU8NYpaMwyG
         ScV1XumFBQBpEq0EYyhBb9w+M/2GX99Ix76ZE7m8qxGt1PI+Bbx6+bweKT1V0xttAdyQ
         hweIUQVYqOdumiyqGG3re1liPZHNvHv6KeZ+lAxgv9PmuU5iNgeha8f5J2NZd2t4UKqk
         1ChVkucKmN/tKs4wbmKya8DB1qNaAB2yv/wXoWD5TFB1QFEv7LTI2yi97WWDd8FDhR+t
         cFgVwYgHcQc+HD4Yv0GxUr5GfON0iYxP7bPUfhXgureWVvLauN6L5A3RInjT3TI8EYMr
         pbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to;
        bh=Y0EGtTyg3mP/YEUrMu8z7SNmBjPe8bhxbkpOT3BOeas=;
        b=iCF8CJ+wRR/KteF+htbfdzoS5sbeGLBhUSAuj+rPEka4r97mKk/2Idne0kGqXm06NO
         JJiPW5PhU+Rn1C4573BY7K/HLnZKnPlN03iUVTMkqfgK6mH6RgI/9JePBcMdig34RQD8
         0jlA7ROdjijB4VIIZEDTJilaBdNGl0piUyFUJtJdVMkpSCX1toHqEfDWDemKKYf9fw7k
         QR05O4AsAEvWbvNS0FwPhkoMIb1gicb7BNzd2mVMPOvwKganRrb9fkWlcFpo++Vuey4s
         jZT1wgqL+gvnVScSlHWNPCHjUR7mOc4u9O9VTsAetr4Ox3kgJDQt7/KvyQoQ0NZR6v2Q
         l8jw==
X-Gm-Message-State: AOAM530NLEo6jNz/izcVJcMFSFMfTNHr8QbhOJVprm7pFb0IsurjONcE
        h6XRlJ2snNOgfQiRL/2SK/k=
X-Google-Smtp-Source: ABdhPJxgId8CbnICHenDxjk8kfBc4ZQeWE9pLZSIYCh95MrrX/786S1Z+Qljt16iduOlsX2g+w05/Q==
X-Received: by 2002:a05:651c:b13:: with SMTP id b19mr1239595ljr.298.1640435969772;
        Sat, 25 Dec 2021 04:39:29 -0800 (PST)
Received: from [192.168.1.11] ([94.103.235.97])
        by smtp.gmail.com with ESMTPSA id c20sm1030611ljf.37.2021.12.25.04.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Dec 2021 04:39:28 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------QhlAo1ObBFuXZqz8o3xtSPmU"
Message-ID: <0c5a424c-4089-9623-9276-9e9473191deb@gmail.com>
Date:   Sat, 25 Dec 2021 15:39:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [syzbot] WARNING in __i2c_transfer (2)
Content-Language: en-US
To:     syzbot <syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, wsa@kernel.org
References: <000000000000b5e7f105d0d2d165@google.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <000000000000b5e7f105d0d2d165@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is a multi-part message in MIME format.
--------------QhlAo1ObBFuXZqz8o3xtSPmU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/21 15:19, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    c8c109546a19 Merge tag 'zstd-for-linus-v5.16' of git://git..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10a5bb32b00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a262045c4c15a9e0
> dashboard link: https://syzkaller.appspot.com/bug?extid=e417648b303855b91d8a
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
> 

#syz test
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


With regards,
Pavel Skripkin
--------------QhlAo1ObBFuXZqz8o3xtSPmU
Content-Type: text/plain; charset=UTF-8; name="ph"
Content-Disposition: attachment; filename="ph"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2kyYy1kZXYuYyBiL2RyaXZlcnMvaTJjL2kyYy1k
ZXYuYwppbmRleCBiY2UwZThiYjc4NTIuLjNiNTRlZmE0YjFlYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9pMmMvaTJjLWRldi5jCisrKyBiL2RyaXZlcnMvaTJjL2kyYy1kZXYuYwpAQCAtNTM1
LDcgKzUzNSw3IEBAIHN0YXRpYyBsb25nIGNvbXBhdF9pMmNkZXZfaW9jdGwoc3RydWN0IGZp
bGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvCiAJCQkJICAgc2l6ZW9m
KHJkd3JfYXJnKSkpCiAJCQlyZXR1cm4gLUVGQVVMVDsKIAotCQlpZiAocmR3cl9hcmcubm1z
Z3MgPiBJMkNfUkRXUl9JT0NUTF9NQVhfTVNHUykKKwkJaWYgKCFyZHdyX2FyZy5ubXNncyB8
fCByZHdyX2FyZy5ubXNncyA+IEkyQ19SRFdSX0lPQ1RMX01BWF9NU0dTKQogCQkJcmV0dXJu
IC1FSU5WQUw7CiAKIAkJcmR3cl9wYSA9IGttYWxsb2NfYXJyYXkocmR3cl9hcmcubm1zZ3Ms
IHNpemVvZihzdHJ1Y3QgaTJjX21zZyksCg==
--------------QhlAo1ObBFuXZqz8o3xtSPmU--

