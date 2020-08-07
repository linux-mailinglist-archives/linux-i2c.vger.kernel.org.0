Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F313223EEE1
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 16:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgHGOPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 10:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgHGOPj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 10:15:39 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C991C061756;
        Fri,  7 Aug 2020 07:15:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id c6so946137pje.1;
        Fri, 07 Aug 2020 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=3rNHsQd+IJnmQRGECHNVlsy5npf2obdnNWTh+jrObj0=;
        b=invKBJUBBomIVacgxCMF4eSLms0SmO+PF198I/M24ObdPQArlyGpwIj4N/BkZ7Dnd0
         aJYgskV+X+CRdkHfKmq3hWVG5RbhhRx5iaDFKQ9Z0E/BCdMrhcUmU8GATiPmCTriWxXr
         lxZwh8BDqtiDgu1USkp9IJXBq9M4d+iv/oC5wC3te1OEyRnFryPbhwwznYkz3DMisnOD
         TStqMMU5M1NnmmTSCAffcI3E4whisp3jkOusxDW1JyBGPUO1O84Dv3SUWoG6xdy4TL8U
         kAmAlLCsN9PfjABj0AlsFr9JisBpv7bmgIIJS6JSvQDYfKu3jmh/DbIlOkUL+7aX2Imh
         70qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=3rNHsQd+IJnmQRGECHNVlsy5npf2obdnNWTh+jrObj0=;
        b=ghvpsZ/L1zOPzMn3XpOoK2Hc8fhCCkBObI/yUCCD8RyvoWoPM46YTTmyDaZA02Tvkp
         Y8pparBL1IlHIwYD1iOh788xXDmyN6xZT32YmgvQPYWTfZr93/ut8uqyEFp246i+79ps
         XXnHTAKUMVqcHga4k/8BOc3n3OHUgYQwuH0FOulOyw64t/IvJC7F07Ah57AFdGeLfeWl
         UgMu7c2GgcUHbcbqy5eVelJyguFO6852Nur4oUR7NhJKGPlX5rZ66jr+uxpAfVbCWJtN
         MthP8BtUriB1NCHlNRuKU3MZ0OySZityn24tCob10agMdFfsfITvqnFN+lAcfhrDaZJT
         PPFw==
X-Gm-Message-State: AOAM533tHbnEabOFpI4s8JWq+9cMa4r5rOGyX6fzuern8O3lbHRmlQiv
        loxUsabvDptWnpmRiAMp8bBKXZxJ
X-Google-Smtp-Source: ABdhPJzGfCCEEfK5KZxnsItctcmUEdQ2CRMFH4LV1SSg1rlitqoRwCGZd1mbn1GFpfEdJPkeVZnlEg==
X-Received: by 2002:a17:902:bb82:: with SMTP id m2mr12583154pls.115.1596809738865;
        Fri, 07 Aug 2020 07:15:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u24sm12671958pfm.20.2020.08.07.07.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 07:15:37 -0700 (PDT)
Subject: Re: [PATCH] hwmon/pmbus: use simple i2c probe function
To:     Stephen Kitt <steve@sk2.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200806161645.9437-1-steve@sk2.org>
 <5f7b5828-cb7c-127a-e454-6c8b8d98777b@roeck-us.net>
 <20200806221232.278c3878@heffalump.sk2.org>
 <e378e4e6-73b3-0a11-bca6-ec0d4225a010@roeck-us.net>
 <20200807082327.02e8a682@heffalump.sk2.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a25e62a8-0610-b015-001f-dec9b1600b3b@roeck-us.net>
Date:   Fri, 7 Aug 2020 07:15:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807082327.02e8a682@heffalump.sk2.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="D3ziB1DQZlBAttgUfYcal3w192NzPdJNj"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D3ziB1DQZlBAttgUfYcal3w192NzPdJNj
Content-Type: multipart/mixed; boundary="JzkhzGad8BZEbvPNhybNQ4DCkage2QZje"

--JzkhzGad8BZEbvPNhybNQ4DCkage2QZje
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/6/20 11:23 PM, Stephen Kitt wrote:
> On Thu, 6 Aug 2020 14:48:58 -0700, Guenter Roeck <linux@roeck-us.net> w=
rote:
>> On 8/6/20 1:12 PM, Stephen Kitt wrote:
>>> On Thu, 6 Aug 2020 12:15:55 -0700, Guenter Roeck <linux@roeck-us.net>=

