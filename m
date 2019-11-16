Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF14AFF3FC
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Nov 2019 17:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfKPQlx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Nov 2019 11:41:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46617 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727687AbfKPQlx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Nov 2019 11:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573922511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rieJJMhberbdtMUK9h8xQqVA5re21QebbZ42Q+bEccA=;
        b=J9xJomuFOqhocQ9O98IzE9S6D1MH4yxYY2yR774H+Q87LN3n2+flU/RJi3Si05/RKa6aOU
        h5jc9Aqmp+xuPdA0mS5CZ4KgpNmnc3PY9aaXz9HGxJXoqDn3MElrtmxem7sveOubtQUF+V
        EWIwV3YRKsubJP2OxB/AezN+3rD39eA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-3rY4nvUoPHuToycnFVJx1w-1; Sat, 16 Nov 2019 11:41:46 -0500
Received: by mail-wr1-f70.google.com with SMTP id y3so11600314wrm.12
        for <linux-i2c@vger.kernel.org>; Sat, 16 Nov 2019 08:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qP9qXptu1iumfZdm4TD6Ahp2yjsqgBao1/DCi2rpxH0=;
        b=fS2vEb7QasRLwA76kKYpu+PmAD9t6cUCy3lQx3N4JvwQhg70EmBHSn20WdOcxfj7Rj
         PsRBmLYccR2S/XrH3nwop+KhAAYjqi4Xch3i9eZwnxwM6jew9AjWplJDG2kb7tmBcA4S
         mgLYfyD1ePCW8DCzF4gPWBLdMztNcLQ3wUnJGUcQDERrilzUmHIvG4ukKP0i7a+HmEnh
         +NXkLe1U2r1XyS40IwEMIRIyLy9DuFC9VFfPk0c1SiB64SeZ89X6yKQjiE1sNP6t81Bz
         OdirgqGyT+JxxGUN0F3/HBqiuwlKYA87Vs7ZEfODgnbBKmfXdJjWRL7ywc9uUdHUbc6X
         j4VA==
X-Gm-Message-State: APjAAAWKBpyrF7L4u/9o34HhJeSnYxeG5iYxKLU6jwWVogKoqoiMy4hM
        f6s+7MEklgInO+5I8qqJuejR7Y/XgqVknKLyAfNJ1AiSB1IlSECu/CF4ipHTzzgOYxawXkp14aT
        aPHELXhrke6PZtbs5crJk
X-Received: by 2002:a05:6000:1206:: with SMTP id e6mr21516277wrx.113.1573922505272;
        Sat, 16 Nov 2019 08:41:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBEdg1RV6Rn9vhpufQzBH4HFASZZ+VzcZmLE4ePDmmdJUuzFmiMVrJ28S+UR8Oz8LAXb5eFA==
X-Received: by 2002:a05:6000:1206:: with SMTP id e6mr21516258wrx.113.1573922505036;
        Sat, 16 Nov 2019 08:41:45 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id t13sm15322975wrr.88.2019.11.16.08.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2019 08:41:44 -0800 (PST)
Subject: Re: [PATCH v2] i2c: acpi: Force bus speed to 400KHz if a Silead
 touchscreen is present
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        youling 257 <youling257@gmail.com>
References: <20191113182938.279299-1-hdegoede@redhat.com>
 <20191114204815.GC7213@kunai>
 <c67a085b-8013-ef03-b5b2-431ea64ca97a@redhat.com>
 <20191115205641.GA8973@kunai>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d340cd7b-c819-58a0-f5ee-efe0665cf4df@redhat.com>
Date:   Sat, 16 Nov 2019 17:41:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191115205641.GA8973@kunai>
Content-Language: en-US
X-MC-Unique: 3rY4nvUoPHuToycnFVJx1w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 15-11-2019 21:56, Wolfram Sang wrote:
>=20
>> Well it is configuring the bus at a speed where not all devices
>> can work, where as there is another speed where all devices do work.
>> With that said I'm open to a different wording for the warning. Feel
>> free to modify this before you add it to your tree.
>=20
> Changed the message to "DSDT uses known not-working I2C bus speed %d,
> forcing it to %d\n" and applied to for-current, thanks!

The new message sounds good to me, thanks.

Regards,

Hans

