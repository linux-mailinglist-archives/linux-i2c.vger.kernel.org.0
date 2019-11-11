Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCCFF72DA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 12:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfKKLNt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 06:13:49 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29764 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726843AbfKKLNt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Nov 2019 06:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573470827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v43gOt+Ld22Ntu2zxfIp5/xCGraGSgFRChV+dHYHki4=;
        b=InnJz8niBqwezXFsadVgkq8miPsOxOdEuI3f7zzm8ypJIQi4d8V3ZzdANwR6zFRIuVfGfU
        HVOPEQzHqeEeVqeNP0QE6+2KGJQ95YVD5u52fVa8+SbuePwRFk8cJFFTqbPn0P8wrAA8pC
        SleL5B5zvTs3h71SP2BYeGyQCvS7A3o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-GRSIWf90OTGOF3m7Y9ug6A-1; Mon, 11 Nov 2019 06:13:44 -0500
Received: by mail-wr1-f71.google.com with SMTP id m17so9615650wrn.23
        for <linux-i2c@vger.kernel.org>; Mon, 11 Nov 2019 03:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bwjhg5HlbRjy6MbaUFOaFFWoL/yYXcbP/BYRsChJNjM=;
        b=mH9gM7f3FkQ0dkmjLrf06MC+QnvBzoc1149l30rKzG/opFNNLU6jjAv97fbchRxMgH
         CyHWO/SIqs5Hscjpeik86lEKuU6fhR9lwdynjIHJuH4g3Mgk36dO8+9cmElfIp0aEJc5
         OUpSw6Y/Yqoebw2JkDVnLtwUZBmHCoRTqkjkm0jFxhar6/ev3hr8eKaP14c7V45BIQQh
         df3KMFk5bl2mTGCeKGPz2ubipSj6Ri0Kb6XQ4yGio2ouMG9KsIONEm2g3EVbqO11xWcQ
         zestNwsppCk0avqofiXjsvlZAJMX7tgdEUkYlqQEZKBZqOTVq0hRfC2eF3q2B5u/uQqi
         N3Hw==
X-Gm-Message-State: APjAAAUmy3zb5DGXBF0L2hvBJe1iFp34TtitZRk/nqNA4Y+GztRL4u4W
        Bxpklsc+XPHKFijA8PgKLTuKZG5O6be9A+fhmLLK2dvVR0o74DIW224anMJqYGK8jTZDWLramp+
        grnhF99u3srcBqgAb7YeX
X-Received: by 2002:a1c:9e58:: with SMTP id h85mr20891606wme.77.1573470823560;
        Mon, 11 Nov 2019 03:13:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPEZum+Z5KctoSEQOBPpq0h5TWph3D/irBX6rOuwvqYY9UWmvOGBrQi5hmFK5rrE2lCghqGA==
X-Received: by 2002:a1c:9e58:: with SMTP id h85mr20891584wme.77.1573470823309;
        Mon, 11 Nov 2019 03:13:43 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id b3sm14424223wmj.44.2019.11.11.03.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2019 03:13:42 -0800 (PST)
Subject: Re: [PATCH] i2c: acpi: Force bus speed to 400KHz if a Silead
 touchscreen is present
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, youling 257 <youling257@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <20191111104827.3713-1-hdegoede@redhat.com>
 <20191111110653.GG2552@lahna.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ea07da81-5458-22f6-7bd3-ee86300bfaef@redhat.com>
Date:   Mon, 11 Nov 2019 12:13:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191111110653.GG2552@lahna.fi.intel.com>
Content-Language: en-US
X-MC-Unique: GRSIWf90OTGOF3m7Y9ug6A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Thank you for the quick reply.