>>> wrote: =20
>>>> On 8/6/20 9:16 AM, Stephen Kitt wrote: =20
> [...]
>>>> Also, I am not convinced that replacements such as
>>>>
>>>> -	{ "ipsps1", 0 },
>>>> +	{ .name =3D "ipsps1" },
>>>>
>>>> are an improvement. I would suggest to leave that alone for
>>>> consistency (and to make it easier to add more devices to the
>>>> various drivers if that happens in the future). =20
>>>
>>> From reading through all the drivers using id_table, it seems to me t=
hat
>>> we could do away with driver_data altogether and move all that to
>>> driver-local structures, in many cases covering more than just an id.=
 By
>>> only initialising the elements of the structure that are really neede=
d, I
>>> was hoping to (a) make it more obvious that driver_data isn=E2=80=99t=
 used, and
>>> (b) allow removing it without touching all the code again.
>>>  =20
>>
>> I don't see it as an improvement to replace a common data structure wi=
th
>> per-driver data structures. That sounds too much like "let's re-invent=

>> the wheel over and over again". If that is where things are going, I'd=

>> rather have it implemented everywhere else first. I am ok with the oth=
er
>> changes, but not with this.
>=20
> I agree, and I wasn=E2=80=99t intending on encouraging re-inventing the=
 wheel in each
> driver. Let=E2=80=99s focus on probe_new for now...
>=20
> What did you mean by =E2=80=9Cto make it easier to add more devices to =
the various
> drivers if that happens in the future=E2=80=9D? There are already many =
drivers with
> multiple devices but no driver_data, dropping the explicit driver_data
> initialisation doesn=E2=80=99t necessarily make it harder to add device=
s, does it?
>=20
There is an existing mechanism to identify devices based on the device ID=
,
should that be necessary. I am not inclined to let people invent a
separate per-driver mechanism unless the kernel community decides that
this is the way to go.

Thanks,
Guenter


--JzkhzGad8BZEbvPNhybNQ4DCkage2QZje--

--D3ziB1DQZlBAttgUfYcal3w192NzPdJNj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl8tYgcACgkQyx8mb86f
mYHgXA/9G2TBy36pfKt10TOh5xKEsal0OfqImvfi8xN8RFbEb9z4Lv1x/TGZA0g9
JxWzzesGB5ijrZJ+toXTfbn4Yz9Fa3QsdFs71LRV/pDu3mXvjiu/awJtX2ETf7wB
5kGx7ndUwrm5blXMkEiRf9mwOen4fof+hwxylJfm7UBKaspRsAQq4//ucH1uMjgy
Lx0jR4ogwnvUGwWi95DqFQ98tyAuJKF6x65HwxYauA/XiyZXytjOzfrXUkePlhQJ
x0gMfhLtOIMp+H0oMCqu1aKRrOfZYZi/oJ6aD+9B5Em2jL1LjVWUrrA1Ft0+30ES
zFP0mwayGcnh0rGqEUp3GN1zlqnVsrkSDSC0Bh4OztZHD6h/bPo4T0Vg4v+eN/Hl
JzauCcvGpN/lScQt75UD4PuLXEp3FWcEOyTuteqWO+jfZFTyjKlPI7qEgrZrvtR2
q9ULXRZF+Zg534crmbPyg5X7pUf1tyvX2Z+hJalCUREYBh+urxmUGko8afRnwg97
gEILEhVJZVsladGvsS8o+jrCzYMRBotDy+Ys42X63Wx3x3SurLS56W3KWHF3t6TQ
CfQ2hMpouhvXZLDx9XlZ/9XuH5MA3LVkQwybwWL6nbWP5w6g3QQOZ97up7HjCU00
KIUNQl2PAnvb3TYBx0lZ4Wzj8yT7lhEYObv1sHvzNAjJCyk6MnE=
=TNBo
-----END PGP SIGNATURE-----

--D3ziB1DQZlBAttgUfYcal3w192NzPdJNj--
