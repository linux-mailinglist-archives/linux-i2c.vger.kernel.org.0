Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC2237879
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 17:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbfFFPsG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 11:48:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35806 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729185AbfFFPsG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 11:48:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id m3so2978366wrv.2;
        Thu, 06 Jun 2019 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e+ma5T7bMYgfWg+yGx1pDmn5YFu+bQrLS2nrrHtWmSo=;
        b=t7tLf79Qc4agYeTVFOkd4VihGEpXUirhumA262OEjsbBtPGrDUaXe/9AK/+r3QBpGj
         2sVmO4/z8H36gT5ma960KR+kBpj5+6EXMcWTYY3OHMLbSvhmtzNdoK8lzqyPk8IcRT+J
         Y6sDjW74328AwIupndEyYd55tE52dnA4VLyXcFqwh/6bEbacfPAehB7k0VFt70BUQDl9
         epgSe0mUIThO3e/ErNCSD8ab6F218rAjcIuU3GhZeITaGxc76tdWO4TASd7YOS541F73
         NHkiP668GwvJjQS62Ob40r2z/uwdQT4Ovi1bdIdxNjPSUC48PntLvCm/AoeQlv5SMCAa
         JInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e+ma5T7bMYgfWg+yGx1pDmn5YFu+bQrLS2nrrHtWmSo=;
        b=qjl3Ij4FKaXljYp0kKxwNbaNy87lT0HYsHYFw6XL/qjvRtDeSoMlHD7fZI9XpjI4Sr
         C6mql3RPNNK2KMUnenP8jdLdZ+xTKCZWIed39vDPVVpeUbkEcyc3mm0iu+sJqRFNznm7
         I+vxv1wO8IVqeDXj6YBmY+ErB15LluaeV6q98inPdIz3hhsDHFKFTL+H2YLiNEUtE91D
         0nkh7wfwSgTEfO/vXSTsXeiD477zhHv/efig9rc848uPBUXmxR6ylGwaezu9nBRX+E9L
         4tZ9gQyQnLl4vgil8/pKSScwA6++P/O8tY4FA8rNjL5K2+3MDdjDlYXaYhVwLMlkdMiW
         RRuw==
X-Gm-Message-State: APjAAAVMkXScmY3cRdSO64eWHkEHbk7IcpzMEipAlbPbaUTJJUmn0Ipo
        v9GvXUApfVh8qJErMSn2HEp2OvB3VGM=
X-Google-Smtp-Source: APXvYqwb1JZR9qiV3J6xJZdXMvNZ2g1fcUMD/qvIrmqmm3310V9GI67H1hgGWyjLr6LzVRnr/RNcDQ==
X-Received: by 2002:a5d:4f0a:: with SMTP id c10mr30111205wru.180.1559836083600;
        Thu, 06 Jun 2019 08:48:03 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id 65sm2508049wro.85.2019.06.06.08.48.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 08:48:01 -0700 (PDT)
Date:   Thu, 6 Jun 2019 17:48:00 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
        Steven Honeyman <stevenhoneyman@gmail.com>,
        Valdis.Kletnieks@vt.edu,
        Jochen Eisinger <jochen@penguin-breeder.org>,
        Gabriele Mazzotta <gabriele.mzt@gmail.com>,
        Andy Lutomirski <luto@kernel.org>, Mario_Limonciello@dell.com,
        Alex Hung <alex.hung@canonical.com>,
        Takashi Iwai <tiwai@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4] i2c: i801: Register optional lis3lv02d I2C device on
 Dell machines
Message-ID: <20190606154800.dpxl7hph5535faya@pali>
References: <20190604223303.31945-1-pali.rohar@gmail.com>
 <20190606165309.4a3c81c0@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wpsgrcaxabs4jmr5"
