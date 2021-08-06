Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077A73E2986
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 13:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242954AbhHFL07 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 07:26:59 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:56286 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbhHFL06 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 07:26:58 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7C6FA2223E;
        Fri,  6 Aug 2021 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628249202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jfmpMuZWGH504HuPxTPDf1by5Fnk48mp6mwFElW6Nus=;
        b=bPJPXGmsEauDRILBQ97cEIZdsoxp9+0MKGqEpboaXzokjxZFzfD2MbnPAzCrEss74z4DdD
        nzslUQLT5mwlEfMf5RYEcEcTAMpImjzJRHteCnJmwtNa65QaGun97LHakazKXLJfWpmnR4
        YlIeMQx2jNFAhBeWnnv0V9sRxSmvkk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628249202;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jfmpMuZWGH504HuPxTPDf1by5Fnk48mp6mwFElW6Nus=;
        b=ci3WtWf8VsbqG0bJuAHg0+IGOCQjgmkbehUwSlXhYE/WLY3NrDR87eFOlVq/IGfZ0J1FL7
        Qmt1bwNcwb5io5CA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3E25013A70;
        Fri,  6 Aug 2021 11:26:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id AiP5DHIcDWG9XwAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Fri, 06 Aug 2021 11:26:42 +0000
Date:   Fri, 6 Aug 2021 13:26:40 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/10] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <20210806132640.4c5d4932@endymion>
In-Reply-To: <20210806104700.2plfzwtp2ajvmwfa@pali>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
        <20210805115156.70e364be@endymion>
        <20210805191144.qq37e73p5zqomkem@pali>
        <14a49ba2-f6a6-3ccc-6a65-70a72bb3fe51@gmail.com>
        <20210805230818.mmgybd4ybr2savyk@pali>
        <20210806115519.3d9c58cf@endymion>
        <20210806104700.2plfzwtp2ajvmwfa@pali>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 6 Aug 2021 12:47:00 +0200, Pali Roh=C3=A1r wrote:
> On Friday 06 August 2021 11:55:19 Jean Delvare wrote:
> > Therefore I would propose the following alternative:
> >=20
> > --- linux-5.13.orig/drivers/i2c/busses/i2c-i801.c	2021-08-06 11:11:44.2=
75200299 +0200
> > +++ linux-5.13/drivers/i2c/busses/i2c-i801.c	2021-08-06 11:18:19.847469=
822 +0200
> > @@ -1194,7 +1194,7 @@ static acpi_status check_acpi_smo88xx_de
> > =20
> >  	kfree(info);
> > =20
> > -	*((bool *)return_value) =3D true;
> > +	*return_value =3D hid;	/* Could be any address, used as true value */
> >  	return AE_CTRL_TERMINATE;
> > =20
> >  smo88xx_not_found:
> > @@ -1204,13 +1204,10 @@ static acpi_status check_acpi_smo88xx_de
> > =20
> >  static bool is_dell_system_with_lis3lv02d(void)
> >  {
> > -	bool found;
> > -	const char *vendor;
> > +	acpi_handle found =3D NULL; =20
>=20
> Then you should define it as: "void *found =3D NULL;" and not as
> acpi_handle anymore.

Oops, you are right of course. That being said, that could (should?)
already be the case with Heiner's patch.

> > =20
> > -	vendor =3D dmi_get_system_info(DMI_SYS_VENDOR);
> > -	if (!vendor || strcmp(vendor, "Dell Inc."))
> > +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
> >  		return false;
> > -
> >  	/*
> >  	 * Check that ACPI device SMO88xx is present and is functioning.
> >  	 * Function acpi_get_devices() already filters all ACPI devices
> > @@ -1219,9 +1216,7 @@ static bool is_dell_system_with_lis3lv02
> >  	 * accelerometer but unfortunately ACPI does not provide any other
> >  	 * information (like I2C address).
> >  	 */
> > -	found =3D false;
> > -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> > -			 (void **)&found);
> > +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &found);
> > =20
> >  	return found;
> >  }
> >=20
> > Basically, it's Heiner's patch except for one line, the idea is to
> > return the HID string pointer (which has type char *) instead of the
> > acpi_handle. That way we don't depend on an opaque ACPI type. (I first
> > tried with the matching acpi_smo8800_ids entry but compiler complained
> > about incompatible pointer types due to the const).
> >=20
> > Actually, I think we could use pretty much ANY pointer. Heck, that
> > would work too:
> >=20
> > 	*return_value =3D &disable_features;	/* Could be any address, used as =
true value */
> >=20
> > Would be kinda confusing, but the comment is supposed to address that.
> > In fact we could even do:
> >=20
> > 	*return_value =3D &i;	/* Could be any address, used as true value */
> >=20
> > That's the address of a local variable on the stack, which will no
> > longer exist by the time we check it, but that's still a non-NULL
> > pointer so it would work :-D Seriously, let's not do that, simply
> > because static code analyzers would possibly complain. =20
>=20
> Ehm.. :-) Rather do not talk about other _interesting_ options. Somebody
> could listen and come up with this idea as another workaround for
> misusing ACPI functions API...
>=20
> Basically using random pointer values or context-valid pointers just as
> true value can cause issues of leaking pointer to context where it is
> not valid anymore. And very smart code analyzers are correct if they
> throw error that in variable is stored dangling pointer.

Fully agreed, I was only making fun of the situation, this last
proposal was absolutely not meant to be taken seriously.

--=20
Jean Delvare
SUSE L3 Support
