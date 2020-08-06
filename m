Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCB023E3A0
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 23:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgHFVtD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 17:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgHFVtD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 17:49:03 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6FEC061574;
        Thu,  6 Aug 2020 14:49:02 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 74so17574315pfx.13;
        Thu, 06 Aug 2020 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=eRp4U9SP0iKmSK29lXmPFC3mt2TOlKgz21+WagTHOxw=;
        b=g5j3I6tZPvtli62eEwRcRGGGjv33s3QQkXJjLQPSao9z95lS9IIS3HKo7oc8ye1Qk8
         t7fWTQ3RoO1lGJmsJ5qHoDlz8eoPHyZ4N9sWUDdNG/0KOBJRcd8wJGovndkkEpzCmnhu
         xjzaNQ12kQM5+3DyCI2sMu85pAJnNJwedxrtHaCfqZhJt0f2cvvncERfZ+D5sDZ2vC7n
         iQxZDCz9ayRedzeA3Y3e18rb+mQgZov3whYaxh7VmseY/AezvVjJ3kFxpTmXmOkFNPFZ
         5H7/dw3AvAREkKnvODpI4kCqcrK9U0adydGsRFsxsTLLTDzITOxaYkyIoZ55DkHUYYQs
         0Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=eRp4U9SP0iKmSK29lXmPFC3mt2TOlKgz21+WagTHOxw=;
        b=hYbrHNp4dlOk5O+E7YtBXpTgo+5MurAwo8lecu8fgIvY6eWnuvU1DAgMqPXrtGX2YW
         LbfmYMNrIibZOfoecaVM8pcTL7Bqtbec3P1J63V+HAw4q8l1Y5fUVGnoeQhd1ZCzeoQA
         HxmwawsFYm429epyWZVqFE2m3Cqaqpr3lX6DpKkOUQ9DJsH3/i7NMuMMec9IBy53E22r
         6haU3lZtT9+5mkQgrFZWo03rwvrweapOS8wEq6tKPRyDLNd/zTxgCTctpZKTmE2bIH/S
         e1gF4UOrafkosrBoYb1S2/xF96z3Cq7a2Rurjt27097vWPVXP/7YTTQP70YERjw9nAWA
         HdkQ==
X-Gm-Message-State: AOAM53347fQde0jb+Z61bQi2e5inNSYnhGEcsLrnH/6xE9EKr7AC2iQT
        VkUmZ28byL9hNuAhZrCahrTvl5B6
X-Google-Smtp-Source: ABdhPJwgJBZFo35+H6lhT4MbY/AhvsAW4u5TATluI7qAcwqiXIeqFMbsn71qXQZMITRT3ZINydFubQ==
X-Received: by 2002:a63:d912:: with SMTP id r18mr9108609pgg.358.1596750542162;
        Thu, 06 Aug 2020 14:49:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id np4sm8570690pjb.4.2020.08.06.14.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 14:49:00 -0700 (PDT)
Subject: Re: [PATCH] hwmon/pmbus: use simple i2c probe function
To:     Stephen Kitt <steve@sk2.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200806161645.9437-1-steve@sk2.org>
 <5f7b5828-cb7c-127a-e454-6c8b8d98777b@roeck-us.net>
 <20200806221232.278c3878@heffalump.sk2.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e378e4e6-73b3-0a11-bca6-ec0d4225a010@roeck-us.net>
Date:   Thu, 6 Aug 2020 14:48:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806221232.278c3878@heffalump.sk2.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JccBE59ttU0QeWUvWVkkHKm2Lyq60I0Lk"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JccBE59ttU0QeWUvWVkkHKm2Lyq60I0Lk
Content-Type: multipart/mixed; boundary="uzMnt8ADmlW4McDEqjBrCCOiz0KUI32b0"