Content-Disposition: inline
In-Reply-To: <20190606165309.4a3c81c0@endymion>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wpsgrcaxabs4jmr5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Thursday 06 June 2019 16:53:09 Jean Delvare wrote:
> Hi Pali,
>=20
> On Wed,  5 Jun 2019 00:33:03 +0200, Pali Roh=C3=A1r wrote:
> > Dell platform team told us that some (DMI whitelisted) Dell Latitude
> > machines have ST microelectronics accelerometer at I2C address 0x29.
> >=20
> > Presence of that ST microelectronics accelerometer is verified by exist=
ence
> > of SMO88xx ACPI device which represent that accelerometer. Unfortunately
> > ACPI device does not specify I2C address.
> >=20
> > This patch registers lis3lv02d device for selected Dell Latitude machin=
es
> > at I2C address 0x29 after detection. And for Dell Vostro V131 machine at
> > I2C address 0x1d which was manually detected.
> >=20
> > Finally commit a7ae81952cda ("i2c: i801: Allow ACPI SystemIO OpRegion to
> > conflict with PCI BAR") allowed to use i2c-i801 driver on Dell machines=
 so
> > lis3lv02d correctly initialize accelerometer.
> >=20
> > Tested on Dell Latitude E6440.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >=20
> > ---
> > Changes since v3:
> >  * Use char * [] type for list of acpi ids
> >  * Check that SMO88xx acpi device is present, enabled and functioning
> >  * Simplify usage of acpi_get_devices()
> >  * Change i2c to I2C
> >  * Make dell_lis3lv02d_devices const
> >=20
> > Changes since v2:
> >  * Use explicit list of SMOxx ACPI devices
> >=20
> > Changes since v1:
> >  * Added Dell Vostro V131 based on Micha=C5=82 K=C4=99pie=C5=84 testing
> >  * Changed DMI product structure to include also i2c address
> > ---
> >  drivers/i2c/busses/i2c-i801.c       | 123 ++++++++++++++++++++++++++++=
++++++++
> >  drivers/platform/x86/dell-smo8800.c |   1 +
> >  2 files changed, 124 insertions(+)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i80=
1.c
> > index ac7f7817dc89..9060d4b16f4f 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1134,6 +1134,126 @@ static void dmi_check_onboard_devices(const str=
uct dmi_header *dm, void *adap)
> >  	}
> >  }
> > =20
> > +/* NOTE: Keep this list in sync with drivers/platform/x86/dell-smo8800=
=2Ec */
> > +static const char *const acpi_smo8800_ids[] =3D {
> > +	"SMO8800",
> > +	"SMO8801",
> > +	"SMO8810",
> > +	"SMO8811",
> > +	"SMO8820",
> > +	"SMO8821",
> > +	"SMO8830",
> > +	"SMO8831",
> > +};
> > +
> > +static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> > +					     u32 nesting_level,
> > +					     void *context,
> > +					     void **return_value)
> > +{
> > +	struct acpi_device_info *info;
> > +	unsigned long long sta;
> > +	acpi_status status;
> > +	char *hid;
> > +	int i;
> > +
> > +	status =3D acpi_bus_get_status_handle(obj_handle, &sta);
> > +	if (!ACPI_SUCCESS(status))
> > +		return AE_OK;
> > +	if (!(sta & (ACPI_STA_DEVICE_PRESENT |
> > +		     ACPI_STA_DEVICE_ENABLED |
> > +		     ACPI_STA_DEVICE_FUNCTIONING)))
> > +		return AE_OK;
>=20
> This is testing that *either* bit is set. Is it what you intend to
> achieve, or would you rather want to ensure that *all* these bits are
> set?

Of course, it is wrong. Thanks for catch. We should ignore apci devices
which are not present, which are disabled or which are not functioning.

Now I looked into acpi_get_devices() implementation and it call
acpi_ns_get_device_callback() function callback for every device. At the
end that function calls user supplied check_acpi_smo88xx_device
function.

And acpi_ns_get_device_callback() already ignores acpi devices which do
not have ACPI_STA_DEVICE_PRESENT or ACPI_STA_DEVICE_FUNCTIONING flag.

According to acpi documentation when ACPI_STA_DEVICE_PRESENT is not set
then ACPI_STA_DEVICE_ENABLED also cannot be set.

So the whole acpi_bus_get_status_handle() is not needed at all as
acpi_get_devices() via acpi_ns_get_device_callback() already filter
unsuitable acpi devices.

I guess that I already did this investigation in past and added comment
"exists and is enabled" which is below near acpi_get_devices() call. But
as I wrote this patch more then year ago I forgot about it.

I will remove that check. Do you have any suggestion what to write into
comment so other readers in future would know that we do not need to
check anything with _STA acpi method?

> > +
> > +	status =3D acpi_get_object_info(obj_handle, &info);
> > +	if (!ACPI_SUCCESS(status) || !(info->valid & ACPI_VALID_HID))
> > +		return AE_OK;
> > +
> > +	hid =3D info->hardware_id.string;
> > +	if (!hid)
> > +		return AE_OK;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(acpi_smo8800_ids); ++i) {
> > +		if (strcmp(hid, acpi_smo8800_ids[i]) =3D=3D 0) {
> > +			*((bool *)return_value) =3D true;
> > +			return AE_CTRL_TERMINATE;
> > +		}
> > +	}
> > +
> > +	return AE_OK;
> > +}
> > +
> > +static bool is_dell_system_with_lis3lv02d(void)
> > +{
> > +	bool found;
> > +	const char *vendor;
> > +
> > +	vendor =3D dmi_get_system_info(DMI_SYS_VENDOR);
> > +	if (strcmp(vendor, "Dell Inc.") !=3D 0)
> > +		return false;
> > +
> > +	/*
> > +	 * Check that ACPI device SMO88xx exists and is enabled. That ACPI
> > +	 * device represent our ST microelectronics lis3lv02d accelerometer b=
ut
> > +	 * unfortunately without any other information (like I2C address).
> > +	 */
> > +	found =3D false;
> > +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> > +				  (void **)&found);
>=20
> Alignment is incorrect now - but don't resend just for this.
>=20
> > +
> > +	return found;
> > +}
> > (...)
>=20
> Everything else looks good to me now. Has the latest version of your
> patch been tested on real hardware?

Yes, I'm testing it on E6440 machine which is still in use (it is nice
piece from Dell). Otherwise I would not spend time on this patch after
such long time :-)

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--wpsgrcaxabs4jmr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXPk1rgAKCRCL8Mk9A+RD
UkJ9AKC1koqr40BYRIwTt6n7xeEmCBB80gCeLrLXC2hibjAfwVe25W4dmxyHcgw=
=y9Ym
-----END PGP SIGNATURE-----

--wpsgrcaxabs4jmr5--
