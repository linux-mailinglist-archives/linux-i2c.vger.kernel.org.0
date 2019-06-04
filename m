Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFF2352BC
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 00:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfFDWal (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 18:30:41 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36740 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfFDWak (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 18:30:40 -0400
Received: by mail-wm1-f67.google.com with SMTP id v22so330121wml.1;
        Tue, 04 Jun 2019 15:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0HZv+59CaHYbd/c5vedTEKSAGdZDFqylChiEzbWamok=;
        b=Dq1xqiHfjVezN0XEY5L7ErrFzEAXrX5BtefTkboNzmMQzbhJPn9uwqZ9pZVV6tKwxT
         OJmmhXckiZJCfi5jWCyt5TJjfjbN+tjUf9xr458RbMXewn1kP+1t/eMB8sAJV7MCA9J9
         Uo0S3wMI2jxy7G78DeUOr8fgVdCxyNFIle1aylGIFgk+2ZkCWp7Dblf8VQECMW0+GSV0
         +Vvsv/zz2CwFdP8rXYAWbDL+IEev4FkOtdkqPjGJPBXYQhBNoD681guxMqbtvC8JjYGU
         rKsWuHDWKJCPbiKkh3yyiJzEaV+h8imlNAfOKCJSNGHWWx2MIB1HNfQcVNBtl7Z7MUxR
         rbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0HZv+59CaHYbd/c5vedTEKSAGdZDFqylChiEzbWamok=;
        b=OPKtXC452lo6g8MLBOzssQWCjKhxMpogVRu9WR6j7iYh+5C0Yb1+5BSU4CDvB9nSWG
         pY8luxcurlzL/nE4GPK3wXhE++xQmu3sCGwt4OGCBHMlTk4SqLFs2juxmyjr/733Sl6S
         TTtCFHyR5hVqr66FpAO+E2G+ki2q/lX9qrzj7Cvett/7hQc/B4yxuxQEmWIC9mBhP4uO
         KBQIHXOtc6J8ZINPdapRL15W/VHJ7IOfDb26KwSScni3MOyNyVlPZ+zreF2tFJ6Sc+iv
         JbNmFCqUzi8LB7HDTpof86wwbJ1m0jZtF9myVIvkpezzHCyGH/4OBkyZOCGP3LKIcdJG
         PcYA==
X-Gm-Message-State: APjAAAVp/RhFPDlBD9ha9440vQxIrwuWWbS5CPpWg8uV85qEtyF9ysQ8
        o8NGsorlr2UX75owRB2XpGY=
X-Google-Smtp-Source: APXvYqzVPL3/lJPiWZwh9HoivInuPZ+OKka+h2YnhdopdI3zHuFuqo06Oam+EXPNyNs3RwwL7zY0xw==
X-Received: by 2002:a1c:c105:: with SMTP id r5mr20051797wmf.46.1559687437236;
        Tue, 04 Jun 2019 15:30:37 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id q21sm14134478wmq.13.2019.06.04.15.30.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 15:30:36 -0700 (PDT)
Date:   Wed, 5 Jun 2019 00:30:34 +0200
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
Subject: Re: [PATCH v3] i2c: i801: Register optional lis3lv02d i2c device on
 Dell machines
Message-ID: <20190604223034.quik44psi43wu4hf@pali>
References: <20180127133209.28995-1-pali.rohar@gmail.com>
 <20190602132003.1911-1-pali.rohar@gmail.com>
 <20190604165729.4b67222f@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eca7kglr7r7hy3co"
Content-Disposition: inline
In-Reply-To: <20190604165729.4b67222f@endymion>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eca7kglr7r7hy3co
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Tuesday 04 June 2019 16:57:29 Jean Delvare wrote:
> Hi Pali,
>=20
> Next time, please start a new thread for a new version of a patch.

Ok!

> On Sun,  2 Jun 2019 15:20:03 +0200, Pali Roh=C3=A1r wrote:
> > Dell platform team told us that some (DMI whitelisted) Dell Latitude
> > machines have ST microelectronics accelerometer at i2c address 0x29.
> >=20
> > Presence of that ST microelectronics accelerometer is verified by exist=
ence
> > of SMO88xx ACPI device which represent that accelerometer. Unfortunately
> > ACPI device does not specify i2c address.
> >=20
> > This patch registers lis3lv02d device for selected Dell Latitude machin=
es
> > at i2c address 0x29 after detection. And for Dell Vostro V131 machine at
> > i2c address 0x1d which was manually detected.
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
> > Changes since v2:
> >  * Use explicit list of SMOxx ACPI devices
> >=20
> > Changes since v1:
> >  * Added Dell Vostro V131 based on Micha=C5=82 K=C4=99pie=C5=84 testing
> >  * Changed DMI product structure to include also i2c address
> > ---
> >  drivers/i2c/busses/i2c-i801.c       | 118 ++++++++++++++++++++++++++++=
++++++++
> >  drivers/platform/x86/dell-smo8800.c |   1 +
> >  2 files changed, 119 insertions(+)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i80=
1.c
> > index ac7f7817dc89..2ac8ff41cc24 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1134,6 +1134,121 @@ static void dmi_check_onboard_devices(const str=
uct dmi_header *dm, void *adap)
> >  	}
> >  }
> > =20
> > +/* NOTE: Keep this list in sync with drivers/platform/x86/dell-smo8800=
=2Ec */
> > +static const struct acpi_device_id acpi_smo8800_ids[] =3D {
> > +	{ "SMO8800", 0 },
> > +	{ "SMO8801", 0 },
> > +	{ "SMO8810", 0 },
> > +	{ "SMO8811", 0 },
> > +	{ "SMO8820", 0 },
> > +	{ "SMO8821", 0 },
> > +	{ "SMO8830", 0 },
> > +	{ "SMO8831", 0 },
> > +};
> > +
> > +static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> > +					     u32 nesting_level,
> > +					     void *context,
> > +					     void **return_value)
> > +{
> > +	struct acpi_device_info *info;
> > +	acpi_status status;
> > +	char *hid;
> > +	int i;
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
> > +		if (strcmp(hid, acpi_smo8800_ids[i].id) =3D=3D 0) {
> > +			*((bool *)return_value) =3D true;
> > +			return AE_CTRL_TERMINATE;
> > +		}
> > +	}
> > +
> > +	return AE_OK;
> > +
>=20
> Unneeded blank line.