On 11-11-2019 12:06, Mika Westerberg wrote:
> +Jarkko
>=20
> On Mon, Nov 11, 2019 at 11:48:27AM +0100, Hans de Goede wrote:
>> Many cheap devices use Silead touchscreen controllers. Testing has shown
>> repeatedly that these touchscreen controllers work fine at 400KHz, but f=
or
>> unknown reasons do not work properly at 100KHz. This has been seen on
>> both ARM and x86 devices using totally different i2c controllers.
>>
>> On some devices the ACPI tables list another device at the same I2C-bus
>> as only being capable of 100KHz, testing has shown that these other
>> devices work fine at 400KHz (as can be expected of any recent I2C hw).
>>
>> This commit makes i2c_acpi_find_bus_speed() always return 400KHz if a
>> Silead touchscreen controller is present, fixing the touchscreen not
>> working on devices which ACPI tables' wrongly list another device on the
>> same bus as only being capable of 100KHz.
>>
>> Specifically this fixes the touchscreen on the Jumper EZpad 6 m4 not
>> working.
>>
>> Reported-and-tested-by: youling 257 <youling257@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/i2c/i2c-core-acpi.c | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
>> index 9cb2aa1e20ef..420c356eba06 100644
>> --- a/drivers/i2c/i2c-core-acpi.c
>> +++ b/drivers/i2c/i2c-core-acpi.c
>> @@ -39,6 +39,7 @@ struct i2c_acpi_lookup {
>>   =09int index;
>>   =09u32 speed;
>>   =09u32 min_speed;
>> +=09u32 force_speed;
>>   };
>>  =20
>>   /**
>> @@ -285,6 +286,19 @@ i2c_acpi_match_device(const struct acpi_device_id *=
matches,
>>   =09return acpi_match_device(matches, &client->dev);
>>   }
>>  =20
>> +static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] =
=3D {
>> +=09/*
>> +=09 * These Silead touchscreen controllers only work at 400KHz, for
>> +=09 * some reason they do not work at 100KHz. On some devices the ACPI
>> +=09 * tables list another device at their bus as only being capable
>> +=09 * of 100KHz, testing has shown that these other devices work fine
>> +=09 * at 400KHz (as can be expected of any recent i2c hw) so we force
>> +=09 * the speed of the bus to 400 KHz if a Silead device is present.
>> +=09 */
>> +=09{ "MSSL1680", 0 },
>> +=09{}
>> +};
>> +
>>   static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level=
,
>>   =09=09=09=09=09   void *data, void **return_value)
>>   {
>> @@ -303,6 +317,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle=
 handle, u32 level,
>>   =09if (lookup->speed <=3D lookup->min_speed)
>>   =09=09lookup->min_speed =3D lookup->speed;
>>  =20
>> +=09if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) =
=3D=3D 0)
>> +=09=09lookup->force_speed =3D 400000;
>=20
> I wonder if it makes sense to log a warning about this? So when
> debugging it can be clearly seen from the logs that the device is
> quirked.

Yes and no, yes a warning is a good idea, but not here, since there are a
ton of devices with a Silead touchscreen and only few have this problem.

>=20
>> +
>>   =09return AE_OK;
>>   }
>>  =20
>> @@ -340,7 +357,12 @@ u32 i2c_acpi_find_bus_speed(struct device *dev)
>>   =09=09return 0;
>>   =09}
>>  =20
>> -=09return lookup.min_speed !=3D UINT_MAX ? lookup.min_speed : 0;
>> +=09if (lookup.force_speed) {

So the warning should go here then, like this:

=09if (lookup.force_speed > lookup.min_speed)
=09=09pr_warn(FW_BUG "Some decent text Hans has to come-up with");


I'll wait a bit for other remarks before posting a v2 with this added.

Regards,

Hans


>> +=09=09return lookup.force_speed;
>> +=09} else if (lookup.min_speed !=3D UINT_MAX)
>> +=09=09return lookup.min_speed;
>> +=09else
>> +=09=09return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(i2c_acpi_find_bus_speed);
>>  =20
>> --=20
>> 2.23.0
>=20

