Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4B923F7D8
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Aug 2020 15:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgHHNq2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Aug 2020 09:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgHHNq0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Aug 2020 09:46:26 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A85BC061A27;
        Sat,  8 Aug 2020 06:46:24 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d188so2670877pfd.2;
        Sat, 08 Aug 2020 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=DZ9MeV3dTfJShUC6JWDZlqJ1PpbVcGHwTUFr7bZs05w=;
        b=if9rqG1GCIB5k00PoPJRri9NmAjH2FdXj+IcYBuCGke6j3+wn9rdUgI7+g5r9Xd6UB
         d1ech/fHKcLfU/lKW+RF0fj0cY3IL+/hIh3DQxcKPj6E9zrd9EoxYR385dv1kKvHEfPY
         UqXFO7K1yjgk+pY356cdZCkyryh+MZ2OdqNxneTWWHdzjg2fQoLCGbNfKIgHPtxfA7ZO
         v2vpWfbhhuW8aTN/3J9wRx20yTpn/9UcoAZtXsGdF2dlA3DPCBU0Os8No2YOuisz38+z
         q/WvUgIimAd4OlWQesKRhlt7Z533cUVByukSv34QHGbIHhgspalzEOVxTZ9q7WA93um3
         pPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=DZ9MeV3dTfJShUC6JWDZlqJ1PpbVcGHwTUFr7bZs05w=;
        b=WNXKLmGGYtYtvZpFBKRVHjRuu9xAaAI7zQ1P+QF371lpEpdv3OyNnB4HXF/1V7+990
         V47rqtFZFVMRi3RantatVfFN3YQJgcdex4D9OXLINgnAPKGyvGr7dS8E5muKXIHRjCOP
         b36NjE9fpbMPuQf5R/exQxqnlFeTWoAofcgW4gCkdNX0HfbExi8wEqr+M6B65Vv92iFC
         cSK1Qs8jANabPGcnrS3FlA9TL2h4VlhCKkFZINcjLrEQmf92RLczRv6pfnOO79/gblWx
         4xrvwkyau/qK+TlLqubz0yDtvkAUVIMnvkVbwwKOUY3SoER5Uwi2NoKxgQk/cvAfD5Au
         ZpnA==
X-Gm-Message-State: AOAM5339iVAy3vb/dX9v5wBst9fxiQ0IblwmMSunUDfiqfmVB5XyhrmD
        p/M1ECrvOX9veZMKS4IbhtUr26uT
X-Google-Smtp-Source: ABdhPJw7Bx352g1P1MWJCXdajnkhT1GfkGLxwaHt2vY/4WApcTyPiB0Yg+hReOC3rN4B3STTOiu5fw==
X-Received: by 2002:aa7:96ef:: with SMTP id i15mr18605859pfq.231.1596894379219;
        Sat, 08 Aug 2020 06:46:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t2sm17351954pfb.123.2020.08.08.06.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2020 06:46:17 -0700 (PDT)
Subject: Re: [PATCH v3] hwmon/pmbus: use simple i2c probe function
To:     Stephen Kitt <steve@sk2.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
References: <20200807173231.GA47449@roeck-us.net>
 <20200807210707.7dd1d9b9@heffalump.sk2.org>
 <20200808085329.4713bf38@heffalump.sk2.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <383af0fb-7eb9-dea8-291c-962c6b9eedd1@roeck-us.net>
Date:   Sat, 8 Aug 2020 06:46:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200808085329.4713bf38@heffalump.sk2.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MgMKAT3V4AgHtgTrwXMCJznCysVxSvk76"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MgMKAT3V4AgHtgTrwXMCJznCysVxSvk76
Content-Type: multipart/mixed; boundary="F13B1wjmV06cEVcGtQ0aut0fpD0euq5ft"

--F13B1wjmV06cEVcGtQ0aut0fpD0euq5ft
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/7/20 11:53 PM, Stephen Kitt wrote:
> On Fri, 7 Aug 2020 21:07:07 +0200, Stephen Kitt <steve@sk2.org> wrote:
>=20
>> On Fri, 7 Aug 2020 10:32:31 -0700, Guenter Roeck <linux@roeck-us.net> =
wrote:
>>> On Fri, Aug 07, 2020 at 06:28:01PM +0200, Stephen Kitt wrote: =20
>>>> =20
>>>> -static int ltc2978_probe(struct i2c_client *client,
>>>> -			 const struct i2c_device_id *id)
>>>> +static int ltc2978_probe(struct i2c_client *client)
>>>>  {
>>>>  	int i, chip_id;
>>>>  	struct ltc2978_data *data;
>>>> @@ -670,10 +669,10 @@ static int ltc2978_probe(struct i2c_client
>>>> *client, return chip_id;
>>>> =20
>>>>  	data->id =3D chip_id;
>>>> -	if (data->id !=3D id->driver_data)
>>>> +	if (strcmp(client->name, ltc2978_id[data->id].name) !=3D 0)   =20
>>>
>>> I was about to apply this patch, but this is problematic: It assumes =
that
>>> __stringify(id) =3D=3D ltc2978_id[id].name and that ltc2978_id[id].dr=
iver_data
>>> =3D=3D id. While that is curently the case (as far as I can see), it =
is still
>>> unsafe. I think it would be much safer to use i2c_match_id() here. =20
>>
>> I=E2=80=99m not following the __stringify assumption
> [...]
>=20
> I get it, the code assumes there=E2=80=99s a bijection between the set =
of names and
> the set of driver_data values. So effectively we can=E2=80=99t log the =
detected name
> based on the chip_id...

Exactly.

Thanks,
Guenter


--F13B1wjmV06cEVcGtQ0aut0fpD0euq5ft--

--MgMKAT3V4AgHtgTrwXMCJznCysVxSvk76
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl8urKcACgkQyx8mb86f
mYHjMw//fGlHUnjvUFI4zD3AvxxNVicO9gXp6qFRM2kV2FKGPaq3UpmOgKA3CE7w
gCpmpAKrLZBDTtGNBs2CPLH7Y/6/j1AwH/bV6vfTwAopd9paMhX4K4qVoMSof7y/
SqnWHASO5Jr6GIkCfL26kgUXg81ypAaSdeeKXqhQImfjMPk7tnmITQlHphc+Xw6C
TJXAygAMoqBnm7WNt7YCvATPzRE6aTt2Z64UitNSr31uz4eEUT7mY9fzKk03ECwf
IrSHC1YTMmKClaubz+rzguLkNO/QS08U7K0hMfqWKUW/lni1YcpW9ZB5L9DsOo6e
CbbHL1r0ssPsWzw0UVziSS8z+CVcJttCEhDUY5PxBqmPBxBnCkDT+j9OWf5ZIoMK
KHAXYkXCxd/lW049jH6p1gIFmr2ebVO1RW1Syjj3/LJ3GxycOtLMkBRR7Ie1Tk04
VLAi0L2FEqwEGdcq5VzCG76qogX9kXiujYpAq89scxZFym9wvVIKsPyLieGi87QG
ME9NHVDtRedoCVs9UAizd1joRfj/kRx+ZgD4k4Fxi2X7zZ32CBsSIkvvqPFGCxgw
Z3QA41V6nYlNIBK9E3JgCRgM9YVnrQ6YI0vNpfx8nQ9DFMwAfx7dzLoxL/lN2CJw
E0zhqf4kAuDsbVgp0nFVQMFlnWDLZaZfZMEyfAriLCOe/iRmP04=
=psmC
-----END PGP SIGNATURE-----

--MgMKAT3V4AgHtgTrwXMCJznCysVxSvk76--