Ok.

> > +}
> > +
> > +static bool is_dell_system_with_lis3lv02d(void)
> > +{
> > +	bool found;
> > +	acpi_status status;
> > +	const char *vendor;
> > +
> > +	vendor =3D dmi_get_system_info(DMI_SYS_VENDOR);
> > +	if (strcmp(vendor, "Dell Inc.") !=3D 0)
> > +		return false;
> > +
> > +	/*
> > +	 * Check that ACPI device SMO88xx exists and is enabled. That ACPI
>=20
> I see how you check that the device exists, but not that it is enabled.

Hm.. you are right. I will add missing check.

> > +	 * device represent our ST microelectronics lis3lv02d accelerometer b=
ut
> > +	 * unfortunately without any other information (like i2c address).
>=20
> I2C

I will change i2c to I2C in whole patch.

> > +	 */
> > +	found =3D false;
> > +	status =3D acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> > +				  (void **)&found);
> > +	if (!ACPI_SUCCESS(status) || !found)
> > +		return false;
> > +
> > +	return true;
>=20
> Looks more complex than it needs to be. You don't really care about the
> status, as in the end you return the same on error as you do when no
> device is found. So I think you can simply go with:
>=20
> 	found =3D false;
> 	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> 				  (void **)&found);
>=20
> 	return found;

Ok, it really simplify that check.

>=20
> > +}
> > +
> > +/*
> > + * Accelerometer's i2c address is not specified in DMI nor ACPI,
>=20
> I2C
>=20
> > + * so it is needed to define mapping table based on DMI product names.
> > + */
> > +static struct {
>=20
> Any reason to not make it const?

No, I will make it const.

> > +	const char *dmi_product_name;
> > +	unsigned short i2c_addr;
> > +} dell_lis3lv02d_devices[] =3D {
> > +	/*
> > +	 * Dell platform team told us that these Latitude devices have
> > +	 * ST microelectronics accelerometer at i2c address 0x29.
>=20
> I2C
>=20
> > +	 */
> > +	{ "Latitude E5250",     0x29 },
> > +	{ "Latitude E5450",     0x29 },
> > +	{ "Latitude E5550",     0x29 },
> > +	{ "Latitude E6440",     0x29 },
> > +	{ "Latitude E6440 ATG", 0x29 },
> > +	{ "Latitude E6540",     0x29 },
> > +	/*
> > +	 * Additional individual entries were added after verification.
> > +	 */
> > +	{ "Vostro V131",        0x1d },
> > +};
> > +
> > +static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
> > +{
> > +	struct i2c_board_info info;
> > +	const char *dmi_product_name;
> > +	int i;
> > +
> > +	dmi_product_name =3D dmi_get_system_info(DMI_PRODUCT_NAME);
> > +	for (i =3D 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
> > +		if (strcmp(dmi_product_name,
> > +			   dell_lis3lv02d_devices[i].dmi_product_name) =3D=3D 0)
> > +			break;
> > +	}
> > +
> > +	if (i =3D=3D ARRAY_SIZE(dell_lis3lv02d_devices)) {
> > +		dev_warn(&priv->pci_dev->dev,
> > +			 "Accelerometer lis3lv02d is present on i2c bus but its"
>=20
> i2c bus -> SMBus
>=20
> > +			 " i2c address is unknown, skipping registration...\n");
>=20
> I2C (or just s/i2c //, as it's kind of redundant)
>=20
> Suspension points not really needed IMHO.

Ok, it will be in V4 which I sent in few minutes.

> > +		return;
> > +	}
> > + (...)
>=20
> All the rest looks good to me.
>=20
> Thanks,

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--eca7kglr7r7hy3co
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXPbxCAAKCRCL8Mk9A+RD
UmSYAKCDBhuuIH1W7/2goRbozB6f9Pw11QCdGPIqJhmPcVKPoecrt7BLyZd1wa4=
=cnP+
-----END PGP SIGNATURE-----

--eca7kglr7r7hy3co--