--uzMnt8ADmlW4McDEqjBrCCOiz0KUI32b0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/6/20 1:12 PM, Stephen Kitt wrote:
> On Thu, 6 Aug 2020 12:15:55 -0700, Guenter Roeck <linux@roeck-us.net> w=
rote:
>> On 8/6/20 9:16 AM, Stephen Kitt wrote:
>>> pmbus_do_probe doesn't use the id information provided in its second
>>> argument, so this can be removed, which then allows using the
>>> single-parameter i2c probe function ("probe_new") for probes which
>>> don't use the id information either.
>>>
>>> This avoids scanning the identifier tables during probes.
>>>
>>> Additionally, in cases where the id information (driver_data) isn't
>>> used, the corresponding declarations are removed from the id_table,
>>> and .name is specified explicitly.
>>>  =20
>>
>> The ultimate idea seems to be to remove the "old" i2c probe function
>> entirely. This means we'll have to touch the various drivers again
>> to make that happen if they are not converted to probe_new.
>>
>> With that in mind, since we are at it, why not use probe_new() in
>> every driver and call i2c_match_id() in cases where it is actually
>> needed/used ?
>=20
> Yes, I was planning on doing that in a second phase, but I can do it ri=
ght
> now (perhaps as a patch series) if that would be better.
>=20
>> Also, I am not convinced that replacements such as
>>
>> -	{ "ipsps1", 0 },
>> +	{ .name =3D "ipsps1" },
>>
>> are an improvement. I would suggest to leave that alone for
>> consistency (and to make it easier to add more devices to the
>> various drivers if that happens in the future).
>=20
> From reading through all the drivers using id_table, it seems to me tha=
t we
> could do away with driver_data altogether and move all that to driver-l=
ocal
> structures, in many cases covering more than just an id. By only initia=
lising
> the elements of the structure that are really needed, I was hoping to (=
a)
> make it more obvious that driver_data isn=E2=80=99t used, and (b) allow=
 removing it
> without touching all the code again.
>=20

I don't see it as an improvement to replace a common data structure with
per-driver data structures. That sounds too much like "let's re-invent
the wheel over and over again". If that is where things are going, I'd
rather have it implemented everywhere else first. I am ok with the other
changes, but not with this.

Guenter


--uzMnt8ADmlW4McDEqjBrCCOiz0KUI32b0--

--JccBE59ttU0QeWUvWVkkHKm2Lyq60I0Lk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl8sesoACgkQyx8mb86f
mYFGGhAAjZ4ELzmvCho06PCAT1uB6L2Xz1dNjhBCEMyRaG5mBENI0EIDwFvIwSaB
kCYE5c5T92F+OdiPAT5w0OlI35QAsC8j4DDikoTrryLxEmZP9FwPbK97lj4fUQ6+
RQxo5O+ysf8JaS/oueqyBfCyihV6Pgth2OLvyflzOld39PSX5fuJHDZlf9jnMALY
k16C7bCiNC5WEFiKkwn9v18Hwl0uT6UPCYNISV+bjZ9AmNPYj59tsH7E6lTI3wfX
89R8pHPXd1G0Rd0XXDzUXxPHeqFEFgbtG9jvJDOfgo4OItdlGOSFmw06ucCQOESu
JdNSvimbBwdorVzG9AuD8r0AqXm+jJulzzLVvre2xnyAAMczUvz5PQ6P7V78DafJ
bKN5tk22DncwYUfx01dkXyPzzcUny9sgWTkP8cky2Adab0c4Wng4mJIhhXcymumt
ZMJ5Q6M8d0ydPg7wyJibOOia88nvJ5slhlPfiJGlCWOnMvKWsGJ9K2vWoYbvFpP0
mahNGpOAbmp3jLwXKGbzLrFnusz4cJ+SYkPR0GJx8naZrgYTRzuXmozn++tqXpEc
NZZTwfl1OX95aAP5Z45EDnA5TuGwJXirowI3y2bHoZsKxe38Jc1liGisWoAWQ7Nb
o+fwA4oAJCcVImra79Zf+sDLDmjRZ7xWKen2bBsGtdOWrGcrQtY=
=vPja
-----END PGP SIGNATURE-----

--JccBE59ttU0QeWUvWVkkHKm2Lyq60I0Lk--
